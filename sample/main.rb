# coding: utf-8
require 'noun_extractor'

def print_noun_list(mode, noun_list)
    header = "--- #{mode} ---"
    footer = '-'*header.length, ''

    puts header
    puts noun_list
    puts footer
end


input_text = 'MeCabは 京都大学情報学研究科−日本電信電話株式会社コミュニケーション科学基礎研究所 共同研究ユニットプロジェクトを通じて開発されたオープンソース 形態素解析エンジンです。'

# single noun mode
single_extractor = NounExtractor.new.to_single
single_noun_list = single_extractor.analyze(input_text)
print_noun_list('single noun', single_noun_list)

# compoun noun mode
compound_extractor = NounExtractor.new.to_compound
compound_noun_list = compound_extractor.analyze(input_text)
print_noun_list('coumpound noun', compound_noun_list)
