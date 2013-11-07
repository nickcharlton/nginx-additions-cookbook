# nginx-additions cookbook

This cookbook extends the community [nginx][] cookbook with a few additional bits:

* Ensures `/var/www` exists.
* Creates and configures a default page based on the hostname.
* and sets default error handlers for; 404, 500 and a general one.

## Requirements

* [nginx][] >= 2.0.4

It follows Debian conventions for directories.

## Usage

Add it to the run list after [nginx][]. You'll probably wish to fork and set your
own templates for the error handlers and default page.

## Attributes

There are two attributes to configure the footer of the error pages. Both default
to none.

* `nginx-additions['support_email']`: An email address to list.
* `nginx-additions['status_page']`: A support page to email, without the `http://`.

## Recipes

`default`

## Author

Author: Nick Charlton (<nick@nickcharlton.net>)

[nginx]: https://github.com/opscode-cookbooks/nginx
