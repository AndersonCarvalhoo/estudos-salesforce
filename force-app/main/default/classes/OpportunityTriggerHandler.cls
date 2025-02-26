public with sharing class OpportunityTriggerHandler {
    public static void totalizeAmountInAccount(Map<Id, Opportunity> mapOld, List<Opportunity> listNew) {
        
        // Armazenar apenas as oportunidades que tiveram o amount alterado em um map.
        Map<Id, Opportunity> opportunitiesMap = new Map<Id, Opportunity>();
        for(Opportunity opp : listNew) {
            if(mapOld.get(opp.Id).Amount != opp.Amount) {
                opportunitiesMap.put(opp.Id, opp);
            }
        }
        // Pegar o ID das accounts das oportunidades que foram alteradas (pode ter sido alterado mais de uma oportunidade de contas diferentes)
        Set<Id> accountIds = new Set<Id>();
        for(Opportunity opp : opportunitiesMap.values()) {
            accountIds.add(opp.AccountId);
        }
        
        // Retornar apenas as contas cujo o id esteja em accountsIds com suas respectivas oportunidades relacionadas atualizadas (ele só pega as oportunidades que realmente foram atualidas)
        List<Account> accounts = [
            SELECT Id, Total_Opportunity_Amount__c, 
            	(SELECT Id, Amount FROM Opportunities)
            FROM Account WHERE Id IN :accountIds
        ];
        
        // Percorrer as contas e para cada conta percorrer todas a oportunidades que foram alteradas e somar o amount com o acc.Total_Opportunity_Amount__c atual
        for(Account acc : accounts) {
            acc.Total_Opportunity_Amount__c = 0;
            for(Opportunity opp : acc.Opportunities) {
                acc.Total_Opportunity_Amount__c	= acc.Total_Opportunity_Amount__c + opp.Amount;
                System.debug('entrou no for');
        	}
        }
        
        if (!accounts.isEmpty()) {update accounts;}
    }
}