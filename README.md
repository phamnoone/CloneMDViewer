Clone MDViewer
=============

An example application that connects to the GitHub REST API and displays users
from organizations.  Users can then be clicked to retrieve their repositories.
Finally, a repository can be clicked and recent commits displayed.

[linkname](https://www.youtube.com/watch?v=RGNcr9oQ60U)

## Running locally ##

## Stack ##

This is an entirely client-side application, meaning aside from the configured
HTTP server and the remote API, there is no server processing.  All logic is
isolated to JavaScript.


## Deployment ##

This is deployed on a Linode Arch Linux server that runs Nginx.  It is served
locally and updated via a `git pull` and `grunt` combination.


```

## Credits ##

[@tbranyen]()
