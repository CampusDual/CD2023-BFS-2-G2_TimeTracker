package com.campusdual.model.core.service;

import com.campusdual.api.core.service.ITaskStatesService;
import com.campusdual.model.core.dao.TaskDao;
import com.campusdual.model.core.dao.TaskStatesDao;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.server.dao.DefaultOntimizeDaoHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Lazy
@Service("TaskStatesService")
public class TaskStatesService implements ITaskStatesService {
    @Autowired
    private TaskStatesDao taskStatesDao;
    @Autowired
    private DefaultOntimizeDaoHelper daoHelper;

    @Override
    public EntityResult taskStatesQuery(Map<?, ?> keyMap, List<?> attrList) {
        return this.daoHelper.query(this.taskStatesDao, keyMap, attrList);
    }

    @Override
    public EntityResult taskStatesInsert(Map<?, ?> attrMap) {
        return this.daoHelper.insert(this.taskStatesDao, attrMap);
    }

    @Override
    public EntityResult taskStatesUpdate(Map<?, ?> attrMap, Map<?, ?> keyMap) {
        return this.daoHelper.update(this.taskStatesDao, attrMap, keyMap);
    }

    @Override
    public EntityResult taskStatesDelete(Map<?, ?> keyMap) {
        return this.daoHelper.delete(this.taskStatesDao, keyMap);
    }
}
