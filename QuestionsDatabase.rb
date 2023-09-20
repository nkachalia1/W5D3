require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
    include Singleton
    def initalize 
        super('question.rb')
        self.type_translation = true
        self.results_as_hash = true
    end
end

class User
    attr_accessor :fname, :lname
    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM user")
        data.map { |hash| Question.new(hash) }
    end

    def self.find_by_id(id)
        question = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            users
        WHERE
            id = ?
        SQL
        return nil unless users.length > 0

        User.new(user.first)
    end

    def initialize(options)
        @fname = options['fname']
        @lname = options['lname']
    end
end


class Question 
    attr_accessor :id, :title, :body, :author_id
    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM question")
        data.map { |hash| Question.new(hash) }
    end

    def self.find_by_id(id)
        question = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            questions
        WHERE
            id = ?
        SQL
        return nil unless question.length > 0

        Question.new(question.first)
    end

    def self.find_by_author_id(author_id)
        
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @author_id = options['author_id']
    end


end

class QuestionFollows
    attr_accessor :id, :user_id, :question_id
    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM question_follows")
        data.map { |hash| QuestionFollows.new(hash) }
    end

    def self.find_by_id(id)
        questionfollows = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            question_follow
        WHERE
            id = ?
        SQL
        return nil unless question_follows.length > 0

        QuestionFollows.new(question_follows.first)
    end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
    end
end

class Replies
    attr_accessor :id, :parent_reply_id, :user_id, :question_id, :body
    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
        data.map { |hash| replies.new(hash) }
    end

    def self.find_by_id(id)
        reply = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            replies
        WHERE
            id = ?
        SQL
        return nil unless question_follows.length > 0

        QuestionFollows.new(question_follows.first)
    end

    def initialize(options)
        @id = options['id']
        @parent_reply_id = options['parent_reply_id']
        @user_id = options['user_id']
        @question_id = options['question_id']
        @body = options['body']
    end
end

class QuestionLikes
    attr_accessor :id, :user_id, :question_id
    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM question_likes")
        data.map { |hash| QuestionLikes.new(hash) }
    end

    def self.find_by_id(id)
        reply = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            question_likes
        WHERE
            id = ?
        SQL
        return nil unless question_likes.length > 0

        QuestionLikes.new(question_likes.first)
    end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
    end
end

