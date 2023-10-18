package com.campusdual.model.core.dao;

import com.ontimize.jee.server.dao.common.ConfigurationFile;
import com.ontimize.jee.server.dao.jdbc.OntimizeJdbcDaoSupport;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

@Lazy
@Repository(value = "UsersProjectDao")
@ConfigurationFile(
        configurationFile = "dao/UsersProjectDao.xml",
        configurationFilePlaceholder = "dao/placeholders.properties")
public class UsersProjectDao extends OntimizeJdbcDaoSupport {

    public static final String UP_ID = "UP_ID";
    public static final String P_ID = "P_ID";
    public static final String USER_ = "USER_";
}
