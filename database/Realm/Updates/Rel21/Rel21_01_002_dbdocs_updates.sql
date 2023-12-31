-- --------------------------------------------------------------------------------
-- This is an attempt to create a full transactional update
-- --------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos` ()

BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

    -- Current Values (TODO - must be a better way to do this)
    SET @cCurVersion := (SELECT `version` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
    SET @cCurStructure := (SELECT structure FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
    SET @cCurContent := (SELECT content FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);

    -- Expected Values
    SET @cOldVersion = '21'; 
    SET @cOldStructure = '1'; 
    SET @cOldContent = '1'; 

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '1';
    SET @cNewContent = '2';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'dbdocs update'; 

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Filled in some fields and added missing subtables back, as they had dropped out somehow.';

    -- Evaluate all settings
    SET @cCurResult := (SELECT description FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
    SET @cOldResult := (SELECT description FROM db_version WHERE `version`=@cOldVersion AND `structure`=@cOldStructure AND `content`=@cOldContent);
    SET @cNewResult := (SELECT description FROM db_version WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

    IF (@cCurResult = @cOldResult) THEN    -- Does the current version match the expected version
        -- APPLY UPDATE
        START TRANSACTION;

        -- UPDATE THE DB VERSION
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        INSERT INTO `db_version` VALUES (@cNewVersion, @cNewStructure, @cNewContent, @cNewDescription, @cNewComment);
        SET @cNewResult := (SELECT description FROM db_version WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        -- -- PLACE UPDATE SQL BELOW -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

update `dbdocsfields` set `fieldNotes` = 'Notes: LanguageId for this Language<br />¬subtable:3¬' where `fieldId`= '67' and `languageId`= 0;
update `dbdocsfields` set `fieldNotes` = 'This represents a version change.' where fieldName = 'version' and languageId = 0;
update `dbdocsfields` set `fieldNotes` = 'This represents a structure change.' where fieldName = 'structure' and languageId = 0;
update `dbdocsfields` set `fieldNotes` = 'This represents a change in the content.' where fieldName = 'content' and languageId = 0;
update `dbdocsfields` set `fieldNotes` = 'Brief description of the update.' where fieldName = 'description' and languageId = 0;
update `dbdocsfields` set `fieldNotes` = 'One or two sentences decribing the purpose of the update.' where fieldName = 'comment' and languageId = 0;
update `dbdocsfields` set `FieldComment` = 'Show the current population.', `fieldNotes` = 'This field shows the current population and is automatically updated at regular intervals and will . The formula to calculate the value in this field is:<br /><br /><pre>playerCount / maxPlayerCount * 2</pre><br />¬subtable:8¬<br /><br />' where `fieldId`= '49' and `languageId`= 0;
update `dbdocsfields` set `FieldComment` = 'The accepted client builds that the realm will accept.', `fieldNotes` = 'The accepted client builds that the realm will accept. (You can see this version at the clients left lower corner when starting.)<br /><br />The format is version No. {space} version No. (i.e. space separated) <pre>xxxx xxxx xxxx</pre><br /><br />Acceptable values are:<br />¬subtable:9¬<br />' where `fieldId`= '51' and `languageId`= 0;
update `dbdocsfields` set `FieldComment` = 'Supported masks for the realm, based on the table below.', `fieldNotes` = 'Supported masks for the realm, based on the table below.<br />¬subtable:6¬<br /><br />' where `fieldId`= '52' and `languageId`= 0;
update `dbdocsfields` set `FieldComment` = 'The realm timezone.', `fieldNotes` = 'The realm timezone, it will be displayed in the tabs of the realmlist.<br />¬subtable:7¬<br /><br />' where `fieldId`= '53' and `languageId`= 0;
update `dbdocsfields` set `FieldComment` = 'The icon of the realm.', `fieldNotes` = 'The icon of the realm.<br />¬subtable:5¬<br /><br />' where `fieldId`= '46' and `languageId`= 0;
        
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        -- -- PLACE UPDATE SQL ABOVE -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

        -- If we get here ok, commit the changes
        IF bRollback = TRUE THEN
            ROLLBACK;
            SHOW ERRORS;
            SELECT '* UPDATE FAILED *' AS `===== Status =====`,@cCurResult AS `===== DB is on Version: =====`;



        ELSE
            COMMIT;
            SELECT '* UPDATE COMPLETE *' AS `===== Status =====`,@cNewResult AS `===== DB is now on Version =====`;
        END IF;
    ELSE    -- Current version is not the expected version
        IF (@cCurResult = @cNewResult) THEN    -- Does the current version match the new version
            SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cCurResult AS `===== DB is already on Version =====`;
        ELSE    -- Current version is not one related to this update
	    IF(@cCurResult IS NULL) THEN    -- Something has gone wrong
                SELECT '* UPDATE FAILED *' AS `===== Status =====`,'Unable to locate DB Version Information' AS `============= Error Message =============`;
	    ELSE
                SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cOldResult AS `=== Expected ===`,@cCurResult AS `===== Found Version =====`;
            END IF;
        END IF;
    END IF;
END $$

DELIMITER ;

-- Execute the procedure
CALL update_mangos();

-- Drop the procedure
DROP PROCEDURE IF EXISTS `update_mangos`;