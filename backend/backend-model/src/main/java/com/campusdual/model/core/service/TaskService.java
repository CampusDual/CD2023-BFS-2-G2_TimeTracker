package com.campusdual.model.core.service;

import com.campusdual.api.core.service.ITaskService;
import com.campusdual.model.core.dao.ProjectDao;
import com.campusdual.model.core.dao.TaskDao;
import com.campusdual.model.core.dao.UsersProjectDao;
import com.ontimize.jee.common.db.SQLStatementBuilder;
import com.ontimize.jee.common.db.SQLStatementBuilder.BasicOperator;
import com.ontimize.jee.common.db.SQLStatementBuilder.BasicExpression;
import com.ontimize.jee.common.db.SQLStatementBuilder.BasicField;
import com.ontimize.jee.common.db.SQLStatementBuilder.ExtendedSQLConditionValuesProcessor;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.common.dto.EntityResultMapImpl;
import com.ontimize.jee.server.dao.DefaultOntimizeDaoHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
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
    @Autowired
   private ProjectService projectService;


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
        EntityResult err;
        try{
            err = this.daoHelper.delete(this.taskDao, keyMap);

        }catch (DataIntegrityViolationException e){
            err = new EntityResultMapImpl();
            err.setCode(EntityResult.OPERATION_WRONG);
            err.setMessage("DELETE_TASK_ERROR");
        }
        return err;
    }

    @Override
    public EntityResult taskTimerQuery(Map<?, ?> keyMap, List<?> attrList) {
        return this.daoHelper.query(this.taskDao, keyMap, attrList,"taskTimer");
    }
    @Override
    public EntityResult projectTaskQuery(Map<String, Object> keyMap, List<String> attrList) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Map<String, Object> newKeyMap = new HashMap<>(keyMap);

        BasicField userField = new BasicField(UsersProjectDao.USER_);
        BasicExpression userExp = new BasicExpression(userField, BasicOperator.EQUAL_OP, authentication.getName());

        if (keyMap.containsKey(ExtendedSQLConditionValuesProcessor.EXPRESSION_KEY)) {
            newKeyMap.put(ExtendedSQLConditionValuesProcessor.EXPRESSION_KEY, new BasicExpression(keyMap.get(ExtendedSQLConditionValuesProcessor.EXPRESSION_KEY), BasicOperator.AND_OP, userExp));
        } else {
            newKeyMap.put(ExtendedSQLConditionValuesProcessor.EXPRESSION_KEY, userExp);
        }

        return this.daoHelper.query(this.taskDao, newKeyMap, attrList,"projectTask");

    }

    @Override
    public EntityResult unfinishedTasksQuery(Map<String, Object> keyMap, List<String> attrList) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Map<String, Object> newKeyMap = new HashMap<>(keyMap);

        SQLStatementBuilder.BasicField userField = new SQLStatementBuilder.BasicField(ProjectDao.USER_);
        SQLStatementBuilder.BasicExpression userExp = new SQLStatementBuilder.BasicExpression(userField, SQLStatementBuilder.BasicOperator.EQUAL_OP, authentication.getName());

        newKeyMap.put(SQLStatementBuilder.ExtendedSQLConditionValuesProcessor.EXPRESSION_KEY, userExp);

        return this.daoHelper.query(this.taskDao, newKeyMap, attrList, "unfinishedTasks");
    }

    @Override
    public EntityResult projectTaskUpdate(Map<?, ?> attrMap, Map<?, ?> keyMap) {

        Map<String, Object> ptQueryMap = new HashMap<>();
        List<String> ptQueryList = new ArrayList<>();

        ptQueryMap.put(TaskDao.T_ID, keyMap.get(TaskDao.T_ID));
        ptQueryList.add(TaskDao.P_ID);

        EntityResult queryRes = taskQuery(ptQueryMap,ptQueryList);

        int pId;

        if(queryRes.calculateRecordNumber()>0){
            pId = (int)queryRes.getRecordValues(0).get(TaskDao.P_ID);

            ptQueryMap.clear();
            ptQueryList.clear();

            ptQueryMap.put(TaskDao.P_ID, pId);
            ptQueryList.add(ProjectDao.P_FINISHED);

            EntityResult pQueryRes = projectService.projectQuery(ptQueryMap,ptQueryList);

            if((boolean)pQueryRes.getRecordValues(0).get(ProjectDao.P_FINISHED)){
                EntityResult err;

                err = new EntityResultMapImpl();
                err.setCode(EntityResult.OPERATION_WRONG);
                err.setMessage("UPDATE_TASK_ERROR");

                return err;
            }
        }
        return this.daoHelper.update(this.taskDao, attrMap, keyMap);
    }

    @Override
    public EntityResult projectTaskDelete(Map<?, ?> keyMap) {
        EntityResult err;
        try{
            err = this.daoHelper.delete(this.taskDao, keyMap);

        }catch (DataIntegrityViolationException e){
            err = new EntityResultMapImpl();
            err.setCode(EntityResult.OPERATION_WRONG);
            err.setMessage("DELETE_TASK_ERROR");
        }
        return err;
    }
}
