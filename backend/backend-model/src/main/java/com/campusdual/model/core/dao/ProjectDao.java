package com.campusdual.model.core.dao;

import com.ontimize.jee.server.dao.common.ConfigurationFile;
import com.ontimize.jee.server.dao.jdbc.OntimizeJdbcDaoSupport;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;
import com.ontimize.jee.server.dao.jdbc.OntimizeJdbcDaoSupport;
import com.ontimize.jee.server.dao.common.ConfigurationFile;

@Lazy
@Repository(value = "ProjectDao")
@ConfigurationFile(
        configurationFile = "dao/ProjectDao.xml",
        configurationFilePlaceholder = "dao/placeholders.properties")
public class ProjectDao extends OntimizeJdbcDaoSupport {

        public static final String P_ID = "P_ID";
        public static final String P_NAME = "P_NAME";
        public static final String P_DESCRIPTION = "P_DESCRIPTION";
        public static final String P_USER_ = "P_USER_";
        public static final String P_TIME = "P_TIME";
        public static final String P_DATE = "P_DATE";
}
