# bash experiments/imagenet-r.sh
# experiment settings
DATASET=ImageNet_A
N_CLASS=200

# save directory
OUTDIR=outputs/${DATASET}/10-task

# hard coded inputs
GPUID='0'
CONFIG=configs/imnet-a_prompt.yaml
REPEAT=1
OVERWRITE=0

###############################################################

# process inputs
mkdir -p $OUTDIR

# CODA-P
#
# prompt parameter args:
#    arg 1 = prompt component pool size
#    arg 2 = prompt length
#    arg 3 = ortho penalty loss weight - with updated code, now can be 0!
python -u run.py --config $CONFIG --gpuid $GPUID --repeat $REPEAT --overwrite $OVERWRITE \
    --learner_type prompt --learner_name CODAPrompt \
    --prompt_param 100 8 0.0 \
    --log_dir ${OUTDIR}/coda-p