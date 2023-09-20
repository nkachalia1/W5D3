require 'sqlite 3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
    include Singleton
    def initalize 
        super('question.rb')
        self.type_translation = true
        self.results_as_hash = true
    end
end

class Question 
    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM question")
        data.map { |hash| Question.new(hash) }
    end

    def self.find_by_id
        Question.new
    end
end
