package service;

import dao.LimitDao;
import dao.LimitDaoImp;
import domain.LimitInfo;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LimitServiceImp implements LimitService {
    LimitDao limitDao=new LimitDaoImp();
    @Override
    public List<LimitInfo> listInfo() throws ClassNotFoundException, SQLException {
        return limitDao.listInfo();
    }

    @Override
    public int updateInfo(String info, int id) throws ClassNotFoundException, SQLException {
        return limitDao.updateInfo(info, id);
    }

    @Override
    public int deleteInfo(int id) throws ClassNotFoundException, SQLException {
        return limitDao.deleteInfo(id);
    }

    @Override
    public LimitInfo selectLimitInfoById(int id) throws ClassNotFoundException, SQLException {
        return limitDao.selectLimitInfoById(id);
    }

    @Override
    public int editInfo(LimitInfo limitInfo) throws ClassNotFoundException, SQLException {
        return limitDao.editInfo(limitInfo);
    }

    @Override
    public int addInfo(LimitInfo limitInfo) throws ClassNotFoundException, SQLException {
        return limitDao.addInfo(limitInfo);
    }

    /**
     * 查询到所有权限表的id，并形成list集合
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    public List<Integer> listId()throws SQLException, ClassNotFoundException{
        List<LimitInfo> list=limitDao.listInfo();
        List<Integer> logId=new ArrayList<>();
        for(LimitInfo limitInfo:list){
            logId.add(limitInfo.getId());
        }
        return logId;
    }
}
