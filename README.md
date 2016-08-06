# Scraperry


## About
Scraperry is a small API application to grab headers and link's URLs from a webpage

Scraperry uses:

1. Active Model Serializer for JSON generation
2. Rails-API for backend
3. RSpec for testing

## Installation

Add this line to your application's Gemfile:

```
gem 'active_model_serializers', '~> 0.10.0'
```

And then execute:

```
$ bundle
```

```
$ bundle exec rake db:setup
```

```
$ bundle exec rake
```

Make sure all tests are green


## List Parsed Web Pages
### Definition:

```
GET api/pages/
```

### Request Example:

```
curl -H 'Accept: application/vnd.scraperry.v1' \
http://localhost:3000/api/pages
```

### Response Example:
```
[{"id":1,"url":"https://www.google.com","status":"requested","updated_at":"2016-08-05T10:50:43.747Z","headers":[],"links":[]},{"id":2,"url":"https://www.facebook.com","status":"requested","updated_at":"2016-08-05T13:24:51.460Z","headers":[],"links":[]},{"id":4,"url":"https://www.facebook.com","status":"parsed","updated_at":"2016-08-06T04:43:34.734Z","headers":[{"tag":"h1","content":"Facebook"},{"tag":"h2","content":"Javascript pada browser Anda tidak diaktifkan."},{"tag":"h2","content":"Pemeriksaan Keamanan"}],"links":[{"url":"https://ar-ar.facebook.com/"},{"url":"https://de-de.facebook.com/"},{"url":"https://developers.facebook.com/?ref=pf"},{"url":"https://en-gb.facebook.com/"},{"url":"https://es-la.facebook.com/"},{"url":"https://fr-fr.facebook.com/"},{"url":"https://ja-jp.facebook.com/"},{"url":"https://jv-id.facebook.com/"},{"url":"https://ko-kr.facebook.com/"},{"url":"https://messenger.com/"},{"url":"https://ms-my.facebook.com/"},{"url":"https://pt-br.facebook.com/"},{"url":"https://www.facebook.com/"},{"url":"https://www.facebook.com/help/568137493302217"}]}]
```

## Parse a Web Page

### Definition:

```
POST api/pages/
```

### Request Example:

```
curl -H 'Accept: application/vnd.scraperry.v1' \
-H "Content-Type: application/json" \
-X POST \
-d '{ "page": { "url": "https://www.facebook.com" } }' \
http://localhost:3000/api/pages
```

### Response Example:
```
{"id":5,"url":"https://www.facebook.com","status":"parsed","updated_at":"2016-08-06T05:58:43.230Z","headers":[{"tag":"h1","content":"Facebook"},{"tag":"h2","content":"Javascript pada browser Anda tidak diaktifkan."},{"tag":"h2","content":"Pemeriksaan Keamanan"}],"links":[{"url":"https://ar-ar.facebook.com/"},{"url":"https://de-de.facebook.com/"},{"url":"https://developers.facebook.com/?ref=pf"},{"url":"https://en-gb.facebook.com/"},{"url":"https://es-la.facebook.com/"},{"url":"https://fr-fr.facebook.com/"},{"url":"https://ja-jp.facebook.com/"},{"url":"https://jv-id.facebook.com/"},{"url":"https://ko-kr.facebook.com/"},{"url":"https://messenger.com/"},{"url":"https://ms-my.facebook.com/"},{"url":"https://pt-br.facebook.com/"},{"url":"https://www.facebook.com/"},{"url":"https://www.facebook.com/help/568137493302217"}]}
```

## Getting Help

If you find a bug, feel free to report an [Issue](https://github.com/waruboy/scraperry/issues/new). I'd be happy to discuss with you.

## To Do

Things to be added:

- Move parsing to a background job
- URL format validation in models
- Limit argument in List endpoint to limit number web pages returned


Enjoy! - Taufiq -




