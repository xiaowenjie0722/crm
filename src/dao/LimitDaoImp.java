package dao;

import domain.LimitInfo;
import util.JdbcUtil;

import java.sql.SQLException;
import java.util.List;

public class LimitDaoImp implements LimitDao {
    @Override
    public List<LimitInfo> listInfo() throws ClassNotFoundException, SQLException {
        return JdbcUtil.listInfo("select * from limitinfo");
    }

    @Override
    public int updateInfo(String info,int id) throws ClassNotFoundException, SQLException {
        return JdbcUtil.updateInfo("update limitinfo set info=? where id=?",info,id);
    }

    @Override
    public int deleteInfo(int id) throws ClassNotFoundException, SQLException {
        return JdbcUtil.updateInfo("delete from limitinfo where id=?",id);
    }

    @Override
    public LimitInfo selectLimitInfoById(int id) throws ClassNotFoundException, SQLException {
        return JdbcUtil.selectLimitInfoById("select * from limitinfo where id=?",id);
    }

    @Override
    public int editInfo(LimitInfo limitInfo) throws ClassNotFoundException, SQLException {
        return JdbcUtil.updateInfo("update limitinfo set limitname=?,info=? where id=?",limitInfo.getLimitname(),limitInfo.getInfo(),limitInfo.getId());
    }

    @Override
    public int addInfo(LimitInfo limitInfo) throws ClassNotFoundException, SQLException {
        return JdbcUtil.updateInfo("INSERT INTO limitinfo (limitname,info,limitstatus) values (?,?,?)",limitInfo.getLimitname(),limitInfo.getInfo(),limitInfo.getLimitstatus());
    }
}
