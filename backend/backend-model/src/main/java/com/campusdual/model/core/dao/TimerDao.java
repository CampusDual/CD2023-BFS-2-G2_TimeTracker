package com.campusdual.model.core.dao;

import com.ontimize.jee.server.dao.common.ConfigurationFile;
import com.ontimize.jee.server.dao.jdbc.OntimizeJdbcDaoSupport;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

@Lazy
@Repository(value = "TimerDao")
@ConfigurationFile(
        configurationFile = "dao/TimerDao.xml",
        configurationFilePlaceholder = "dao/placeholders.properties")
public class TimerDao extends OntimizeJdbcDaoSupport {
    public static final String TM_ID = "TM_ID";
    public static final String USER_ = "USER_";
    public static final String T_ID = "T_ID";
    public static final String TM_START_TIME = "TM_START_TIME";
    public static final String TM_END_TIME = "TM_END_TIME";
    public static final String TM_DURATION = "TM_DURATION";
    public static final String TM_DURATION_DECIMAL = "TM_DURATION_DECIMAL";

}
