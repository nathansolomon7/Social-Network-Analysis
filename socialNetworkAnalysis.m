
%Nathan Solomon
%Partner: Luke Botsford
csvread('largeNetwork.dat')
MG = csvread('largeNetwork.dat'); 

% size function is used to find both the size of the row and the size of
% the column of the matrix MG. the variable "numofPeople" is assigned the
% value of the number of rows, while the variable "numofColumns" is
% assigned the value of the number of columns.
[numofPeople,numofColumns]=size(MG)

%The M matrix is made by taking all rows between the start to the size of
%the rows in MG, while taking all columns between the second column of MG
%(since matrix M does not include the first vector column) and ends at the
%number of columns in the MG matrix. The end result is the MG matrix
%without the first column.
M= MG(1:numofPeople, 2:numofColumns)
%The G matrix is made by finding the indexes of 1 to the number of rows in
%MG, thus getting the first column
G=MG(1:numofPeople)==1





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%takes the sum of all 0's in G array, which gives the count of all males
%since males are represented by 0
male= sum(G==0);
%takes the sum of all 1's in G array, which gives the count of all females
%since females are represented by 1
female= sum(G==1);
fprintf("There are %d females and %d males in this group",female, male)
fprintf('\n')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%sums the columns of matrix M, which represents the connections of all people in the social network
%it then finds the maximum, minimum, and mean amount of connections from the sum of
%columns using command functions
sumofcolumns=sum(M); %sums the columns of matrix M, which represents the connections of all people in the social network
max(sumofcolumns);
min(sumofcolumns);
mean(sumofcolumns);

%found the maximum, minimum, and mean amount of connections from the sum of
%columns
mostconnectedperson = max(sumofcolumns);
leastconnectedperson = min(sumofcolumns);
averageconnections = mean(sumofcolumns);
fprintf("The most connected person has %d connections",mostconnectedperson)
fprintf('\n')
fprintf("The least connected person has %d connections",leastconnectedperson)
fprintf('\n')
fprintf("On average, a person has %1.2f connections",averageconnections)
fprintf('\n')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% sorts the sum of columns from the previous problem from least to greatest
% and displays it on the graph

sortedsumofcolumns= sort(sumofcolumns);
y = sortedsumofcolumns;
bar(y)

xlabel('number of people')
ylabel('number of connections')
grid on


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%finds where the number of connections per person is greater than the max
%amount of connections and the lowest amount of connections by a range of 2

highamount =find(sumofcolumns > (max(sumofcolumns)-2));
lowamount = find(sumofcolumns <= (min(sumofcolumns)+2));



fprintf("The following individuals have a high number of connections-- %d,%d,%d,%d,%d",highamount)
fprintf('\n')
fprintf("and")
fprintf('\n')
fprintf("The following individuals have a low number of connections-- %d,%d,%d,%d,%d,%d,%d",lowamount)
fprintf('\n')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% used a for loop with a conditional statement. If the value in the first
% index of the G vector, showing the gender of the people is equal to 1, then the next
% line will multiply an empty 1x1 matrix with the sum of the corresponding
% row in Matrix M. The new variable,
% connectionsforwomen, creates a new vector showing the
% connections for women.The result after the loop is complete is a vector with an array having all amounts of connections for the women in the M matrix The same is repeated after line 113, except for
% men. 
connectionsforwomen = [];
for i=1:numofPeople
if (G(i)==1)
    connectionsforwomen = [connectionsforwomen sum(M(i,:))];
end
end

connectionsformen = [];
for i=1:numofPeople
if (G(i)==0)
    connectionsformen = [connectionsformen sum(M(i,:))];
end
end
%found the maximum, minimum, and mean for the connections for women using
%the built in commands. 
maxconnectionsforwomen=max(connectionsforwomen);
minconnectionsforwomen=min(connectionsforwomen);
meanconnectionsforwomen=mean(connectionsforwomen);

%found the maximum, minimum, and mean for the connections for men using
%the built in commands. 
maxconnectionsformen= max(connectionsformen);
minconnectionsformen= min(connectionsformen);
meanconnectionsformen= mean(connectionsformen);

fprintf("The  number  of  connections  for  females  ranges  between ")
fprintf('%d',minconnectionsforwomen)
fprintf(" and ")
fprintf('%d',maxconnectionsforwomen)
fprintf(" with  an  average  of ")  
fprintf('%d',meanconnectionsforwomen)
fprintf('\n')


fprintf(" The  number  of  connections  for  males  ranges  between  %d  and %d,  with  an  average  of  %d, ",[minconnectionsformen,maxconnectionsformen,meanconnectionsformen])
fprintf('\n')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%the nested for loop finds the connections of the first person by finding
%the location where there is a value for their respective row (their
%connections). The inner loop finds the connections of the first person's
%connections by finding where there are values in their row, thus showing
%their connections. The first person and second person's connections are
%seperate arrays that are then concatanated into one array, where the values are
%sorted and show only non repeating values. 
fileID = fopen('largeNetworkNeighbors2.dat','w');
sizeofnetwork = numofPeople;
for i= 1:sizeofnetwork
    firstperson = M(i,:);
    firstconnection = find(firstperson);
    totalconnections=firstconnection;
    for x=firstconnection
        secondperson= M(x,:);
        secondconnection = find(secondperson);
        totalconnections = [totalconnections secondconnection];
        totalconnections = sort(totalconnections);
        totalconnections = unique(totalconnections);
        
    end
    fprintf('%d,',totalconnections)
    fprintf('\n')
    fprintf(fileID,'%d,',totalconnections);
    fprintf(fileID,'\n');
    
   
end
fclose(fileID);



























    































    


