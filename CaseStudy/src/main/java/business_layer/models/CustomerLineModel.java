package business_layer.models;

/**
 * Created with IntelliJ IDEA.
 * User: cfdcom3g
 * Date: 4/9/14
 * Time: 12:48 AM
 * To change this template use File | Settings | File Templates.
 */
public class CustomerLineModel {
    int customerId;
    String customerName;
    String contactName;
    String email;
    int totalEquiment;
    String lastOrder;

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

    public String getContactName() {
        return contactName;
    }

    public void setContactName(String contactName) {
        this.contactName = contactName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getTotalEquiment() {
        return totalEquiment;
    }

    public void setTotalEquiment(int totalEquiment) {
        this.totalEquiment = totalEquiment;
    }

    public String getLastOrder() {
        return lastOrder;
    }

    public void setLastOrder(String lastOrder) {
        this.lastOrder = lastOrder;
    }
}
