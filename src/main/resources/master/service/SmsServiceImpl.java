package msm.msmsend.master.service;


import msm.msmsend.dto.smsDto;
import msm.msmsend.master.mapper.smsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service("SmsService")
public class SmsServiceImpl implements SmsService {
    @Autowired
    private smsMapper smsMapper;

    public List<smsDto> basicGroup(){return smsMapper.basicGroup();}

    public int updateBasic(String number){return smsMapper.updateBasic(number);}

    public int userCheck(String user){return smsMapper.userCheck(user);}
    public List<smsDto> getTable(String one) {
        return smsMapper.getTable(one);
    }
    public List<smsDto> getDISTINCT(){return smsMapper.getDISTINCT();}

    public int updateOtherGroup(String number,String othergroup){return smsMapper.updateOtherGroup(number,othergroup);}

    public List<smsDto> getDISTINCTOthergroup(){return smsMapper.getDISTINCTOthergroup();}

    public int insert(String number,String name,String groupnm,String groupname){
        return smsMapper.insert(number,name,groupnm,groupname);
    }
    public List<smsDto> getTableNm(String groupnm) {
        return smsMapper.getTableNm(groupnm);
    }

    public List<smsDto> otherGroup(String groupnm) {
        return smsMapper.otherGroup(groupnm);
    }

    public List<smsDto> getUser (String no1,String number){
        return smsMapper.getUser(no1,number);
    };
    public int delete(String no1) {
        return smsMapper.delete(no1);
    }

    public int getGroupnm(String groupname) {
        return smsMapper.getGroupnm(groupname);
    }

    public int update(String number,String name,String no1,String groupname,String groupnm ,String othergroup)
    {
        return smsMapper.update(number,name,no1,groupname,groupnm,othergroup);
    }

    public int deleteExisting(String number){return smsMapper.deleteExisting(number);}
    public int smshistory(String number,String text,String result,String reason){
        return  smsMapper.smshistory(number,text,result,reason);
    }

    public List<smsDto> getTableOtherNot(){return smsMapper.getTableOtherNot();}

    public String getGroupname(int groupnm){ return  smsMapper.getGroupname(groupnm);
    };

    public int groupMax() {return  smsMapper.groupMax();}

    public String getText() {return  smsMapper.getText();}

}
