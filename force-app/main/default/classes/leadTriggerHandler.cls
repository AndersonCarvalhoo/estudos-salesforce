//Generated for Decodeforce programming test
public class leadTriggerHandler{

	public static void beforeInsert(){

		List<Lead> newLeads = Trigger.new;

		/* Write your logic below */
        for (Lead l : newLeads) {
            if (l.Company == null) {
                l.Company = 'TBA';
            }
        }
	}
}