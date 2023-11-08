package com.campusdual.api.core.service;

import com.ontimize.jee.common.dto.EntityResult;

import java.util.List;
import java.util.Map;

public interface IProjectService {

    public EntityResult projectQuery(Map<String, Object> keyMap, List<?> attrList);
    public EntityResult projectInsert(Map<String, Object> attrMap);
    public EntityResult projectUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap);
    public EntityResult projectDelete(Map<String, Object> keyMap);
    public EntityResult projectTotalTimeQuery(Map<String, Object> keyMap, List<String> attrList);
    public EntityResult projectTotalTimeDelete(Map<String, Object> keyMap);
    public EntityResult projectTotalTimeUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap);

}
