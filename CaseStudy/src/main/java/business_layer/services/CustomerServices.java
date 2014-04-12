package business_layer.services;

import business_layer.models.CustomerLineModel;
import business_layer.models.CustomerModel;
import persistent_layer.dao.ContactDao;
import persistent_layer.dao.CustomerDao;
import persistent_layer.dao.OrderDao;
import persistent_layer.entities.ContactEntities;
import persistent_layer.entities.CustomerEntities;
import persistent_layer.entities.OrderEntities;

import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: cfdcom3g
 * Date: 4/9/14
 * Time: 12:51 AM
 * To change this template use File
 * | Settings | File Templates.
 */
public class CustomerServices {
    //Des: return all of customer line model
    public List<CustomerLineModel> finfAllCustomerLine(){
        List<CustomerLineModel> result = new ArrayList<CustomerLineModel>();
        CustomerLineModel customerLineModel = null;
        CustomerDao customerDao = new CustomerDao();
        ContactDao contactDao = new ContactDao();
        OrderDao orderDao = new OrderDao();
        List<CustomerEntities> customerEntitieses = customerDao.findCustomers();
        for(int i=0; i< customerEntitieses.size(); i++){
            ContactEntities contactEntities = contactDao.findMainContactByCustomer(customerEntitieses.get(i).getCustomerId());
            List<OrderEntities> orderEntities = orderDao.findEquipment(customerEntitieses.get(i).getCustomerId());
            customerLineModel = new CustomerLineModel();
            customerLineModel.setCustomerId(customerEntitieses.get(i).getCustomerId());
            customerLineModel.setCustomerName(customerEntitieses.get(i).getCustomerName());
            customerLineModel.setContactName(contactEntities.getContactName());
            customerLineModel.setEmail(contactEntities.getEmail());
            customerLineModel.setTotalEquiment(orderEntities.size());
            customerLineModel.setLastOrder(orderEntities.get(0).getUpdateDate().toString());
            result.add(customerLineModel);
        }
        return result;
    }
    //Des: search Customer has attribute like key word
    public CustomerLineModel searchCustomer(String keyword){
        return  null;

    }
    // Find customer by id
    public CustomerModel findCustomerById(int customerId){
        CustomerDao customerDao = new CustomerDao();
        CustomerModel customerModel = new CustomerModel();
        CustomerEntities customerEntities = customerDao.findCustomerById(customerId);
        customerModel.setCustomerId(customerEntities.getCustomerId());
        customerModel.setCustomerName(customerEntities.getCustomerName());
        customerModel.setAddress(customerEntities.getAddress());
        customerModel.setFax(customerEntities.getFax());
        customerModel.setTel(customerEntities.getTel());
        return customerModel;

    }
}

