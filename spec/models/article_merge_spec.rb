# coding: utf-8
 # I don't seem to be able to write this test right.

require 'spec_helper'

describe "ArticleWithMerge" do
 
    describe "test merge_with: A.merge_with(B.id): body and title" do
        
        a = Article.create(:title => "ATITLE", :body => "ABODY", :published => false)
        acopy = a.clone
        b = Article.create(:title => "BTITLE", :body => "BBODY", :published => false)
        a.save
        b.save
        a.merge_with(b.id)
        it "should contain body of A" do
            assert a.body.include? acopy.body
        end
        it "should contain body of B" do
            assert a.body.include? b.body
        end
        it "should contain title or A or B" do
            assert (a.title.include? acopy.title or a.title.include? b.title)
        end
        a.destroy
        b.destroy
    end
=begin

    describe "test merge_with: A.merge_with(B.id): comments" do

        
        a = Article.create(:title => "ATITLE", :body => "ABODY", :published => false)
        acopy = a.clone
        b = Article.create(:title => "BTITLE", :body => "BBODY", :published => false)
        
        ca = Comment.new({:author => 'AUTHORCA', :body => "BODYCA"})
        cb = Comment.new({:author => 'AUTHORCB', :body => "BODYCB"})
        
        a.comments << ca
        a.save
        b.comments << cb
        b.save
        
        caCopy = ca.clone
        cbCopy = cb.clone
        
        
        a.merge_with(b.id)
        it "should contain comments from A" do
            assert a.comments.any? {|c| c.body.include? caCopy.body}
        end
        it "should contain comments from B" do
            assert a.comments.any? {|c| c.body.include? cbCopy.body}
        end
        
    @blog = Factory(:blog,
                    :sp_global => false,
                    :default_moderate_comments => true)

        b.destroy
     @blog = nil;

        it "should contain valid comments after B is destroyed" do
            assert a.comments.all? {|c| Comment.find_by_id(c.id)}
        end
        
    end
=end
end
