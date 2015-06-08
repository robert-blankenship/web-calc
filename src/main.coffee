app = angular.module 'App', []

app.controller 'CalcCtrl', ($scope) ->

	$scope.inputBuffer =
		str: ''
		
		append: (char) ->
			if char is '.' and @str.indexOf '.' is -1
				@str += '.'
			else
				@str += char

		clear: ->
			@str = ''
			@sign = ''

		invertSign: ->
			@sign = if @sign is '-'	then '' else '-'

		evaluate: ->
			@str = '' + eval @str.replace /x/g, '*'

		sign: '' # '' is positive, '-' is negative
		str: ''


	$scope.numericInputsHelper = [9..1]
	$scope.basicOperationsHelper = ['/', 'x', '-', '+']
