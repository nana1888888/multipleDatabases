package msm.msmsend.master.mapper;




import msm.msmsend.dto.smsDto;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
@Mapper
public interface smsMapper {
    public List<smsDto> getTable(String one);

    public List<smsDto> getTableOtherNot();

    public int insert(String number,String name,String groupnm,String groupname);
    public List<smsDto> getDISTINCT();

    public List<smsDto> basicGroup();

    public List<smsDto> getDISTINCTOthergroup();
    public List<smsDto> getTableNm(String groupnm);

    public int delete(String no1);

    public int updateBasic(String number);

    public List<smsDto> otherGroup(String groupnm);
    public int userCheck(String user);

    public int deleteExisting(String number);

    public int update(String number,String name,String no1,String groupname,String groupnm,String othergroup);

    public int smshistory(String number,String text,String result,String reason);

    public int updateOtherGroup(String othergroup,String number);

    public String getGroupname(int groupnm);

    public int getGroupnm(String groupname);
    public List<smsDto> getUser (String no1,String number);

    public int groupMax();

    public String getText();
}
