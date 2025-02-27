public with sharing class ApexPracticalExercises {
    public ApexPracticalExercises() {

    }
    public static Boolean duplicateContacts(Contact c1, Contact c2) {
        if( ((c1.Email == c2.Email && c1.Email != null) || (c1.Phone == c2.Phone && c1.Phone != null)) ) {
            return true;
        }
        return false;
    }

    // #57 - Account Rating
    public void setAccountRating(Account a) {
        if (a.AnnualRevenue <= 100000) {
            a.Rating = 'Cold';
        } else if (a.AnnualRevenue <= 500000) {
            a.Rating = 'Warm';
        } else if (a.AnnualRevenue > 500000) {
            a.Rating = 'Hot';
        }
    }

}