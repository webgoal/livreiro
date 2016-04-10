FactoryGirl.define do
  factory :book do
    title "A Game of Thrones"
    author "George R. R. Martin"
    publisher "Whatever"
    owner "Gugu"
    email "gugu@webgoal.com.br"
    abstract "Long ago, in a time forgotten, a preternatural event threw the seasons out of balance."
    question "Qual o lanche preferido"
    answer "presunto"
    lending_name "teste"
    lending_email "teste@teste.com"
    lending_data "2000-01-01"
  end
end
