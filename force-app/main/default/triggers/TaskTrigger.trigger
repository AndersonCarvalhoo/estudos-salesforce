trigger TaskTrigger on Task (before delete) {
	
    if(Trigger.isBefore && Trigger.isDelete) {
        TaskTriggerHelper.onlyAdminDeleteTask(Trigger.old);
    }
}