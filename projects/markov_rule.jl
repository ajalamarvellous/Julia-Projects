"""
Markov Hashtable: 
This function creates a hashtable to be used for predicting next word 
in markov rule

Parameter(s)
------------------
file    : address of the file to be used

Return(s)
---------------
hashtable[prefix: next word]

Example
------------
for file a.txt that contains
"Bolaji is a goat but what can I do with him, I don't know but I know 
is that he is a very stubborn animal in human body"

> m_h_t = markovhashtable("a.txt")

> m_h_t["Bolaji is"]

["a"]
> m_h_t["is a"]

["goat", "very"]
> m_h_t["a goat"]

["but"]
"""
function markovhashtable(file)
    bag_of_word = make_bow(file)
    hashtable_ = Dict()
    counter = 1
    for counter in 1:length(bag_of_word)-2
        prefix = bag_of_word[counter] *" "* bag_of_word[counter+1]
        suffix = bag_of_word[counter+2]
        if prefix in keys(hashtable_)
            if suffix in hashtable_[prefix]
                print("")
            else
                push!(hashtable_[prefix], suffix)
            end
        else
            hashtable_[prefix] = [suffix]
        end
    end
    hashtable_
end


"""
Make_bow:
This function combines all the words in the file into a long list
of words

Parameter
--------------
file:   file to read from

Return
------------
bag_of_word: List of all the words in the file in a sequential manner

Example
------------
for file a.txt that contains
"Bolaji is a goat 
but what can I
do with him"

> bow = make_bow("a.txt")

["Bolaji", "is", "a", "goat", "but", "what", "can", "I", "do", "with", "him"]
"""
function make_bow(file)
    bag_of_word = []
    for line in eachline(file)
        append!(bag_of_word, split(line, " "))
    end
    bag_of_word
end


function main()
    file = readline()
    m_h_t = markovhashtable(file)
    start_word = readline()
    while true
        if start_word in keys(m_h_t)
            suffix = random(m_h_t[start_word])
            print(" ", suffix)
            start_word = split(start_word, " ")[2]*" "*suffix
        else
            println("Word not found")
            break
        end
    end
end