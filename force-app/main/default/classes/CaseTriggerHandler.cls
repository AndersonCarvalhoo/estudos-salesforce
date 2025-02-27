public with sharing class CaseTriggerHandler {
    public static void updateRatingAccount(Map<Id, Case> oldMapCases, List<Case> cases) {
        Set<Id> accountIds = new Set<Id>();
        for (Case c : oldMapCases.values()) {
            accountIds.add(c.AccountId);
        }
        List<Account> accounts = [SELECT Id, Rating, (SELECT Id FROM Cases WHERE Status = 'Closed') FROM Account WHERE Id IN :accountIds];

        if (!accounts.isEmpty()) {
            for(Account a : accounts) {
                if(a.Cases.size() < 3) {
                    a.Rating = 'Cold';
                } else if (a.Cases.size() <= 5) {
                    a.Rating = 'Warm';
                } else {
                    a.Rating = 'Hot';
                }
            }
            update accounts;
        }
    }
}