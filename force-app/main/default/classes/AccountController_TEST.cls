@isTest
private class AccountController_TEST {
    
    @testSetup
    private static void initData() {
        List<Account> newAccounts = new List<Account>();
        for(Integer i=0; i<300; i=i+1) {
            newAccounts.add(
                new Account(
                    name = 'Account Test ' + i
                )
            );
        }
        insert newAccounts;
    }

    @isTest
    private static void T01_findAll() {

        Test.starttest();
        List<Account> accountsReturned = AccountController.findAll();
        Test.stopTest();

        System.assertEquals(50, accountsReturned.size());
    }
}
