package domain;

public class LimitInfo {
    private int id;
    private String limitname;
    private String info;
    private int limitstatus;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLimitname() {
        return limitname;
    }

    public void setLimitname(String limitname) {
        this.limitname = limitname;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public int getLimitstatus() {
        return limitstatus;
    }

    public void setLimitstatus(int limitstatus) {
        this.limitstatus = limitstatus;
    }

}
