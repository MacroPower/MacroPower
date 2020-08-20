MacroPower README
=================

Hello! If you're here, you're probably wondering how `my README`_ works.
Well, you're in luck.

Badges
======

-  `Views counter`_
-  `shields.io`_ (everything else)

To add some extra flair, append some query parameters to your request to
`shields.io`_. All parameters I've used are well documented in the
footer of `shields.io`_.

GitHub Stats
============

Generate the Stats card via `GitHub Readme Stats`_.

.. code:: markdown

   ![Stats](https://github-readme-stats.vercel.app/api?username=MacroPower&show_icons=true)

Append ``&theme=<your_theme>`` with a theme from `GitHub Readme Stats
Themes`_.

Dev Icons
=========

All icons are from `Devicon`_ as well as `cncf-artwork`_. I used the
html table syntax to create the table.

.. code:: html

   <table id="macropower-tech">
     <!-- Row #1 -->
     <tr>
       <td align="center" width="96">
         <a href="#macropower-tech">
           <img src="icon.svg" width="48" height="48" alt="Tech Name" />
         </a>
         <br />Tech Name
       </td>
       <td align="center" width="96">
         {...}
       </td>
     </tr>
     <!-- Row #2 -->
     <tr>
       {...}
     </tr>
   </table>

Dynamic ASCII Graph
===================

The ASCII Graph uses data from `Wakatime`_. I have developed a set of
simple tools that, when combined, can render the graph using this data.
Each of the linked repos contains its own more detailed documentation.

Wakatime Exporter
-----------------

`Wakatime Exporter`_ is a `Prometheus Exporter`_ that collects metrics
from the `Wakatime API`_ on scrape. When added as a Prometheus target,
each scrape adds coding metrics to Prometheus.

Prometheus ASCII
----------------

`Prometheus ASCII`_ is a Prometheus CLI Client that outputs ASCII
graphs. By inputting a PromQL query for the Wakatime data collected via
`Wakatime Exporter`_, e.g. ``increase(wakatime_seconds_total[24h])``, we
can gather data and render the graph using my `asciigraph fork`_, which
adds support for bucketing by duration.

.. _update_graphsh:

update_graph.sh
---------------

`update_graph.sh`_ is a very simple shell script that updates this
repo's README.md, which is run locally on one of my servers (scheduled
via cron). GitHub Actions can not be used unless you plan on exposing
your Prometheus server to the internet (or perhaps you could get away
with using some clever tunneling).

The only requirement is that you add the two comments to denote the area
of README.md to modify. Any content between these comments will be
replaced with the rendered graph each time the script is run.

.. code:: markdown

    <!-- START_SECTION:ascii_graph -->

    <!-- END_SECTION:ascii_graph -->

The `update_graph.sh`_ script is wrapped with some bash that sets
environment-specific things that would be not be appropriate to commit.
Also, the script writes some files to the working directory, so you
should run in some tmp directory. Example:

.. code:: shell

    git config user.email "myemail+bot@gmail.com"
    git config user.name "[bot] Username"

    export PROMETHEUS_ASCII_SERVER_ENDPOINT="http://<my prometheus instance>:9090"

    ./update_graph.sh

    git add README.md
    git commit -m "Update graph : $(date)"

    git push "https://<USERNAME:APIKEY>@github.com/<REPO>/<REPO>.git"


.. _my README: https://github.com/MacroPower/MacroPower
.. _Views counter: https://github.com/antonkomarev/github-profile-views-counter
.. _shields.io: https://shields.io
.. _GitHub Readme Stats: https://github.com/anuraghazra/github-readme-stats
.. _GitHub Readme Stats Themes: https://github.com/anuraghazra/github-readme-stats/blob/master/themes/README.md
.. _Devicon: https://devicons.github.io/devicon/
.. _cncf-artwork: https://github.com/cncf/artwork
.. _Wakatime: https://wakatime.com/
.. _Wakatime Exporter: https://github.com/MacroPower/wakatime_exporter
.. _Prometheus Exporter: https://prometheus.io/docs/instrumenting/exporters/
.. _Wakatime API: https://wakatime.com/developers
.. _Prometheus ASCII: https://github.com/MacroPower/prometheus_ascii
.. _asciigraph fork: https://github.com/MacroPower/asciigraph
.. _update_graph.sh: https://github.com/MacroPower/MacroPower/blob/master/update_graph.sh
