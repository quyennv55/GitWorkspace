package business_layer.services;


import business_layer.models.ContactModel;
import persistent_layer.dao.ContactDao;
import persistent_layer.entities.ContactEntities;

public class ContactServices {
    // Find main contact and show on page
    public ContactModel findMainContact(int customerId){
        ContactDao contactDao = new ContactDao();
        ContactModel contactModel = new ContactModel();
        ContactEntities contactEntities = contactDao.findMainContactByCustomer(customerId);
        contactModel.setContactName(contactEntities.getContactName());
        contactModel.setEmail(contactEntities.getEmail());
        contactModel.setTel(contactEntities.getTel());
        contactModel.setMainContact(contactEntities.getMainContact());
        contactModel.setJobTitle(contactEntities.getJobTitle());
        return contactModel;
    }
}
