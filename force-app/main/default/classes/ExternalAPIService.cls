public with sharing class ExternalAPIService {
    @future(callout=true)
    public static void fetchCandidates() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:JSONPlaceholder/users');
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200) {
            System.debug('API Response: ' + response.getBody());
        } else {
            System.debug('Error: ' + response.getStatus());
        }
    }
}