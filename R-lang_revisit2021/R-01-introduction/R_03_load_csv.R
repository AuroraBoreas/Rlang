# load data from .csv file
StudyArea <- read.csv("R-00-exercise/Data/StudyArea_SmallFile.csv")
# StudyArea
for(fire in 1:nrow(StudyArea))
{
    print(StudyArea[fire, "TOTALACRES"])
}

