package msm.msmsend.slave.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface slaveMapper {
    public int kakaoInsert1(String phoneNum,String KAC,String MMS);
}

