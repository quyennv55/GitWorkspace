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
    // Add contact
    public void addContact(ContactModel contactModel){
        ContactDao contactDao = new ContactDao();
        ContactEntities contactEntities = new ContactEntities();
        contactEntities.setContactName(contactModel.getContactName());
        contactEntities.setCustomerId(contactModel.getCustomerId());
        contactEntities.setJobTitle(contactModel.getJobTitle());
        contactEntities.setTel(contactModel.getTel());
        contactEntities.setEmail(contactModel.getEmail());
        contactEntities.setMainContact(contactModel.getMainContact());
        contactDao.addContact(contactEntities);
    }
    // Change all contact to not main contact
    public void changeMainContact(int customerId){
        ContactDao contactDao = new ContactDao();
        contactDao.changeMainContact(customerId);
    }

}
