package com.campusdual.ws.core.rest;

import com.campusdual.api.core.service.ITimerService;
import com.campusdual.model.core.dao.TimerDao;
import com.ontimize.jee.common.db.SQLStatementBuilder.BasicOperator;
import com.ontimize.jee.common.db.SQLStatementBuilder.BasicExpression;
import com.ontimize.jee.common.db.SQLStatementBuilder.BasicField;
import com.ontimize.jee.common.db.SQLStatementBuilder.ExtendedSQLConditionValuesProcessor;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.common.dto.EntityResultMapImpl;
import com.ontimize.jee.server.rest.ORestController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/timers")
public class TimerRestController extends ORestController<ITimerService> {
    @Autowired
    private ITimerService timerService;


    @Override
    public ITimerService getService() {
        return this.timerService;
    }

    @RequestMapping(value="close", method = RequestMethod.PUT, produces = MediaType.APPLICATION_JSON_VALUE)
    public EntityResult closeTimer(Map<String, Object> keyMap, Map<String, Object> attrList) {
        EntityResult res = timerService.openTimerQuery(null, List.of(TimerDao.TM_ID));

        for (int i = 0; i < res.calculateRecordNumber(); i++) {
            Map<String, Object> recValues = res.getRecordValues(i);
            Integer value = (Integer) recValues.get(TimerDao.TM_ID);
            Map<String, Object> key = new HashMap<>(keyMap);
            Map<String, Object> attr = new HashMap<>(attrList);

            key.put(TimerDao.TM_ID, value);
            attr.put(TimerDao.TM_END_TIME, LocalDateTime.now());
            timerService.timerUpdate(attr, key);
        }
        EntityResult result = new EntityResultMapImpl();
        result.setCode(EntityResult.OPERATION_SUCCESSFUL_SHOW_MESSAGE);
        result.setMessage("CLOSE_TIMER_OK_MESSAGE");
        return result;
    }

    // where USER_ = nombreUser && TM_END_TIME is NULL
}
