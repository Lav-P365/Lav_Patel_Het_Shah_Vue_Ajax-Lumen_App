<?php

/** @var \Laravel\Lumen\Routing\Router $router */

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| These are the routes for your IPL Teams API.
|
*/

// matches localhost:8888/ipl-api/public/
$router->get('/', function () use ($router) {
    return $router->app->version();
});

// Get all IPL teams
$router->get('/teams', 'TeamController@getAll');

// Get one IPL team by ID (details like owner, founded year, stadium, image)
$router->get('/teams/{id}', 'TeamController@getOne');

// (Optional: if adding backend admin functionality later)
$router->post('/teams/add', 'TeamController@save');
$router->post('/teams/edit/{id}', 'TeamController@update');
$router->delete('/teams/delete/{id}', 'TeamController@delete');
