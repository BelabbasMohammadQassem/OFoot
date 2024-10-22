<?php
// src/Controller/ErrorController.php
namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Throwable;

class ErrorController extends AbstractController
{
    private bool $debug;

    public function __construct(bool $debug)
    {
        $this->debug = $debug;
    }

    public function show(Request $request, Throwable $exception): Response
    {
        // Récupérer le vrai code d'erreur
        $statusCode = method_exists($exception, 'getStatusCode') 
            ? $exception->getStatusCode() 
            : Response::HTTP_INTERNAL_SERVER_ERROR;

        // Si on est en mode debug et que c'est une erreur 500, on laisse Symfony gérer
        if ($this->debug && $statusCode == 500) {
            throw $exception;
        }

        $statusText = match ($statusCode) {
            404 => 'Page non trouvée',
            403 => 'Accès interdit',
            500 => 'Erreur interne du serveur',
            default => 'Une erreur est survenue'
        };

        return $this->render('error/error.html.twig', [
            'status_code' => $statusCode,
            'status_text' => $statusText,
            'exception' => $exception,
        ], new Response('', $statusCode));
    }
}