
## pddl-lib ##

### Description ###

A PDDL library that, by using an ANTLR 4 grammar to parse PDDL files, provides a very simple interface to interact with domain-problems.
This library publishes one object class whose API exposes methods for obtaining:

* The initial state.
* The goals.
* The list of operators.
* The positive and negative preconditions and the positive and negative effects.
* The _grounded_ states of a given operator (grounded variables, preconditions and effects).

This is enough for the user to focus on the implementation of state-space or plan-space search algorithms.

The development of this tool was inspired from Univerty of Edinburgh's Artificial Intelligence Planning course by Dr. Gerhard Wickler and Prof. Austin Tate. The terms used in this API (and the API itself) closely resembles the ones proposed by the lecturers.

For .NET the library is `pddlnet.dll`.

The orginal grammar file was authored by Zeyn Saigol from University of Birmingham. I cleaned up it, made it language agnostic and upgraded to ANTLR 4.



### What this project is not? ###

This library doesn't include and won't include algorithms for solutions search.
There are lots of projects and complete packages for planning available. This project is just a library that provides the user a simple PDDL helper API useful when she experiments with her own planning algorithms.


### Examples ###

In this repostory you'll find some PDDL examples files useful for testing purposes.
For instance, [domain-03.pddl](examples-pddl/domain-03.pddl)
and [problem-03.pddl](examples-pddl/problem-03.pddl)


### Other Resources ###

There are wonderful material at the the University of Edinburgh:
* [AI Planning MOOC Project Home Page](http://www.aiai.ed.ac.uk/project/plan/ooc)
* [Index to access all course materials and videos](http://media.aiai.ed.ac.uk/Project/AIPLAN)
* [Videos on YouTube](http://bit.ly/aiplanmooc)


### Using the PDDL .NET library ###

The .NET library is available from nuget as `pddlnet.dll`.


### Future development ###


### Adavanced ###

In case you want to tweak the grammar, add other target languages or modify the library you will need build this project from the repository sources.

#### Prerequisites

* Install ANTLR version 4.
    I used `brew install antlr4` (a Mac). Your mileage may vary depending on your environment.
* mono development.
* Antlr4.Runtime.Standard.dll

#### Building

* Checkout the repository.
* Edit the Makefile to configure PATHs.
* Run `make` (it includes tests.)

To build the .NET library you must download the Antlr4.Runtime.Standard.dll from www.antlr4.org and
place it under the pddlnet directory. Currently it works with 4.7.0
 
 
### Contribution guidelines ###

I'd appreciate any feedback you send like pull requests, bug reports, etc.

Please, use the issue tracker at will.


### Acknowledgments

Michiaki Tatsubori [@tatsubori](https://github.com/tatsubori) added time-duration support. Thanks!


### License ###

This project is publish under the
[Apache License](http://www.apache.org/licenses/LICENSE-2.0).


### Who do I talk to? ###

For questions or requests post an issue here or tweet me at
[@herchu](http://twitter.com/herchu)



