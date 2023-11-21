package com.campusdual.api.core.service;

import com.ontimize.jee.common.dto.EntityResult;

import java.util.List;
import java.util.Map;

public interface ITaskService {

    public EntityResult taskQuery(Map<?, ?> keyMap, List<?> attrList);
    public EntityResult taskInsert(Map<String, Object> attrMap);
    public EntityResult taskUpdate(Map<?, ?> attrMap, Map<?, ?> keyMap);
    public EntityResult taskDelete(Map<?, ?> keyMap);
    public EntityResult taskTimerQuery(Map<?, ?> keyMap, List<?> attrList);
    public EntityResult projectTaskQuery(Map<String, Object> keyMap, List<String> attrList);
    public EntityResult unfinishedTasksQuery(Map<String, Object> keyMap, List<String> attrList);
    public EntityResult projectTaskUpdate(Map<?, ?> attrMap, Map<?, ?> keyMap);
    public EntityResult projectTaskDelete(Map<?, ?> keyMap);
    public EntityResult projectSummaryTasksGraphQuery(Map<String, Object> keyMap, List<String> attrList);
    public EntityResult projectSummaryTasksTableQuery(Map<String, Object> keyMap, List<String> attrList);
    public EntityResult allTasksOrderedQuery(Map<String, Object> keyMap, List<String> attrList);
    public EntityResult allTasksOrderedUpdate(Map<?, ?> attrMap, Map<?, ?> keyMap);
    public EntityResult allTasksOrderedDelete(Map<?, ?> keyMap);
}
