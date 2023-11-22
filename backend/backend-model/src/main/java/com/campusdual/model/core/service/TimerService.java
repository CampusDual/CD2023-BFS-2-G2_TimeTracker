package com.campusdual.model.core.service;

import com.campusdual.api.core.service.ITimerService;
import com.campusdual.model.core.dao.TaskDao;
import com.campusdual.model.core.dao.TimerDao;
import com.ontimize.jee.common.db.SQLStatementBuilder.BasicOperator;
import com.ontimize.jee.common.db.SQLStatementBuilder.BasicExpression;
import com.ontimize.jee.common.db.SQLStatementBuilder.BasicField;
import com.ontimize.jee.common.db.SQLStatementBuilder.ExtendedSQLConditionValuesProcessor;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.common.dto.EntityResultMapImpl;
import com.ontimize.jee.common.exceptions.OntimizeJEERuntimeException;
import com.ontimize.jee.server.dao.DefaultOntimizeDaoHelper;
import org.postgresql.util.PGInterval;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.sql.Time;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.*;

@Lazy
@Service("TimerService")
public class TimerService implements ITimerService {
    @Autowired
    private TimerDao timerDao;
    @Autowired
    private DefaultOntimizeDaoHelper daoHelper;


    @Override
    public EntityResult timerQuery(Map<String, Object> keyMap, List<String> attrList) {
        return this.daoHelper.query(this.timerDao, keyMap, attrList);
    }

