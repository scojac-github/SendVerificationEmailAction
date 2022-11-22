@isTest
private class SendVerificationEmailActionTest {
    
    static testMethod void SendEmailTest() {

        // Create variables
        String varEmailTemplateId = '00XRM000000hxnG';  
        String varNetworkId = '0DBRM000000015i'; 
        String varStartUrl = '/s/contactsupport';

        // Get Profile to create user
        Profile p = [SELECT Id FROM Profile WHERE Name = 'Standard User'];

        // Create User
         User u1 = new User(
            alias = 'standt', 
            email='standarduserxyz215@testorg.com',
            emailencodingkey='UTF-8',
            firstname='Standard',
            lastname='Testing', 
            languagelocalekey='en_US',
            localesidkey='en_US', 
            profileid = p.Id,
            timezonesidkey='America/Los_Angeles', 
            username='standarduserxyz215@testorg.com');
            
        insert u1;

        List<SendVerificationEmailAction.FlowInput> inps = new List<SendVerificationEmailAction.FlowInput>();
        SendVerificationEmailAction.FlowInput inp = new SendVerificationEmailAction.FlowInput();


        inp.userId = u1.Id;
        // inp.EmailTemplateId = varEmailTemplateId;
        // inp.networkId = varNetworkId;
        inp.landingPageUrl = varStartUrl;
        inps.add(inp);

        
        Test.startTest();

        SendVerificationEmailAction.sendEmail(inps);
        System.assertEquals(inps.size(), 1);
        
        Test.stopTest();
        
    }
}