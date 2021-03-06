Non-Check and Non-ACH Payment Methods
======================

This git repository represents the University of Arizona (the UA)'s _Non-Check and Non-ACH Payment Methods_ modification to **KFS 3.0**, in the form of patch files (generated by svn diff), liquibase scripts, and documentation.
This "patch package" is designed to be informative to technical developers in the position to
apply patch files to the java source code of KFS. In order to better serve such an endeavor,
this README contains several informative sections:

* <a href="#jiras">List of Jiras</a> - This list contains every Jira ticket at the University of Arizona
  that relates to this modification. It provides reverse documentation back to the developers at
  the UA in case of questions regarding how this patch package was created.
* <a href="#liquibase_changesets">List of Liquibase Changesets</a> - This list contains any
  liquibase changeset files that were associated with this modification.
* <a href="#patch_files">List of Patch Files</a> - This is a list of each patch file that needs
  to be applied to the KFS source code in order to realize the modification. This list does _not_
  include patch files for revisions that didn't touch the `trunk/` at the UA.
  Before a modification was merged with `trunk/`, it may have been tweaked, reworked, refactored,
  code reviewed, etc, in handfuls of revisions in a feature branch.
* <a href="#revisions">List of Revisions</a> - This list contains every revision associated with
  this modification. Many of which, as you will see, only touch files in a feature branch. The
  revisions that actually made it into the actual modification touch files in `trunk/`. The list
  of patch files is a better reference of which are these revisions.
* <a href="#files">Lists of Files</a> - These lists contain every file that was created,
  modified, or deleted for this enhancement.
* <a href="#post_mod_changes">List of Post-Modification Changes</a> - This list contains
  revision numbers that are _not_ included in the patches, or raw patches, but that touched one
  or more key files involved in this modification.

Disclaimer
==========

> This enhancement required numerous database changes that were developed over many months. In the end, the remaining developers at UA are not entirely certain what database changes were necessary specifically for this enhancement. Many changes were backed out, column names were changed, and some changes appear to insert UA-specific data. In the end, the liqubiase scripts included in this patch are likely unhelpful.
> 
> So the developers at UA that built this patch package decided to do their best in writing one caconical SQL file (`extra_files/KITT-3049.sql`) that includes all of the changes needed for this enhancement. This single SQL file has not been tested or verified, so please verify the database changes upon implementation. Please provide any feedback to the UA team (or as an issue to this GitHub project) so that we may improve this SQL file if needed.
> 
> Also, the SQL file has been converted from a Liquibase script, so there are references to `DATABASECHANGELOCK` and `DATABASECHANGELOG` tables that can be ignored if not using Liquibase.

<h2><a name="jiras">Jiras</a></h2>

This is a list of Jira tickets at the University of Arizona that relate to this modification. The subversion revisions tagged against each such jira are also listed:

* **KITT-592**: (The main jira ticket for this modification)<br />
  revisions: #7215, #7216, #7217, #7218, #7219, #7220, #7221, #7355, #7356, #7358, #7498, #7516, #7517, #7518, #7605, #7606, #7646, #7683, #7952, #7977, #8054, #8055, #8056, #8095, #8373, #10217, #10221, #10222, #10223, #10227, #10228, #10229, #10230, #10298, #10347, #10958, #10959, #10960, #11056, #11157, #11328, #11387, #11388, #11389, #11390, #11391, #11392, #11393, #11394, #11395, #11396, #11751, #11803, #11824, #11848, #11849, #12008, #12909
* **KFSI-2501**: (A bug fix)<br />
  revisions: #13632, #13633
* **KITT-1268**: (An OJB configuration fix)<br />
  revisions: #11049
* **KFSI-1892**: (A namespace bug fix)<br />
  revisions: #11063
* **KFSI-2592**: (A modification to this modification, wherein we add search by Payment Method to PREQ, DV, and CM searches, and *I believe* to the Vendor search)<br />
  revisions: #15309
* **KFSI-1692**<br />
  **Note**: The description in this Jira ticket is a very important piece of this modification. It has been [included](Non-Check-and-Non-ACH-Payment-Methods/wiki/notes) in this patch package for your reference.<br />
  (no revisions, just that description page)

<h2><a name="liquibase_changesets">Liquibase Changesets</a></h2>

