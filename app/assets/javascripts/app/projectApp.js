
// Create Angular App
var projectApp = angular.module('projectApp', ['ngResource']);

// Controllers
projectApp.controller('ProjectsController', ['$scope', 'Project', function($scope, Project) {
  $scope.heading = "Angular Projects";
  
  $scope.projects = Project.query();
  
  $scope.newProject = {
    title: 'a default title'
  }
  
  $scope.create = function() {
    Project.save($scope.newProject, function(resource) {
      $scope.projects.push(resource);
      $scope.newProject = {};
    }, function (response) {
      console.log('Error ' + response.status);
    })
  }
  
}]);


// Service
projectApp.factory('Project', ['$resource', function($resource) {
  return $resource('/projects.json');
}])


// Filters
projectApp.filter('titleize', function() {
  return function(text) {
    if (text == null) return '';
    return String(text).replace(/(?:^|\s)\S/g, function(c) {
      return c.toUpperCase();
    })
  }
})
































