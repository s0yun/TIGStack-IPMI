# tig stack/ipmi

TIG Monitoring stack with ipmi-tools prebaked into it using a custom docker image, designed to be used as a quick and painless set up for those with iLO from HPE who want pretty metrics from iLO
- Tested on iLO4


# Prerequiests

- Docker and Docker-Compose installed 

### iLO Config

    IPMI/DCMI over LAN Access - enabled
    Seperate iLO user account from your main user 
    This needs to be a full administrator account not an operator or user. 

Full details on how to do this in iLO4 [Available here](https://support.hpe.com/hpesc/public/docDisplay?docId=a00045108en_us&docLocale=en_US)



## Setup

Clone this git repository and enter it.
Run the following command, this will build the custom docker image, and tag it for the docker compose to be used moments later

```docker build -t telegraf_ipmi:latest .``` 

Once that's done, using your favorate text editor you need to edit the `telegraf.conf` file to add your ipmi user info on line 12. 
Swap out the `username`, `password` and `FQDN or IP` for your enviroment respectivly. 


Time to bring the stack up with `docker-compose up -d` 

Head to `FQDN:3000` and log in with admin as the username and password
you'll be prompted to change it. 

Once done to set up your influx db head to Configuration/Datasources
The infomtion you'll need is as follows: 
```
Query Lang: InfluxQL

URL:http://influxdb:8086

Database: tigstack
User: admin
```
That's it, click `save & close`


Suggested dashboard as a starting point:
Grafana import from ID:  11832 


