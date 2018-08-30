   * ******************************************************************** *
   * ******************************************************************** *
   *                                                                      *
   *               your_project_name                                      *
   *               MASTER DO_FILE                                         *
   *                                                                      *
   * ******************************************************************** *
   * ******************************************************************** *

       /*
       ** PURPOSE:      Write intro to project here

       ** OUTLINE:      PART 0: Standardize settings and install packages
                        PART 1: Set globals for dynamic file paths
                        PART 2: Set globals for constants and varlist
                               used across the project. Intall custom
                               commands needed.
                        PART 3: Call the task specific master do-files 
                               that call all do-files needed for that 
                               tas. Do not include Part 0-2 in a task
                               specific master do-file


       ** IDS VAR:      list_ID_var_here         //Uniquely identifies households (update for your project)

       ** NOTES:

       ** WRITEN BY:    names_of_contributors

       ** Last date modified: 30 Aug 2018
       */

*iefolder*0*StandardSettings****************************************************
*iefolder will not work properly if the line above is edited

   * ******************************************************************** *
   *
   *       PART 0:  INSTALL PACKAGES AND STANDARDIZE SETTINGS
   *
   *           -Install packages needed to run all dofiles called
   *            by this master dofile.
   *           -Use ieboilstart to harmonize settings across users
   *
   * ******************************************************************** *

