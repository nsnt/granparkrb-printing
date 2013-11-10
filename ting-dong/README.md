REQUIREMENT
====

Ruby 1.9 以降。


gutenberg.rb
====

USAGE
----

    ruby gutenberg.rb -i MOVABLE_TYPES.CSV -t TEXT_TO_PRINT

DESCRIPTION
----

このプログラムは，28種類n文字の活字に対し，O(n)で読み込み/ハッシュ化を行う。同一キーの衝突の際に配列の末尾への追加を行うので，そこにコストが発生するが，Rubyでは配列の末尾への追加のコストはO(1)らしい ( cf. http://stackoverflow.com/questions/17019523/what-is-the-complexity-of-rubys-arrayinsert ) ので無視できる。さらに，t文字の出力文字列に対し，O(t)で文字種ごとの文字数のカウントを行い，印字可能なら，t文字の文字列それぞれに対し，O(1)でハッシュの探索，O(1)で配列からのpop ( cf. http://en.wikipedia.org/wiki/Double-ended_queue#Complexity )，O(1)で印字を行うため，印字の計算量はO(t)となる。結果的に，このプログラムの計算量はO(n)+O(t)になる(はず)。

gutenberg2.rb
====

USAGE
----

    ruby gutenberg2.rb -i MOVABLE_TYPES.CSV

DESCRIPTION
----

このプログラムは，起動されると，印字したい文字列の入力を待ち受ける。入力が1行行われるたびに，入力文字列の文字種ごとの文字数のカウントを行い，印字可能なら印字を行い。印字不可能な場合は，「cannnot print」と出力する。いずれの場合も，出力後に活字種類ごとの残り活字数を出力し，次の入力行を待ち受ける。入力を終了する場合は，単にCTRL-Dを入力するか，もしくは小文字で「exit」と入力し改行する。

計算量に関しては(interactiveなプログラムなので議論にあまり意味はないが)，内部の処理はgutenberg.rbと同じなので，gutenberg.rbに準ずる。
