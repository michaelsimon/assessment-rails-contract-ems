# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship - _a Venue and an Act has_many Performances; a Contract has_many Approvals and Documents_
- [x] Include at least one belongs_to relationship-  _a Contract belongs_to a Performance; a Document belongs_to a Contract; an Approval belongs_to a Contract and a User_
- [x] Include at least one has_many through relationship - _a Venue and Act has_many Contracts through Performances_
- [x] The "through" part of the has_many through includes at least one user submittable attribute - _performance.name, performance.perf_date, performance.perf_time, performance.tkts_url, performance.description_
- [x] Include reasonable validations for simple model objects - _act.website format, contract.due_date not in the past, document.location format, uniqueness of identity.uid & identity.provider, performance.perf_date not in the past, performance.tkts_url format, user.email is unique, venue.email format_
- [x] Include a class level ActiveRecord scope method - _View Approval requests in "pending status" (/approvals/pending)_
- [x] Include a nested form writing to an associated model using a custom attribute writer - _addition of approvals are nested within contract form_
- [x] Include signup _implemented via Devise with customization to require approval before site use_
- [x] Include login - _implemented via Devise_
- [x] Include logout- _implemented via Devise_
- [x] Include third party signup/login- _implemented via Devise/Omniauth with Google and LinkedIn providers_
- [x] Include nested resource show or index _documents are nested under contracts (/contracts/7/documents/8)_
- [x] Include nested resource "new" form - _documents are nested under contracts (/contracts/7/documents/new)_
- [x] Include form display of validation errors - _included on all forms via partials_

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
