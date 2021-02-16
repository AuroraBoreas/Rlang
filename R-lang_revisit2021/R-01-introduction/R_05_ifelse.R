# load data from .csv file
StudyArea <- read.csv("R-00-exercise/Data/StudyArea_SmallFile.csv")
# StudyArea
for(fire in 1:nrow(StudyArea))
{
    fire_total_acres <- StudyArea[fire, "TOTALACRES"]
    if(fire_total_acres> 100000)
    {
        print(paste("100K Fire: ", StudyArea[fire, "FIRENAME"], sep=""))
    }
    else if(fire_total_acres > 75000)
    {
        print(paste("75K Fire: ", StudyArea[fire, "FIRENAME"], sep=""))
    }
    else if(fire_total_acres > 50000)
    {
        print(paste("50K Fire: ", StudyArea[fire, "FIRENAME"], sep=""))
    }
    else
    {
        print("Not a MEGAFIRE")
    }
}

