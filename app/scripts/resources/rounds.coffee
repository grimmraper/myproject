`// @ngInject`
window.Cobudget.Resources.Round = (Restangular) ->

	get: (round_id)->
		Restangular.one('rounds', round_id).get()