# coding: utf-8
require File.expand_path('spec/spec_helper')

describe BaseAnalyzer do
    context 'initialized' do
        before(:each) do
            mecab = MeCab::Tagger.new
            @analyzer = BaseAnalyzer.new(mecab)
        end

        describe '#analyze' do
            context 'when nil input' do
                it '[]' do
                    noun_list = @analyzer.analyze(nil)
                    noun_list.should == []
                end
            end

            context 'when null string input' do
                it '[]' do
                    noun_list = @analyzer.analyze('')
                    noun_list.should == []
                end
            end

            context 'when doc input' do
                it 'raise error' do
                    doc = 'hoge fuga'
                    expect { noun_list = @analyzer.analyze(doc)
                    }.to raise_error(RuntimeError, BaseAnalyzer::ABSTRACT_METHOD_CALL_ERROR)
                end
            end
        end
    end
end
