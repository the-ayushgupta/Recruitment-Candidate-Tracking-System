public with sharing class InterviewTriggerHandler {
    public static void handleAfterUpdate(List<Interview__c> newList, Map<Id, Interview__c> oldMap) {
        List<Candidate__c> toUpdate = new List<Candidate__c>();

        for (Interview__c intv : newList) {
            // ✅ Correct field references using your API names
            if (intv.Interview_Status_c__c == 'Selected' &&
                oldMap.get(intv.Id).Interview_Status_c__c != 'Selected') {

                toUpdate.add(new Candidate__c(
                    Id = intv.Candidate__c,
                    Status_c__c = 'Hired'
                ));
            }
        }

        if (!toUpdate.isEmpty()) {
            update toUpdate;
        }
    }
}