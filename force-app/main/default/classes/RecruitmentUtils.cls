public with sharing class RecruitmentUtils {
    public static void sendCandidateNotification(Id candidateId, String message) {
        Candidate__c cand = [SELECT Id, Email_c__c FROM Candidate__c WHERE Id = :candidateId LIMIT 1];
        if (cand.Email_c__c != null) {
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToAddresses(new String[] { cand.Email_c__c });
            mail.setSubject('Recruitment Update');
            mail.setPlainTextBody(message);
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
    }
}
