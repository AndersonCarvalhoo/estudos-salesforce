public with sharing class ApexsandboxSetPractice {
    
    // #76 - Union
    public static Set<Integer> setUnion(Set<Integer> set1, Set<Integer> set2) {
        Set<Integer> listUnion = new Set<Integer>(set1);
        listUnion.addAll(set2);
        return listUnion;
    }

    // 
    public Set<Integer> setIntersection(Set<Integer> set1, Set<Integer> set2) {
        Set<Integer> numbersIntersection = new Set<Integer>();
        for(Integer s1 : set1) {
            if (s2.contains(s1)) {
                numbersIntersection.add(s1);
            }
        }
        return numbersIntersection;
    }
}