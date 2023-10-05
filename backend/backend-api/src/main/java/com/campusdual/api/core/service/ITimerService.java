package com.campusdual.api.core.service;

import com.ontimize.jee.common.dto.EntityResult;

import java.util.List;
import java.util.Map;

public interface ITimerService {
    public EntityResult timerQuery(Map<?, ?> keyMap, List<?> attrList);
    public EntityResult timerInsert(Map<?, ?> attrMap);
    public EntityResult timerUpdate(Map<?, ?> attrMap, Map<?, ?> keyMap);
    public EntityResult timerDelete(Map<?, ?> keyMap);
}
