public with sharing class ApexsandboxApex101Practice {
    //#18 - Teenager
    public Boolean isTeenager(Integer age) {
        if (age >= 13 && age <= 19) {
            return true;
        }
        return false;
    }

    // #4 - Number Difference
    public Integer diff(Integer a, Integer b) {
        return Math.abs(a - b);
    }
}