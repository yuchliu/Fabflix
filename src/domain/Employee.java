package domain;

/**
 * Created by cjk98 on 5/9/2017.
 *
 */
public class Employee {
    private String email = "";
    private String fullname = "";
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getFullName() {
        return fullname;
    }
    public void setFullName(String fullName) {
        this.fullname = fullName;
    }
}
