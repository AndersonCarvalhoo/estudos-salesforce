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

    // #86 - Industry Summary
    public Map<String, Decimal> industrySummary(List<Account> accounts) {
        Map<String, Decimal> totalRevenueByIndustry = new Map<String, Decimal>();
        for (Account a : accounts) {
            Decimal nowRevenue = totalRevenueByIndustry.get(a.Industry);
            if (nowRevenue == null) {
                totalRevenueByIndustry.put(a.Industry, a.AnnualRevenue);
            } else {
                totalRevenueByIndustry.put(a.Industry, nowRevenue + a.AnnualRevenue);
            }
        }
        return totalRevenueByIndustry;
    }

    // #87 - Cases by Type
    public Map<String, List<Case>> casesByType(List<Case> cases) {
        Map<String, List<Case>> listCaseByType = new Map<String, List<Case>>();
        for(Case c : cases) {
            if (c.Type != null) {
                List<Case> cas = new List<Case>(listCaseByType.get(c.Type));
                cas.add(c);
                listCaseByType.put(c.Type, cas);
            }
        }
        return listCaseByType;
    }
}