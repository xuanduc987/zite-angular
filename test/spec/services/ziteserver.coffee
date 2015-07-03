'use strict'

describe 'Service: ZiteServer', ->

  # load the service's module
  beforeEach module 'ziteApp'

  # instantiate service
  ZiteServer = {}
  beforeEach inject (_ZiteServer_) ->
    ZiteServer = _ZiteServer_

  it 'should do something', ->
    expect(!!ZiteServer).toBe true
