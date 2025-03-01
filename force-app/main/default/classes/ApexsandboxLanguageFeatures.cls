public with sharing class ApexsandboxLanguageFeatures {

    // #100 - sObject Type
    public Boolean isTypeAccount(sObject record) {
        if(record instanceof Account) {
            return true;
        }
        return false;
    }


    // #106 - Context User
    public Map<String,String> getContextUserInformation(){
        Map<String, String> userInfoContext = new Map<String, String>();
        userInfoContext.put('EmailId', UserInfo.getUserEmail());
        userInfoContext.put('ProfileId', UserInfo.getProfileId());
        userInfoContext.put('Type', UserInfo.getUserType());
        userInfoContext.put('UserName', UserInfo.getUserName());
        return userInfoContext;
    }

    // #96 - Deserialize sObjects
    public List<Account> getAccountsFromJSONString(String inputJSON){
        if (inputJSON == null) {
            return null;
        }
    
        List<Account> objects = (List<Account>) JSON.deserialize(inputJSON, List<Account>.class);
        return objects;
    }
}