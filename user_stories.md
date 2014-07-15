USER STORIES
   * Given user is a guest
   * When I visit the website
   * Then I’m greeted by a title page which displays:
   *
      * the title,
      * main, general image
      * brief catchphrase/description,
      * Search by MVCI contributions, state, Legislator name
      * ‘About’ information
      * (Map of US — clicking on a state leads to LEGISLATOR table, with that state’s legislators displayed)



   * Given user is a guest
   * When I view the search box
   * the displayed text reads “search Current Legislator by name”


   * Given user is a guest
   * When I click on the search box
   * Then I can type in a Legislator’s name and will be lead to the Legislator Table Page (LTP)

      * MISSPELLINGS, AS ALWAYS, ARE UNFORGIVABLE, AS THEY ARE SATAN




   * Given user is a guest
   * When I click on the STATE option
   * Then I will be prompted with a drop down menu of all states, which will lead me to the LTP and serve as a STATE param for that table (narrowing the results of Legislators by the state they represent)



   * Given user is a guest
   * When I click on the contribution icon
   * Then I will be listed industries (see list below), where the User selects an industry. The user is then led to the LTP the top 10 Legislators are ranked according to the magnitude of contributions they have received in this sector.

      * Legal/Law
      * Health Care
      * Manufacturing
      * Lobbyists


            * (want, overall D3 chart indicating industry funding)






   * Given user is a guest
   * When I view the center of the main page
   * Then the ‘About’ Information displays a general summary of the site’s purpose and content


LEGISLATOR TABLE PAGE (LTP)


   * Given user is a guest
   * When I view the LTP
   * Then I am prompted with a table containing current Legislators, chosen by my parameters

      * I can see their:


                              —Name
                              —State
                              —Total Amount of Contributions (TAC)
                                        —lists sum of all contributions
                              —Most Valuable Contributing Industry (MVCI)
                                        —lists


   * Given user is a guest
   * When I do not click on anything
   * Then I’m provided a table of legislators, filtered by name, in alphabetical order



   * Given user is a guest
   * When I click on State
   * Then the table sorts my given list of a legislators, filtered by my original parameter, by States, listed in alphabetical order



   * Given user is a guest
   * When I click on TAC
   * Then the table sorts my given list of a legislators, filtered by my original parameter, by TAC, listed in descending amounts



   * Given user is a guest
   * When I click on MVCI
   * Then the table sorts my given list of a legislators, filtered by my original parameter, by MVCI, listed in descending amounts

FEATURE PAGE: LEGISLATOR (FEATURE)


   * Given user is a guest
   * When I click on a legislator on LTP
   * Then I’m directed to his/her profile page, the FEATURE
   *

      * This hosts:
      *

         * Image
         * Legislator Info
         * Contribution Info



Legislator Image


   * Given user is a guest
   * When I view a legislator’s FEATURE
   * Then I see a their current, official picture


Legislator Info


   * Given user is a guest
   * When I view a legislator’s FEATURE
   * Then I see the legislator’s:

      * Name
      * Party
      * State
      * (Religion)
      * Contact information

         * Office Address
         * email address
         * phone number

      * Bills sponsored & co-sponsored and Bill names/hyperlinks (and their status)
      * Voting record
      * (Giving a shit ratio)
      * (Words used most often)
      * (absences)
      * (ratio of bi-partisan/party-voting)




   * Given user is a guest
   * When I click on a bill hyperlink,
   * Then I am led to the specific Bill page that that bill ID corresponds to


Legislator Contribution Info

   * Given user is a guest
   * When I view  Legislator Contribution Info
   * Then I can see the TAC, followed by  a List of Contribution sources, with corresponding contribution values


BILL PAGE


   * Given user is a guest
   * When am led to the BILL PAGE
   * Then I see Bill info and Contribution info


Bill Info


   * Given user is a guest
   * When a see the Bill Info
   * Then I see:

                         —Bill Name
                         —Name of Bill Sponsors
                         —Bill Keywords
                         —Bill Summary

                         —Bill History (actions.history)
                         —Bill Result (if apparent)
                         —Votes Record of Bill


Contribution Info


   * Given user is a guest
   * When am vie the Contribution info
   * Then I can see:

          —Contribution data of Bill Sponsor(s)
          —TAC
          —List of Contribution industries, sorted by most valuable
