package com.campusdual.api.core.service;

import com.ontimize.jee.common.dto.EntityResult;

import java.util.List;
import java.util.Map;

public interface ITaskStatesService {
    public EntityResult taskStatesQuery(Map<?, ?> keyMap, List<?> attrList);
    public EntityResult taskStatesInsert(Map<?, ?> attrMap);
    public EntityResult taskStatesUpdate(Map<?, ?> attrMap, Map<?, ?> keyMap);
    public EntityResult taskStatesDelete(Map<?, ?> keyMap);
}
