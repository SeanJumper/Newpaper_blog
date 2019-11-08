class DataController < ApplicationController
#encoding: utf-8

  def index
  @words = []
  @cleanWords =[]
    # SELECT "action_text_rich_texts".* FROM "action_text_rich_texts" WHERE "action_text_rich_texts"."record_id" = ? AND "action_text_rich_texts"."record_type" = ? AND "action_text_rich_texts"."name" = ? LIMIT ?  [["record_id", 10], ["record_type", "Post"], ["name", "body"], ["LIMIT", 1]]
  sql = "SELECT body from action_text_rich_texts WHERE body IS NOT NULL "
  @result = ActiveRecord::Base.connection.execute(sql)
    
  @result.each do |x|
   #words = []
   @cleanWords =[]
    #get the values only from the hash
    values = x.values
  
    #convert it to string 
    strValue = values.to_s
    #to utf 8
    encodedValue = strValue.gsub(160.chr("UTF-8"),"") # this beautiful little function removes &nbsp; -> LIFE SAVER
    #puts encodedValue
    # remove html tags
    rmvHtml = encodedValue.gsub(/(<[^>]*>)|\n|\t/s) {""}  
    
    # remove additional chars
    rmvExtraChars = rmvHtml.tr('[]',"")
    # still some chars left, gotta get rid of them
    again = rmvExtraChars.delete('\\"')
    #split each by white space
    #word = again.split(' ')
    #word is an array covert back to string
    newWord =again.to_s
    @words.push(newWord)
    end
    #p @words
    @words.each do |ugh|
     dog = ugh.split(" ")
      dog.each do |mouse|
        @cleanWords.push(mouse)
        #p @cleanWords
      end
    end
    # there has to be a smarter was to do this!!!!! this is completely stupid and a bad comsumption of resources
    # annnnyway now we have one array with each post split by white space so we can actually start 
    # doing some mad $h!t
   # p @cleanWords # is the final array of all the posts, we can use this to create a words count hash
    # once this has is created we can start to generate graphics for an admin
    # user to understand the over all sentiment of the websites content
    # And thats the basic iteration of the data analysis concept of this application.

    @hCount = Hash.new
    @cleanWords.each {|w|
    if @hCount.has_key?(w)
      @hCount[w] = @hCount[w]+1
    else
      @hCount[w]=1
    end
    }
    #sort the hash and print the results
    @hCount.sort{|a,b| a[1]<=>b[1]}.each { |elem|
     "\"#{elem[0]}\" has #{elem[1]} occurrences"
     }
     # end of sort
    @hCount.delete('""')

    puts @hCount
  
    

  end # end of the index 

  
  
end
