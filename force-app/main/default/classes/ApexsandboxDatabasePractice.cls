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
        List<apxio__Student__c> students = [
            SELECT Id, Name, apxio__Active__c 
            FROM apxio__Student__c 
            WHERE apxio__Active__c = true
            WITH SECURITY_ENFORCED
        ];
        return students;
    }

    // #130 - Unreachable Students
    public List<apxio__Student__c> selectUnreachableStudents() {
        List<apxio__Student__c> unreachableStudents = [
            SELECT Id, Name, apxio__Phone__c, apxio__Email__c, apxio__Active__c
            FROM apxio__Student__c
            WHERE apxio__Phone__c = '' 
            AND apxio__Email__c = '' 
            AND apxio__Active__c = true 
            WITH SECURITY_ENFORCED
            ORDER BY Name ASC
        ];
        return unreachableStudents;
    }

    // #129 - Students Missing Info
    public List<apxio__Student__c> selectStudentsWithoutContactInfo() {
        List<apxio__Student__c> studentsWithoutContactInfo = [
            SELECT Id, Name 
            FROM apxio__Student__c 
            WHERE apxio__Active__c = true 
            AND (apxio__Email__c = null OR apxio__Phone__c = null)
            WITH SECURITY_ENFORCED
            ORDER BY Name ASC
        ];
        return studentsWithoutContactInfo;
    }

    // #131 - Course and Class
    public void createCourseAndClass(String name, String description) {
        apxio__Course__c course = new apxio__Course__c();
        course.Name = name;
        if(description != null) {
            course.apxio__Course_Details__c = description;
        }
        insert course;
    
        apxio__Class__c courseClass = new apxio__Class__c();
        courseClass.apxio__Course__c = course.Id;
        courseClass.Name = name;
        if(description != null) {
            courseClass.apxio__Description__c = truncateString(description, 255);
        }
        insert courseClass;
    }
    
    private string truncateString(String s, Integer size) {
        return s.length() > size ? s.substring(0,size) : s;
    }

    // #133 - Student List
    public void insertStudents(List<String> studentNames, List<String> studentEmails) {
        List<apxio__Student__c> students = new List<apxio__Student__c>();
        for (Integer i = 0; i < studentNames.size(); i++) {
            students.add(new apxio__Student__c(Name = studentNames[i], apxio__Email__c = studentEmails[i]));
        }
        if (!students.isEmpty()) {
            insert students;
        }
    }

    // #134 - Class from Course
    public Id classFromCourse(String courseName) {
        List<apxio__Course__c> courses = [SELECT Id, Name FROM apxio__Course__c WHERE Name = :courseName WITH SECURITY_ENFORCED LIMIT 1];
    
        if (courses.isEmpty()) {
            return null;
        }
        apxio__Class__c courseClass = new apxio__Class__c();
        courseClass.Name = courses[0].Name;
        courseClass.apxio__Course__c = courses[0].Id;
        insert courseClass;
    
        return courseClass.Id;
    }

    // #135 - Enroll Students
    public void enrollStudents(List<String> emails, String className) {
    List<apxio__Class__c> studentClass = [SELECT Id FROM apxio__Class__c WHERE Name = :className WITH SECURITY_ENFORCED LIMIT 1];
    
    List<apxio__Class_Enrollment__c> classEnrollments = new List<apxio__Class_Enrollment__c>();

    for (apxio__Student__c student : [SELECT Id FROM apxio__Student__c WHERE apxio__Email__c IN :emails WITH SECURITY_ENFORCED]) {
        apxio__Class_Enrollment__c classEnrollment = new apxio__Class_Enrollment__c();
        classEnrollment.apxio__Student__c = student.Id;
        classEnrollment.apxio__Offered_Class__c = studentClass[0].Id;
        classEnrollments.add(classEnrollment);
    }

    insert classEnrollments;

}


}