*iefolder*0*End_StandardSettings************************************************
*iefolder will not work properly if the line above is edited

   *Install all packages that this project requires:
   local user_commands ietoolkit       //Fill this list will all commands this project requires
   foreach command of local user_commands {
       cap which `command'
       if _rc == 111 {
           cap ssc install `command'
       }
   }

   *Standardize settings accross users
   ieboilstart, version(12.1)          //Set the version number to the oldest version used by anyone in the project team
   `r(version)'                        //This line is needed to actually set the version from the command above

*iefolder*1*FolderGlobals*******************************************************
*iefolder will not work properly if the line above is edited

   * ******************************************************************** *
   *
   *       PART 1:  PREPARING FOLDER PATH GLOBALS
   *
   *           -Set the global box to point to the project folder
   *            on each collaborators computer.
   *           -Set other locals that point to other folders of interest.
   *
   * ******************************************************************** *

   * Users
   * -----------

   *User Number:
   * You                     1    //Replace "You" with your name
   * Next User               2    //Assign a user number to each additional collaborator of this code

   *Set this value to the user currently using this file
   global user  1

   * Root folder globals
   * ---------------------

   if $user == 1 {
       global projectfolder "/Users/bbdaniels/GitHub/dime-continuing-education"
   }

   if $user == 2 {
       global projectfolder ""  //Enter the file path to the projectfolder of next user here
   }

*These lines are used to test that name ois not already used (do not edit manually)
*round*Baseline*Endline*R1_Baseline*R2_Endline**********************************
*untObs*************************************************************************
*subFld*************************************************************************
*iefolder will not work properly if the lines above are edited


   * Project folder globals
   * ---------------------

   global dataWorkFolder         "$projectfolder/DataWork"

*iefolder*1*FolderGlobals*subfolder*********************************************
*iefolder will not work properly if the line above is edited


*iefolder*1*FolderGlobals*master************************************************
*iefolder will not work properly if the line above is edited

   global mastData               "$dataWorkFolder/MasterData" 

*iefolder*1*FolderGlobals*encrypted*********************************************
*iefolder will not work properly if the line above is edited

   global encryptFolder          "$dataWorkFolder/EncryptedData" 


*iefolder*1*RoundGlobals*rounds*Baseline*Baseline*******************************
*iefolder will not work properly if the line above is edited

   *Baseline folder globals
   global Baseline               "$dataWorkFolder/Baseline" 
   global Baseline_encrypt       "$encryptFolder/Round Baseline Encrypted" 
   global Baseline_dt            "$Baseline/DataSets" 
   global Baseline_do            "$Baseline/Dofiles" 
   global Baseline_out           "$Baseline/Output" 


*iefolder*1*RoundGlobals*rounds*Endline*Endline*********************************
*iefolder will not work properly if the line above is edited

   *Endline folder globals
   global Endline                "$dataWorkFolder/Endline" 
   global Endline_encrypt        "$encryptFolder/Round Endline Encrypted" 
   global Endline_dt             "$Endline/DataSets" 
   global Endline_do             "$Endline/Dofiles" 
   global Endline_out            "$Endline/Output" 


*iefolder*1*RoundGlobals*rounds*R1_Baseline*R1_Baseline*************************
*iefolder will not work properly if the line above is edited

   *R1_Baseline folder globals
   global R1_Baseline            "$dataWorkFolder/R1_Baseline" 
   global R1_Baseline_encrypt    "$encryptFolder/Round R1_Baseline Encrypted" 
   global R1_Baseline_dt         "$R1_Baseline/DataSets" 
   global R1_Baseline_do         "$R1_Baseline/Dofiles" 
   global R1_Baseline_out        "$R1_Baseline/Output" 


*iefolder*1*RoundGlobals*rounds*R2_Endline*R2_Endline***************************
*iefolder will not work properly if the line above is edited

   *R2_Endline folder globals
   global R2_Endline             "$dataWorkFolder/R2_Endline" 
   global R2_Endline_encrypt     "$encryptFolder/Round R2_Endline Encrypted" 
   global R2_Endline_dt          "$R2_Endline/DataSets" 
   global R2_Endline_do          "$R2_Endline/Dofiles" 
   global R2_Endline_out         "$R2_Endline/Output" 

*iefolder*1*FolderGlobals*endRounds*********************************************
*iefolder will not work properly if the line above is edited


*iefolder*1*End_FolderGlobals***************************************************
*iefolder will not work properly if the line above is edited


*iefolder*2*StandardGlobals*****************************************************
*iefolder will not work properly if the line above is edited

   * Set all non-folder path globals that are constant accross
   * the project. Examples are conversion rates used in unit
   * standardization, differnt set of control variables,
   * ado file paths etc.

   do "$dataWorkFolder/global_setup.do" 


*iefolder*2*End_StandardGlobals*************************************************
*iefolder will not work properly if the line above is edited


*iefolder*3*RunDofiles**********************************************************
*iefolder will not work properly if the line above is edited

   * ******************************************************************** *
   *
   *       PART 3: - RUN DOFILES CALLED BY THIS MASTER DO FILE
   *
   *           -When survey rounds are added, this section will
   *            link to the master dofile for that round.
   *           -The default is that these dofiles are set to not
   *            run. It is rare that all round specfic master dofiles
   *            are called at the same time, the round specific master
   *            dofiles are almost always called individually. The
   *            exception is when reviewing or replicating a full project.
   *
   * ******************************************************************** *


*iefolder*3*RunDofiles*Baseline*Baseline****************************************
*iefolder will not work properly if the line above is edited

   if (0) { //Change the 0 to 1 to run the Baseline master dofile
       do "$Baseline/Baseline_MasterDofile.do" 
   }


*iefolder*3*RunDofiles*Endline*Endline******************************************
*iefolder will not work properly if the line above is edited

   if (0) { //Change the 0 to 1 to run the Endline master dofile
       do "$Endline/Endline_MasterDofile.do" 
   }


*iefolder*3*RunDofiles*R1_Baseline*R1_Baseline**********************************
*iefolder will not work properly if the line above is edited

   if (0) { //Change the 0 to 1 to run the R1_Baseline master dofile
       do "$R1_Baseline/R1_Baseline_MasterDofile.do" 
   }


*iefolder*3*RunDofiles*R2_Endline*R2_Endline************************************
*iefolder will not work properly if the line above is edited

   if (0) { //Change the 0 to 1 to run the R2_Endline master dofile
       do "$R2_Endline/R2_Endline_MasterDofile.do" 
   }

*iefolder*3*End_RunDofiles******************************************************
*iefolder will not work properly if the line above is edited

