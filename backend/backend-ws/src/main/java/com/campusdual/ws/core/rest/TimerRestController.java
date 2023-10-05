package com.campusdual.ws.core.rest;

import com.campusdual.api.core.service.ITaskService;
import com.campusdual.api.core.service.ITimerService;
import com.ontimize.jee.server.rest.ORestController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/timers")
public class TimerRestController extends ORestController<ITimerService> {
    @Autowired
    private ITimerService timerService;


    @Override
    public ITimerService getService() {
        return this.timerService;
    }
}
