package msm.msmsend.config;


import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;




@Configuration
@MapperScan(value="msm.msmsend.slave.mapper", sqlSessionFactoryRef="slave1SqlSessionFactory")
@EnableTransactionManagement
public class SlaveDataBaseConfig {

    @Bean(name="slave1DataSource")
    @ConfigurationProperties(prefix="spring.slave.datasource")
    public DataSource masterDataSource() {
        return DataSourceBuilder.create().build();
    }
        //ApplicationContext -> BeanFactory 하위 파일 ApplicationContext 스프링 최상단위 인터페이스
    @Bean(name="slave1SqlSessionFactory")
    public SqlSessionFactory slave1SqlSessionFactory(@Qualifier("slave1DataSource") DataSource slave1DataSource) throws Exception{
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(slave1DataSource);
        sqlSessionFactoryBean.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("classpath:/mapper/*.xml"));
        return sqlSessionFactoryBean.getObject();
    }

    @Bean(name="slave1SqlSessionTemplate")
    public SqlSessionTemplate slave1SqlSessionTemplate(SqlSessionFactory slave1SqlSessionFactory) throws Exception{
        return new SqlSessionTemplate(slave1SqlSessionFactory);
    }
}
