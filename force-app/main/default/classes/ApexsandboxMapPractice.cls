public with sharing class ApexsandboxMapPractice {
    
    // #83 Employee Email
    public String employeeEmail(Map<String, String> employeeIdToEmail, String employeeId) {
        String employeeEmail = employeeIdToEmail.get(employeeId);
        return employeeEmail == null ? 'info@apexsandbox.io' : employeeEmail;
    }

    // #84 - Phonebook
    public Map<String, String> phonebook(List<Contact> contacts) {
        Map<String, String> phoneByName = new Map<String, String>();
        for (Contact c : contacts) {
            if (c.Phone != null) {
                phoneByName.put(c.Name, c.Phone);
            }
        }
        return phoneByName;
    }

    // #85 - Phone to Account
    public Map<String, Account> phoneToAccount(List<Account> accounts) {
        Map<String, Account> accountByPhone = new Map<String, Account>();
        for (Account a : accounts) {
            if (a.Phone != null) {
                accountByPhone.put(a.Phone, a);
            }
        }
        return accountByPhone;
    }
}