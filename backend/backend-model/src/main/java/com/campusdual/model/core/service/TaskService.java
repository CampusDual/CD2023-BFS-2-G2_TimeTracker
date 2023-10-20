package com.campusdual.model.core.service;

import com.campusdual.api.core.service.ITaskService;
import com.campusdual.model.core.dao.ProjectDao;
import com.campusdual.model.core.dao.TaskDao;
import com.campusdual.model.core.dao.TimerDao;
import com.campusdual.model.core.dao.UsersProjectDao;
import com.ontimize.jee.common.db.SQLStatementBuilder;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.server.dao.DefaultOntimizeDaoHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Lazy
@Service("TaskService")
public class TaskService implements ITaskService {

   @Autowired
   private TaskDao taskDao;
   @Autowired
   private DefaultOntimizeDaoHelper daoHelper;


    @Override
    public EntityResult taskQuery(Map<?, ?> keyMap, List<?> attrList) {
        return this.daoHelper.query(this.taskDao, keyMap, attrList);
    }

    @Override
    public EntityResult taskInsert(Map<?, ?> attrMap) {
        return this.daoHelper.insert(this.taskDao, attrMap);
    }

    @Override
    public EntityResult taskUpdate(Map<?, ?> attrMap, Map<?, ?> keyMap) {
        return this.daoHelper.update(this.taskDao, attrMap, keyMap);
    }

    @Override
    public EntityResult taskDelete(Map<?, ?> keyMap) {
        return this.daoHelper.delete(this.taskDao, keyMap);
    }

    @Override
    public EntityResult taskTimerQuery(Map<?, ?> keyMap, List<?> attrList) {
        return this.daoHelper.query(this.taskDao, keyMap, attrList,"taskTimer");
    }
    @Override
    public EntityResult projectTaskQuery(Map<String, Object> keyMap, List<String> attrList) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Map<String, Object> newKeyMap = new HashMap<>(keyMap);

        SQLStatementBuilder.BasicField userField = new SQLStatementBuilder.BasicField(UsersProjectDao.USER_);
        SQLStatementBuilder.BasicExpression userExp = new SQLStatementBuilder.BasicExpression(userField, SQLStatementBuilder.BasicOperator.EQUAL_OP, authentication.getName());

        newKeyMap.put(SQLStatementBuilder.ExtendedSQLConditionValuesProcessor.EXPRESSION_KEY, userExp);


        return this.daoHelper.query(this.taskDao, newKeyMap, attrList,"projectTask");
    }
}
