#!/bin/bash

set -e -u

# get list of dirs
for subdir in [0-9]*; do
    newsub="sub-${subdir}"
    mkdir -p ${newsub}/ses-3T/anat
    mkdir -p ${newsub}/ses-3T/fmap
    mkdir -p ${newsub}/ses-7T1/func
    mkdir -p ${newsub}/ses-7T1/fmap
    mkdir -p ${newsub}/ses-7T2/func
    mkdir -p ${newsub}/ses-7T2/fmap
    mkdir -p ${newsub}/ses-7T3/func
    mkdir -p ${newsub}/ses-7T3/fmap
    mkdir -p ${newsub}/ses-7T4/func
    mkdir -p ${newsub}/ses-7T4/fmap

    # rename 3T T1w files
    git mv -fk ${subdir}/*/*/T1w*/${subdir}_3T_AFI.nii.gz \
        ${newsub}/ses-3T/anat/${newsub}_ses-3T_AFI.nii.gz || true
    git mv -fk ${subdir}/*/*/T1w*/${subdir}_3T_BIAS_32CH.nii.gz \
        ${newsub}/ses-3T/anat/${newsub}_ses-3T_BIAS_32CH.nii.gz || true
    git mv -fk ${subdir}/*/*/T1w*/${subdir}_3T_BIAS_BC.nii.gz \
        ${newsub}/ses-3T/anat/${newsub}_ses-3T_BIAS_BC.nii.gz || true
    git mv -fk ${subdir}/*/*/T1w*/${subdir}_3T_FieldMap_Magnitude.nii.gz \
        ${newsub}/ses-3T/fmap/${newsub}_ses-3T_magnitude1.nii.gz || true
    git mv -fk ${subdir}/*/*/T1w*/${subdir}_3T_FieldMap_Phase.nii.gz \
        ${newsub}/ses-3T/fmap/${newsub}_ses-3T_phasediff.nii.gz || true
    git mv -fk ${subdir}/*/*/T1w*/${subdir}_3T_T1w_MPR1.nii.gz \
        ${newsub}/ses-3T/anat/${newsub}_ses-3T_T1w.nii.gz || true

    # rename 7T MOVIE1 files
    # fieldmap scans for MOVIE 1 & 2 are the same
    git mv -fk ${subdir}/*/*/*MOVIE1*/${subdir}_7T_SpinEchoFieldMap_AP.nii.gz \
        ${newsub}/ses-7T1/fmap/${newsub}_ses-7T1_dir-AP_run-2_epi.nii.gz || true
    git mv -fk ${subdir}/*/*/*MOVIE1*/${subdir}_7T_SpinEchoFieldMap_PA.nii.gz \
        ${newsub}/ses-7T1/fmap/${newsub}_ses-7T1_dir-PA_run-2_epi.nii.gz || true
    git mv -fk ${subdir}/*/*/*MOVIE1*/${subdir}_7T_tfMRI_MOVIE1_AP.nii.gz \
        ${newsub}/ses-7T1/func/${newsub}_ses-7T1_task-MOVIE1_dir-AP_bold.nii.gz || true
    git mv -fk ${subdir}/*/*/*MOVIE1*/${subdir}_7T_tfMRI_MOVIE1_AP_SBRef.nii.gz \
        ${newsub}/ses-7T1/func/${newsub}_ses-7T1_task-MOVIE1_dir-AP_sbref.nii.gz || true
    git mv -fk ${subdir}/*/*/*MOVIE1*/*/BEHAV/${subdir}_7T_MOV1_behav.xml \
        ${newsub}/ses-7T1/func/${newsub}_ses-7T1_task-MOVIE1_behav.xml || true
    # subject 169040 has a typo in the eyetrack filenames
    git mv -fk ${subdir}/*/*/*MOVIE1*/*/EYETRACKER/${subdir}_*_MOV1_eyetrack.asc \
        ${newsub}/ses-7T1/func/${newsub}_ses-7T1_task-MOVIE1_recording-eyetracking_physio.asc || true
    git mv -fk ${subdir}/*/*/*MOVIE1*/*/EYETRACKER/${subdir}_*_MOV1_eyetrack_summary.csv \
        ${newsub}/ses-7T1/func/${newsub}_ses-7T1_task-MOVIE1_recording-eyetracking_physio.csv || true
    git mv -fk ${subdir}/*/*/*MOVIE1*/filescans.csv \
        ${newsub}/ses-7T1/func/${newsub}_ses-7T1_task-MOVIE1_filescans.csv || true

    # rename 7T MOVIE2 files
    # fieldmap scans for MOVIE 1 & 2 are the same
    git mv -fk ${subdir}/*/*/*MOVIE2*/${subdir}_7T_SpinEchoFieldMap_AP.nii.gz \
        ${newsub}/ses-7T1/fmap/${newsub}_ses-7T1_dir-AP_run-2_epi.nii.gz || true
    git mv -fk ${subdir}/*/*/*MOVIE2*/${subdir}_7T_SpinEchoFieldMap_PA.nii.gz \
        ${newsub}/ses-7T1/fmap/${newsub}_ses-7T1_dir-PA_run-2_epi.nii.gz || true
    git mv -fk ${subdir}/*/*/*MOVIE2*/${subdir}_7T_tfMRI_MOVIE2_PA.nii.gz \
        ${newsub}/ses-7T1/func/${newsub}_ses-7T1_task-MOVIE2_dir-PA_bold.nii.gz || true
    git mv -fk ${subdir}/*/*/*MOVIE2*/${subdir}_7T_tfMRI_MOVIE2_PA_SBRef.nii.gz \
        ${newsub}/ses-7T1/func/${newsub}_ses-7T1_task-MOVIE2_dir-PA_sbref.nii.gz || true
    git mv -fk ${subdir}/*/*/*MOVIE2*/*/BEHAV/${subdir}_7T_MOV2_behav.xml \
        ${newsub}/ses-7T1/func/${newsub}_ses-7T1_task-MOVIE2_behav.xml || true
    # subject 169040 has a typo in the eyetrack filenames
    git mv -fk ${subdir}/*/*/*MOVIE2*/*/EYETRACKER/${subdir}_*_MOV2_eyetrack.asc \
        ${newsub}/ses-7T1/func/${newsub}_ses-7T1_task-MOVIE2_recording-eyetracking_physio.asc || true
    git mv -fk ${subdir}/*/*/*MOVIE2*/*/EYETRACKER/${subdir}_*_MOV2_eyetrack_summary.csv \
        ${newsub}/ses-7T1/func/${newsub}_ses-7T1_task-MOVIE2_recording-eyetracking_physio.csv || true
    git mv -fk ${subdir}/*/*/*MOVIE2*/filescans.csv \
        ${newsub}/ses-7T1/func/${newsub}_ses-7T1_task-MOVIE2_filescans.csv || true

    # rename 7T MOVIE3 files
    # fieldmap scans for MOVIE 3 & 4 are the same
    git mv -fk ${subdir}/*/*/*MOVIE3*/${subdir}_7T_SpinEchoFieldMap_AP.nii.gz \
        ${newsub}/ses-7T4/fmap/${newsub}_ses-7T4_dir-AP_run-2_epi.nii.gz || true
    git mv -fk ${subdir}/*/*/*MOVIE3*/${subdir}_7T_SpinEchoFieldMap_PA.nii.gz \
        ${newsub}/ses-7T4/fmap/${newsub}_ses-7T4_dir-PA_run-2_epi.nii.gz || true
    git mv -fk ${subdir}/*/*/*MOVIE3*/${subdir}_7T_tfMRI_MOVIE3_PA.nii.gz \
        ${newsub}/ses-7T4/func/${newsub}_ses-7T4_task-MOVIE3_dir-PA_bold.nii.gz || true
    git mv -fk ${subdir}/*/*/*MOVIE3*/${subdir}_7T_tfMRI_MOVIE3_PA_SBRef.nii.gz \
        ${newsub}/ses-7T4/func/${newsub}_ses-7T4_task-MOVIE3_dir-PA_sbref.nii.gz || true
    git mv -fk ${subdir}/*/*/*MOVIE3*/*/BEHAV/${subdir}_7T_MOV3_behav.xml \
        ${newsub}/ses-7T4/func/${newsub}_ses-7T4_task-MOVIE3_behav.xml || true
    git mv -fk ${subdir}/*/*/*MOVIE3*/*/EYETRACKER/${subdir}_7T_MOV3_eyetrack.asc \
        ${newsub}/ses-7T4/func/${newsub}_ses-7T4_task-MOVIE3_recording-eyetracking_physio.asc || true
    git mv -fk ${subdir}/*/*/*MOVIE3*/*/EYETRACKER/${subdir}_7T_MOV3_eyetrack_summary.csv \
        ${newsub}/ses-7T4/func/${newsub}_ses-7T4_task-MOVIE3_recording-eyetracking_physio.csv || true
    git mv -fk ${subdir}/*/*/*MOVIE3*/filescans.csv \
        ${newsub}/ses-7T4/func/${newsub}_ses-7T4_task-MOVIE3_filescans.csv || true

    # rename 7T MOVIE4 files
    # fieldmap scans for MOVIE 3 & 4 are the same
    git mv -fk ${subdir}/*/*/*MOVIE4*/${subdir}_7T_SpinEchoFieldMap_AP.nii.gz \
        ${newsub}/ses-7T4/fmap/${newsub}_ses-7T4_dir-AP_run-2_epi.nii.gz || true
    git mv -fk ${subdir}/*/*/*MOVIE4*/${subdir}_7T_SpinEchoFieldMap_PA.nii.gz \
        ${newsub}/ses-7T4/fmap/${newsub}_ses-7T4_dir-PA_run-2_epi.nii.gz || true
    git mv -fk ${subdir}/*/*/*MOVIE4*/${subdir}_7T_tfMRI_MOVIE4_AP.nii.gz \
        ${newsub}/ses-7T4/func/${newsub}_ses-7T4_task-MOVIE4_dir-AP_bold.nii.gz || true
    git mv -fk ${subdir}/*/*/*MOVIE4*/${subdir}_7T_tfMRI_MOVIE4_AP_SBRef.nii.gz \
        ${newsub}/ses-7T4/func/${newsub}_ses-7T4_task-MOVIE4_dir-AP_sbref.nii.gz || true
    git mv -fk ${subdir}/*/*/*MOVIE4*/*/BEHAV/${subdir}_7T_MOV4_behav.xml \
        ${newsub}/ses-7T4/func/${newsub}_ses-7T4_task-MOVIE4_behav.xml || true
    git mv -fk ${subdir}/*/*/*MOVIE4*/*/EYETRACKER/${subdir}_7T_MOV4_eyetrack.asc \
        ${newsub}/ses-7T4/func/${newsub}_ses-7T4_task-MOVIE4_recording-eyetracking_physio.asc || true
    git mv -fk ${subdir}/*/*/*MOVIE4*/*/EYETRACKER/${subdir}_7T_MOV4_eyetrack_summary.csv \
        ${newsub}/ses-7T4/func/${newsub}_ses-7T4_task-MOVIE4_recording-eyetracking_physio.csv || true
    git mv -fk ${subdir}/*/*/*MOVIE4*/filescans.csv \
        ${newsub}/ses-7T4/func/${newsub}_ses-7T4_task-MOVIE4_filescans.csv || true

    # rename 7T REST1 files
    git mv -fk ${subdir}/*/*/*REST1*/${subdir}_7T_SpinEchoFieldMap_AP.nii.gz \
        ${newsub}/ses-7T1/fmap/${newsub}_ses-7T1_dir-AP_run-1_epi.nii.gz || true
    git mv -fk ${subdir}/*/*/*REST1*/${subdir}_7T_SpinEchoFieldMap_PA.nii.gz \
        ${newsub}/ses-7T1/fmap/${newsub}_ses-7T1_dir-PA_run-1_epi.nii.gz || true
    git mv -fk ${subdir}/*/*/*REST1*/${subdir}_7T_rfMRI_REST1_PA.nii.gz \
        ${newsub}/ses-7T1/func/${newsub}_ses-7T1_task-REST1_dir-PA_bold.nii.gz || true
    git mv -fk ${subdir}/*/*/*REST1*/${subdir}_7T_rfMRI_REST1_PA_SBRef.nii.gz \
        ${newsub}/ses-7T1/func/${newsub}_ses-7T1_task-REST1_dir-PA_sbref.nii.gz || true
    git mv -fk ${subdir}/*/*/*REST1*/*/BEHAV/${subdir}_7T_REST1_behav.xml \
        ${newsub}/ses-7T1/func/${newsub}_ses-7T1_task-REST1_behav.xml || true
    # subject 169040 has a typo in the eyetrack filenames
    git mv -fk ${subdir}/*/*/*REST1*/*/EYETRACKER/${subdir}_*_REST1_eyetrack.asc \
        ${newsub}/ses-7T1/func/${newsub}_ses-7T1_task-REST1_recording-eyetracking_physio.asc || true
    git mv -fk ${subdir}/*/*/*REST1*/*/EYETRACKER/${subdir}_*_REST1_eyetrack_summary.csv \
        ${newsub}/ses-7T1/func/${newsub}_ses-7T1_task-REST1_recording-eyetracking_physio.csv || true
    git mv -fk ${subdir}/*/*/*REST1*/filescans.csv \
        ${newsub}/ses-7T1/func/${newsub}_ses-7T1_task-REST1_filescans.csv || true

    # rename 7T REST2 files
    git mv -fk ${subdir}/*/*/*REST2*/${subdir}_7T_SpinEchoFieldMap_AP.nii.gz \
        ${newsub}/ses-7T2/fmap/${newsub}_ses-7T2_dir-AP_run-1_epi.nii.gz || true
    git mv -fk ${subdir}/*/*/*REST2*/${subdir}_7T_SpinEchoFieldMap_PA.nii.gz \
        ${newsub}/ses-7T2/fmap/${newsub}_ses-7T2_dir-PA_run-1_epi.nii.gz || true
    git mv -fk ${subdir}/*/*/*REST2*/${subdir}_7T_rfMRI_REST2_AP.nii.gz \
        ${newsub}/ses-7T2/func/${newsub}_ses-7T2_task-REST2_dir-AP_bold.nii.gz || true
    git mv -fk ${subdir}/*/*/*REST2*/${subdir}_7T_rfMRI_REST2_AP_SBRef.nii.gz \
        ${newsub}/ses-7T2/func/${newsub}_ses-7T2_task-REST2_dir-AP_sbref.nii.gz || true
    git mv -fk ${subdir}/*/*/*REST2*/*/BEHAV/${subdir}_7T_REST2_behav.xml \
        ${newsub}/ses-7T2/func/${newsub}_ses-7T2_task-REST2_behav.xml || true
    # subject 116726 has a typo in the eyetrack filenames
    git mv -fk ${subdir}/*/*/*REST2*/*/EYETRACKER/${subdir}_*_REST2_eyetrack.asc \
        ${newsub}/ses-7T2/func/${newsub}_ses-7T2_task-REST2_recording-eyetracking_physio.asc || true
    git mv -fk ${subdir}/*/*/*REST2*/*/EYETRACKER/${subdir}_*_REST2_eyetrack_summary.csv \
        ${newsub}/ses-7T2/func/${newsub}_ses-7T2_task-REST2_recording-eyetracking_physio.csv || true
    git mv -fk ${subdir}/*/*/*REST2*/filescans.csv \
        ${newsub}/ses-7T2/func/${newsub}_ses-7T2_task-REST2_filescans.csv || true

    # rename 7T REST3 files
    git mv -fk ${subdir}/*/*/*REST3*/${subdir}_7T_SpinEchoFieldMap_AP.nii.gz \
        ${newsub}/ses-7T3/fmap/${newsub}_ses-7T3_dir-AP_run-1_epi.nii.gz || true
    git mv -fk ${subdir}/*/*/*REST3*/${subdir}_7T_SpinEchoFieldMap_PA.nii.gz \
        ${newsub}/ses-7T3/fmap/${newsub}_ses-7T3_dir-PA_run-1_epi.nii.gz || true
    git mv -fk ${subdir}/*/*/*REST3*/${subdir}_7T_rfMRI_REST3_PA.nii.gz \
        ${newsub}/ses-7T3/func/${newsub}_ses-7T3_task-REST3_dir-PA_bold.nii.gz || true
    git mv -fk ${subdir}/*/*/*REST3*/${subdir}_7T_rfMRI_REST3_PA_SBRef.nii.gz \
        ${newsub}/ses-7T3/func/${newsub}_ses-7T3_task-REST3_dir-PA_sbref.nii.gz || true
    git mv -fk ${subdir}/*/*/*REST3*/*/BEHAV/${subdir}_7T_REST3_behav.xml \
        ${newsub}/ses-7T3/func/${newsub}_ses-7T3_task-REST3_behav.xml || true
    git mv -fk ${subdir}/*/*/*REST3*/*/EYETRACKER/${subdir}_7T_REST3_eyetrack.asc \
        ${newsub}/ses-7T3/func/${newsub}_ses-7T3_task-REST3_recording-eyetracking_physio.asc || true
    git mv -fk ${subdir}/*/*/*REST3*/*/EYETRACKER/${subdir}_7T_REST3_eyetrack_summary.csv \
        ${newsub}/ses-7T3/func/${newsub}_ses-7T3_task-REST3_recording-eyetracking_physio.csv || true
    git mv -fk ${subdir}/*/*/*REST3*/filescans.csv \
        ${newsub}/ses-7T3/func/${newsub}_ses-7T3_task-REST3_filescans.csv || true

    # rename 7T REST4 files
    git mv -fk ${subdir}/*/*/*REST4*/${subdir}_7T_SpinEchoFieldMap_AP.nii.gz \
        ${newsub}/ses-7T4/fmap/${newsub}_ses-7T4_dir-AP_run-1_epi.nii.gz || true
    git mv -fk ${subdir}/*/*/*REST4*/${subdir}_7T_SpinEchoFieldMap_PA.nii.gz \
        ${newsub}/ses-7T4/fmap/${newsub}_ses-7T4_dir-PA_run-1_epi.nii.gz || true
    git mv -fk ${subdir}/*/*/*REST4*/${subdir}_7T_rfMRI_REST4_AP.nii.gz \
        ${newsub}/ses-7T4/func/${newsub}_ses-7T4_task-REST4_dir-AP_bold.nii.gz || true
    git mv -fk ${subdir}/*/*/*REST4*/${subdir}_7T_rfMRI_REST4_AP_SBRef.nii.gz \
        ${newsub}/ses-7T4/func/${newsub}_ses-7T4_task-REST4_dir-AP_sbref.nii.gz || true
    git mv -fk ${subdir}/*/*/*REST4*/*/BEHAV/${subdir}_7T_REST4_behav.xml \
        ${newsub}/ses-7T4/func/${newsub}_ses-7T4_task-REST4_behav.xml || true
    git mv -fk ${subdir}/*/*/*REST4*/*/EYETRACKER/${subdir}_7T_REST4_eyetrack.asc \
        ${newsub}/ses-7T4/func/${newsub}_ses-7T4_task-REST4_recording-eyetracking_physio.asc || true
    git mv -fk ${subdir}/*/*/*REST4*/*/EYETRACKER/${subdir}_7T_REST4_eyetrack_summary.csv \
        ${newsub}/ses-7T4/func/${newsub}_ses-7T4_task-REST4_recording-eyetracking_physio.csv || true
    git mv -fk ${subdir}/*/*/*REST4*/filescans.csv \
        ${newsub}/ses-7T4/func/${newsub}_ses-7T4_task-REST4_filescans.csv || true

    # get rid of the old dir
    git rm -r ${subdir} &> /dev/null || rm -rf ${subdir}
