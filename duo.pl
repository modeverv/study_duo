#! /usr/bin/env perl
use strict;
use Data::Dumper;
use JSON qw/encode_json decode_json/;
use CGI;

####################################################
### 1.duo.jsのデータを読み込んで
### 2.リクエストパラメータを読み込んで
### 3.指定されたデータを表示する
####################################################

## duoのデータ構造を用意
my $file = './html/js/duo.js';
my $s = get_content($file);
$s =~ s/var duo = //g;
$s =~ s/\n//g;
$s =~ s/\;//g;
my $data = decode_json($s);
my $count = 0;
foreach(keys(%{$data})){
  $count++;  
}
  
## リクエストパラメーターを読み込む
my $q = new CGI;
my $num = $q->param('num')|| 1;
if ($num > $count){
    $num = 1;
}
my $lang = $q->param('lang') || "en";

## ヘッダーと内容を読み込む
print $q->header(-type=>'text/html', -charset=>'utf-8');
print $num . ". " . $data->{$num}->{$lang};


####################################################
### 関数
####################################################
# ファイルの内容を取得する関数
sub get_content {
  my $file = shift;

  open my $fh, '<', $file
    or die "Can't open file \"$file\": $!";

  my $content = do { local $/; <$fh> };

  close $fh;

  return $content;
}

