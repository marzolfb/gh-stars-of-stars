Answers the question:

```
Starting with other Github users who have starred the same repos I have, what
other repos have these users starred that I might be interested in?
```

Utilizes the shiny brand new GraphQL Github API (need to opt-in to early access
program currently)

The setup process is a bit rough at the moment:
* hand-edit ./runit.sh and plug in your Github personal access token for the
  GITHUB_TOKEN environment variable

To run it:
```
./runit.sh
```
* The first time through it will make a curl request to Githubs GraphQL API to get
data and it will write it to a local response.json file.
* The contents of the local response.json file will be piped through formatting
utilities to produce a simple 2-column, tabular display containing repo name
and description
* On subsequent runs if the cached response.json file exists in the current
directory, the call to query the GitHub API is skipped and the cached data is
displayed

Sample output:
```
NAME                                                        DESCRIPTION
-------                                                     -------------
12factor
1pass                                                       A command line interface for 1Password
2016-OSCON-containers-at-scale-with-Kubernetes
2016.pycon.my                                               IPython notebook slides
2016-slides                                                 PyCon SK 2016 Presentation Materials
2016-talks                                                  Slides and Links to slides for 2016 talks
30-days-of-react-native                                     30 days of React Native demos
320andup                                                    This is the new 320 and Up
52-technologies-in-2016                                     Let's learn a new technology every week. A new technology blog every Sunday in 2016.
99-problems                                                 This is an adaptation of the Ninety-Nine Prolog Problems written by Werner Hett.
AbletonLive9_RemoteScripts                                  Unofficial repository for Ableton Live 9 MIDI Remote Scripts by Julien Bayle
abot                                                        Abot makes it easy and fun to build your own digital assistant, and we include everything you need to get started.
ABPTTS                                                      TCP tunneling over HTTP/HTTPS for web application servers
absinthe                                                    GraphQL for Elixir
Abstract-Algebra                                            Implements group theory in Python
ACC                                                         Apollo CPU Core in Verilog. For learning and having fun with open FPGA
accelerate                                                  Embedded language for high-performance array computations
accessibility-developer-tools                               This is a library of accessibility-related testing and utility code
```
