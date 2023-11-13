package com.campusdual.model.core.service;

import com.campusdual.api.core.service.IUsersProjectService;
import com.campusdual.model.core.dao.UsersProjectDao;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.common.dto.EntityResultMapImpl;
import com.ontimize.jee.server.dao.DefaultOntimizeDaoHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Lazy
@Service("UsersProjectService")
public class UsersProjectService implements IUsersProjectService {
    @Autowired
    private UsersProjectDao usersProjectDao;
    @Autowired
    private DefaultOntimizeDaoHelper daoHelper;


    @Override
    public EntityResult usersProjectQuery(Map<?, ?> keyMap, List<?> attrList) {
        return this.daoHelper.query(this.usersProjectDao, keyMap, attrList);
    }

    @Override
    public EntityResult usersProjectInsert(Map<?, ?> attrMap) {
        EntityResult res;
        try {
            res = this.daoHelper.insert(this.usersProjectDao, attrMap);
        } catch (DuplicateKeyException ex) {
            ex.printStackTrace();
            res = new EntityResultMapImpl();
            res.setCode(EntityResult.OPERATION_WRONG);
            res.setMessage("ERROR_USER_INSERT_MSG");
        }
        return res;
    }

    @Override
    public EntityResult usersProjectUpdate(Map<?, ?> attrMap, Map<?, ?> keyMap) {
        return this.daoHelper.update(this.usersProjectDao, attrMap, keyMap);
    }

    @Override
    public EntityResult usersProjectDelete(Map<?, ?> keyMap) {
        return this.daoHelper.delete(this.usersProjectDao, keyMap);
    }

    @Override
    public EntityResult usersProjectsNamesQuery(Map<?, ?> keyMap, List<?> attrList) {
        return this.daoHelper.query(this.usersProjectDao, keyMap, attrList, "usersProjectsNames");
    }

    @Override
    public EntityResult usersProjectsNamesDelete(Map<?, ?> keyMap) {
        return this.daoHelper.delete(this.usersProjectDao, keyMap);
    }

    @Override
    public EntityResult usersProjectTimeQuery(Map<?, ?> keyMap, List<?> attrList) {
        return this.daoHelper.query(this.usersProjectDao, keyMap, attrList, "usersProjectTime");
    }

}
