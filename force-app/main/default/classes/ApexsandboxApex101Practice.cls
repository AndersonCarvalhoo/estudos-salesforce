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

    // #14 - Sum Equals
    public Boolean sumEquals(Integer a, Integer b, Integer c) {
        if ((a + b) == c) {
            return true;
        }
        return false;
    }

    // #20 - Ascending Order
    public Boolean ascendingOrder(Integer a, Integer b, Integer c) {
        if (a <= b && b <= c) {
            return true;
        }
        return false;
    }

    // #21 - A or An
    public String aOrAn(String word) {
        Set<String> vowels = new Set<String>{'a', 'e', 'i', 'o', 'u'};
        if (vowels.contains(word.substring(0,1))) {
            return 'an ' + word;
        }
        return 'a ' + word;
    }

    //#3 - Largest of Three
    public static Integer findLargest(Integer num1, Integer num2, Integer num3) {
        if (num1 > num2 && num1 > num3) {
            return num1;
        } else if (num2 > num1 && num2 > num3) {
            return num2;
        }
        return num3;
    }

    // #137 - Tip Calculator
    public Decimal computeTip(Decimal total, Integer percent) {
        return total * percent/100;
    }

    // #19 - Passing Students
    public Boolean isPassed(Boolean passedExam, Boolean passedAssignments, Boolean passedProject) {
        return (passedExam && passedAssignments) || (passedAssignments && passedProject) || (passedExam && passedProject);
    }

    // #90 - Ends With 0
    public Boolean isEndWithZero(Integer num){
        return Math.mod(num, 10) == 0;
    }

    // #9 - Full Name
    public String formatName(String firstName, String lastName) {
        return firstName + ' ' + lastName;
    }

    // #10 - Format Name https://www.apexsandbox.io/problem/10
    public String formatName2(String firstName, String lastName) {
        if (String.isBlank(firstName) && !String.isBlank(lastName)) {
            return lastName;
        } else if (String.isBlank(lastName) && !String.isBlank(firstName)) {
            return firstName;
        } else if (String.isBlank(firstName) && String.isBlank(lastName)) {
            return '';
        }
        return lastName + ', ' + firstName;
    }

    // #16 - Sum 1 to N
    public Integer sumToN(Integer n) {
        Integer sum = n;
        for (Integer i = 0; i < n; i++) {
            sum += i;
        }
        return sum;
    }

    // #11 - Name from Email
    public String nameFromEmail(String email) {
        String nameEmail = email.substring(0, email.lastIndexOf('@'));
        String firstName = nameEmail.substringBefore('.').toLowerCase().capitalize();
        String lastName = nameEmail.substringAfter('.').toLowerCase().capitalize();
        return firstName + ' ' + lastName;
    }
    
}