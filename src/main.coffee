class Control
	constructor: (@symbol) ->

app = angular.module 'App', []

app.controller 'CalcCtrl', ($scope) ->

	$scope.miscellaneousCtrls = ['C','+/-','%'].map (symbol) -> new Control symbol
	$scope.numericInputs = [9..1].map (symbol) -> new Control symbol
	$scope.basicOperations = ['/', '*', '-', '+', '='].map (symbol) -> new Control symbol
