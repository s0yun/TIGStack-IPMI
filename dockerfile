FROM telegraf

RUN apt update && apt install ipmitool -y

