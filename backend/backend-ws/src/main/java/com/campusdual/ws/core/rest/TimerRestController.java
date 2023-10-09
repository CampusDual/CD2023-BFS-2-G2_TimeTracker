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
    public void closeTimer() {
        List<Object> unclosedTimersList = (List<Object>)getUnclosedTimer().get(TimerDao.TM_ID);

        for (int i = 0; i < unclosedTimersList.size(); i++) {
            Integer timerID = (Integer) unclosedTimersList.get(i);
            Map<String, Object> key = new HashMap<>();
            Map<String, Object> attr = new HashMap<>();
            key.put(TimerDao.TM_ID, timerID);
            attr.put(TimerDao.TM_END_TIME, LocalDateTime.now());
            timerService.timerUpdate(attr, key);
        }
    }

    @RequestMapping(value = "getUnclose", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    private EntityResult showUnclosed() {
        return getUnclosedTimer();
    }

    private EntityResult getUnclosedTimer() {
        try {
            Map<String, Object> key = new HashMap<String, Object>();
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            key.put(ExtendedSQLConditionValuesProcessor.EXPRESSION_KEY, searchLatestNULL(authentication.getName()));

            return timerService.timerQuery(key, List.of(TimerDao.TM_ID));
        } catch (Exception e) {
            e.printStackTrace();
            EntityResult res = new EntityResultMapImpl();
            res.setCode(EntityResult.OPERATION_WRONG);
            return res;
        }
    }

    private BasicExpression searchLatestNULL(String user) {
        BasicField timeField = new BasicField(TimerDao.TM_END_TIME);
        BasicField userField = new BasicField(TimerDao.USER_);
        BasicExpression timeExp = new BasicExpression(timeField, BasicOperator.NULL_OP, null);
        BasicExpression userExp = new BasicExpression(userField, BasicOperator.EQUAL_OP, user);
        return new BasicExpression(timeExp, BasicOperator.AND_OP, userExp);
    }

    // where USER_ = nombreUser && TM_END_TIME is NULL
}
