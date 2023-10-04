package com.campusdual.ws.core.rest;

import com.campusdual.api.core.service.ITaskService;
import com.campusdual.api.core.service.ITaskStatesService;
import com.ontimize.jee.server.rest.ORestController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/taskStates")
public class TaskStatesRestController extends ORestController<ITaskStatesService> {
    @Autowired
    private ITaskStatesService taskStatesService;


    @Override
    public ITaskStatesService getService() {
        return this.taskStatesService;
    }
}
