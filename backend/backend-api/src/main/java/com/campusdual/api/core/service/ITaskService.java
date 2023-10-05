package com.campusdual.api.core.service;

import com.ontimize.jee.common.dto.EntityResult;

import java.util.List;
import java.util.Map;

public interface ITaskService {

    public EntityResult taskQuery(Map<?, ?> keyMap, List<?> attrList);
    public EntityResult taskInsert(Map<?, ?> attrMap);
    public EntityResult taskUpdate(Map<?, ?> attrMap, Map<?, ?> keyMap);
    public EntityResult taskDelete(Map<?, ?> keyMap);
    public EntityResult taskTimerQuery(Map<?, ?> keyMap, List<?> attrList);

}
