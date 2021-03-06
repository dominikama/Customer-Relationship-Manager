package org.example.config;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import javax.sql.DataSource;
import java.beans.PropertyVetoException;
import java.util.Properties;
import java.util.logging.Logger;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "org.example")
@EnableTransactionManagement
@PropertySource("classpath:persistence-mysql.properties")
public class CRMAppConfig implements WebMvcConfigurer {

    //set up a variable to hold the properties
    @Autowired
    Environment env;

    //set up a logger
    private Logger logger = Logger.getLogger(getClass().getName());

    //define a bean for a view resolver

    @Bean
    public ViewResolver viewResolver() {

        InternalResourceViewResolver resolver =
                new InternalResourceViewResolver();

        resolver.setPrefix("/WEB-INF/view/");
        resolver.setSuffix(".jsp");

        return resolver;
    }

    //define a bean for security datasource
    @Bean
    public DataSource securityDataSource() {

        //create connection pool

        ComboPooledDataSource securityDataSource =
                new ComboPooledDataSource();

        //set jdbc driver
        try {
            securityDataSource.setDriverClass(env.getProperty("jdbc.driver"));
        } catch (PropertyVetoException e) {
            throw new RuntimeException(e);
        }

        //log connection
        logger.info("=======>>> jdbc:url="+ env.getProperty("jdbc.url"));

        //set connection props
        securityDataSource.setJdbcUrl(env.getProperty("jdbc.url"));
        securityDataSource.setUser(env.getProperty("jdbc.user"));
        securityDataSource.setPassword(env.getProperty("jdbc.password"));


        //set connection pool props
        securityDataSource.setInitialPoolSize(toInt("connection.pool.initialPoolSize"));
        securityDataSource.setMinPoolSize(toInt("connection.pool.minPoolSize"));
        securityDataSource.setMaxPoolSize(toInt("connection.pool.maxPoolSize"));
        securityDataSource.setMaxIdleTime(toInt("connection.pool.maxIdleTime"));
        return securityDataSource;
    }

    private int toInt(String name) {
        String propval = env.getProperty(name);
        return Integer.parseInt(propval);
    }

    private Properties getHibernateProperties() {

        // set hibernate properties
        Properties props = new Properties();

        props.setProperty("hibernate.dialect", env.getProperty("hibernate.dialect"));
        props.setProperty("hibernate.show_sql", env.getProperty("hibernate.show_sql"));

        return props;
    }


    @Bean
    public LocalSessionFactoryBean sessionFactory(){

        // create session factories
        LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();

        // set the properties
        sessionFactory.setDataSource(securityDataSource());
        sessionFactory.setPackagesToScan(env.getProperty("hiberante.packagesToScan"));
        sessionFactory.setHibernateProperties(getHibernateProperties());

        return sessionFactory;
    }

    @Bean
    @Autowired
    public HibernateTransactionManager transactionManager(SessionFactory sessionFactory) {

        // setup transaction manager based on session factory
        HibernateTransactionManager txManager = new HibernateTransactionManager();
        txManager.setSessionFactory(sessionFactory);

        return txManager;
    }

    @Override
    public void addResourceHandlers(final ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
    }


}
