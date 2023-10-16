package com.campusdual.api.core.service;

import com.ontimize.jee.common.dto.EntityResult;

import java.util.List;
import java.util.Map;

public interface IProjectService {

    public EntityResult projectQuery(Map<?, ?> keyMap, List<?> attrList);
    public EntityResult projectInsert(Map<?, ?> attrMap);
    public EntityResult projectUpdate(Map<?, ?> attrMap, Map<?, ?> keyMap);
    public EntityResult projectDelete(Map<?, ?> keyMap);
    public EntityResult projectTotalTimeQuery(Map<?, ?> keyMap, List<?> attrList);


}
