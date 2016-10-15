# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased] - 2016-10-15
This repository mirrors the jQuery branch of the original version of this application, created solely on rails (without JS) located at:
_master:_ [https://github.com/michaelsimon/assessment-rails-contract-ems](https://github.com/michaelsimon/assessment-rails-contract-ems])
_jquery:_ [https://github.com/michaelsimon/assessment-rails-contract-ems/tree/jquery](https://github.com/michaelsimon/assessment-rails-contract-ems/tree/jquery)

### Added
- Utilize jQuery and AJAX calls to pull information for Performances, Contracts, Approvals, Documents
- JS Model Objects created for Performance, Contract, Approval, Document
- Generate JSON data rendered via AJAX calls using active_model_serializers Ruby Gem

### Changed
- Performance Listing on Performance Index page displayed via AJAX call
- Performance Listing on Artist and Venue Show pages displayed via AJAX calls
- Performance Details on Performance Show page displayed via AJAX call
- Contract Details on Contract Detail page displayed via AJAX call
- Contract Documents on Contract Detail page displayed via AJAX call
- Creation/Modification of Contract Documents created in Modal window (compared to previous separate page) and updates model via AJAX call
- Deletion of Contract Document performed via AJAX call
- Actions taken on Approvals (Accept, Reject, Cancel) performed via AJAX call
