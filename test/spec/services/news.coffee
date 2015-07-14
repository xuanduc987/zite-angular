'use strict'

describe 'Service: News', ->

  # load the service's module
  beforeEach module 'ziteApp'

  # instantiate service
  News = {}
  beforeEach inject (_News_) ->
    News = _News_

  it 'should do something', ->
    expect(!!News).toBe true
