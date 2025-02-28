public with sharing class ApexsandboxDatabasePractice {

    // #126 - Insert Student
    public Id insertStudent(String name, String email) {
        apxio__Student__c student = new apxio__Student__c();
        student.Name = name;
        student.apxio__Email__c = email;
        insert student;
    
        return student.Id;
    }
}