//Generated for Decodeforce programming test
public class OrderReturnController{

	public static Boolean checkOrderWithin30Days(String orderNumber){

		boolean isOrderWithIn30Days = false;

		List<Order> queryOrder = [
            SELECT Id, EffectiveDate 
            FROM Order 
            WHERE OrderNumber = :orderNumber 
            AND EffectiveDate = LAST_N_DAYS:30
            LIMIT 1];
        
        if (queryOrder.size() == 1) {
            isOrderWithIn30Days = true;
        }
		return isOrderWithIn30Days;
	}
}