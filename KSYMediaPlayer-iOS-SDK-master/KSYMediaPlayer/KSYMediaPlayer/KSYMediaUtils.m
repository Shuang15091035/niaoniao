/*
 * KSYMediaUtils.m
 *
 * Copyright (c) 2013 
 *
 * This file is part of ksyPlayer.
 *
 * ksyPlayer is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * ksyPlayer is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with ksyPlayer; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */

#import "KSYMediaUtils.h"

@implementation KSYMediaUtils

+ (NSString*)createTempFileNameForFFConcat
{
    return [KSYMediaUtils createTempFileNameWithPrefix:@"ffconcat-"];
}

+ (NSString*)createTempFileNameWithPrefix: (NSString*)aPrefix
{
    return [KSYMediaUtils createTempFileNameInDirectory: NSTemporaryDirectory()
                                             withPrefix: aPrefix];
}

+ (NSString*)createTempFileNameInDirectory: (NSString*)aDirectory
                                withPrefix: (NSString*)aPrefix
{
    NSString* templateStr = [NSString stringWithFormat:@"%@/%@XXXXX", aDirectory, aPrefix];
    char template[templateStr.length + 1];
    strcpy(template, [templateStr cStringUsingEncoding:NSASCIIStringEncoding]);
    char* filename = mktemp(template);

    if (filename == NULL) {
        NSLog(@"Could not create file in directory %@", aDirectory);
        return nil;
    }
    return [NSString stringWithCString:filename encoding:NSASCIIStringEncoding];
}

+ (NSError*)createErrorWithDomain: (NSString*)domain
                             code: (NSInteger)code
                      description: (NSString*)description
                           reason: (NSString*)reason
{
    /* Generate an error describing the failure. */
    if (description == nil)
        description = @"";
    if (reason == nil)
        reason = @"";

    NSString *localizedDescription = NSLocalizedString(description, description);
    NSString *localizedFailureReason = NSLocalizedString(reason, reason);
    NSDictionary *errorDict = [NSDictionary dictionaryWithObjectsAndKeys:
                               localizedDescription, NSLocalizedDescriptionKey,
                               localizedFailureReason, NSLocalizedFailureReasonErrorKey,
                               nil];
    NSError *error = [NSError errorWithDomain:domain
                                         code:0
                                     userInfo:errorDict];
    return error;
}

@end
