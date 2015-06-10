app = angular.module 'App', []

app.controller 'CalcCtrl', ($scope) ->

	$scope.inputBuffer =
		operand1: ''
		operand2: ''

		operator: ''

		getDisplayBuffer: ->
			if not @operand2 then @operand1 else @operand2

		setOperator: (operator) ->
			if @operand1 and @operand1 isnt '.'
				@operator = operator
		
		append: (char) ->
			if @operator is '='
				@operand1 = char
				@operator = ''

			else if @operator and not @operand2
				@operand2 = char

			else if not (char is '.' and @getDisplayBuffer().indexOf '.' >= 0)
				if @operand2
					@operand2 += char
				else
					@operand1 += char

		clear: ->
			@operand1 = ''
			@operand2 = ''
			@operator = ''
			@sign = ''

		invertSign: ->
			@sign = if @sign is '-'	then '' else '-'

		evaluate: ->
			return if not @operand2 or @operand2 is '.'

			op1 = parseFloat @operand1
			op2 = parseFloat @operand2
			
			result = switch @operator
				when '/' then op1 / op2
				when '*' then op1 * op2
				when '+' then op1 + op2
				when '-' then op1 - op2

			@operand1 = result.toString()
			@operand2 = ''
			@operator = '=' #This is mainly to handle an exception in @append.

