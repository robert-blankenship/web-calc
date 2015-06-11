App = angular.module('WebCalc', [])

App.controller 'CalcCtrl', ($scope) ->
	$scope.inputBuffer =
		operand1: ''
		operand2: ''

		operator: ''

		getDisplayBuffer: ->
			currentOperand = if not @operand2 then @operand1 else @operand2

			if currentOperand.length > 9
				parseFloat(currentOperand).toExponential(6)
			else
				currentOperand

		setOperator: (operator) ->
			if @operator is operator
				@operator = ''

			else if @operand1 and @operand1 not in ['.', '-.']
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
			if @operand2
				if @operand2[0] is '-'
					@operand2 = @operand2.slice(1)
				else
					@operand2 = '-' + @operand2
			else
				if @operand1[0] is '-'
					@operand1 = @operand1.slice(1)
				else
					@operand1 = '-' + @operand1

		evaluate: ->
			return if not @operand2 or @operand2 in ['.', '-.']

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
