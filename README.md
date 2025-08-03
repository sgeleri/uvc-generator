## UVC GENERATOR

UVC generator python script takes following UVM object/components as input:
    - driver
    - monitor
    - sequencer
    - agent
    - config
    - seqit
    - sequence base
    - package
    - interface

Script changes <name> object in all of the files with the given input name, adds header and footer, creates an folder named <name>_uvc and places the edited files here.

