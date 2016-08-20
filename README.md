# A Project Template

```

--------------------------------         --------------------------------         --------------------------------
|                              |         |                              |         |                              |
|       Hosting Server(s)      | ------> |        Varnish Server        | ------> |        HTTP Servers          |
|                              |         |         (kubernetes)         |         |                              |
--------------------------------         --------------------------------         --------------------------------
                                                                                                  |
                                                                                                  |
                                                                                                  |
--------------------------------         --------------------------------         --------------------------------
|                              |         |                              |         |                              |
|                              |         |                              |         |    Application Container     |
|                              |         |         (kubernetes)         |         |                              |
--------------------------------         --------------------------------         --------------------------------


--------------------------------         --------------------------------
|                              |         |                              |
|      Database Server(s)      | ------> |          MySQL Server        |
|       (Stand Alone S1)       |   |     |                              | 
--------------------------------   |     --------------------------------
                                   |
                                   |     --------------------------------
                                   |     |                              |
                                   --->  |          PgSQL Server        |
                                         |                              | 
                                         --------------------------------

(https://www.howtoforge.com/loadbalanced_mysql_cluster_debian)
--------------------------------         --------------------------------         --------------------------------
|                              |         |                              |         |                              |
|      Database Server(s)      | ------> |          MySQL Server        | ------> |          MySQL Server        |
|         (Cluster S2)         |         |            Cluster           |         |             Node             |
--------------------------------         --------------------------------         --------------------------------


```