angular.module('states.budget', ['controllers.buckets'])
.config(['$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider)->
  $stateProvider.state('budgets',
    url: '/budgets/:budget_id'
    views:
      'main':
        resolve:
          currentUser: ['$rootScope', 'User', ($rootScope, User)->
            $rootScope.current_user
            users = []
            User.allUsers().then((success)->
              users = success
              $rootScope.current_user = users[2]
              $rootScope.current_user
            , (error)->
              console.log error
            )
          ]
        templateUrl: '/views/budgets/budget.show.html'
        controller: 'BudgetController'
  ) #end state
  .state('budgets.buckets',
    url: '/buckets'
    views:
      'header':
        template: '
          <h2>Budget</h2>
        '
      'page':
        templateUrl: '/views/buckets/buckets.list.html'
      'sidebar':
        templateUrl: '/views/budgets/budget.sidebar.html'
  ) #end state
  .state('budgets.propose_bucket',
    url: '/propose-bucket'
    views:
      'header':
        template: '<h2>Propose a Bucket</h2>'
      'page':
        templateUrl: '/views/buckets/buckets.create.html'
        controller: 'BucketController'
      'sidebar':
        template: '<h1>Instructions</h1>'
  ) #end state
]) #end config

