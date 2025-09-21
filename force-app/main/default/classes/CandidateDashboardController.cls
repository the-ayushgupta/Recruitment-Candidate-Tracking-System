public with sharing class CandidateDashboardController {
    @AuraEnabled(cacheable=true)
    public static Map<String, Integer> getStats() {
        Map<String, Integer> result = new Map<String, Integer>();
        Integer total = [SELECT COUNT() FROM Candidate__c];
        Integer hired = [SELECT COUNT() FROM Candidate__c WHERE Status_c__c = 'Hired'];
        Integer pending = [SELECT COUNT() FROM Interview__c WHERE Interview_Status_c__c = 'Scheduled'];
        result.put('total', total);
        result.put('hired', hired);
        result.put('pending', pending);
        return result;
    }
}