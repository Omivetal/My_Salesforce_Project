@isTest
public class UpdateLeadsBatch_Test {
    
    @testSetup
    static void testData()
    {   
        List<Lead> objLeadList = New List<Lead>();
        //creating multiple records
        for (Integer i=0; i<20; i++){
            objLeadList.add(new Lead(LastName ='Test User' + i,Company = 'Test Company US' + i, Status = 'Open - Not Contacted',Country = 'US', City = 'New York'));
        }
        insert objLeadList;
    }
    public static TestMethod void UpdateLeadsBatch_TestMethod()
   { 
              
        Test.startTest();   
        UpdateLeadsBatch batchJob=new UpdateLeadsBatch();
        ID batchID = Database.executeBatch(batchJob,100);
        Test.stopTest(); 
       	System.abortJob(batchID);
        System.assertEquals(20, [Select count() from Lead where City = 'New York' AND Rating = 'Hot' AND LeadSource = 'Web']);
   }
    
}