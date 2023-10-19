package com.campusdual.api.core.service;

import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.common.exceptions.OntimizeJEERuntimeException;

import java.util.List;
import java.util.Map;

public interface ITimerService {
    public EntityResult timerQuery(Map<String, Object> keyMap, List<String> attrList) throws OntimizeJEERuntimeException;
    public EntityResult timerInsert(Map<String, Object> attrMap) throws OntimizeJEERuntimeException;
    public EntityResult timerUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap) throws OntimizeJEERuntimeException;
    public EntityResult timerDelete(Map<String, Object> keyMap) throws OntimizeJEERuntimeException;
    public EntityResult openTimerQuery(Map<String, Object> keyMap, List<String> attrList) throws OntimizeJEERuntimeException;
    public EntityResult recordQuery(Map<String, Object> keyMap, List<String> attrList) throws OntimizeJEERuntimeException;
    public EntityResult recordInsert(Map<String, Object> attrMap) throws OntimizeJEERuntimeException;
    public EntityResult recordUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap) throws OntimizeJEERuntimeException;
    public EntityResult recordDelete(Map<String, Object> keyMap) throws OntimizeJEERuntimeException;
}
