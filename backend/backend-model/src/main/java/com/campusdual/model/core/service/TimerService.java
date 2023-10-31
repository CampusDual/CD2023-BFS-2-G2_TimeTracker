package com.campusdual.model.core.service;

import com.campusdual.api.core.service.ITimerService;
import com.campusdual.model.core.dao.TimerDao;
import com.ontimize.jee.common.db.SQLStatementBuilder.BasicOperator;
import com.ontimize.jee.common.db.SQLStatementBuilder.BasicExpression;
import com.ontimize.jee.common.db.SQLStatementBuilder.BasicField;
import com.ontimize.jee.common.db.SQLStatementBuilder.ExtendedSQLConditionValuesProcessor;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.common.exceptions.OntimizeJEERuntimeException;
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
        newMap.put(TimerDao.USER_, authentication.getName());
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
        key.put(ExtendedSQLConditionValuesProcessor.EXPRESSION_KEY, searchLatestNULL(authentication.getName()));
        return this.timerQuery(key, attrList);
    }

    private BasicExpression searchLatestNULL(String user) {
        BasicField timeField = new BasicField(TimerDao.TM_END_TIME);
        BasicField userField = new BasicField(TimerDao.USER_);
        BasicExpression timeExp = new BasicExpression(timeField, BasicOperator.NULL_OP, null);
        BasicExpression userExp = new BasicExpression(userField, BasicOperator.EQUAL_OP, user);
        return new BasicExpression(timeExp, BasicOperator.AND_OP, userExp);
    }

    @Override
    public EntityResult recordQuery(Map<String, Object> keyMap, List<String> attrList) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Map<String, Object> newKeyMap = new HashMap<>(keyMap);

        BasicField userField = new BasicField(TimerDao.USER_);
        BasicExpression userExp = new BasicExpression(userField, BasicOperator.EQUAL_OP, authentication.getName());

        if (keyMap.containsKey(ExtendedSQLConditionValuesProcessor.EXPRESSION_KEY)) {
            newKeyMap.put(ExtendedSQLConditionValuesProcessor.EXPRESSION_KEY, new BasicExpression(keyMap.get(ExtendedSQLConditionValuesProcessor.EXPRESSION_KEY), BasicOperator.AND_OP, userExp));
        } else {
            newKeyMap.put(ExtendedSQLConditionValuesProcessor.EXPRESSION_KEY, userExp);
        }

        return this.daoHelper.query(this.timerDao, newKeyMap, attrList,"record");
    }

    @Override
    public EntityResult recordInsert(Map<String, Object> attrMap) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Map<String, Object> newMap = new HashMap<>(attrMap);
        newMap.put(TimerDao.USER_, authentication.getName());
        return this.daoHelper.insert(this.timerDao, newMap);
    }

    @Override
    public EntityResult recordUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap) {
        return this.daoHelper.update(this.timerDao, attrMap, keyMap);
    }

    @Override
    public EntityResult recordDelete(Map<String, Object> keyMap) {
        return this.daoHelper.delete(this.timerDao, keyMap);
    }

    @Override
    public EntityResult startEndDateQuery(Map<String, Object> keyMap, List<String> attrList) throws OntimizeJEERuntimeException {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Map<String, Object> newMap = new HashMap<>(keyMap);
        newMap.put(TimerDao.USER_, authentication.getName());
        return this.timerQuery(newMap, attrList);
    }
}
