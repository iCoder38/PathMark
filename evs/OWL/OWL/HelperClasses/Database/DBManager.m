//
//  DBManager.m
//  OWL
//
//  Created by Rameshwar on 22/08/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "DBManager.h"
#import "StoreData.h"


@implementation DBManager



#pragma mark - InitWithDB:-
- (id)initWithDB:(NSString*)dbName{
    if(self = [super init])
    {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:dbName];

        NSLog(@"writableDBPath =%@",writableDBPath);

        if (sqlite3_open([writableDBPath UTF8String], &_database) != SQLITE_OK) {
            NSLog(@"could not prepare statement: %s\n", sqlite3_errmsg(_database));
            NSLog(@"Failed to open database!");
        }
    }
    return self;
}

#pragma mark - Create a copy of DB.
+ (BOOL)createEditableCopyOfDatabaseIfNeeded:(NSString*)dbName{
    // First, test for existence.
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:dbName];
    success = [fileManager fileExistsAtPath:writableDBPath];
    if (success) {
        NSLog(@"File Exist->%@",writableDBPath);
        return success;
    }
    // The writable database does not exist, so copy the default to the appropriate location.
    NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:dbName];
    success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
    if (!success) {
        NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
    }
    else{
        NSURL* fileURL = [NSURL fileURLWithPath:writableDBPath];
        [DBManager addSkipBackupAttributeToItemAtURL:fileURL];
    }
    return success;
}


#pragma mark - Add Skip Backup on Cloud
+ (BOOL)addSkipBackupAttributeToItemAtURL:(NSURL *)URL {
    if([[NSFileManager defaultManager] fileExistsAtPath: [URL path]]){
        assert([[NSFileManager defaultManager] fileExistsAtPath: [URL path]]);

        NSError *error = nil;
        BOOL success = [URL setResourceValue: [NSNumber numberWithBool: YES]
                                      forKey: NSURLIsExcludedFromBackupKey error: &error];
        if(!success){
            NSLog(@"Error excluding %@ from backup %@", [URL lastPathComponent], error);
        }
        return success;
    }
    else{
        NSLog(@"File Not Exist for excluding from backup->%@",URL);
        return NO;
    }
}
#pragma mark - Remove DB
-(void)removeFile:(NSString *)fileName{

    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];

    NSString *filePath = [documentsPath stringByAppendingPathComponent:fileName];


    if([fileManager fileExistsAtPath:filePath]){
        NSError *error;
        BOOL success = [fileManager removeItemAtPath:filePath error:&error];
        if (success) {
            NSLog(@"Remove File : %@",filePath);
        }
        else
        {
            NSLog(@"Could not delete file -:%@ ",[error localizedDescription]);
        }
    }
    else
        NSLog(@"File not Exist");
}


#pragma mark - Create Table

#pragma mark - Create A table With Name..
-(BOOL)createTableWithName:(NSString*)tableName{

    int rc=0;

    NSString *strQuesryData = [NSString stringWithFormat:@"(firstname    VARCHAR, lastname   VARCHAR, userId VARCHAR PRIMARY KEY,  gender VARCHAR, dob VARCHAR, dateofdisappearance VARCHAR, placeofdisappearance VARCHAR, fathername VARCHAR,mothername VARCHAR, selectcountry VARCHAR, selectcity VARCHAR, selectstate VARCHAR, pincode VARCHAR, parentsMobileNumber VARCHAR, identificationMark VARCHAR, height VARCHAR, weight VARCHAR, eyeColor VARCHAR, hairColor VARCHAR, isThisChild VARCHAR, complainedDate VARCHAR, complainedBy VARCHAR, prizeReward VARCHAR, rewardInformation VARCHAR)"];

    NSString* queryString=[NSString stringWithFormat:
        @"CREATE TABLE IF NOT EXISTS %@%@",tableName,strQuesryData];


    char * query =(char*)[queryString UTF8String];
    char * errMsg;
    rc = sqlite3_exec(_database, query,NULL,NULL,&errMsg);

    if(SQLITE_OK != rc)
    {
        NSLog(@"Failed to create table rc:%d, msg=%s",rc,errMsg);
        return NO;
    }
    else    NSLog(@"Successfully created '%@' Table",tableName);

    return YES;
    // sqlite3_close(db);
}


