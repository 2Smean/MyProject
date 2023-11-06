package user.db;

public class UserDto {

    private String sUserEmail;
    private String sUserPassword;
    private String sUserName;
    private String sUserPhoneNumber;
    private String sUserType;
    public String getsUserEmail() {
        return sUserEmail;
    }
    public void setsUserEmail(String sUserEmail) {
        this.sUserEmail = sUserEmail;
    }
    public String getsUserPassword() {
        return sUserPassword;
    }
    public void setsUserPassword(String sUserPassword) {
        this.sUserPassword = sUserPassword;
    }
    public String getsUserName() {
        return sUserName;
    }

    public void setsUserName(String sUserName) {
        this.sUserName = sUserName;
    }

    public String getsUserPhoneNumber() {
        return sUserPhoneNumber;
    }

    public void setsUserPhoneNumber(String sUserPhoneNumber) {
        this.sUserPhoneNumber = sUserPhoneNumber;
    }

    public String getsUserType() {
        return sUserType;
    }

    public void setsUserType(String sUserType) {
        this.sUserType = sUserType;
    }
}
