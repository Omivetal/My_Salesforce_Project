global class UpdateLeadsBatch implements Database.batchable<sObject>{  
    
    global Database.QueryLocator start(Database.BatchableContext BC)  //start method
    {
        //We can use System labels instead of hard coding value for City & Country
        String Country = 'US'; 
        String City = 'New York'; 
        String query= '' ;
        query='select Id, City, Country, LeadSource, Rating From Lead ' +
              'where Country = \'' + Country + '\'' +
              ' AND City =\'' + City + '\'';  
        System.debug('==query==' + query);
        return Database.getQueryLocator(query);        
    }
    global void execute(Database.batchableContext BC, List<Lead> scope) //execute method
    {  //You can switch to Map instead of list by uncommenting below code of map and comment the List related code.
      //  Map<Id,Lead> updateLeadMap =new Map<Id,Lead>(); 
        List<Lead> updateLeadList =new List<Lead>(); 
        System.debug('==scope=='+scope);
        for(Lead objLead:scope)
        {
            objLead.LeadSource = 'Web';
            objLead.Rating = 'Hot';            
           // updateLeadMap.put(objLead.Id, objLead);
            updateLeadList.add(objLead);
        }
       /* if(updateLeadMap.size()>0)
        {   
            update updateLeadMap.values();
        }*/
        if(updateLeadList.size()>0)
        {   
            update updateLeadList;
        }
    }
    global void finish(Database.batchableContext BC)
    {
    }  
}