#!/usr/bin/env Rscript

## Load librares ----
require(optparse)

## Process command-line parameters ----
option_list = list(
  optparse::make_option(c("-r", "--rootdir"), type="character", default=NULL, 
                        help="full path to root directory", metavar="character"),
  optparse::make_option(c("-d", "--debug"), action="store_true", default = FALSE, dest = 'debug', 
                        help="Print extra output")
); 

opt_parser = optparse::OptionParser(option_list=option_list);
opt = optparse::parse_args(opt_parser)

if (is.null(opt$rootdir)){
  optparse::print_help(opt_parser)
  stop("Please supply a full path to root directory with data to analyse.\n", call.=FALSE)
}

## Assign global params ----
lPar = list()

lPar$dir.root = opt$rootdir
cat(sprintf('Working in:\n%s\n\n', lPar$dir.root))

if (opt$debug)
  cat('\nEntering debug mode. More output...\n\n')

## Analyse data ----

if (opt$debug)
  cat('\nAnalysis finished...\n\n')