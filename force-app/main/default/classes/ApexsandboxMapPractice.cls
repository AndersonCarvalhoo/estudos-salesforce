public with sharing class ApexsandboxMapPractice {
    
    // #83 Employee Email
    public String employeeEmail(Map<String, String> employeeIdToEmail, String employeeId) {
        String employeeEmail = employeeIdToEmail.get(employeeId);
        return employeeEmail == null ? 'info@apexsandbox.io' : employeeEmail;
    }
}