trigger OpportunityTrigger on Opportunity (after update) {
	
    if(Trigger.isUpdate && Trigger.isAfter) {
        OpportunityTriggerHandler.totalizeAmountInAccount(Trigger.oldMap, trigger.new);
    }
}