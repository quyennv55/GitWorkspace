package business_layer.services;

import business_layer.models.OrderLineModel;
import persistent_layer.dao.ContactDao;
import persistent_layer.dao.OrderDao;
import persistent_layer.dao.ProductDao;
import persistent_layer.entities.ContactEntities;
import persistent_layer.entities.OrderEntities;
import persistent_layer.entities.ProductEntities;

import java.util.ArrayList;
import java.util.List;


public class OrderServices {
    // Find order by customer id
    public List<OrderLineModel> OrderLinesByCustomer(int customerId){
        List<OrderLineModel> orderLineModels = new ArrayList<OrderLineModel>();
        OrderLineModel orderLineModel = null;
        OrderDao orderDao = new OrderDao();
        ContactDao contactDao = new ContactDao();
        ProductDao productDao = new ProductDao();
        List<OrderEntities> orderEntitieses = orderDao.findOderById(customerId);
        List<ProductEntities> productEntitieses = null;
        for(OrderEntities orderEntities: orderEntitieses){
            orderLineModel = new OrderLineModel();
            orderLineModel.setOrderNumber(orderEntities.getOrderNumber()); // Set order Number
            orderLineModel.setCreateDate(orderEntities.getCreateDate());  // Set creation date
            orderLineModel.setUpdateDate(orderEntities.getUpdateDate());  // Set update date
            // find contact entity from order number
            ContactEntities contactEntities = contactDao.findContactByOrder(orderEntities.getOrderNumber());
            orderLineModel.setContact(contactEntities.getContactName());    // Set contact
            orderLineModel.setStatus(orderEntities.getStatus());
            // Find list products by order number
            productEntitieses = productDao.findProductsByOrder(orderEntities.getOrderNumber());
            int amount = 0; // total amount for each order
            for (ProductEntities productEntitiese : productEntitieses) {
                amount += productEntitiese.getPrice();
            }
            orderLineModel.setYear(productEntitieses.get(0).getYear()); // Set year
            orderLineModel.setTotalAmount(amount); // Set total amount
            orderLineModels.add(orderLineModel);
        }
        return orderLineModels;
    }
}
