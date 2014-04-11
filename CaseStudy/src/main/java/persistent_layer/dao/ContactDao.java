package persistent_layer.dao;

import Utils.DBUtils;
import persistent_layer.entities.ContactEntities;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ContactDao {
    // Find all contacts by customer id
    public List<ContactEntities> findAllContact(int customerId){
        List<ContactEntities> result = new ArrayList<ContactEntities>();
        ContactEntities contactEntities = null;
        String sql = "SELECT * FROM contacts WHERE customer_id =?";
        Connection con = null;
        try {
            con = DBUtils.getConnection();
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, customerId);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){
                contactEntities = new ContactEntities();
                contactEntities.setContactId(rs.getInt("contact_id"));
                contactEntities.setContactName(rs.getString("contact_name"));
                contactEntities.setEmail(rs.getString("email"));
                contactEntities.setTel(rs.getString("tel"));
                contactEntities.setMainContact(rs.getBoolean("main_contact"));
                contactEntities.setCustomerId(rs.getInt("customer_id"));
                result.add(contactEntities);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    // Add contact to customer
    public void addContact(int customerId, ContactEntities contactEntities){
        String sql = "INSERT INTO contacts(contact_name, email, tel, job_title, main_contact, customer_id) VALUES(?,?,?,?,?,?)";
        Connection con = null;
        try {
            con = DBUtils.getConnection();
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1,contactEntities.getContactName());
            pstmt.setString(2,contactEntities.getEmail());
            pstmt.setString(3, contactEntities.getTel());
            pstmt.setString(4, contactEntities.getJobTitle());
            pstmt.setBoolean(5, contactEntities.getMainContact());
            pstmt.setInt(6, contactEntities.getCustomerId());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    // Find main contact by customer id
    public  ContactEntities findContactByCustomer(int customerId){
        ContactEntities contactEntities = null;
        String sql = "SELECT * FROM contacts ct JOIN customers c on ct.customer_id = c.customer_id WHERE ct.customer_id = ? and ct.main_contact = 1 ";
        Connection con = null;
        try {
            con = DBUtils.getConnection();
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, customerId);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){
                contactEntities = new ContactEntities();
                contactEntities.setContactId(rs.getInt("contact_id"));
                contactEntities.setContactName(rs.getString("contact_name"));
                contactEntities.setEmail(rs.getString("email"));
                contactEntities.setTel(rs.getString("tel"));
                contactEntities.setMainContact(rs.getBoolean("main_contact"));
                contactEntities.setCustomerId(rs.getInt("customer_id"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return contactEntities;
    }

}