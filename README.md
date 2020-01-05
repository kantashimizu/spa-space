# このアプリについて
全国の温泉の情報投稿サイトです。

## 概要
アプリ名：SPA-SPACE

使用言語：Ruby on Rails、JavaScript

主な機能：ユーザーログイン機能、投稿機能

作業人数：１人

作業日数：６日間

## このアプリを作ろうと思ったきっかけ
TECH::EXPERTの基礎カリキュラム修了時にCSSの機能を沢山使い技術の定着させたいと思い、私の趣味である温泉のサイトを制作致しました。

## 工夫した点
・cssのanimationのみで最初のオープニングを演出した事です。  
以下の様に時間差で文字の表示を行い、animationを制作しました。  
``  
@keyframes Background {  
  0%{  
    opacity:  0;  
  }  
  50%{  
    opacity:  0; 
  }  
  100%{  
    opacity:  1;  
  }  
}  
@keyframes Font1 {  
  0%{  
    opacity: 0;  
  }  
  70%{  
    opacity: 0;  
  }  
  100%{  
    opacity: 1;  
  }  
}  
@keyframes Font2 {  
  0%{  
    opacity: 0;  
  }  
  70%{    
    opacity: 0;  
  }  
  100%{  
    opacity: 1;  
  }  
}  
@keyframes Font3 {  
  0%{  
    opacity: 0;  
  }  
  70%{  
    opacity: 0;  
  }  
  100%{  
    opacity: 1;  
  }  
``
そしてJSを使いクリック時にはオープニングをスキップ出来る様に致しました。  　　
・投稿時に評価機能を付けました<br>   
以下のコードで星マークを演出し、cssでhover時に変化を加えて直感的に操作を出来る様に致しました。
``
### HTML
.evaluation  
  = form.radio_button :rate,5,id: :star1  
  %label{for:"star1"}  
    %span.text> 最高  
    ★  
  = form.radio_button :rate,4,id: :star2  
  %label{for:"star2"}  
    %span.text> 良い  
### CSS  
.evaluation{  
  display: flex;  
  flex-direction: row-reverse;  
  justify-content: center;  
  width: 300px;  
  margin-top: 10px;  
}  
.evaluation input[type='radio']{  
  display: none;  
}  
.evaluation label{  
  position: relative;  
  padding: 10px 10px 0;  
  color:gray;  
  cursor: pointer;  
  font-size: 30px;  
}  
.evaluation label .text{  
  position: absolute;  
  left: 0;  
  top: 0;  
  right: 0;  
  text-align: center;  
  font-size: 12px;  
  color:black;  
}  
.evaluation label:hover,  
.evaluation label:hover ~ label,  
.evaluation input[type='radio']:checked ~ label{  
  color: #ffcc00;  
}   
``  



# README

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|

### Association
- has_many :comment
- has_many :tweet

## tweetsテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|text|string|null: false|
|image|string||
|address|string|null: false|
|user_id|references|null: false,foreign_key: true|
|area_id|references|null: false,foreign_key: true|

### Association
- belongs_to :user
- has_many :comment

### Association
- belongs_to :tweet
- belongs_to :user

## areasテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image|string||


### Association
- belongs_to :tweet
