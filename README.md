# BongoKit

A library to help manage interacting with the Bongo API.

## API

Documentation for the API can be found at https://api.bongo.org/.

## Stop Numbering

||Numbers||Description||
|1-999|Shared by more than one agency|
|1000-3999|Cambus stop|
|4000-6999|Coralville stop|
|7000-9999|Iowa City stop|

## Testing

### Run tests from Terminal

```
xcodebuild test -project BongoKit.xcodeproj -scheme BongoKit-Package -destination platform=OS X,arch=x86_64 -quiet
```
