CREATE TABLE IF NOT EXISTS 物件(
    物件コード INTEGER PRIMARY KEY,
    物件名 VARCHAR(50) NOT NULL DEFAULT 'hoge ',
    沿線 VARCHAR(50) NOT NULL DEFAULT 'oo線 ',
    最寄駅 VARCHAR(50) NOT NULL DEFAULT 'oo駅 ',
    賃料 SMALLINT NOT NULL DEFAULT 10000,
    間取り VARCHAR(50) NOT NULL DEFAULT '三畳 ',
    向き VARCHAR(50) NOT NULL DEFAULT '東 ',
    専有面積 SMALLINT NOT NULL DEFAULT 38,
    築年数 SMALLINT NOT NULL DEFAULT 20,
    都道府県 VARCHAR(50) NOT NULL DEFAULT '北海道 ',
    市区町村 VARCHAR(50) NOT NULL DEFAULT '大阪市 ',
    エアコン VARCHAR(1) NOT NULL CHECK(エアコン IN ('Y', 'N')) DEFAULT 'N ',
    オートロック VARCHAR(1) NOT NULL CHECK(オートロック IN ('Y', 'N')) DEFAULT 'N ',
    物件登録日 DATE NOT NULL DEFAULT '2022/01/01 '
);

CREATE TABLE IF NOT EXISTS 設備(設備コード VARCHAR(50) PRIMARY KEY, 設備名 VARCHAR(50));

CREATE TABLE IF NOT EXISTS 新物件(
    物件コード INTEGER PRIMARY KEY,
    物件名 VARCHAR(50) NOT NULL DEFAULT 'hoge ',
    沿線 VARCHAR(50) NOT NULL DEFAULT 'oo線 ',
    最寄駅 VARCHAR(50) NOT NULL DEFAULT 'oo駅 ',
    賃料 SMALLINT NOT NULL DEFAULT 10000,
    間取り VARCHAR(50) NOT NULL DEFAULT '三畳 ',
    向き VARCHAR(50) NOT NULL DEFAULT '東 ',
    専有面積 SMALLINT NOT NULL DEFAULT 38,
    築年数 SMALLINT NOT NULL DEFAULT 20,
    都道府県 VARCHAR(50) NOT NULL DEFAULT '北海道 ',
    市区町村 VARCHAR(50) NOT NULL DEFAULT '大阪市 ',
    物件登録日 DATE NOT NULL DEFAULT '2022/01/01 '
);

CREATE TABLE IF NOT EXISTS 物件設備(
    物件コード INTEGER,
    設備コード VARCHAR(50),
    設置個数 SMALLINT DEFAULT 1,
    PRIMARY KEY (物件コード, 設備コード),
    FOREIGN KEY (物件コード) REFERENCES 新物件(物件コード),
    FOREIGN KEY (設備コード) REFERENCES 設備(設備コード)
);