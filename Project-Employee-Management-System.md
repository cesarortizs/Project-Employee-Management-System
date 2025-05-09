**Project Documentation**

We have to be very careful when selecting the order in which we créate our tables, this involves taking into consideration those tables which have a relationship with another, as obviously the relationship can’t be established if the other table doesn’t exist yet.

In these tables with relationships between each other is possible to use joins, these are a powerful tool that allow us to combine de data from two or more different tables, this is useful because we can créate projections with very specific data from multiple sources (tables), as long as they are related to each other, getting this way a more complete picture of our data.

Views are tables that are often generated from a certain query, if the query is too complex it might help us alíviate the time it takes to obtain the required data, obviously the query should be executed often to make it really worthwhile, views can also be combined with indexing to obtain even faster querying times but the same frequency conditions should still apply.

As this is very simple implementation of a database, there werent a lot of problems, nonetheless we have to be very careful when defining relationships because when we do, often data is directly related to another and this means that if some data that has a relationship with another is updated or deleted it can also affect the other.