#pragma mark - Insert Record into DB Table.
-(void)insertAndUpdateArrayUsingTrasaction:(NSArray*)arr tableName:(NSString*)tableName{

    int insert=0,delete=0;
    NSLog(@"StoreData data saving------->%lu",(unsigned long)arr.count);

    if(arr.count){

        NSString *strQueryInsertAndUpdate = [NSString stringWithFormat:@"INSERT OR REPLACE INTO %@(firstname,lastname,userId,gender, dob,dateofdisappearance,placeofdisappearance,fathername,mothername, selectcountry,selectcity,selectstate,pincode,parentsMobileNumber,identificationMark,height,weight,eyeColor,hairColor,isThisChild,complainedDate,complainedBy,prizeReward,rewardInformation)VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", tableName];

        const char *queryInsertAndUpdate =(char*)[strQueryInsertAndUpdate UTF8String];

        NSString *strDltQuery = [NSString stringWithFormat:@"delete from exhibitors where %@=?", tableName];

        const char *queryDelete = (char*)[strDltQuery UTF8String];

        sqlite3_stmt *compiledStatement1 = nil;
        sqlite3_stmt *compiledStatement2 = nil;



        sqlite3_exec(_database, "BEGIN EXCLUSIVE TRANSACTION", 0, 0, 0);

        NSLog(@"sqlState =%d",sqlite3_prepare(_database, queryInsertAndUpdate, -1, &compiledStatement1, NULL));


        BOOL insertPrepare=(sqlite3_prepare(_database, queryInsertAndUpdate, -1, &compiledStatement1, NULL) == SQLITE_OK) ? YES : NO;
        BOOL deletePrepare=(sqlite3_prepare(_database, queryDelete, -1, &compiledStatement2, NULL) == SQLITE_OK )? YES : NO;
        //        NSLog(@"Insert Prepare->%hhd",insertPrepare);
        //        NSLog(@"Delete Prepare->%hhd",deletePrepare);

        if(insertPrepare || deletePrepare)
            for (int i = 0; i < arr.count; i++)
            {
                StoreData * dialogHistory = [arr objectAtIndex:i];

                // Insert or Replace

                if(dialogHistory!=nil && insertPrepare){

                    sqlite3_bind_text(compiledStatement1, 1, [dialogHistory.firstname UTF8String], -1, SQLITE_STATIC);

                    sqlite3_bind_text(compiledStatement1, 2, [dialogHistory.lastname UTF8String], -1, SQLITE_STATIC);

                    sqlite3_bind_text(compiledStatement1, 3, [dialogHistory.userId UTF8String], -1, SQLITE_STATIC);

                    sqlite3_bind_text(compiledStatement1, 4, [dialogHistory.gender UTF8String], -1, SQLITE_STATIC);

                    sqlite3_bind_text(compiledStatement1, 5, [dialogHistory.dob UTF8String], -1, SQLITE_STATIC);

                    sqlite3_bind_text(compiledStatement1, 6, [dialogHistory.dateofdisappearance UTF8String], -1, SQLITE_STATIC);

                    sqlite3_bind_text(compiledStatement1, 7, [dialogHistory.placeofdisappearance UTF8String], -1, SQLITE_STATIC);

                    sqlite3_bind_text(compiledStatement1, 8, [dialogHistory.fathername UTF8String], -1, SQLITE_STATIC);

                    sqlite3_bind_text(compiledStatement1, 9, [dialogHistory.mothername UTF8String], -1, SQLITE_STATIC);

                    sqlite3_bind_text(compiledStatement1, 10, [dialogHistory.selectcountry UTF8String], -1, SQLITE_STATIC);

                    sqlite3_bind_text(compiledStatement1, 11, [dialogHistory.selectcity UTF8String], -1, SQLITE_STATIC);

                    sqlite3_bind_text(compiledStatement1, 12, [dialogHistory.selectstate UTF8String], -1, SQLITE_STATIC);

                    sqlite3_bind_text(compiledStatement1, 13, [dialogHistory.pincode UTF8String], -1, SQLITE_STATIC);

                    sqlite3_bind_text(compiledStatement1, 14, [dialogHistory.parentsMobileNumber UTF8String], -1, SQLITE_STATIC);

                    sqlite3_bind_text(compiledStatement1, 15, [dialogHistory.height UTF8String], -1, SQLITE_STATIC);

                    sqlite3_bind_text(compiledStatement1, 16, [dialogHistory.weight UTF8String], -1, SQLITE_STATIC);

                    sqlite3_bind_text(compiledStatement1, 17, [dialogHistory.eyeColor UTF8String], -1, SQLITE_STATIC);

                    sqlite3_bind_text(compiledStatement1, 18, [dialogHistory.hairColor UTF8String], -1, SQLITE_STATIC);

                    sqlite3_bind_text(compiledStatement1, 19, [dialogHistory.isThisChild UTF8String], -1, SQLITE_STATIC);

                    sqlite3_bind_text(compiledStatement1, 20, [dialogHistory.complainedDate UTF8String], -1, SQLITE_STATIC);

                    sqlite3_bind_text(compiledStatement1, 21, [dialogHistory.prizeReward UTF8String], -1, SQLITE_STATIC);

                    sqlite3_bind_text(compiledStatement1, 22, [dialogHistory.rewardInformation UTF8String], -1, SQLITE_STATIC);

                    if (sqlite3_step(compiledStatement1) != SQLITE_DONE)
                        NSLog(@"Values not inserted. Error: %s",sqlite3_errmsg(_database));

                    if (sqlite3_reset(compiledStatement1) != SQLITE_OK)
                        NSLog(@"SQL Error: %s",sqlite3_errmsg(_database));

                    insert+=1;
                }

            }

        //Close transaction for insert & update
        if (sqlite3_finalize(compiledStatement1) != SQLITE_OK)
            NSLog(@"SQL Error: %s",sqlite3_errmsg(_database));

        //Close transaction for delete
        if (sqlite3_finalize(compiledStatement2) != SQLITE_OK)
            NSLog(@"SQL Error: %s",sqlite3_errmsg(_database));

        if (sqlite3_exec(_database, "COMMIT TRANSACTION", 0, 0, 0) != SQLITE_OK)
            NSLog(@"SQL Error: %s",sqlite3_errmsg(_database));
    }

    NSLog(@"Record Add or Update->%d",insert);
    NSLog(@"Record Delete->%d",delete);
}




