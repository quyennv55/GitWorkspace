package business_layer.models;

/**
 * Created with IntelliJ IDEA.
 * User: cfdcom3g
 * Date: 4/9/14
 * Time: 12:55 AM
 * To change this template use File | Settings | File Templates.
 */
public class CustomerModel {
    int customerId;
    String customerName;
    String address;
    String tel;
    String fax;

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }
}
