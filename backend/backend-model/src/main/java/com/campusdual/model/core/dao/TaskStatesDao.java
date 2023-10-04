package com.campusdual.model.core.dao;

import com.ontimize.jee.server.dao.common.ConfigurationFile;
import com.ontimize.jee.server.dao.jdbc.OntimizeJdbcDaoSupport;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

@Lazy
@Repository(value = "TaskStatesDao")
@ConfigurationFile(
        configurationFile = "dao/TaskStatesDao.xml",
        configurationFilePlaceholder = "dao/placeholders.properties")
public class TaskStatesDao extends OntimizeJdbcDaoSupport {
    public static final String TS_ID = "TS_ID";
    public static final String TS_NAME = "TS_NAME";
}
