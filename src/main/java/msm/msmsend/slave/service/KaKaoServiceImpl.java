package msm.msmsend.slave.service;



import msm.msmsend.master.service.SmsService;
import msm.msmsend.slave.mapper.slaveMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service("KaKaoService")
public class KaKaoServiceImpl implements KaKaoService {
    @Autowired
    private slaveMapper slaveMapper;

    public int kakaoInsert1(String phoneNum,String KAC,String MMS){return slaveMapper.kakaoInsert1(phoneNum,KAC,MMS);};

}
