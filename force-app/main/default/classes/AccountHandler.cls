public with sharing class AccountHandler {
    
    public static void writeBillingAddressWithShipping(Map<Id,Account> accountMap, List<Account> accounts) {
        for(Account acc : accounts) {
            Boolean isBillingAddressNull = String.isEmpty(acc.BillingStreet) || String.isEmpty(acc.BillingCity) || String.isEmpty(acc.BillingState) || String.isEmpty(acc.BillingPostalCode) || String.isEmpty(acc.BillingCountry);
            Boolean isShippingAddressNull = String.isEmpty(acc.ShippingStreet) || String.isEmpty(acc.ShippingCity) || String.isEmpty(acc.ShippingState) || String.isEmpty(acc.ShippingPostalCode) || String.isEmpty(acc.ShippingCountry);
            if(isBillingAddressNull && !isShippingAddressNull) {
                acc.BillingStreet = acc.ShippingStreet;
                acc.BillingCity = acc.ShippingCity;
                acc.BillingState = acc.ShippingState;
                acc.BillingPostalCode = acc.ShippingPostalCode;
                acc.BillingCountry = acc.ShippingCountry;
            } 
            if (isShippingAddressNull){
                acc.addError('Favor preenchero endereço de entrega completo!');
            }
        }
    }
    
    public static void closeOldOpportunities(Map<Id, Account> triggerMap, List<Account> triggerList) {
        List<Opportunity> opps = [SELECT Id, StageName, CreatedDate 
                                  FROM Opportunity 
                                  WHERE 
                                  	AccountId IN :triggerMap.keySet() 
                                  	AND StageName != 'Closed Won' 
                                  	AND StageName != 'Closed Lost'
                                  	AND CreatedDate <= :Date.today().addDays(-30)
                                 WITH SECURITY_ENFORCED];
        System.debug(opps);
        for (Opportunity opp : opps) {
			opp.StageName = 'Closed Lost';
        }
        if(!opps.isEmpty())	{update opps;}
    }
}