* `install/tab/AP_CRDT_MEMO_T.xml` saw the following activity:
  * changed in [#7215](https://subversion.uits.arizona.edu/kitt-anon/kitt/!svn/bc/7215//financial-system/kfs-cfg-dbs/trunk/install/tab/AP_CRDT_MEMO_T.xml).
* `install/tab/AP_PMT_RQST_T.xml` saw the following activity:
  * created in [#7215](https://subversion.uits.arizona.edu/kitt-anon/kitt/!svn/bc/7215//financial-system/kfs-cfg-dbs/trunk/install/tab/AP_PMT_RQST_T.xml).
* `latest/dat/FP_OFFSET_DEFN_T.xml` saw the following activity:
  * created in [#7215](https://subversion.uits.arizona.edu/kitt-anon/kitt/!svn/bc/7215//financial-system/kfs-cfg-dbs/trunk/latest/dat/FP_OFFSET_DEFN_T.xml).
  * changed in [#7358](https://subversion.uits.arizona.edu/kitt-anon/kitt/!svn/bc/7358//financial-system/kfs-cfg-dbs/trunk/latest/dat/FP_OFFSET_DEFN_T.xml).
* `install/tab/FP_PMT_MTHD_CHART_T.xml` saw the following activity:
  * created in [#7215](https://subversion.uits.arizona.edu/kitt-anon/kitt/!svn/bc/7215//financial-system/kfs-cfg-dbs/trunk/install/tab/FP_PMT_MTHD_CHART_T.xml).
* `install/tab/FP_PMT_MTHD_T.xml` saw the following activity:
  * created in [#7215](https://subversion.uits.arizona.edu/kitt-anon/kitt/!svn/bc/7215//financial-system/kfs-cfg-dbs/trunk/install/tab/FP_PMT_MTHD_T.xml).
* `update/KITT-592.xml` saw the following activity:
  * created in [#7216](https://subversion.uits.arizona.edu/kitt-anon/kitt/!svn/bc/7216//financial-system/kfs-cfg-dbs/trunk/update/KITT-592.xml), [#10223](https://subversion.uits.arizona.edu/kitt-anon/kitt/!svn/bc/10223//financial-system/kfs-cfg-dbs/trunk/update/KITT-592.xml).
  * changed in [#10227](https://subversion.uits.arizona.edu/kitt-anon/kitt/!svn/bc/10227//financial-system/kfs-cfg-dbs/trunk/update/KITT-592.xml), [#10228](https://subversion.uits.arizona.edu/kitt-anon/kitt/!svn/bc/10228//financial-system/kfs-cfg-dbs/trunk/update/KITT-592.xml).
* `latest/tab/FP_PMT_MTHD_T.xml` saw the following activity:
  * changed in [#7605](https://subversion.uits.arizona.edu/kitt-anon/kitt/!svn/bc/7605//financial-system/kfs-cfg-dbs/trunk/latest/tab/FP_PMT_MTHD_T.xml), [#7683](https://subversion.uits.arizona.edu/kitt-anon/kitt/!svn/bc/7683//financial-system/kfs-cfg-dbs/trunk/latest/tab/FP_PMT_MTHD_T.xml), [#11387](https://subversion.uits.arizona.edu/kitt-anon/kitt/!svn/bc/11387//financial-system/kfs-cfg-dbs/trunk/latest/tab/FP_PMT_MTHD_T.xml), [#11394](https://subversion.uits.arizona.edu/kitt-anon/kitt/!svn/bc/11394//financial-system/kfs-cfg-dbs/trunk/latest/tab/FP_PMT_MTHD_T.xml).
* `latest/tab/FP_PMT_MTHD_CHART_T.xml` saw the following activity:
  * changed in [#7605](https://subversion.uits.arizona.edu/kitt-anon/kitt/!svn/bc/7605//financial-system/kfs-cfg-dbs/trunk/latest/tab/FP_PMT_MTHD_CHART_T.xml), [#7683](https://subversion.uits.arizona.edu/kitt-anon/kitt/!svn/bc/7683//financial-system/kfs-cfg-dbs/trunk/latest/tab/FP_PMT_MTHD_CHART_T.xml).
* `latest/dat/FP_PMT_MTHD_T.xml` saw the following activity:
  * changed in [#7605](https://subversion.uits.arizona.edu/kitt-anon/kitt/!svn/bc/7605//financial-system/kfs-cfg-dbs/trunk/latest/dat/FP_PMT_MTHD_T.xml).
* `latest/cst/FP_PMT_MTHD_T.xml` saw the following activity:
  * created in [#7605](https://subversion.uits.arizona.edu/kitt-anon/kitt/!svn/bc/7605//financial-system/kfs-cfg-dbs/trunk/latest/cst/FP_PMT_MTHD_T.xml).
  * changed in [#7683](https://subversion.uits.arizona.edu/kitt-anon/kitt/!svn/bc/7683//financial-system/kfs-cfg-dbs/trunk/latest/cst/FP_PMT_MTHD_T.xml).
* `latest/dat/KREW.xml` saw the following activity:
  * created in [#7605](https://subversion.uits.arizona.edu/kitt-anon/kitt/!svn/bc/7605//financial-system/kfs-cfg-dbs/trunk/latest/dat/KREW.xml).
* `latest/cst/FP_PMT_MTHD_CHART_T.xml` saw the following activity:
  * created in [#7605](https://subversion.uits.arizona.edu/kitt-anon/kitt/!svn/bc/7605//financial-system/kfs-cfg-dbs/trunk/latest/cst/FP_PMT_MTHD_CHART_T.xml).
  * changed in [#7683](https://subversion.uits.arizona.edu/kitt-anon/kitt/!svn/bc/7683//financial-system/kfs-cfg-dbs/trunk/latest/cst/FP_PMT_MTHD_CHART_T.xml).
* `latest/dat/FP_PMT_MTHD_CHART_T.xml` saw the following activity:
  * created in [#7605](https://subversion.uits.arizona.edu/kitt-anon/kitt/!svn/bc/7605//financial-system/kfs-cfg-dbs/trunk/latest/dat/FP_PMT_MTHD_CHART_T.xml).
* `update/KITT-592-2.xml` saw the following activity:
  * created in [#7952](https://subversion.uits.arizona.edu/kitt-anon/kitt/!svn/bc/7952//financial-system/kfs-cfg-dbs/trunk/update/KITT-592-2.xml).
* `update/KITT-592-3.xml` saw the following activity:
  * created in [#7977](https://subversion.uits.arizona.edu/kitt-anon/kitt/!svn/bc/7977//financial-system/kfs-cfg-dbs/trunk/update/KITT-592-3.xml).
* `latest/dat/GL_OFFSET_DEFN_T.xml` saw the following activity:
  * created in [#8054](https://subversion.uits.arizona.edu/kitt-anon/kitt/!svn/bc/8054//financial-system/kfs-cfg-dbs/trunk/latest/dat/GL_OFFSET_DEFN_T.xml).
  * changed in [#8055](https://subversion.uits.arizona.edu/kitt-anon/kitt/!svn/bc/8055//financial-system/kfs-cfg-dbs/trunk/latest/dat/GL_OFFSET_DEFN_T.xml), [#8056](https://subversion.uits.arizona.edu/kitt-anon/kitt/!svn/bc/8056//financial-system/kfs-cfg-dbs/trunk/latest/dat/GL_OFFSET_DEFN_T.xml), [#8095](https://subversion.uits.arizona.edu/kitt-anon/kitt/!svn/bc/8095//financial-system/kfs-cfg-dbs/trunk/latest/dat/GL_OFFSET_DEFN_T.xml), [#8373](https://subversion.uits.arizona.edu/kitt-anon/kitt/!svn/bc/8373//financial-system/kfs-cfg-dbs/trunk/latest/dat/GL_OFFSET_DEFN_T.xml).
* `update/KITT-592-4.xml` saw the following activity:
  * created in [#8054](https://subversion.uits.arizona.edu/kitt-anon/kitt/!svn/bc/8054//financial-system/kfs-cfg-dbs/trunk/update/KITT-592-4.xml).
* `update/KITT-592-5.xml` saw the following activity:
  * created in [#8095](https://subversion.uits.arizona.edu/kitt-anon/kitt/!svn/bc/8095//financial-system/kfs-cfg-dbs/trunk/update/KITT-592-5.xml).
* `update/KITT-592-drop-old.xml` saw the following activity:
  * created in [#10221](https://subversion.uits.arizona.edu/kitt-anon/kitt/!svn/bc/10221//financial-system/kfs-cfg-dbs/trunk/update/KITT-592-drop-old.xml).
* `latest/tab/PUR_VNDR_DTL_EXT_T.xml` saw the following activity:
  * changed in [#11328](https://subversion.uits.arizona.edu/kitt-anon/kitt/!svn/bc/11328//financial-system/kfs-cfg-dbs/trunk/latest/tab/PUR_VNDR_DTL_EXT_T.xml).
* `update/KITT-1383.xml` saw the following activity:
  * created in [#12008](https://subversion.uits.arizona.edu/kitt-anon/kitt/!svn/bc/12008//financial-system/kfs-cfg-dbs/trunk/update/KITT-1383.xml).

(35 changes among 21 files)

<h2><a name="patch_files">Patch Files</a></h2>

This is a list of all of the patches for revisions that affected files in `trunk/`. The filenames in each has been modified, for easy digestion. UA's subversion server manages many Kuali projects in one Subversion project, so a file path like:

```
financial-system/kfs/trunk/src/org/kuali/kfs...
```

has been modified to:

```
src/org/kuali/kfs...
```

* [`patches/07217_KITT-592_cleaned.diff`](Non-Check-and-Non-ACH-Payment-Methods/blob/master/patches/07217_KITT-592_cleaned.diff) is the patch file for #7217.
* [`patches/07218_KITT-592_cleaned.diff`](Non-Check-and-Non-ACH-Payment-Methods/blob/master/patches/07218_KITT-592_cleaned.diff) is the patch file for #7218.
* [`patches/07219_KITT-592_cleaned.diff`](Non-Check-and-Non-ACH-Payment-Methods/blob/master/patches/07219_KITT-592_cleaned.diff) is the patch file for #7219.
* [`patches/07220_KITT-592_cleaned.diff`](Non-Check-and-Non-ACH-Payment-Methods/blob/master/patches/07220_KITT-592_cleaned.diff) is the patch file for #7220.
* [`patches/07221_KITT-592_cleaned.diff`](Non-Check-and-Non-ACH-Payment-Methods/blob/master/patches/07221_KITT-592_cleaned.diff) is the patch file for #7221.
* [`patches/07355_KITT-592_cleaned.diff`](Non-Check-and-Non-ACH-Payment-Methods/blob/master/patches/07355_KITT-592_cleaned.diff) is the patch file for #7355.
* [`patches/07356_KITT-592_cleaned.diff`](Non-Check-and-Non-ACH-Payment-Methods/blob/master/patches/07356_KITT-592_cleaned.diff) is the patch file for #7356.
* [`patches/07498_KITT-592_cleaned.diff`](Non-Check-and-Non-ACH-Payment-Methods/blob/master/patches/07498_KITT-592_cleaned.diff) is the patch file for #7498.
* [`patches/07516_KITT-592_cleaned.diff`](Non-Check-and-Non-ACH-Payment-Methods/blob/master/patches/07516_KITT-592_cleaned.diff) is the patch file for #7516.
* [`patches/07517_KITT-592_cleaned.diff`](Non-Check-and-Non-ACH-Payment-Methods/blob/master/patches/07517_KITT-592_cleaned.diff) is the patch file for #7517.
* [`patches/07518_KITT-592_cleaned.diff`](Non-Check-and-Non-ACH-Payment-Methods/blob/master/patches/07518_KITT-592_cleaned.diff) is the patch file for #7518.
* [`patches/10347_KITT-592_cleaned.diff`](Non-Check-and-Non-ACH-Payment-Methods/blob/master/patches/10347_KITT-592_cleaned.diff) is the patch file for #10347.
* [`patches/10958_KITT-592_cleaned.diff`](Non-Check-and-Non-ACH-Payment-Methods/blob/master/patches/10958_KITT-592_cleaned.diff) is the patch file for #10958.
* [`patches/10959_KITT-592_cleaned.diff`](Non-Check-and-Non-ACH-Payment-Methods/blob/master/patches/10959_KITT-592_cleaned.diff) is the patch file for #10959.
* [`patches/10960_KITT-592_cleaned.diff`](Non-Check-and-Non-ACH-Payment-Methods/blob/master/patches/10960_KITT-592_cleaned.diff) is the patch file for #10960.
* [`patches/11056_KITT-592_cleaned.diff`](Non-Check-and-Non-ACH-Payment-Methods/blob/master/patches/11056_KITT-592_cleaned.diff) is the patch file for #11056.
* [`patches/11157_KITT-592_cleaned.diff`](Non-Check-and-Non-ACH-Payment-Methods/blob/master/patches/11157_KITT-592_cleaned.diff) is the patch file for #11157.
* [`patches/11751_KITT-592_cleaned.diff`](Non-Check-and-Non-ACH-Payment-Methods/blob/master/patches/11751_KITT-592_cleaned.diff) is the patch file for #11751.
* [`patches/11803_KITT-592_cleaned.diff`](Non-Check-and-Non-ACH-Payment-Methods/blob/master/patches/11803_KITT-592_cleaned.diff) is the patch file for #11803.
* [`patches/11824_KITT-592_cleaned.diff`](Non-Check-and-Non-ACH-Payment-Methods/blob/master/patches/11824_KITT-592_cleaned.diff) is the patch file for #11824.
* [`patches/11848_KITT-592_cleaned.diff`](Non-Check-and-Non-ACH-Payment-Methods/blob/master/patches/11848_KITT-592_cleaned.diff) is the patch file for #11848.
* [`patches/11849_KITT-592_cleaned.diff`](Non-Check-and-Non-ACH-Payment-Methods/blob/master/patches/11849_KITT-592_cleaned.diff) is the patch file for #11849.
* [`patches/12909_KITT-592_cleaned.diff`](Non-Check-and-Non-ACH-Payment-Methods/blob/master/patches/12909_KITT-592_cleaned.diff) is the patch file for #12909.
* [`patches/13632_KFSI-2501_cleaned.diff`](Non-Check-and-Non-ACH-Payment-Methods/blob/master/patches/13632_KFSI-2501_cleaned.diff) is the patch file for #13632.
* [`patches/13633_KFSI-2501_cleaned.diff`](Non-Check-and-Non-ACH-Payment-Methods/blob/master/patches/13633_KFSI-2501_cleaned.diff) is the patch file for #13633.
* [`patches/11049_KITT-1268_cleaned.diff`](Non-Check-and-Non-ACH-Payment-Methods/blob/master/patches/11049_KITT-1268_cleaned.diff) is the patch file for #11049.
* [`patches/11063_KFSI-1892_cleaned.diff`](Non-Check-and-Non-ACH-Payment-Methods/blob/master/patches/11063_KFSI-1892_cleaned.diff) is the patch file for #11063.
* [`patches/15309_KFSI-2592_cleaned.diff`](Non-Check-and-Non-ACH-Payment-Methods/blob/master/patches/15309_KFSI-2592_cleaned.diff) is the patch file for #15309.

<h2><a name="revisions">Revisions</a></h2>

This is an ordered list of revisions that relate to this modification. There may not be a patch
file for every revision listed below for the following reasons:

* A revision might only affect a branch, perhaps one where development primarily took place. Any
  changes that finally made it into `trunk/` will be seen in revisions that specifically touch
  files in `trunk/`. Therefore, we do not create patch files for revisions that only affect a
  branch.
* A revision might only include a liquibase changeset that is executed by some automated process.
  Since each institution maintains different revision controls on their database, liquibase
  changesets are not provided as patches. They are instead presented as intact files under the
  `liquibase-changesets/` directory.

[Here](Non-Check-and-Non-ACH-Payment-Methods/blob/master/patch_log.txt) is a printout of `svn log -v` for each revision.

*   \#7217 was committed against KITT-592 on 2010-01-20 04:07:05 UTC by <strong>jhkeller</strong>.

    > KITT-592 : Added new payment method table and BO classes
    > Also changes to DV document (add'l work still needed)
*   \#7218 was committed against KITT-592 on 2010-01-20 05:03:46 UTC by <strong>jhkeller</strong>.

    > KITT-592 : removed use of document class constructors to allow for subclassing of the documents
*   \#7219 was committed against KITT-592 on 2010-01-20 05:45:18 UTC by <strong>jhkeller</strong>.

    > KITT-592 : fixed call to get document type
*   \#7220 was committed against KITT-592 on 2010-01-20 05:59:47 UTC by <strong>jhkeller</strong>.

    > KITT-592 : slight correction to the logic for generating the bank offset entries
*   \#7221 was committed against KITT-592 on 2010-01-20 06:02:06 UTC by <strong>jhkeller</strong>.

    > KITT-592 : removed use of document class constructors to allow for subclassing of the documents
*   \#7355 was committed against KITT-592 on 2010-01-24 19:25:49 UTC by <strong>jhkeller</strong>.

    > KITT-592 : Updates to the DV changes and baseline changes to allow for subclassing.
*   \#7356 was committed against KITT-592 on 2010-01-24 19:28:40 UTC by <strong>jhkeller</strong>.

    > KITT-592 : PREQ and CM document changes - new functionality will be broken until data changes are in place
*   \#7498 was committed against KITT-592 on 2010-01-30 21:42:00 UTC by <strong>jhkeller</strong>.

    > KITT-592 : work on credit memo validation
*   \#7516 was committed against KITT-592 on 2010-01-31 00:37:21 UTC by <strong>jhkeller</strong>.

    > KITT-592: Finished business rules and GL entry generation for CM document.
*   \#7517 was committed against KITT-592 on 2010-01-31 01:00:48 UTC by <strong>jhkeller</strong>.

    > KITT-592: Added sanity-check business rules to the payment method document.
*   \#7518 was committed against KITT-592 on 2010-01-31 23:52:17 UTC by <strong>jhkeller</strong>.

    > KITT-592: E-Invoice updates to handle payment medium code
*   \#10347 was committed against KITT-592 on 2010-06-06 22:35:33 UTC by <strong>jhkeller</strong>.

    > KITT-592 : Migrating payment method change portions of mod to allow for data entry required in TST and CFG environments which will be needed to preserve current functionality
*   \#10958 was committed against KITT-592 on 2010-07-07 02:56:45 UTC by <strong>jhkeller</strong>.

    > KITT-592 : payment method changes for payable documents - new fee and clearing account GL entries
*   \#10959 was committed against KITT-592 on 2010-07-07 02:57:21 UTC by <strong>jhkeller</strong>.

    > KITT-592 : payment method changes for payable documents - new fee and clearing account GL entries
*   \#10960 was committed against KITT-592 on 2010-07-07 03:12:22 UTC by <strong>jhkeller</strong>.

    > KITT-592 : payment method changes for payable documents - new fee and clearing account GL entries
*   \#11049 was committed against KITT-1268 on 2010-07-10 23:44:01 UTC by <strong>jhkeller</strong>.

    > KITT-1286 - fixed problem with bank code not saving
*   \#11056 was committed against KITT-592 on 2010-07-11 19:24:12 UTC by <strong>jhkeller</strong>.

    > KITT-592 : Added active indicator to the payment method maintenance document
*   \#11063 was committed against KFSI-1892 on 2010-07-12 23:25:28 UTC by <strong>ahollamo</strong>.

    > KFSI-1892
    > KITT-1316
    > Adding annotation

*   \#11157 was committed against KITT-592 on 2010-07-15 04:39:17 UTC by <strong>jhkeller</strong>.

    > KITT-592
    > KFSI-1931
    > 
    > Found remaining places where the logic was looking for the baseline Check/ACH payment method code.
*   \#11751 was committed against KITT-592 on 2010-08-04 03:03:10 UTC by <strong>jhkeller</strong>.

    > KITT-592 : adjusted label for default payment method code per request
*   \#11803 was committed against KITT-592 on 2010-08-05 02:57:05 UTC by <strong>jhkeller</strong>.

    > KITT-592 : Fixed OJB mappings for reference objects on PaymentMethodChart object
*   \#11824 was committed against KITT-592 on 2010-08-06 06:06:41 UTC by <strong>jhkeller</strong>.

    > KITT-592 : Updated DV to default payment method from vendor tables
*   \#11848 was committed against KITT-592 on 2010-08-07 06:04:03 UTC by <strong>jhkeller</strong>.

    > KITT-592 : Updated PREQ to default payment method from vendor tables
*   \#11849 was committed against KITT-592 on 2010-08-07 06:39:49 UTC by <strong>jhkeller</strong>.

    > KITT-592 : Updated CM to default payment method from PREQ or vendor table
*   \#12909 was committed against KITT-592 on 2010-09-06 19:00:11 UTC by <strong>jhkeller</strong>.

    > KITT-592 : Updated logic around the payment request to adjust ledger entries properly when PREQ is modified.  Also, locked down the payment method and bank code fields as needed to preserve correctness of the GL entries.
*   \#13632 was committed against KFSI-2501 on 2010-09-28 02:53:28 UTC by <strong>jhkeller</strong>.

    > KFSI-2501 : updated DV so that it defaults the bank code from the payment method defaulted from the vendor
*   \#13633 was committed against KFSI-2501 on 2010-09-28 03:01:58 UTC by <strong>jhkeller</strong>.

    > KFSI-2501 : updated PREQ and CM so that they default the bank code from the payment method upon creation
*   \#15309 was committed against KFSI-2592 on 2010-12-21 19:50:28 UTC by <strong>jwingate@CATNET.ARIZONA.EDU</strong>.

    > KFSI-2592/KITT-1970 Add Payment Method to Document Search/Lookup (DV/PREQ/CM and Vendor Detail) 

<h2><a name="files">Files</a></h2>

Files **created** for this modification (48 files)

    /build/project/xsd/purap/uaElectronicInvoice.xsd
    /work/src/edu/arizona/kfs/fp/batch/service/impl/UaDisbursementVoucherExtractServiceImpl.java
    /work/src/edu/arizona/kfs/fp/businessobject/PaymentMethod.java
    /work/src/edu/arizona/kfs/fp/businessobject/PaymentMethodChart.java
    /work/src/edu/arizona/kfs/fp/businessobject/datadictionary/PaymentMethod.xml
    /work/src/edu/arizona/kfs/fp/businessobject/datadictionary/PaymentMethodChart.xml
    /work/src/edu/arizona/kfs/fp/businessobject/options
    /work/src/edu/arizona/kfs/fp/businessobject/options/PaymentMethodValuesFinder.java
    /work/src/edu/arizona/kfs/fp/businessobject/options/PaymentMethodValuesFinderNonInterdepartmental.java
    /work/src/edu/arizona/kfs/fp/businessobject/options/PaymentMethodsForDVValuesFinder.java
    /work/src/edu/arizona/kfs/fp/businessobject/options/PaymentMethodsForVendorValuesFinder.java
    /work/src/edu/arizona/kfs/fp/dataaccess
    /work/src/edu/arizona/kfs/fp/dataaccess/impl
    /work/src/edu/arizona/kfs/fp/dataaccess/impl/UaDisbursementVoucherDaoOjb.java
    /work/src/edu/arizona/kfs/fp/document/UaDisbursementVoucherDocument.java
    /work/src/edu/arizona/kfs/fp/document/datadictionary/PaymentMethodMaintenanceDocument.xml
    /work/src/edu/arizona/kfs/fp/document/validation/impl/PaymentMethodRule.java
    /work/src/edu/arizona/kfs/fp/document/validation/impl/UaDisbursementVoucherDocumentPreRules.java
    /work/src/edu/arizona/kfs/fp/document/workflow/DisbursementVoucherNonCheck.xml
    /work/src/edu/arizona/kfs/fp/document/workflow/PaymentMethodMaintenanceDocument.xml
    /work/src/edu/arizona/kfs/fp/dwr-fp.xml
    /work/src/edu/arizona/kfs/fp/service
    /work/src/edu/arizona/kfs/fp/service/UaPaymentMethodGeneralLedgerPendingEntryService.java
    /work/src/edu/arizona/kfs/fp/service/impl
    /work/src/edu/arizona/kfs/fp/service/impl/UaPaymentMethodGeneralLedgerPendingEntryServiceImpl.java
    /work/src/edu/arizona/kfs/fp/service/impl/UaPaymentMethodGeneralLedgerServiceTest.java
    /work/src/edu/arizona/kfs/module/purap/batch
    /work/src/edu/arizona/kfs/module/purap/batch/electronicInvoiceDigesterRules.xml
    /work/src/edu/arizona/kfs/module/purap/businessobject
    /work/src/edu/arizona/kfs/module/purap/businessobject/UaElectronicInvoiceDetailRequestHeader.java
    /work/src/edu/arizona/kfs/module/purap/document/UaPaymentRequestDocument.java
    /work/src/edu/arizona/kfs/module/purap/document/UaVendorCreditMemoDocument.java
    /work/src/edu/arizona/kfs/module/purap/document/service
    /work/src/edu/arizona/kfs/module/purap/document/service/impl
    /work/src/edu/arizona/kfs/module/purap/document/service/impl/UaCreditMemoServiceImpl.java
    /work/src/edu/arizona/kfs/module/purap/document/service/impl/UaPaymentRequestServiceImpl.java
    /work/src/edu/arizona/kfs/module/purap/document/validation
    /work/src/edu/arizona/kfs/module/purap/document/validation/configuration
    /work/src/edu/arizona/kfs/module/purap/document/validation/configuration/PurapValidatorOverrides.xml
    /work/src/edu/arizona/kfs/module/purap/document/validation/impl
    /work/src/edu/arizona/kfs/module/purap/document/validation/impl/UaAccountsPayableBankCodeValidation.java
    /work/src/edu/arizona/kfs/module/purap/document/validation/impl/VendorCreditMemoPaymentMethodCodeValidation.java
    /work/src/edu/arizona/kfs/module/purap/document/workflow/CreditMemoNonCheck.xml
    /work/src/edu/arizona/kfs/module/purap/document/workflow/PaymentRequestNonCheck.xml
    /work/src/edu/arizona/kfs/module/purap/service
    /work/src/edu/arizona/kfs/module/purap/service/impl
    /work/src/edu/arizona/kfs/module/purap/service/impl/UaElectronicInvoiceHelperServiceImpl.java
    /work/src/edu/arizona/kfs/module/purap/service/impl/UaPurchaseOrderServiceImpl.java

Files **modified** for this modification (43 files)

    /test/integration/src/org/kuali/kfs/fp/document/DisbursementVoucherDocumentTest.java
    /test/unit/src/org/kuali/kfs/fp/document/service/DisbursementVoucherTaxServiceTest.java
    /test/unit/src/org/kuali/kfs/fp/document/service/DisbursementVoucherTravelServiceTest.java
    /test/unit/src/org/kuali/kfs/module/cab/fixture/PaymentRequestDocumentFixture.java
    /test/unit/src/org/kuali/kfs/module/purap/document/validation/impl/PaymentRequestDocumentRuleTest.java
    /test/unit/src/org/kuali/kfs/module/purap/fixture/ElectronicInvoiceHelperServiceFixture.java
    /test/unit/src/org/kuali/kfs/module/purap/service/ElectronicInvoiceHelperServiceTest.java
    /test/unit/src/org/kuali/kfs/module/purap/util/TestPaymentRequestPayDateNotPastValidation.java
    /test/unit/src/org/kuali/kfs/sys/dataaccess/impl/UnitTestSqlDaoOjb.java
    /work/src/arizona-ApplicationResources.properties
    /work/src/edu/arizona/kfs/fp/document/datadictionary/DisbursementVoucherDocument.xml
    /work/src/edu/arizona/kfs/fp/document/web/struts/DisbursementVoucherForm.java
    /work/src/edu/arizona/kfs/fp/ojb-fp.xml
    /work/src/edu/arizona/kfs/fp/spring-fp.xml
    /work/src/edu/arizona/kfs/module/purap/document/datadictionary/PaymentRequestDocument.xml
    /work/src/edu/arizona/kfs/module/purap/document/datadictionary/VendorCreditMemoDocument.xml
    /work/src/edu/arizona/kfs/module/purap/ojb-purap.xml
    /work/src/edu/arizona/kfs/module/purap/spring-purap.xml
    /work/src/edu/arizona/kfs/vnd/businessobject/VendorDetailExtension.java
    /work/src/edu/arizona/kfs/vnd/businessobject/datadictionary/VendorDetail.xml
    /work/src/edu/arizona/kfs/vnd/businessobject/datadictionary/VendorDetailExtension.xml
    /work/src/edu/arizona/kfs/vnd/document/datadictionary/VendorMaintenanceDocument.xml
    /work/src/edu/arizona/kfs/vnd/ojb-vnd.xml
    /work/src/org/kuali/kfs/fp/batch/service/impl/DisbursementVoucherExtractServiceImpl.java
    /work/src/org/kuali/kfs/fp/dataaccess/impl/DisbursementVoucherDaoOjb.java
    /work/src/org/kuali/kfs/fp/document/validation/impl/DisbursementVoucherBankCodeValidation.java
    /work/src/org/kuali/kfs/module/cab/batch/service/impl/BatchExtractServiceImpl.java
    /work/src/org/kuali/kfs/module/cab/businessobject/PurchasingAccountsPayableDocument.java
    /work/src/org/kuali/kfs/module/purap/businessobject/CreditMemoView.java
    /work/src/org/kuali/kfs/module/purap/businessobject/PaymentRequestView.java
    /work/src/org/kuali/kfs/module/purap/dataaccess/impl/ElectronicInvoicingDaoOjb.java
    /work/src/org/kuali/kfs/module/purap/document/dataaccess/impl/CreditMemoDaoOjb.java
    /work/src/org/kuali/kfs/module/purap/document/dataaccess/impl/PaymentRequestDaoOjb.java
    /work/src/org/kuali/kfs/module/purap/document/service/impl/CreditMemoServiceImpl.java
    /work/src/org/kuali/kfs/module/purap/document/service/impl/PaymentRequestServiceImpl.java
    /work/src/org/kuali/kfs/module/purap/service/impl/ElectronicInvoiceHelperServiceImpl.java
    /work/src/org/kuali/kfs/module/purap/service/impl/PurapGeneralLedgerServiceImpl.java
    /work/src/org/kuali/kfs/sys/document/validation/impl/BankCodeValidation.java
    /work/web-root/WEB-INF/tags/fp/dvMessages.tag
    /work/web-root/WEB-INF/tags/module/purap/creditMemoInfo.tag
    /work/web-root/WEB-INF/tags/module/purap/paymentRequestInvoiceInfo.tag
    /work/web-root/WEB-INF/tags/portal/channel/maintenance/financialProcessing.tag
    /work/web-root/WEB-INF/tags/sys/bankControl.tag

<h2><a name="extra_files">Extra Files</a></h2>

<h2><a name="post_mod_changes">Post Mod Changes</a></h2>

For each file that was changed or added for this modification, I've looked at its history in subversion (`svn log <file_name>`) to find whether later fixes were committed against this modification that I might have missed. There were some :) They may be fixes to the modification, or further enhancements, or changes completely unrelated. Please contact the UA for more information about a given revision number, or Jira ticket. Here they are:

*   **#12980** touches /work/src/edu/arizona/kfs/fp/service/impl/UaPaymentMethodGeneralLedgerPendingEntryServiceImpl.java.

    > Fix what showed up to me as a compile error
*   **#13156** touches /work/src/edu/arizona/kfs/module/purap/document/UaVendorCreditMemoDocument.java.

    > KITT-1630
*   **#13294** touches /work/src/edu/arizona/kfs/module/purap/service/impl/UaElectronicInvoiceHelperServiceImpl.java.

    > KFSI-1811
    > KITT-1658
    > Modified the eInvoicing & EIRT process to allow AP staff to approve an EIRT where the eInvoice unit price exceeds the upper variance allowed.
*   **#13479** touches /work/src/edu/arizona/kfs/fp/businessobject/options/PaymentMethodValuesFinder.java.

    > KITT-1671 : Updated values finder to output in alpha order
*   **#14971** touches: 
    * /work/src/edu/arizona/kfs/fp/document/UaDisbursementVoucherDocument.java
    * /work/web-root/WEB-INF/tags/module/purap/paymentRequestInvoiceInfo.tag
    * /work/src/edu/arizona/kfs/fp/document/validation/impl/UaDisbursementVoucherDocumentPreRules.java

    > KFSI-2726 : Updated DV and PREQ documents to lock down attributes which cause special extraction by PDP when the payment method will not be processed
*   **#15341** touches /work/src/edu/arizona/kfs/fp/service/impl/UaPaymentMethodGeneralLedgerPendingEntryServiceImpl.java.

    > KFSI-2728 : Fixed sign used for reversal of fees upon cancel of PREQ
*   **#15503** touches /work/src/edu/arizona/kfs/module/purap/document/UaPaymentRequestDocument.java.

    > KITT-2054 code needed to update BO for bank code
*   **#15567** touches /work/src/edu/arizona/kfs/module/purap/document/UaPaymentRequestDocument.java.

    > KITT-2063 PREQ needs paymentHistory timestamps when final and payment method not A-ach/check
*   **#15625** touches /work/src/edu/arizona/kfs/module/purap/document/UaPaymentRequestDocument.java.

    > KITT-2063 KFSI-2944 changed it to look at document instead of PaymentRequestView.
*   **#15626** touches /work/src/edu/arizona/kfs/module/purap/document/UaPaymentRequestDocument.java.

    > KITT-2063 KFSI-2944 changed it to look at document instead of PaymentRequestView.
*   **#15627** touches /work/src/edu/arizona/kfs/module/purap/document/UaPaymentRequestDocument.java.

    > KITT-2063 KFSI-2944 changed it to look at document instead of PaymentRequestView.
*   **#15675** touches /work/src/edu/arizona/kfs/module/purap/document/UaPaymentRequestDocument.java.

    > kitt-2063 kfsi-2944 Amy wants both fields updated just not the one as per spec.
*   **#16178** touches /work/src/edu/arizona/kfs/module/purap/document/service/impl/UaPaymentRequestServiceImpl.java.

    > KFSI-3049 KITT-2215 deep copy and materialize collections for PREQ before autoapprove
*   **#16312** touches /work/src/edu/arizona/kfs/module/purap/document/UaVendorCreditMemoDocument.java.

    > KITT-2240 KFSI-3060 adapted change from linked jira
*   **#17426** touches /work/src/edu/arizona/kfs/fp/document/UaDisbursementVoucherDocument.java.

    > KFSI-3373: DV payment method should be able to be edited by AP Specialist. 
    > (Change bank code when a new payment method is selected)
*   **#17451** touches /work/src/edu/arizona/kfs/fp/document/UaDisbursementVoucherDocument.java.

    > KFSI-3373: DV payment method should be able to be edited by AP Specialist. 
    > (Change bank code when a new payment method is selected)
*   **#17504** touches /work/src/edu/arizona/kfs/module/purap/document/UaPaymentRequestDocument.java.

    > KFSI-3299
*   **#17589** touches /work/src/edu/arizona/kfs/module/purap/document/UaPaymentRequestDocument.java.

    > KFSI-2634
    > KITT-2202
    > Second commit of purap matching mod.  All of the code.

*   **#17823** touches /work/src/edu/arizona/kfs/fp/service/impl/UaPaymentMethodGeneralLedgerPendingEntryServiceImpl.java.

    > KFSI-3406/KITT-2393 Non-Check/ACH for Payment Method "C" AP PCard and Use Tax is creating incorrect GL Entries
*   **#17938** touches /work/src/edu/arizona/kfs/module/purap/document/UaPaymentRequestDocument.java.

    > KFSI-3299/KITT-2358 Total Amount listed on Payment Request Document Overview tab is incorrect
*   **#19674** touches /work/src/edu/arizona/kfs/fp/document/UaDisbursementVoucherDocument.java.

    > KITT-2605 && KFSI-3971
    > - Parameterize where the DV and CR get the Campus Code from
*   **#19676** touches /work/src/edu/arizona/kfs/fp/document/UaDisbursementVoucherDocument.java.

    > KITT-2605 && KFSI-3971
    > - Parameterize where the DV and CR get the Campus Code from
    > - repackage the code so that it can ready for contribution
*   **#19889** touches /work/src/edu/arizona/kfs/module/purap/service/impl/UaElectronicInvoiceHelperServiceImpl.java.

    > KFSI-3342/KITT-2325 Electronic Invoice Job crashes if one file is bad.
*   **#20569** touches /work/src/edu/arizona/kfs/module/purap/document/UaPaymentRequestDocument.java.

    > KFSI-4548
    > KITT-2728
    > Added code to handle situations where the FO has not taken action on the overage and PREQ document evaluates the split node that determines if the document should route to PACS or not.
*   **#21548** touches /work/src/edu/arizona/kfs/module/purap/service/impl/UaElectronicInvoiceHelperServiceImpl.java.

    > KFSI-5128/KITT-2896 The EIRT document is routing to exception in STG
*   **#21779** touches /work/src/edu/arizona/kfs/fp/document/UaDisbursementVoucherDocument.java.

    > KFSI-5154 KITT-2899 set the paid date when the DV will not go through PDP 
*   **#21979** touches /work/src/edu/arizona/kfs/fp/service/impl/UaPaymentMethodGeneralLedgerPendingEntryServiceImpl.java.

    > KFSI-5323/KITT-2932 Overage amounts are posting to the wrong account
*   **#22358** touches /work/src/edu/arizona/kfs/fp/service/impl/UaPaymentMethodGeneralLedgerPendingEntryServiceImpl.java.

    > KFSI-5787
    > KITT-2972
    > For use tax PRNC's and CMNC's, use the total pre-tax dollar amount from the document for the bank offset instead of performing the calculation for the bank offset.
*   **#22469** touches /work/src/edu/arizona/kfs/fp/service/impl/UaPaymentMethodGeneralLedgerPendingEntryServiceImpl.java.

    > KFSI-5787
    > KITT-2972
    > Fixed issue with Credit and Debit being inverted on the two bank offset GLPEs for PREQs.
*   **#22523** touches /work/src/edu/arizona/kfs/fp/service/impl/UaPaymentMethodGeneralLedgerPendingEntryServiceImpl.java.

    > KFSI-5872
    > KITT-2986
    > Refactored the code to not cast to PurchasingAccountsPayableDocument until after it verifies that the document is a PRNC or CMNC document.
*   **#23649** touches /work/src/edu/arizona/kfs/fp/service/impl/UaPaymentMethodGeneralLedgerPendingEntryServiceImpl.java.

    > KFSI-6190
*   **#23756** touches /work/src/edu/arizona/kfs/module/purap/document/UaPaymentRequestDocument.java.

    > KFSI-5964 KITT-3051 archive use tax pending entries on a PREQ so that they may be reversed when accounts are changed by a fiscal officer
*   **#23880** touches /work/src/edu/arizona/kfs/module/purap/document/UaPaymentRequestDocument.java.

    > KFSI-5964 KITT-3051 delete archived use tax pending entries when the doc is disapproved or cancelled.
*   **#23933** touches /work/src/edu/arizona/kfs/fp/document/UaDisbursementVoucherDocument.java.

    > KFSI-5979
    > Added a new business rule and special route node to the DV.  As the very last route node, if a DV has "special characters" (non-ascii) in its check stub text field, then it will stop at the AP Managers group and require fixing.
*   **#23934** touches /work/src/edu/arizona/kfs/fp/document/UaDisbursementVoucherDocument.java.

    > KFSI-5979
    > Added a new business rule and special route node to the DV.  As the very last route node, if a DV has "special characters" (non-ascii) in its check stub text field, then it will stop at the AP Managers group and require fixing.
*   **#23957** touches /work/src/edu/arizona/kfs/fp/document/UaDisbursementVoucherDocument.java.

    > KFSI-5979
    > Fixed some bugs, and added more fields being checked.
*   **#24306** touches /work/src/edu/arizona/kfs/module/purap/document/UaPaymentRequestDocument.java.

    > KFSI-6365/KATTS-39/KITT-3076 PREQ documents from eInvoice routing to kfs-sys-user as initiator of PREQ

(37 revisions)

The following files were ignored here:

    arizona-ApplicationResources.properties
    ojb-fp.xml
    spring-fp.xml
    ojb-purap.xml
    spring-purap.xml
    PaymentRequestDocument.xml
    PurapValidatorOverrides.xml
    VendorDetail.xml
    VendorMaintenanceDocument.xml
    PaymentMethodRule.java
    PaymentMethodMaintenanceDocument.xml
    DisbursementVoucherDocument.xml
    VendorDetailExtension.java
    VendorDetailExtension.xml
    ElectronicInvoiceHelperServiceImpl.java
    PaymentRequestServiceImpl.java
    CreditMemoServiceImpl.java
    PurapGeneralLedgerServiceImpl.java
    PaymentRequestDaoOjb.java
    DisbursementVoucherExtractServiceImpl.java
    ElectronicInvoicingDaoOjb.java
    ElectronicInvoiceHelperServiceTest.java
    BatchExtractServiceImpl.java
    PurchasingAccountsPayableDocument.java
    VendorCreditMemoDocument.xml
    financialProcessing.tag
    CreditMemoView.java
    PaymentRequestView.java
    bankControl.tag

This means, for example, that "arizona-ApplicationResources.properties" was changed for this modification, but its history was not used to build this list of revisions.

