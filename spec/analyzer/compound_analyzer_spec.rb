# coding: utf-8
require File.expand_path('spec/spec_helper')

describe CompoundAnalyzer do
    context 'initialized' do
        describe '#do_analyze' do
            context 'when node input' do
                it 'single noun_list' do
                    doc = '機械制御'
                    expected = ['機械制御']

                    mecab = MeCab::Tagger.new
                    analyzer = CompoundAnalyzer.new(mecab)

                    noun_list = analyzer.analyze(doc)
                    noun_list.should == expected
                end
            end
        end
    end
end
