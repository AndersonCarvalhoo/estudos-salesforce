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
    
    // #64 - Same Parent II
    public Boolean sameParent(Account acc, Contact con, Opportunity opp) {
        if ( (acc.Id != null) && (con.AccountId == acc.Id && opp.AccountId == acc.Id) ) {
            return true;
        }
        return false;
    }

    // #66 - Set Parent Account
    public void setParent(Account acc, Contact con, Opportunity opp) {
        if((acc != null && con != null && opp != null) && acc.Id != null) {
            con.AccountId = acc.Id;
            opp.AccountId = acc.Id;
        }
    }

    // #67 - Set Parent Case
    public void linkParent(Case c1, Case c2) {
        if((c1.ContactId != null) && (c1.ContactId == c2.ContactId && c1.CreatedDate < c2.CreatedDate)) {
            c2.ParentId = c1.Id;
        } else if ((c2.ContactId != null) && (c2.ContactId == c1.ContactId && c2.CreatedDate < c1.CreatedDate)) {
            c1.ParentId = c2.Id;
        }
    }

}