CREATE TABLE Article (
  Id INT IDENTITY(1,1),
  Title NTEXT NOT NULL,
  CONSTRAINT PK_Article PRIMARY KEY(Id)
);

CREATE TABLE Tag (
  Id INT IDENTITY(1,1),
  Name NTEXT NOT NULL,
  CONSTRAINT PK_Tag PRIMARY KEY(Id)
);

CREATE TABLE Article2Tag(
  ArticleId INT NOT NULL,
  TagId INT NOT NULL,
  CONSTRAINT PK_Article2Tag PRIMARY KEY CLUSTERED (ArticleId, TagId),
  CONSTRAINT FK_ArticleId FOREIGN KEY (ArticleId)
  REFERENCES Article (Id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_TagId FOREIGN KEY (TagId)
  REFERENCES Tag (Id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Article (Title) VALUES 
  ('Article1'),
  ('Article2'), 
  ('Article3');

INSERT INTO Tag (Name) VALUES
  ('Tag1'),
  ('Tag2');

INSERT INTO Article2Tag (ArticleId,TagId) VALUES 
  (1,1),
  (1,2),
  (2,1);



SELECT a.Title,t.Name
FROM
  Article AS a
  LEFT JOIN Article2Tag AS at ON a.Id=at.ArticleId
  LEFT JOIN Tag AS t ON t.Id=at.TagId;