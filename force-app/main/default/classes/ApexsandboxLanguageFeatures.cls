public with sharing class ApexsandboxLanguageFeatures {

    // #100 - sObject Type
    public Boolean isTypeAccount(sObject record) {
        if(record instanceof Account) {
            return true;
        }
        return false;
    }
}