#pragma mark - Get all Records from DB
- (NSArray*)getProductData:(NSString*)tableName strUserId:(NSString*)strUserId{

    NSMutableArray *retval = [[NSMutableArray alloc] init];

    NSString *query = [NSString stringWithFormat:@"SELECT * from %@ where userId=%@",tableName, strUserId];

    const char* queryUTF8 = [query UTF8String];
    sqlite3_stmt *statement;

    @autoreleasepool {
        int response = sqlite3_prepare_v2(_database, queryUTF8, -1, &statement, nil);

        if (response == SQLITE_OK) {

            while (sqlite3_step(statement) == SQLITE_ROW) {

                StoreData* SSUSA=[[StoreData alloc]init];



                if ( sqlite3_column_type(statement, 0) != SQLITE_NULL ){


                    SSUSA.firstname = [[NSString alloc] initWithUTF8String:
                                             (const char *) sqlite3_column_text(statement, 0)];
                }
                else
                    SSUSA.firstname = @"NULL";

                if ( sqlite3_column_type(statement, 1) != SQLITE_NULL ){

                    SSUSA.lastname = [[NSString alloc] initWithUTF8String:
                                           (const char *) sqlite3_column_text(statement, 1)];
                }
                else
                    SSUSA.lastname = @"NULL";

                if ( sqlite3_column_type(statement, 2) != SQLITE_NULL ){

                    SSUSA.userId = [[NSString alloc] initWithUTF8String:
                                              (const char *) sqlite3_column_text(statement, 2)];
                }
                else
                    SSUSA.userId = @"NULL";

                if ( sqlite3_column_type(statement, 3) != SQLITE_NULL ){

                    SSUSA.gender = [[NSString alloc] initWithUTF8String:
                                               (const char *) sqlite3_column_text(statement, 3)];

                }
                else
                    SSUSA.gender = @"NULL";


                if ( sqlite3_column_type(statement, 4) != SQLITE_NULL ){

                    SSUSA.dob = [[NSString alloc] initWithUTF8String:
                                    (const char *) sqlite3_column_text(statement, 4)];

                }
                else
                    SSUSA.dob = @"NULL";

                if ( sqlite3_column_type(statement, 5) != SQLITE_NULL ){

                    SSUSA.dateofdisappearance = [[NSString alloc] initWithUTF8String:
                                 (const char *) sqlite3_column_text(statement, 5)];

                }
                else
                    SSUSA.dateofdisappearance = @"NULL";

                if ( sqlite3_column_type(statement, 6) != SQLITE_NULL ){

                    SSUSA.placeofdisappearance = [[NSString alloc] initWithUTF8String:
                                 (const char *) sqlite3_column_text(statement, 6)];

                }
                else
                    SSUSA.placeofdisappearance = @"NULL";

                if ( sqlite3_column_type(statement, 7) != SQLITE_NULL ){

                    SSUSA.fathername = [[NSString alloc] initWithUTF8String:
                                 (const char *) sqlite3_column_text(statement, 7)];

                }
                else
                    SSUSA.fathername = @"NULL";

                if ( sqlite3_column_type(statement, 8) != SQLITE_NULL ){

                    SSUSA.mothername = [[NSString alloc] initWithUTF8String:
                                 (const char *) sqlite3_column_text(statement, 8)];

                }
                else
                    SSUSA.mothername = @"NULL";

                if ( sqlite3_column_type(statement, 9) != SQLITE_NULL ){

                    SSUSA.selectcountry = [[NSString alloc] initWithUTF8String:
                                 (const char *) sqlite3_column_text(statement, 9)];

                }
                else
                    SSUSA.selectcountry = @"NULL";

                if ( sqlite3_column_type(statement, 10) != SQLITE_NULL ){

                    SSUSA.selectcity = [[NSString alloc] initWithUTF8String:
                                 (const char *) sqlite3_column_text(statement, 10)];

                }
                else
                    SSUSA.selectcity = @"NULL";

                if ( sqlite3_column_type(statement, 11) != SQLITE_NULL ){

                    SSUSA.selectstate = [[NSString alloc] initWithUTF8String:
                                 (const char *) sqlite3_column_text(statement, 11)];

                }
                else
                    SSUSA.selectstate = @"NULL";



                if ( sqlite3_column_type(statement, 12) != SQLITE_NULL ){


                    SSUSA.pincode = [[NSString alloc] initWithUTF8String:
                                                (const char *) sqlite3_column_text(statement, 12)];
                }
                else
                    SSUSA.pincode = @"NULL";

                if ( sqlite3_column_type(statement, 13) != SQLITE_NULL ){

                    SSUSA.parentsMobileNumber = [[NSString alloc] initWithUTF8String:
                                    (const char *) sqlite3_column_text(statement, 13)];
                }
                else
                    SSUSA.parentsMobileNumber = @"NULL";

                if ( sqlite3_column_type(statement, 14) != SQLITE_NULL ){


                    SSUSA.identificationMark = [[NSString alloc] initWithUTF8String:
                                       (const char *) sqlite3_column_text(statement, 14)];
                }
                else
                    SSUSA.identificationMark = @"NULL";

                if ( sqlite3_column_type(statement, 15) != SQLITE_NULL ){

                    SSUSA.height = [[NSString alloc] initWithUTF8String:
                                      (const char *) sqlite3_column_text(statement, 15)];
                }
                else
                    SSUSA.height = @"NULL";

                if ( sqlite3_column_type(statement, 16) != SQLITE_NULL ){

                    SSUSA.weight = [[NSString alloc] initWithUTF8String:
                                    (const char *) sqlite3_column_text(statement, 16)];
                }
                else
                    SSUSA.weight = @"NULL";

                if ( sqlite3_column_type(statement, 17) != SQLITE_NULL ){

                    SSUSA.eyeColor = [[NSString alloc] initWithUTF8String:
                                    (const char *) sqlite3_column_text(statement, 17)];

                }
                else
                    SSUSA.eyeColor = @"NULL";


                if ( sqlite3_column_type(statement, 18) != SQLITE_NULL ){

                    SSUSA.hairColor = [[NSString alloc] initWithUTF8String:
                                 (const char *) sqlite3_column_text(statement, 18)];

                }
                else
                    SSUSA.hairColor = @"NULL";

                if ( sqlite3_column_type(statement, 19) != SQLITE_NULL ){

                    SSUSA.isThisChild = [[NSString alloc] initWithUTF8String:
                                                 (const char *) sqlite3_column_text(statement, 19)];

                }
                else
                    SSUSA.isThisChild = @"NULL";

                if ( sqlite3_column_type(statement, 20) != SQLITE_NULL ){

                    SSUSA.complainedDate = [[NSString alloc] initWithUTF8String:
                                                  (const char *) sqlite3_column_text(statement, 20)];

                }
                else
                    SSUSA.complainedDate = @"NULL";

                if ( sqlite3_column_type(statement, 21) != SQLITE_NULL ){

                    SSUSA.complainedBy = [[NSString alloc] initWithUTF8String:
                                        (const char *) sqlite3_column_text(statement, 21)];

                }
                else
                    SSUSA.complainedBy = @"NULL";

                if ( sqlite3_column_type(statement, 22) != SQLITE_NULL ){

                    SSUSA.prizeReward = [[NSString alloc] initWithUTF8String:
                                        (const char *) sqlite3_column_text(statement, 22)];

                }
                else
                    SSUSA.prizeReward = @"NULL";

                if ( sqlite3_column_type(statement, 23) != SQLITE_NULL ){

                    SSUSA.rewardInformation = [[NSString alloc] initWithUTF8String:
                                           (const char *) sqlite3_column_text(statement, 23)];

                }
                else
                    SSUSA.rewardInformation = @"NULL";

                [retval addObject:SSUSA];
            }
            sqlite3_finalize(statement);
        }
    }
    return retval;
}

-(NSMutableArray *)fetchTableNames
{
    sqlite3_stmt* statement;
    NSString *query = @"SELECT name FROM sqlite_master WHERE type=\'table\'";
    int retVal = sqlite3_prepare_v2(_database,
                                    [query UTF8String],
                                    -1,
                                    &statement,
                                    NULL);
    
    NSMutableArray *selectedRecords = [NSMutableArray array];
    if ( retVal == SQLITE_OK )
    {
        while(sqlite3_step(statement) == SQLITE_ROW )
        {
            NSString *value = [NSString stringWithCString:(const char *)sqlite3_column_text(statement, 0)
                                                 encoding:NSUTF8StringEncoding];
            [selectedRecords addObject:value];
        }
    }
    
    sqlite3_clear_bindings(statement);
    sqlite3_finalize(statement);
    
    return selectedRecords;
}

@end
