# cookbook-marathon Cookbook
[![Build Status](https://travis-ci.org/mcoffin/cookbook-marathon.svg?branch=master)](https://travis-ci.org/mcoffin/cookbook-marathon)

Cookbook to install and configure [Marathon](https://mesosphere.github.io/marathon).

## Requirements
This cookbook requires a bash shell and the `tar` command, which is used to extract the marathon tarballs.

If you actually want to run marathon, you will need [Zookeeper](http://zookeeper.apache.org) and [Apache Mesos](http://mesos.apache.org/) running somewhere.

## Contributing
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Run `foodcritic`, and `rubocop` to ensure your style is up to par with the rest of the repository.
6. Submit a Pull Request using Github

## Authors
Authors: Matt Coffin

## License
This cookbook is licensed under the Apache 2.0 license.
