package dao;

import domain.LimitInfo;

import java.sql.SQLException;
import java.util.List;

public interface LimitDao {
    public abstract List<LimitInfo> listInfo() throws ClassNotFoundException, SQLException;
    public abstract int updateInfo(String info, int id) throws ClassNotFoundException, SQLException;
    public abstract int deleteInfo(int id) throws ClassNotFoundException, SQLException;
    public abstract LimitInfo selectLimitInfoById(int id) throws ClassNotFoundException, SQLException;
    public abstract  int editInfo(LimitInfo limitInfo) throws ClassNotFoundException, SQLException;
    public abstract  int addInfo(LimitInfo limitInfo) throws ClassNotFoundException, SQLException;
}
