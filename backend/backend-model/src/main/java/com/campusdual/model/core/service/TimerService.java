package com.campusdual.model.core.service;

import com.campusdual.api.core.service.ITimerService;
import com.campusdual.model.core.dao.TimerDao;
import com.ontimize.jee.common.db.SQLStatementBuilder;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.server.dao.DefaultOntimizeDaoHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Lazy
@Service("TimerService")
public class TimerService implements ITimerService {
    @Autowired
    private TimerDao timerDao;
    @Autowired
    private DefaultOntimizeDaoHelper daoHelper;


    @Override
    public EntityResult timerQuery(Map<String, Object> keyMap, List<String> attrList) {
        return this.daoHelper.query(this.timerDao, keyMap, attrList);
    }

    @Override
    public EntityResult timerInsert(Map<String, Object> attrMap) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Map<String, Object> newMap = new HashMap<>(attrMap);
        newMap.put(TimerDao.USER_, authentication.getName());//NOMBRE usuario
        newMap.put(TimerDao.TM_START_TIME, LocalDateTime.now());
        return this.daoHelper.insert(this.timerDao, newMap);
    }

    @Override
    public EntityResult timerUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap) {
        return this.daoHelper.update(this.timerDao, attrMap, keyMap);
    }

    @Override
    public EntityResult timerDelete(Map<String, Object> keyMap) {
        return this.daoHelper.delete(this.timerDao, keyMap);
    }

    @Override
    public EntityResult openTimerQuery(Map<String, Object> keyMap, List<String> attrList) {
        Map<String, Object> key = new HashMap<>();
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        key.put(SQLStatementBuilder.ExtendedSQLConditionValuesProcessor.EXPRESSION_KEY, searchLatestNULL(authentication.getName()));
        return this.timerQuery(key, attrList);
    }

    private SQLStatementBuilder.BasicExpression searchLatestNULL(String user) {
        SQLStatementBuilder.BasicField timeField = new SQLStatementBuilder.BasicField(TimerDao.TM_END_TIME);
        SQLStatementBuilder.BasicField userField = new SQLStatementBuilder.BasicField(TimerDao.USER_);
        SQLStatementBuilder.BasicExpression timeExp = new SQLStatementBuilder.BasicExpression(timeField, SQLStatementBuilder.BasicOperator.NULL_OP, null);
        SQLStatementBuilder.BasicExpression userExp = new SQLStatementBuilder.BasicExpression(userField, SQLStatementBuilder.BasicOperator.EQUAL_OP, user);
        return new SQLStatementBuilder.BasicExpression(timeExp, SQLStatementBuilder.BasicOperator.AND_OP, userExp);
    }

    @Override
    public EntityResult recordQuery(Map<?, ?> keyMap, List<?> attrList) {
        return this.daoHelper.query(this.timerDao, keyMap, attrList,"record");
    }
}