    @Override
    public EntityResult timerInsert(Map<String, Object> attrMap) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Map<String, Object> newMap = new HashMap<>(attrMap);
        newMap.put(TimerDao.USER_, authentication.getName());
        newMap.put(TimerDao.TM_START_TIME, LocalDateTime.now());
        return this.daoHelper.insert(this.timerDao, newMap);
    }

    @Override
    public EntityResult timerUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap) {
        return this.daoHelper.update(this.timerDao, attrMap, keyMap);
    }

    @Override
    public EntityResult timerDelete(Map<String, Object> keyMap) {
        return this.daoHelper.delete(this.timerDao, keyMap);
    }

    @Override
    public EntityResult openTimerQuery(Map<String, Object> keyMap, List<String> attrList) {
        Map<String, Object> key = new HashMap<>();
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        key.put(ExtendedSQLConditionValuesProcessor.EXPRESSION_KEY, searchLatestNULL(authentication.getName()));
        return this.timerQuery(key, attrList);
    }

    private BasicExpression searchLatestNULL(String user) {
        BasicField timeField = new BasicField(TimerDao.TM_END_TIME);
        BasicField userField = new BasicField(TimerDao.USER_);
        BasicExpression timeExp = new BasicExpression(timeField, BasicOperator.NULL_OP, null);
        BasicExpression userExp = new BasicExpression(userField, BasicOperator.EQUAL_OP, user);
        return new BasicExpression(timeExp, BasicOperator.AND_OP, userExp);
    }

    @Override
    public EntityResult recordQuery(Map<String, Object> keyMap, List<String> attrList) {
        List<Long> minuteTimes = new ArrayList<>();
        List<Long> minuteDecimalTimes = new ArrayList<>();

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Map<String, Object> newKeyMap = new HashMap<>(keyMap);

        BasicField userField = new BasicField(TimerDao.USER_);
        BasicExpression userExp = new BasicExpression(userField, BasicOperator.EQUAL_OP, authentication.getName());

        if (keyMap.containsKey(ExtendedSQLConditionValuesProcessor.EXPRESSION_KEY)) {
            newKeyMap.put(ExtendedSQLConditionValuesProcessor.EXPRESSION_KEY, new BasicExpression(keyMap.get(ExtendedSQLConditionValuesProcessor.EXPRESSION_KEY), BasicOperator.AND_OP, userExp));
        } else {
            newKeyMap.put(ExtendedSQLConditionValuesProcessor.EXPRESSION_KEY, userExp);
        }

        EntityResult res= this.daoHelper.query(this.timerDao, newKeyMap, attrList,"record");

        if (res.containsKey(TimerDao.TM_DURATION) || res.containsKey(TimerDao.TM_DURATION_DECIMAL)) {
            for (int i = 0; i < res.calculateRecordNumber(); i++) {
                Map<String, Object> recValues = res.getRecordValues(i);
                if (recValues.containsKey(TimerDao.TM_DURATION)) {
                    PGInterval value = (PGInterval) recValues.get(TimerDao.TM_DURATION);
                    minuteTimes.add(TaskService.intervalToMinutes(value));
                } else {
                    minuteTimes.add(0L);
                }
                if (recValues.containsKey(TimerDao.TM_DURATION_DECIMAL)) {
                    PGInterval value = (PGInterval) recValues.get(TimerDao.TM_DURATION_DECIMAL);
                    minuteDecimalTimes.add(TaskService.intervalToMinutes(value));
                } else {
                    minuteDecimalTimes.add(0L);
                }
            }
            res.put(TimerDao.TM_DURATION, minuteTimes);
            res.put(TimerDao.TM_DURATION_DECIMAL, minuteDecimalTimes);
        }
        return res;
    }

    @Override
    public EntityResult recordGlobalQuery(Map<String, Object> keyMap, List<String> attrList) {
        List<Long> minuteTimes = new ArrayList<>();
        List<Long> minuteDecimalTimes = new ArrayList<>();
        EntityResult res= this.daoHelper.query(this.timerDao, keyMap, attrList,"record");

        if (res.containsKey(TimerDao.TM_DURATION) || res.containsKey(TimerDao.TM_DURATION_DECIMAL)) {
            for (int i = 0; i < res.calculateRecordNumber(); i++) {
                Map<String, Object> recValues = res.getRecordValues(i);
                if (recValues.containsKey(TimerDao.TM_DURATION)) {
                    PGInterval value = (PGInterval) recValues.get(TimerDao.TM_DURATION);
                    minuteTimes.add(TaskService.intervalToMinutes(value));
                } else {
                    minuteTimes.add(0L);
                }
                if (recValues.containsKey(TimerDao.TM_DURATION_DECIMAL)) {
                    PGInterval value = (PGInterval) recValues.get(TimerDao.TM_DURATION_DECIMAL);
                    minuteDecimalTimes.add(TaskService.intervalToMinutes(value));
                } else {
                    minuteDecimalTimes.add(0L);
                }
            }
            res.put(TimerDao.TM_DURATION, minuteTimes);
            res.put(TimerDao.TM_DURATION_DECIMAL, minuteDecimalTimes);
        }
        return res;
    }

    @Override
    public EntityResult recordInsert(Map<String, Object> attrMap) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Map<String, Object> kMapQuery = new HashMap<>();
        List<String> aListQuery = new ArrayList<>();

        kMapQuery.put(TimerDao.USER_, authentication.getName());
        aListQuery.add(TimerDao.TM_START_TIME);
        aListQuery.add(TimerDao.TM_END_TIME);

        EntityResult queryRes = this.timerQuery(kMapQuery, aListQuery);
        ArrayList<Timestamp> startTime = (ArrayList<Timestamp>) queryRes.get(TimerDao.TM_START_TIME);
        ArrayList<Timestamp> endTime = (ArrayList<Timestamp>) queryRes.get(TimerDao.TM_END_TIME);

        for (int i = 0; i < startTime.size(); i++) {
            if (((Date) attrMap.get(TimerDao.TM_START_TIME)).before(endTime.get(i)) && ((Date) attrMap.get(TimerDao.TM_END_TIME)).after(startTime.get(i))) {
                EntityResult err = new EntityResultMapImpl();
                err.setCode(EntityResult.OPERATION_WRONG);
                err.setMessage("OVERLAPPING_TASK_MSG");
                return err;
            }
        }

        Map<String, Object> newMap = new HashMap<>(attrMap);
        newMap.put(TimerDao.USER_, authentication.getName());
        return this.daoHelper.insert(this.timerDao, newMap);
    }

    @Override
    public EntityResult recordUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap) {
        if (attrMap.containsKey(TimerDao.TM_START_TIME) || attrMap.containsKey(TimerDao.TM_END_TIME)) {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            Map<String, Object> kMapQuery = new HashMap<>();
            List<String> aListQuery = new ArrayList<>();

            kMapQuery.put(TimerDao.USER_, authentication.getName());
            aListQuery.add(TimerDao.TM_START_TIME);
            aListQuery.add(TimerDao.TM_END_TIME);
            aListQuery.add(TimerDao.TM_ID);

            EntityResult queryRes = this.timerQuery(kMapQuery, aListQuery);
            ArrayList<Timestamp> startTime = (ArrayList<Timestamp>) queryRes.get(TimerDao.TM_START_TIME);
            ArrayList<Timestamp> endTime = (ArrayList<Timestamp>) queryRes.get(TimerDao.TM_END_TIME);
            ArrayList<Integer> id = (ArrayList<Integer>) queryRes.get(TimerDao.TM_ID);

            Date newStartTime;
            Date newEndTime;
            List<String> newAttrList = new ArrayList<>();

            if (attrMap.containsKey(TimerDao.TM_START_TIME)) {
                if (attrMap.containsKey(TimerDao.TM_END_TIME)) {
                    newStartTime = (Date) attrMap.get(TimerDao.TM_START_TIME);
                    newEndTime = (Date) attrMap.get(TimerDao.TM_END_TIME);
                } else {
                    newStartTime = (Date) attrMap.get(TimerDao.TM_START_TIME);
                    newAttrList.add(TimerDao.TM_END_TIME);
                    EntityResult res = this.timerQuery(keyMap, newAttrList);
                    newEndTime = ((ArrayList<Date>) res.get(TimerDao.TM_END_TIME)).get(0);
                }
            } else {
                newEndTime = (Date) attrMap.get(TimerDao.TM_END_TIME);
                newAttrList.add(TimerDao.TM_START_TIME);
                EntityResult res = this.timerQuery(keyMap, newAttrList);
                newStartTime = ((ArrayList<Date>) res.get(TimerDao.TM_START_TIME)).get(0);
            }

            for (int i = 0; i < startTime.size(); i++) {
                if (endTime.get(i) == null) {
                    endTime.set(i, Timestamp.valueOf(LocalDateTime.now()));
                }
                    if (id.get(i).compareTo((Integer) keyMap.get(TimerDao.TM_ID)) != 0) {
                        if (newStartTime.before(endTime.get(i)) &&
                                newEndTime.after(startTime.get(i))) {
                            EntityResult err = new EntityResultMapImpl();
                            err.setCode(EntityResult.OPERATION_WRONG);
                            err.setMessage("OVERLAPPING_TASK_MSG");
                            return err;
                        }
                    }
            }
        }
        return this.daoHelper.update(this.timerDao, attrMap, keyMap);
    }

    @Override
    public EntityResult recordDelete(Map<String, Object> keyMap) {
        return this.daoHelper.delete(this.timerDao, keyMap);
    }

    @Override
    public EntityResult startEndDateQuery(Map<String, Object> keyMap, List<String> attrList) throws OntimizeJEERuntimeException {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Map<String, Object> newMap = new HashMap<>(keyMap);
        newMap.put(TimerDao.USER_, authentication.getName());
        return this.timerQuery(newMap, attrList);
    }
}
