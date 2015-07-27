'use strict'

describe 'Service: logEvent', ->

  # load the service's module
  beforeEach module 'ziteApp'

  # instantiate service
  logEvent = {}
  beforeEach inject (_logEvent_) ->
    logEvent = _logEvent_

  it 'should do something', ->
    expect(!!logEvent).toBe true
