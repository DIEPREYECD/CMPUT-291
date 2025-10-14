Create Table Users (
    uid Integer,
    name char(100),
    email char(100),
    city char(100),
    timezone char(100),
    primary key (uid)
);

Create Table follows (
    follower Integer,
    followee Integer,
    primary key (follower, followee),
    foreign key (follower) references Users on delete cascade,
    foreign key (followee) references Users on delete cascade
);

Create Table Lists (
    uid Integer,
    name char(100),
    primary key (uid, name),
    foreign key (uid) references Users on delete cascade
);

Create Table ListIncludes (
    listcreator Integer,
    listname char(100),
    userid Integer,
    primary key (listcreator, listname, userid),
    foreign key (listcreator, listname) references Lists on delete cascade,
    foreign key (userid) references Users on delete cascade
);

Create Table Bot (
    uid Integer,
    primary key (uid),
    foreign key (uid) references Users on delete cascade
);

Create Table Blue (
    uid integer,
    cardno integer,
    primary key (uid),
    foreign key (uid) references Users on delete cascade
);

Create Table Gray (
    uid Integer,
    vdate date,
    primary key (uid),
    foreign key (uid) references Users on delete cascade
);

Create Table botOwners (
    botid Integer,
    ownerid Integer,
    primary key (botid, ownerid),
    foreign key (botid) references Bot on delete cascade,
    foreign key (ownerid) references Users on delete cascade
);

Create Table affiliateGray (
    grayid Integer,
    uid Integer,
    primary key (grayid, uid),
    foreign key (grayid) references Gray on delete cascade,
    foreign key (uid) references Users on delete cascade
);

Create Table Tweets (
    writer Integer,
    tdate Date,
    text char(280),
    repltowriter Integer,
    replytodate Date,
    primary key (writer, tdate),
    foreign key (writer) references Users on delete cascade,
    foreign key (repltowriter, replytodate) references Tweets on delete cascade
);

Create Table ReTweets (
    uid Integer,
    tweetOwner Integer,
    tweetDate Date,
    rdate Date,
    primary key (uid, tweetOwner, tweetDate),
    foreign key (uid) references Users on delete cascade,
    foreign key (tweetOwner, tweetDate) references Tweets on delete cascade
);

Create Table Hashtags (
    term char(100),
    primary key (term)
);

Create Table mentionsH (
    tweetOwner Integer,
    tweetDate Date,
    term char(100),
    primary key (tweetOwner, tweetDate, term),
    foreign key (tweetOwner, tweetDate) references Tweets on delete cascade,
    foreign key (term) references Hashtags on delete cascade
);

Create Table URLs (
    shorturl char(100),
    longurl char(100),
    primary key (shorturl)
);

Create Table mentionsU (
    tweetOwner Integer,
    tweetDate Date,
    shorturl char(100),
    primary key (tweetOwner, tweetDate, shorturl),
    foreign key (tweetOwner, tweetDate) references Tweets on delete cascade,
    foreign key (shorturl) references URLs on delete cascade
);