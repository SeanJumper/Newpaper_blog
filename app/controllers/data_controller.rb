class DataController < ApplicationController
  @words = []
  def index
    # SELECT "action_text_rich_texts".* FROM "action_text_rich_texts" WHERE "action_text_rich_texts"."record_id" = ? AND "action_text_rich_texts"."record_type" = ? AND "action_text_rich_texts"."name" = ? LIMIT ?  [["record_id", 10], ["record_type", "Post"], ["name", "body"], ["LIMIT", 1]]
  sql = "SELECT body from action_text_rich_texts WHERE body IS NOT NULL "
  @result = ActiveRecord::Base.connection.execute(sql)

  @result.each do |x|
    #convert it to string 
    values = x.values
    strValue = values.to_s
    rmvHtml =strValue.gsub(/(<[^>]*>)|\n|\t/s) {""}
    rmvExtraChars = rmvHtml.tr('[]',"")
    again = rmvExtraChars.delete('\\"')
    word = again.split(' ')
    p word
    
  
    
  end
  

end
end
