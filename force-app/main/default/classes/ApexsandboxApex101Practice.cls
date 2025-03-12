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
        return total * (percent/100);
    }

    
}