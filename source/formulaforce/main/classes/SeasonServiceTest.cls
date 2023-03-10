@isTest
private class SeasonServiceTest {
    	
	@isTest static void testIssueNewsletter() {
		try {
			SeasonService.issueNewsLetters(null);
			System.assert(false);
		} catch (Exception e) {
			System.assertEquals('Not implemented', e.getMessage());
		}
	}

	@isTest static void testImportSeasons() {
		System.runAs(TestData.raceManager()) {
			SeasonService.importSeasons(TestData.asJSON());
			System.assertEquals(8, Database.countQuery('select count() from Driver__c'));
			System.assertEquals(1, Database.countQuery('select count() from Season__c'));
			System.assertEquals(10, Database.countQuery('select count() from Race__c'));
			System.assertEquals(80, Database.countQuery('select count() from Contestant__c'));
		}
	}	
}