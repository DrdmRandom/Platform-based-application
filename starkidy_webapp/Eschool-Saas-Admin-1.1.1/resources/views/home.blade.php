@extends('layouts.home_page.master')

@section('content')
    <style>
        :root {
            --front-site-theme-color: {{ $settings['front_site_theme_color'] ?? '#CCF6FF' }};
            --primary-color: {{ $settings['primary_color'] ?? '#4CBFD8' }};
            --secondary-color: {{ $settings['secondary_color'] ?? '#94DFEF' }};

            --preloader-img: url({{ $settings['horizontal_logo'] ?? asset('assets/home_page/img/Logo.svg') }});

        }
    </style>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="../css/style.css">
    
        <title>Login-index</title>
    </head>
    <body>
        <div class="logo me-auto">
            <div class="text-center">
                <img src="{{ $settings['horizontal_logo'] ?? asset('assets/home_page/img/Logo.svg') }}" class="rounded" alt="...">
            </div>

            <div class="d-flex justify-content-center align-items-center">
                <a class="login scrollto" href="{{ url('login') }}"><button type="button" class="btn btn-primary w-50 custom-height" onclick="{{ url('login') }}">Student</button></a>
            </div>

            <br>

            <div class="d-flex justify-content-center align-items-center">
                <a class="login scrollto" href="{{ url('login') }}"><button type="button" class="btn btn-primary w-50 custom-height" onclick="{{ url('login') }}">Teacher</button></a>
            </div>

            <br>

            <div class="d-flex justify-content-center align-items-center">
            <a class="login scrollto" href="{{ url('login') }}"><button type="button" class="btn btn-primary w-50 custom-height" onclick="{{ url('login') }}">Admin</button></a>
            </div>

        <br>

            
        
        
            

        </div>
            
        
    </body>