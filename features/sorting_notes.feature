Feature: sorting notes
	As a user
	I want to be able to sort notes on the homepage
	In order to view notes more convienently

	Background:
		Given there are the following notes:
	    | subject    | technology 	| mastery 	|
	    | Note C 		 | JavaSctipt		| 75				|
	    | Note A 		 | Rails        | 50        |
	    | Note B     | Ruby 				| 25 				|
	  And I am on the homepage
	  Then I should see "Note A"
	  And I should see "Note B"
	  And I should see "Note C"

	Scenario: Sorting by subject
		When I follow "Subject"
		Then I should see the notes in this order:
			| Note A |
			| Note B |
			| Note C |
		And I follow "Subject"
		Then I should see the notes in this order:
			| Note C |
			| Note B |
			| Note A |

	Scenario: Sorting by technology
		When I follow "Technology"
		Then I should see the notes in this order:
			| Note C |
			| Note A |
			| Note B |

	Scenario: Sorting by mastery
		When I follow "Mastery"
		Then I should see the notes in this order:
			| Note B |
			| Note A |
			| Note C |