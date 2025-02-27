trigger CaseTrigger on Case (after insert, after update, after delete) {
    
    if(Trigger.isAfter) {
        if (Trigger.isInsert || Trigger.isUpdate || Trigger.isDelete) {
            CaseTriggerHandler.updateRatingAccount(Trigger.oldMap, Trigger.new);
        }
    }
}