package com.example;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class DataSourceTest {
    public void testConnection(){
        ApplicationContext ctx= new FileSystemXmlApplicationContext("file:src/main/webapp/WEB-INF/root-context.xml");
        DataSource ds=(DataSource) ctx.getBean("dataSource");

        try {
            Connection con = ds.getConnection();
            System.out.println("연결 성공");
        }
        catch (SQLException e){
            e.printStackTrace();
            System.out.println("연결 실패");
        }
    }
}
