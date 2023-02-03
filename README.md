# venturecreatordao

The interface which allows investors in threefold venture creator to work with their investments.

The code library consists of three modules:

- app: business logic and backend
- api: server for communication between the app and ui
- webui: web user interface

## Usage

To run, from the root of the repository, `v run .`

This will:

- Run the application backend
- Launch an API Server at port 8080
- Launch an ui at port 8000

### Dependencies

- > = v0.3.2
- freeflowuniverse/spiderlib
- freeflowuniverse/crystallib

## User Functionalities

Users have:

Users can:

- see their shares/participations
- see overview of portfolio & value

- per company have a nice page (markdown with some dynamic parts)
  - purpose
  - shareholder table
  - milestones
  - last valuation (if investor came in)
  - team
  - link to boardmeetings
- boardmeetings
  - decisions to be tabled on boardmeetings
  - results
- portfolio
  - threefold gold
  - TFS =shares in tf
  - ...
- how to go from gold to e.g. shares
- liquidtiy pool overview
  - terms: buying price/sales price per pair
  - which pair's inside
- login with TFConnect
