
# transactions.csv ####
csvPath <- "Data/Base/transactions.csv"
xdfPath <- "Data/Processed/Xdf/transactions.xdf"
tic()
rxImport(inData = csvPath,
         outFile = xdfPath,
         colClasses = c(payment_method_id = 'factor',
                        is_auto_renew = 'factor',
                        is_cancel = 'factor'),
         transforms = list(transaction_date = as.Date(as.character(transaction_date), format="%Y%m%d"),
                           membership_expire_date = as.Date(as.character(membership_expire_date), format="%Y%m%d")),
         overwrite = TRUE,
         rowsPerRead = 5000000,
         reportProgress = 3)
toc()
transactionsXdf <- RxXdfData(xdfPath)
rxGetInfo(transactionsXdf, getVarInfo = TRUE, numRows = 10)


# members data ####

csvPath <- "Data/Base/members_v3.csv"
xdfPath <- "Data/Processed/Xdf/members.xdf"
tic()
rxImport(inData = csvPath,
         outFile = xdfPath,
         colClasses = c(city = 'factor',
                        gender = 'factor',
                        registered_via = 'factor'),
         transforms = list(registration_init_time = as.Date(as.character(registration_init_time), format="%Y%m%d")),
         overwrite = TRUE, 
         reportProgress = 3)
toc()
membersXdf <- RxXdfData(xdfPath)
rxGetInfo(membersXdf, getVarInfo = TRUE, numRows = 10)
rxSummary(~city, membersXdf)
rxSummary(~registered_via, membersXdf)

rxFactors(inData = membersXdf, outFile = membersXdf,
          factorInfo = list(city = list(varName = "city",
                                        # levels = 1:21, 
                                        otherLevel = NULL,
                                        sortLevels = TRUE),
                            registered_via = list(varName = "registered_via",
                                                  # levels = 1:19, 
                                                  otherLevel = NULL,
                                                  sortLevels = TRUE)),
          # sortLevels = TRUE,
          overwrite = TRUE)

rxGetInfo(membersXdf, getVarInfo = TRUE, numRows = 10)


# user logs data ####

csvPath <- "Data/Base/user_logs.csv"
xdfPath <- "Data/Processed/Xdf/userLogs.xdf"
tic()
rxImport(inData = csvPath,
         outFile = xdfPath,
         # colClasses = c(city = 'factor',
         #                gender = 'factor',
         #                registered_via = 'factor'),
         transforms = list(date = as.Date(as.character(date), format="%Y%m%d")),
         overwrite = TRUE)
toc()
userLogsXdf <- RxXdfData(xdfPath)
rxGetInfo(userLogsXdf, getVarInfo = TRUE, numRows = 10)


# train data ####

csvPath <- "Data/Base/train_v2.csv"
xdfPath <- "Data/Processed/Xdf/train.xdf"
rxImport(inData = csvPath,
         outFile = xdfPath,
         colClasses = c(is_churn = 'factor'),
         overwrite = TRUE, 
         reportProgress = 3)

trainXdf <- RxXdfData(xdfPath)
rxGetInfo(trainXdf, getVarInfo = TRUE, numRows = 10)

