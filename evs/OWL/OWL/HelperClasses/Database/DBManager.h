//
//  DBManager.h
//  OWL
//
//  Created by Rameshwar on 22/08/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DBManager : NSObject
{
    sqlite3 *_database;
}

// Create DB with Name
- (id)initWithDB:(NSString*)dbName;

// Create Editable Table for DB if needed
+ (BOOL)createEditableCopyOfDatabaseIfNeeded:(NSString*)dbName;

// Create Table Using Sqlite
-(BOOL)createTableWithName:(NSString*)tableName;

// Add iCloud Backup URl;
+ (BOOL)addSkipBackupAttributeToItemAtURL:(NSURL *)URL;

// Remove DB
-(void)removeFile:(NSString *)fileName;

// Insert or Update Table
-(void)insertAndUpdateArrayUsingTrasaction:(NSArray*)arr tableName:(NSString*)tableName;

// Get all saved data of particular table
- (NSArray*)getProductData:(NSString*)tableName  strUserId:(NSString*)strUserId;

-(NSMutableArray *)fetchTableNames;

@end
