<?php
require __DIR__ . '/../vendor/autoload.php';

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Factory\AppFactory;

session_start();

$app = AppFactory::create();
$app->addRoutingMiddleware();
$errorMiddleware = $app->addErrorMiddleware(true, true, true);

if (!isset($_SESSION['cart'])) {
    $_SESSION['cart'] = [];
}

$app->get('/catalog', function (Request $request, Response $response) {
    $catalog = [
        ['id' => 1, 'name' => 'Product A'],
        ['id' => 2, 'name' => 'Product B']
    ];
    $response->getBody()->write(json_encode($catalog));
    return $response->withHeader('Content-Type', 'application/json');
});

$app->get('/cart', function (Request $request, Response $response) {
    $response->getBody()->write(json_encode($_SESSION['cart']));
    return $response->withHeader('Content-Type', 'application/json');
});

$app->post('/cart', function (Request $request, Response $response) {
    $data = $request->getParsedBody();
    if (isset($data['item'])) {
        $_SESSION['cart'][] = $data['item'];
    }
    $response->getBody()->write(json_encode($_SESSION['cart']));
    return $response->withHeader('Content-Type', 'application/json');
});

$app->get('/', function (Request $request, Response $response) {
    $response->getBody()->write('E-commerce service running');
    return $response;
});

$app->run();
