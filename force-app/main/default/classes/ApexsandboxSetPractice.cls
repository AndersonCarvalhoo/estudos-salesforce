public with sharing class ApexsandboxSetPractice {
    
    // #76 - Union
    public static Set<Integer> setUnion(Set<Integer> set1, Set<Integer> set2) {
        Set<Integer> listUnion = new Set<Integer>(set1);
        listUnion.addAll(set2);
        return listUnion;
    }
}