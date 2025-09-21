import { LightningElement, wire } from 'lwc';
import getCandidateStats from '@salesforce/apex/CandidateDashboardController.getStats';

export default class CandidateDashboard extends LightningElement {
    totalCandidates = 0;
    hiredCount = 0;
    pendingInterviews = 0;

    @wire(getCandidateStats)
    wiredStats({ error, data }) {
        if (data) {
            this.totalCandidates = data.total;
            this.hiredCount = data.hired;
            this.pendingInterviews = data.pending;
        } else if (error) {
            // handle error: log or show toast in future
            // console.error(error);
        }
    }
}