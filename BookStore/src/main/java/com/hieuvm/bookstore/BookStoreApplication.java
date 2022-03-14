package com.hieuvm.bookstore;

import org.activiti.spring.boot.SecurityAutoConfiguration;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ImportResource;

@SpringBootApplication(exclude = { SecurityAutoConfiguration.class })
@ImportResource({"classpath*:activity_config.xml"})
public class BookStoreApplication {

    public static void main(String[] args) {
        SpringApplication.run(BookStoreApplication.class, args);

//        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext()
//        ApplicationContext applicationContext = SpringApplication.run(BookStoreApplication.class, args);
//
//        MessageProcessor userService = applicationContext.getBean(MessageProcessor.class);
//        userService.processMsg("twitter message sending ");
    }

//    @Bean
//    public CommandLineRunner init(final EmployeeService employeeService) {
//
//        return new CommandLineRunner() {
//            public void run(String... strings) throws Exception {
//                employeeService.createEmployee();
//            }
//        };
//    }
//
//    //    ------------------------
//    @Bean
//    public DataSource dataSource() {
//        // Use a JNDI data source or read the properties from
//        // env or a properties file.
//        // Note: The following shows only a simple data source
//        // for In-Memory H2 database.
//
//        SimpleDriverDataSource dataSource = new SimpleDriverDataSource();
//        dataSource.setDriverClass(com.mysql.jdbc.Driver.class);
//        dataSource.setUrl("jdbc:mysql://localhost:3306/book_store3");
//        dataSource.setUsername("root");
//        dataSource.setPassword("1999");
//        return dataSource;
//    }
//
//    @Bean
//    public PlatformTransactionManager transactionManager() {
//        return new DataSourceTransactionManager(dataSource());
//    }
//
//    @Bean
//    public SpringProcessEngineConfiguration processEngineConfiguration() {
//        SpringProcessEngineConfiguration config = new SpringProcessEngineConfiguration();
//
//        config.setDataSource(dataSource());
//        config.setTransactionManager(transactionManager());
//
//        config.setDatabaseSchemaUpdate("true");
//        config.setHistory("audit");
//        config.setJobExecutorActivate(true);
//
//        return config;
//    }
//
//    @Bean
//    public ProcessEngineFactoryBean processEngine() {
//        ProcessEngineFactoryBean factoryBean = new ProcessEngineFactoryBean();
//        factoryBean.setProcessEngineConfiguration(processEngineConfiguration());
//        return factoryBean;
//    }
//
//    @Bean
//    public RepositoryService repositoryService(ProcessEngine processEngine) {
//        return processEngine.getRepositoryService();
//    }
//
//    @Bean
//    public RuntimeService runtimeService(ProcessEngine processEngine) {
//        return processEngine.getRuntimeService();
//    }
//
//    @Bean
//    public TaskService taskService(ProcessEngine processEngine) {
//        return processEngine.getTaskService();
//    }


}
