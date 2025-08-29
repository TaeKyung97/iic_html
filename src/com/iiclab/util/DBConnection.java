package com.iiclab.util;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;
import org.apache.commons.dbcp2.BasicDataSource;

public class DBConnection {
    private static BasicDataSource dataSource;

    // static 블록: 클래스가 로딩될 때 한 번만 실행됨
    static {
        try {
            Properties dbProps = new Properties();
            // config/db.properties 파일을 classpath에서 읽어옴
            InputStream is = Thread.currentThread()
                                   .getContextClassLoader()
                                   .getResourceAsStream("config/db.properties");
            if (is == null) {
                throw new RuntimeException("Cannot find db.properties in classpath");
            }
            dbProps.load(is);

            dataSource = new BasicDataSource();

            // 아래는 config/db.properties가 아닌 직접 입력하는 경우 (필요시 수정)
            /*
            dataSource.setDriverClassName("org.mariadb.jdbc.Driver");
            dataSource.setUrl("jdbc:mariadb://localhost:3306/iiclab?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC");
            dataSource.setUsername("iic_html");
            dataSource.setPassword("0619");
            */

            // 프로퍼티 파일에서 읽어온 값 사용
            dataSource.setDriverClassName(dbProps.getProperty("db.driver"));
            dataSource.setUrl(dbProps.getProperty("db.url"));
            dataSource.setUsername(dbProps.getProperty("db.user"));
            dataSource.setPassword(dbProps.getProperty("db.password"));

            // 커넥션 풀 상세 설정
            dataSource.setInitialSize(5);        // 초기 커넥션 수
            dataSource.setMaxTotal(20);          // 최대 커넥션 수
            dataSource.setValidationQuery("SELECT 1");     // 커넥션 유효성 검사 쿼리
            dataSource.setTestOnBorrow(true);    // 커넥션 빌릴 때 검사
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to initialize database connection pool", e);
        }
    }

    // 커넥션 풀에서 커넥션 반환 메서드
    public static Connection getConnection() throws SQLException {
        return dataSource.getConnection();
    }
}

