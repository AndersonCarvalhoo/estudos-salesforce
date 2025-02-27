trigger Account on Account (before insert, after update) {
	
    if (Trigger.isBefore && Trigger.isInsert) {
        AccountHandler.writeBillingAddressWithShipping(Trigger.newMap, Trigger.new);
    }
    if (Trigger.isAfter && Trigger.isUpdate) {
        AccountHandler.closeOldOpportunities(trigger.newMap, trigger.new);
    }
}