public with sharing class ApexsandboxDatabasePractice {

    // #126 - Insert Student
    public Id insertStudent(String name, String email) {
        apxio__Student__c student = new apxio__Student__c();
        student.Name = name;
        student.apxio__Email__c = email;
        insert student;
    
        return student.Id;
    }

    // #132 - Insert Course
    public Id insertCourse(String name, String details, Integer credits) {
        if (credits == 0 || credits > 4) {
            return null;
        }
    
        apxio__Course__c course = new apxio__Course__c();
        course.Name = name;
        course.apxio__Course_Details__c = details;
        course.apxio__Credits__c = String.valueof(credits);
        insert course;
        
        return course.Id;
    }

    // #128 - Active Students
    public List<apxio__Student__c> selectActiveStudents() {
        List<apxio__Student__c> students = [SELECT Id, Name, apxio__Active__c FROM apxio__Student__c WHERE apxio__Active__c = true];
        return students;
    }


}