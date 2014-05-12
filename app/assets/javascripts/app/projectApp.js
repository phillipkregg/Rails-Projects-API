
// Create Angular App
var projectApp = angular.module('projectApp', ['ngResource']);

// Controllers
projectApp.controller('ProjectsController', ['$scope', 'Projects', 'Project', 'ProjectTodos', function($scope, Projects, Project, ProjectTodos) {
  $scope.heading = "Angular Projects";
  
  $scope.projects = Projects.query();
  $scope.project = Project.query({ projectId: 1 });
  $scope.todos = ProjectTodos.query();
  
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
projectApp.factory('Projects', ['$resource', function($resource) {
  return $resource('/projects.json');
}]);

projectApp.factory('Project', ['$resource', function($resource) {
  return $resource('/projects/:projectId', { projectId: '@id' }, {'query': { method: 'GET', isArray: false }});
}]);

projectApp.factory('ProjectTodos', ['$resource', function($resource) {
  return $resource('/projects/:project_id/project_todos.json', { projectId: '@id'}, {'query': { method: 'GET', isArray: true }});
}]);


// Filters
projectApp.filter('titleize', function() {
  return function(text) {
    if (text == null) return '';
    return String(text).replace(/(?:^|\s)\S/g, function(c) {
      return c.toUpperCase();
    })
  }
})
































