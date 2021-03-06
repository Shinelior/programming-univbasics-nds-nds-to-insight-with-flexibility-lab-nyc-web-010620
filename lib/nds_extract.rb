# Provided, don't edit
require 'directors_database'
require "pp" 
# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].
puts pp directors_database
def flatten_a_o_a(aoa)
  flatten_a_o_a=[]
  row_index=0 
  while row_index<aoa.length do
  column_index=0  
  while column_index<aoa[row_index].length  do
  flatten_a_o_a<< aoa[row_index][column_index]
  column_index+=1 
end
row_index+=1 
end
return flatten_a_o_a
end

 
     def movie_with_director_name(director_name, movie_data)
      { 
        :title => movie_data[:title],
        :worldwide_gross => movie_data[:worldwide_gross],
        :release_year => movie_data[:release_year],
        :studio => movie_data[:studio],
        :director_name => director_name
      } 
    end  
    
     def movies_with_director_key(name, movies_collection)
       new_name=[]
       new_hash={} 
       new_array=[]
     row_index=0 
     while row_index< movies_collection.length  do
     #column_index=0
     #while column_index<movies_collection[row_index][:movies].length  do
     new_name=flatten_a_o_a(aoa)
     #puts new_name
     new_hash=movie_with_director_name(new_name[row_index],movies_collection[row_index][:movies])
      new_array << new_hash
     #column_index+=1
   #end
  
   row_index+=1
 end
 return  new_array
 end 
 
     
     
     

  #result=flatten_a_o_a(movies_collection)
  # GOAL: For each Hash in an Array (movies_collection), provide a collection
  # of movies and a directors name to the movie_with_director_name method
  # and accumulate the returned Array of movies into a new Array that's
  # returned by this method.
  #
  # INPUT:
  # * name: A director's name
  # * movies_collection: An Array of Hashes where each Hash represents a movie
  #
  # RETURN:
  #
  # Array of Hashes where each Hash represents a movie; however, they should all have a
  # :director_name key. This addition can be done by using the provided
  # movie_with_director_name method



def gross_per_studio(collection)
  new_hash={}
  #collection=directors_database
  total=0
  row_index=0
  while row_index< collection.length do
  column_index=0 
  while column_index<collection[row_index][:movies].length do
   # studio_name=collection[row_index][:movies][column_index][:studio]
    #tempelt=studio_name
   
    studio_name=collection[row_index][:movies][column_index][:studio]
   #studio_namet=collection[row_index][:movies][column_index+1][:studio]
   #same=studio_name<=>studio_namet
   #puts studio_namet
      if studio_name.downcase==studio_namet.downcase
         #column_index-=1
         #if same=0 
        # new_hash[studio_name]=[]
      total+=collection[row_index][:movies][column_index][:worldwide_gross]
      column_index+=1
      
  else
  column_index+=1 
  end
end

#studio_name=collection[row_index][:movies][column_index][:studio]
new_hash[studio_name]=total
 #new_hash=collection[row_index][:movies][column_index][:studio][total]
  row_index+=1
  total=0 
end
return  new_hash
  
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  #
  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash
end

def movies_with_directors_set(source)
  secound_new_array=[]
  new_hash={}
   new_array=[]
  row_index=0
  while row_index< source.length do
  column_index=0 
  while column_index<source[row_index][:movies].length do
   director_name=source[row_index][:name]
   #director_nameone=source[row_index+1][:name]
    if  !new_hash[director_name]
      
     movie_title=source[row_index][:movies][column_index][:title]
  
      
      new_hash[:title]= movie_title
      column_index+=1 
else
  #x =movie_with_director_name(name, movies_collection)
   #new_array << movies_collection[row_index][:movies][row_index]
    #new_array<< new_hash
    
     column_index+=1 
    end
   end
   director_name=source[row_index][:name]
   new_hash[:name]=director_name
   new_array << new_hash 
   row_index+=1 
 end
secound_new_array<< new_array
 return secound_new_array
  
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
