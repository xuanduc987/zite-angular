'use strict'

describe 'Filter: fromNow', ->

  # load the filter's module
  beforeEach module 'ziteApp'

  # initialize a new instance of the filter before each test
  fromNow = {}
  beforeEach inject ($filter) ->
    fromNow = $filter 'fromNow'

  it 'should return the input prefixed with "fromNow filter:"', ->
    text = 'angularjs'
    expect(fromNow text).toBe ('fromNow filter: ' + text)
