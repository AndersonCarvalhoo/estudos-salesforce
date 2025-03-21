public with sharing class ApexsandboxSetPractice {
    
    // #76 - Union
    public static Set<Integer> setUnion(Set<Integer> set1, Set<Integer> set2) {
        Set<Integer> listUnion = new Set<Integer>(set1);
        listUnion.addAll(set2);
        return listUnion;
    }

    // #77 - Intersection
    public Set<Integer> setIntersection(Set<Integer> set1, Set<Integer> set2) {
        Set<Integer> numbersIntersection = new Set<Integer>();
        for(Integer s1 : set1) {
            if (set2.contains(s1)) {
                numbersIntersection.add(s1);
            }
        }
        return numbersIntersection;
    }

    // #77 - Intersection (With retainAll)
    public Set<Integer> setIntersectionRetainAll(Set<Integer> set1, Set<Integer> set2) {
        Set<Integer> numbersIntersection = new Set<Integer>(set1);  // Cria uma cópia de set1
        numbersIntersection.retainAll(set2);  // Mantém apenas os elementos que estão em ambos os Sets
        return numbersIntersection;
    }

    // #82 - Related Accounts
    public static Set<Id> accountIds(List<Opportunity> opps) {
        set<Id> accountIds = new set<Id>();
        for (Opportunity opp : opps) {
            if (opp.AccountId != null) {
                accountIds.add(opp.AccountId);
            }
        }
        return accountIds;
    }

    // #80 - Duplicate Integers
    public Boolean containsDuplicates(List<Integer> nums) {
        Set<Integer> setNums = new Set<Integer>(nums);
        if (nums.size() != setNums.size()) {
            return true;
        }
        return false;
    }

    // #80 - Duplicate Integers
    public Boolean containsDuplicatesTernary(List<Integer> nums) {
        Set<Integer> setNums = new Set<Integer>(nums);
        return nums.size() != setNums.size() ? true : false;
    }

    // #81 - Same Elements
    public Boolean sameElements(List<Integer> nums1, List<Integer> nums2) {
        Set<Integer> setNums1 = new Set<Integer>(nums1);
        Set<Integer> setNums2 = new Set<Integer>(nums2);
        return setNums1.size() == setNums2.size();
    }
}