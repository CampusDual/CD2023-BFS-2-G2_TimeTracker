package com.campusdual.ws.core.rest;

import com.campusdual.api.core.service.IProjectService;
import com.campusdual.api.core.service.IUsersProjectService;
import com.ontimize.jee.server.rest.ORestController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/usersProjects")
public class UsersProjectRestController extends ORestController<IUsersProjectService> {
    @Autowired
    private IUsersProjectService usersProjectService;
    @Override
    public IUsersProjectService getService() {
        return this.usersProjectService;
    }
}