done

# rename README
git mv -fk README.md README

# let git-annex ensure all file pointers are proper
git annex fsck -q

# create dataset_description.json, if there is none
[ -f dataset_description.json ] && exit 0

cat >> dataset_description.json << EOT
{
    "Name": "HCP Movies",
    "BIDSVersion": "1.6.0",
    "DatasetType": "raw",
    "Authors": [
      "Bruce Rosen",
      "Arthur W. Toga",
      "Van J. Weeden"
    ],
    "HowToAcknowledge": "Acknowledge the HCP project as a source of data and include language similar to the following: 'Data collection and sharing for this project was provided by the Human Connectome Project (HCP; Principal Investigators: Bruce Rosen, M.D., Ph.D., Arthur W. Toga, Ph.D., Van J. Weeden, MD). HCP funding was provided by the National Institute of Dental and Craniofacial Research (NIDCR), the National Institute of Mental Health (NIMH), and the National Institute of Neurological Disorders and Stroke (NINDS). HCP data are disseminated by the Laboratory of Neuro Imaging at the University of Southern California.'",
    "Funding": [
      "National Institute of Dental and Craniofacial Research (NIDCR)",
      "National Institute of Mental Health (NIMH)",
      "National Institute of Neurological Disorders and Stroke (NINDS)"
    ],
    "ReferencesAndLinks": [
      "https://www.humanconnectome.org/study/hcp-young-adult/document/1200-subjects-data-release"
    ]
}
EOT

