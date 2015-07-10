# NounExtractor

'noun_extractor' provides feature for japanese noun extraction from parse result of MeCab.

## Requirements

- ruby 1.9
- [MeCab](http://code.google.com/p/mecab/)
- [mecab gem](https://rubygems.org/gems/mecab)

## Install

### MeCab

Install MeCab and dictionary:

```
# at Mac
% brew install mecab
% brew install mecab-ipadic
```

Add this line to your application's Gemfile:

```
gem 'noun_extractor', :github => 'yukihir0/noun_extractor'
```

And then execute:

```
% bundle install
```

## How to use

```
extractor = NounExtractor.new
noun_list = extractor.analyze("こんにちは、世界。")

puts noun_list
```

For more information, please see [here](https://github.com/yukihir0/noun_extractor/blob/master/sample/main.rb).

## License

Copyright &copy; 2013 yukihir0
