Entertainment Management System (EMS)
======================================

License in Brief
-----------------
**This repository was created as part of a learning exercise in Flatiron School's Learn-Verified program.**

**The content of this repository is available for non-commercial use only. For more information please refer to the [LICENSE](http://www.binpress.com/license/view/l/993f3cab247ffc88c0932118bf5bf1dd).**

About the EMS
-------------
The EMS allows an entertainment agency to maintain information related to entertainment acts, venues an act may perform in, and specific performances of an act at a venue. For a given performance, a contract can be generated comprised of a number of documents and approvals by any number of users associated with the act, the venue, or the agency.

Act:
 * Name
 * Description
 * Size
 * Home Location
 * Website

Venue:
 * Name
 * Address
 * Zipcode
 * Phone
 * E-mail Address
 * Website

Performance:
 * Name
 * Description
 * Act Selection
 * Venue Selection
 * Show Date
 * Show Time
 * Ticketing URL

Contract:
 * Performance
 * Submission Date
 * Due Date
 * Status
 * Additional Details

Document:
 * Contract
 * Document Name
 * Document Description
 * Document URL

Approval:
 * Contract
 * User Selection
 * Date Requested
 * Date Answered
 * Status

**Authentication**

 Any user can create an account on the site, however they must be approved by an administrator and associated with a venue, an act, or the agency. Additionally, once approved and logged in, a user can associate their EMS account with a Google and/or LinkedIn account for single sign-on.

**Authorization**

 With part of the approval process specifying whether a user is associated with a specific venue, a specific act, or the agency, confidentiality of information is maintained. Users of a specific venue or act are only able to access information on  act(s), venue(s), performances, and contracts, that are relevant to that entity.(i.e. a venue or an act can see only their own performances and contracts, an act can only see venues they are performing at, a venue can only see acts performing at their venue, etc.) Conversely, an agency user can access all data.

User:
 * Name
 * Title/Organization
 * Phone
 * Email
 * Password
 * Role Selection
 * Venue or Act Selection
 * Approval Status

Identity (for Single Sign-on/OmniAuth):
 * Associated User
 * Provider (Google or LinkedIn)
 * Provider UID
