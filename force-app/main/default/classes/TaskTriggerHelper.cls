public with sharing class TaskTriggerHelper {
    public static void onlyAdminDeleteTask(List<Task> newTasks) {
        
        String profile = [
            SELECT Id, Name 
            FROM Profile 
            WHERE Id = :UserInfo.getProfileId() 
            LIMIT 1
            ].Name;
        
        final Boolean profileIsAdmin = profile.trim() == 'System Administrator';
        if (!profileIsAdmin) {
        	for (Task t : newTasks) {
        		t.addError('Apenas administradores podem excluir uma task');
        	}
        }
    }
}