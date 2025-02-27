public with sharing class CaseTriggerHandler {
    public static void updateRatingAccount(Map<Id, Case> oldMapCases, List<Case> cases) {
        Set<Id> accountIds = new Set<Id>();
        for (Case c : oldMapCases.values()) {
            accountIds.add(c.AccountId);
        }
        List<Account> accounts = [SELECT Id, Rating, (SELECT Id FROM Cases WHERE Status = 'Closed') FROM Account WHERE Id IN :accountIds];

        for(Account a : accounts) {
            System.debug(a.Cases.size());
        }
    }
}