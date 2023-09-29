package com.campusdual.model.core.service;

import com.campusdual.api.core.service.IProjectService;
import com.campusdual.model.core.dao.ProjectDao;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.server.dao.DefaultOntimizeDaoHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Lazy
@Service("ProjectService")
public class ProjectService implements IProjectService {

    @Autowired
    private ProjectDao projectDao;
    @Autowired
    private DefaultOntimizeDaoHelper daoHelper;


    @Override
    public EntityResult projectQuery(Map<?, ?> keyMap, List<?> attrList) {
        return this.daoHelper.query(this.projectDao, keyMap, attrList);
    }

    @Override
    public EntityResult projectInsert(Map<?, ?> attrMap) {
        return this.daoHelper.insert(this.projectDao, attrMap);
    }

    @Override
    public EntityResult projectUpdate(Map<?, ?> attrMap, Map<?, ?> keyMap) {
        return this.daoHelper.update(this.projectDao, attrMap, keyMap);
    }

    @Override
    public EntityResult projectDelete(Map<?, ?> keyMap) {
        return this.daoHelper.delete(this.projectDao, keyMap);
    }
}
