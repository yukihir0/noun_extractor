# coding: utf-8
require File.expand_path('spec/spec_helper')
include NounExtractorAnalyzer

describe SingleAnalyzer do
    context 'initialized' do
        describe '#do_analyze' do
            context 'when node input' do
                it 'call node#feature, node#next' do
                    analyzer = SingleAnalyzer.new
                    
                    node = double('node')
                    node.should_receive(:feature).and_return('test_node')
                    node.should_receive(:next)

                    analyzer.send(:do_analyze, node)
                end
            end
        end
    end
end
