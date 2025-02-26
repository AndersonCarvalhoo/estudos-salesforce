trigger ContentVersion on ContentVersion (after insert) {
    Set<Id> ids = new Set<Id>();
    for(ContentVersion ct : trigger.new) {
        ids.add(ct.ContentDocumentId);
    }
    
	List<ContentDocumentLink> link = [SELECT Id, LinkedEntityId, ContentDocumentId, ContentDocument.Title
                                      FROM ContentDocumentLink 
                                      WHERE ContentDocumentId IN :ids
                                     ];
    
	final String accountPrefix = Account.sObjectType.getDescribe().getKeyPrefix();
	for (ContentDocumentLink lt : link) {
    	if( String.valueOf(lt.LinkedEntityId).substring(0,3) == accountPrefix ) {
        	System.debug(lt.LinkedEntityId);
            System.debug(lt.ContentDocument.Title);
    	}
	}
}