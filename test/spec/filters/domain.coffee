'use strict'

describe 'Filter: domain', ->

  # load the filter's module
  beforeEach module 'ziteApp'

  # initialize a new instance of the filter before each test
  domain = {}
  beforeEach inject ($filter) ->
    domain = $filter 'domain'

  it 'should return the input prefixed with "domain filter:"', ->
    text = 'angularjs'
    expect(domain text).toBe ('domain filter: ' + text)
