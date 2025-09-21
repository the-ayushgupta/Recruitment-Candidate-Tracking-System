trigger InterviewTrigger on Interview__c (after update) {
    InterviewTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
}