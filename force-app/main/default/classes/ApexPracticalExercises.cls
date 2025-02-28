public with sharing class ApexPracticalExercises {
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

    // #59 - Contact Birthday
    public Boolean isBirthday(Contact c) {
        if (c.Birthdate == Date.Today() || (Date.Today().addYears(-5) == c.Birthdate)) {
            return true;
        }
        return false;
    }

    // #60 - Key Account
    public Boolean isKeyAccount(Account a) {
        switch on a.Industry {
            when 'Banking' {
                return a.AnnualRevenue >= 600000;
            }
            when 'Technology' {
                return a.AnnualRevenue >= 800000;
            }
            when 'Retail' {
                return a.AnnualRevenue >= 2000000;
            }
            when else {
                return a.AnnualRevenue >= 500000;
            }
        }
    }

    // #61 - Escalate Case
    public void escalateIfMeetsCriteria(Case c) {
        if ((c.Type == 'Mechanical' || c.Type == 'Electrical') && c.Reason == 'Breakdown' && c.Status == 'In Progress') {
           c.IsEscalated = true; 
        }
    }

    // #63 - Same Parent
    public Boolean sameParent(Contact c, Opportunity opp) {
        if (c.AccountId == opp.AccountId && c.AccountId != null) {
            return true;
        }
        return false;
    }
    

}