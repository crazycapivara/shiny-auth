shiny-auth
================

Examples on how to add authentification to `shiny` apps.

run apps
--------

    # all apps will be ...
    Listening on http://127.0.0.1:5141

    # just sign in and out by clicking an action button
    $ Rscript shiny_auth_example.R

    # sign in by passing an api key
    $ Rscript shiny_auth_example_api_key.R

    # open browser and try
    http://127.0.0.1:5141
    http://127.0.0.1:5141?key=1234
    http://127.0.0.1:5141?key=8989

    # sign in with username and password
    Rscript shiny_auth_example_uid_pwd.R

    # try
    username = bird
    password = dog

nginx meets shiny-server
------------------------

See config files for `nginx` and `shiny-server` in `nginx_meets_shiny-server` folder.
