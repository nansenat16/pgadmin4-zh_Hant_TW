FROM dpage/pgadmin4:4.13

RUN wget -O /tmp/pgadmin-lang-tw.zip https://github.com/pgsql-tw/pgadmin4-zh_Hant_TW/archive/master.zip
RUN unzip /tmp/pgadmin-lang-tw.zip -d /tmp \
    && line=`cat /pgadmin4/config.py|grep LANGUAGES -n|awk -F ':' '{ print $1}'` \
    && line=`expr "$line" + 1` \
    && sed -i "$line a \ \ \ \ 'zh_Hant_TW': 'Mandarin (Taiwan)'," /pgadmin4/config.py \
    && cp -r /tmp/pgadmin4-zh_Hant_TW-master/web/pgadmin/translations/zh_Hant_TW /pgadmin4/pgadmin/translations \
    && rm -rf /tmp/*