# create .bidsignore file, if there is none
[ -f .bidsignore ] && exit 0

cat >> .bidsignore << EOT
DATA_USE_AGREEMENT.md
sub-*/ses-3T/anat/sub-*_ses-3T_AFI.nii.gz
sub-*/ses-3T/anat/sub-*_ses-3T_BIAS_32CH.nii.gz
sub-*/ses-3T/anat/sub-*_ses-3T_BIAS_BC.nii.gz
sub-*/ses-*/func/sub-*_ses-*_task-*_behav.xml
sub-*/ses-*/func/sub-*_ses-*_task-*_recording-eyetracking_physio.*
sub-*/ses-*/func/*filescans.csv
EOT

# create top-level metadata files, if there are none
for task in MOVIE1 MOVIE2 MOVIE3 MOVIE4 REST1 REST2 REST3 REST4; do
    [ -f task-${task}_bold.json ] && exit 0
    cat >> task-${task}_bold.json << EOT
{
   "TaskName": "${task}",
   "RepetitionTime": 1,
   "EchoTime": 0.0222
}
EOT
done

[ -f phasediff.json ] && exit 0
cat >> phasediff.json << EOT
{
   "EchoTime1": 0.00408,
   "EchoTime2": 0.0051
}
EOT

[ -f dir-AP_epi.json ] && exit 0
cat >> dir-AP_epi.json << EOT
{
   "PhaseEncodingDirection": "j",
   "TotalReadoutTime": 0.0544
}
EOT

[ -f dir-PA_epi.json ] && exit 0
cat >> dir-PA_epi.json << EOT
{
   "PhaseEncodingDirection": "j-",
   "TotalReadoutTime": 0.0544
}
EOT
