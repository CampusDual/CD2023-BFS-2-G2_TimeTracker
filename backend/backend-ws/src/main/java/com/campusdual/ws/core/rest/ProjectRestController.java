package com.campusdual.ws.core.rest;

import com.campusdual.api.core.service.IProjectService;
import com.ontimize.jee.server.rest.ORestController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/projects")
public class ProjectRestController extends ORestController{

    @Autowired
    private IProjectService projectService;


    @Override
    public Object getService() {
        return this.projectService;
    }
}
