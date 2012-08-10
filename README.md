[Riemann](http://aphyr.github.com/riemann/) is a very interesting
event agregation and monitoring tool. This repository aims to make
experimenting with it easier.

It does that by using two other lovely tools, namely
[Vagrant](http://vagrantup.com) and [Puppet](http://puppetlabs.com/).
You'll need to install Vagrant yourself but puppet comes included on the
specified box.

[![Build
Status](https://secure.travis-ci.org/garethr/riemann-vagrant.png)](http://travis-ci.org/garethr/riemann-vagrant)

## Usage

Once you have Vagrant installed all you have to do is:

    vagrant up

This should download an Ubuntu base box and then use Puppet to install
Reinmann. It also installs a modified dashboard as an example, starts a
couple of daemons to start putting information into Riemann and also
uses the [Puppet report
processor](https://github.com/jamtur01/puppet-riemann) to load even more
data.

You can access the dashboard at http://localhost:4567 due to that port
being forwarded and if you're experimenting with the a Riemann client
you can access that on localhost:5555.

## Riemann Puppet Module

The Riemann puppet module bundled here wants a bit of refactoring and pulling
out into a separate repository at some point and uploading to The Forge.
For the moment feel free to copy it from here.

## Contributing

The puppet module for riemann included here has both a test suite and is
syntax checked. If you're going to contribute, or just interested in
testing Puppet code, first install the dependencies:

    bundle install

The run the tests and linter:

    bundle exec rake spec
    bundle exec rake lint

## License

Copyright (c) 2012 Gareth Rushgrove

Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
