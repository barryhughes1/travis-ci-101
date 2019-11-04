@isTest
private class accountLocationsMapController_TEST {
    
    @testSetup
    private static void initData() {
        Account customer = new Account(
            name = 'Salesforce (Sandyford)',
            BillingStreet = 'Level 1, Atrium A, Sandyford Business Park',
            BillingCity = 'Dublin',
            BillingState = ''
        );
        insert customer;

        List<Contact> contactsToInsert = new List<Contact>();
        contactsToInsert.add(
            new Contact(
                accountId=customer.id, 
                lastName='Gaffney', 
                firstName='Susan',
                Title='Program Manager', 
                MailingStreet='1 Central Park, Leopardstown Rd', 
                MailingCity='Dublin', 
                MailingState=''
        ));
        contactsToInsert.add(
            new Contact(
                accountId=customer.id, 
                lastName='Jones', 
                firstName='James',
                Title='Senior Consultant', 
                MailingStreet='Beacon Court, Bracken Road, Sandyford Industrial Estate', 
                MailingCity='Dublin', 
                MailingState=''
        ));
        insert contactsToInsert;
    }

    @isTest
    private static void T01_getAccountLocations() {

        Account acc = [SELECT ID FROM Account WHERE name = 'Salesforce (Sandyford)'];

        Test.starttest();
        List<accountLocationsMapController.clientLocationObj> result = accountLocationsMapController.getAccountLocations(acc.Id);
        Test.stopTest();

        System.assertEquals(3, result.size());
    }
}
