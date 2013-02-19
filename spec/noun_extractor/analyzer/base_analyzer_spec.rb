# coding: utf-8
require File.expand_path('spec/spec_helper')
include NounExtractorAnalyzer

describe BaseAnalyzer do
    context 'initialized' do
        before(:each) do
            @analyzer = BaseAnalyzer.new
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
                it 'call mecab#parseToNode' do
                    mecab = mock('mecab')
                    mecab.should_receive(:parseToNode)
                    @analyzer.instance_variable_set('@mecab', mecab)

                    doc = 'hoge fuga'
                    @analyzer.analyze(doc)
                end
            end
        end

        describe '#is_noun?' do
            context 'when not noun node input' do
                it 'false' do
                    node = mock('node')
                    node.should_receive(:feature).and_return('動詞,一般')
                    
                    @analyzer.send(:is_noun?, node).should be_false
                end
            end

            context 'when not general node input' do
                it 'false' do
                    node = mock('node')
                    node.should_receive(:feature).and_return('名詞,複合')
                    
                    @analyzer.send(:is_noun?, node).should be_false
                end
            end

            context 'when general noun node input' do
                it 'true' do
                    node = mock('node')
                    node.should_receive(:feature).and_return('名詞,一般')
                    
                    @analyzer.send(:is_noun?, node).should be_true
                end
            end
        end

        describe '#get_surface' do
            context 'when node input' do
                it 'surface' do
                    node = mock('node')
                    node.should_receive(:surface).and_return('surface_test')

                    @analyzer.send(:get_surface, node).should == 'surface_test'
                end
            end
        end
    end
end
