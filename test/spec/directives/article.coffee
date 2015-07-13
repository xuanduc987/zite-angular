'use strict'

describe 'Directive: article', ->

  # load the directive's module
  beforeEach module 'ziteApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<article></article>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the article directive'
