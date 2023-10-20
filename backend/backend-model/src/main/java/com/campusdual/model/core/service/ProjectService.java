package com.campusdual.model.core.service;

import com.campusdual.api.core.service.IProjectService;
import com.campusdual.model.core.dao.ProjectDao;
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
@Service("ProjectService")
public class ProjectService implements IProjectService {

    @Autowired
    private ProjectDao projectDao;
    @Autowired
    private DefaultOntimizeDaoHelper daoHelper;

    @Autowired
    private UsersProjectService usersProjectService;


    @Override
    public EntityResult projectQuery(Map<String, Object> keyMap, List<?> attrList) {
        return this.daoHelper.query(this.projectDao, keyMap, attrList);
    }

    @Override
    public EntityResult projectInsert(Map<String, Object> attrMap) {
        EntityResult res = this.daoHelper.insert(this.projectDao, attrMap);

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Map<String, Object> newAttrMap = new HashMap<>();
        newAttrMap.put(ProjectDao.P_ID, res.get(ProjectDao.P_ID));
        newAttrMap.put(UsersProjectDao.USER_, authentication.getName());
        usersProjectService.usersProjectInsert(newAttrMap);

        return res;
    }

    @Override
    public EntityResult projectUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap) {
        return this.daoHelper.update(this.projectDao, attrMap, keyMap);
    }

    @Override
    public EntityResult projectDelete(Map<String, Object> keyMap) {
        return this.daoHelper.delete(this.projectDao, keyMap);
    }

    @Override
    public EntityResult projectTotalTimeQuery(Map<String, Object> keyMap, List<String> attrList) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Map<String, Object> newKeyMap = new HashMap<>(keyMap);

        SQLStatementBuilder.BasicField userField = new SQLStatementBuilder.BasicField(ProjectDao.USER_);
        SQLStatementBuilder.BasicExpression userExp = new SQLStatementBuilder.BasicExpression(userField, SQLStatementBuilder.BasicOperator.EQUAL_OP, authentication.getName());

        newKeyMap.put(SQLStatementBuilder.ExtendedSQLConditionValuesProcessor.EXPRESSION_KEY, userExp);


        return this.daoHelper.query(this.projectDao, newKeyMap, attrList, "projectTotalTime");
    }

    @Override
    public EntityResult projectTotalTimeDelete(Map<String, Object> keyMap) {
        return this.daoHelper.delete(this.projectDao, keyMap);
    }

    @Override
    public EntityResult projectTotalTimeUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap) {
        return this.daoHelper.update(this.projectDao, attrMap, keyMap);
    }
}
