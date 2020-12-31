# My crappy New York Times Covid19 REST API

A quick (read: hacky) api that can import the data from https://github.com/nytimes/covid-19-data and then serve it.

Configure `config/database.yml` to point at your pg database, then run:

`rake db:create db:migrate import:states import:us`

From there, you can request the data as such:

| Command | Output |
| :-----: | :----: |
| `curl localhost:3000/states` | All output in json by state |
| `curl localhost:3000/states/nebraska` | Data for a specific state by date |
| `curl localhost:3000/uss` | Data for the US by date |

states and uss support `.csv` output as well, so to get a csv spreadsheet just request this:

`curl localhost:3000/uss.csv` and it will prompt to download a spreadsheet

