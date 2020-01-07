---
title: "svcnvplus_howto"
output: html_document
---



<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
  document.querySelector("h1").className = "title";
});
</script>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
  var links = document.links;  
  for (var i = 0, linksLength = links.length; i < linksLength; i++)
    if (links[i].hostname != window.location.hostname)
      links[i].target = '_blank';
});
</script>
<style type="text/css" scoped>
body {
  margin: 0px auto;
  max-width: 1134px;
  font-family: sans-serif;
  font-size: 10pt;
}

/* Table of contents style */

div#TOC ul {
  padding: 0px 0px 0px 45px;
  list-style: none;
  background-image: none;
  background-repeat: none;
  background-position: 0;
  font-size: 10pt;
  font-family: Helvetica, Arial, sans-serif;
}

div#TOC > ul {
  padding: 0px 150px 0px 65px;
  font-size: 12pt;
}

div#TOC > ul > li {
  padding: 5px 0px 0px 0px;
}

div#TOC ul ul {
  font-size: 11pt;
}

div#TOC.tocify ul {
  padding: 0px;
  font-size: inherit;
  font-family: inherit;
}

div#TOC.tocify li {
  padding: 5px;
  font-size: inherit;
  font-family: inherit;
}

p, dl {
  padding: 0px 150px 0px 65px;
  text-align: justify;
}

/* vertical content spacing */
p, img, table {
  margin-top: 10px;
  margin-bottom: 10px;
}

/* lists */
ol, ul {
  padding: 0px 150px 0px 100px;
  list-style: square;
}

li ol, li ul {
  padding: 0px 0px 0px 35px;
}

li p {
  padding: 0;
}

pre {
  margin: 0em 150px 0.5em 0em;
  padding: 0px 0px 0px 65px;
  border: 0px none;
  background-color: #f0f0f0;
  white-space: pre;
  overflow-x: auto;
  font-size: 90%;
}

li pre {
  margin: 0em 0px 0.5em -65px;
  padding: 0px 0px 0px 65px;
}
pre code {
  background-color: inherit;
  display: block;
  padding: 10px 10px 10px 0px;
  overflow-x: inherit;
  font-size: 100%;
}

/* markdown v1 */
pre code[class] {
  background-color: inherit;
}

/* markdown v2 */
pre[class] code {
  background-color: inherit;
}

tt, code, pre {
   font-family: 'DejaVu Sans Mono', 'Droid Sans Mono', 'Lucida Console', Consolas, Monaco, monospace;
}

h1, h2, h3, h4, h5, h6 { 
  font-family: Helvetica, Arial, sans-serif;
  margin: 1.2em 150px 0.6em 0em;
/* hanging headings */
  padding-left: 65px;
  text-indent: -65px;
}

h1.title {
  color: #87b13f;
  line-height: 1.1em;
  margin-top: 25px;
  border-bottom: 0px;
}

h1 {
  line-height: 1.4em;
  border-bottom: 1px #1a81c2 solid;
}

h1, h2, h3 {
  color: #1a81c2;
}

h1 {
  font-size: 18.0pt;
}

h2 {
  font-size: 14.5pt;
}

h3, h4 {
  font-size: 12pt;
}

span.header-section-number {
  float: left;
  width: 65px;
}

/* document header */

p.author-name {
  font-size: 14.5pt;
  font-weight: bold;
  font-style: italic;
  text-align: left;
}

.date {
  text-indent: 0px;
  font-weight: bold;
}

.abstract, .package {
  font-weight: bold;
}

/* formatting of inline code */
code { 
  background-color: #f0f0f0;
  color: #404040;
  font-size: 90%;
}

/* figures */

.figure { 
  margin: 0em 0px 0.5em;
}

img {
  max-width: 100%;
  display: block;
  padding: 0px 150px 0px 130px;
}

p > img {
  padding-left: 65px;
  padding-right: 0px;
}

img.smallfigure {
  padding-left: 195px;
  padding-right: 280px;
}

p > img.smallfigure {
  padding-left: 130px;
  padding-right: 130px;
}

img.widefigure {
  padding-left: 65px;
  padding-right: 85px;
  margin-right: -65px;
}

p > img.widefigure {
  padding-left: 0px;
  padding-right: 0px;
  margin-right: -65px;
}

p.caption, caption {
  color: inherit;
  font-size: 8pt;
}

p.caption {
  padding-left: 130px;
  padding-right: 85px;
  margin-bottom: 20px;
}

caption {
  padding: 0px;
  margin-bottom: 10px;
  min-width: 583;
}
span.caption-title {
  color: #1a81c2;
  font-weight: bold;
}

span.caption-label {
  font-weight: bold;
}

/* tables */

table {
  margin-left: 130px;
  margin-right: 85px;
}

.table {
  max-width: 518px;
}

/* definition lists */

dd {
  margin-left: 65px;
  margin-bottom: 10px;
}

/* code folding buttons */

.code-folding-btn {
  position: relative;
  margin-top: -26px;
  top: 26px;
}

.col-md-12 {
  min-height: 0px;
}

/* footnotes as sidenotes */

.sidenote {
  float: right;
  clear: right;
  margin-right: -150px;
  width: 130px;
  margin-top: 0;
  margin-bottom: 1rem;
  font-size: 8pt;
  line-height: 1.3;
  vertical-align: baseline;
  position: relative;
  text-align: left;
}

.sidenote-number, .affil-mark {
  position: relative;
  vertical-align: super;
  font-size: 7.5pt;
  font-weight: normal;
  font-style: normal;
  line-height: normal;
}

input.margin-toggle { display: none; }

label.sidenote-number { display: inline; }

label.margin-toggle:not(.sidenote-number) { display: none; }

/* Class described in https://benjeffrey.com/posts/pandoc-syntax-highlighting-css
   Colours from https://gist.github.com/robsimmons/1172277 */

code > span.kw { color: #E07020; } /* Function calls */
code > span.dt { color: #404040; } /* Function args */
code > span.dv { color: #D02070; } /* DecVal (decimal values) */
code > span.bn { color: #d14; } /* BaseN */
code > span.fl { color: #D02070; } /* Float */
code > span.ch { color: #40A040; } /* Char */
code > span.st { color: #40A040; } /* String */
code > span.co { color: #808080; font-style: italic; } /* Comment */
code > span.ot { color: #2020F0; } /* Keywords */
code > span.al { color: #ff0000; font-weight: bold; } /* AlertToken */
code > span.fu { color: #E07020; } /* Function calls */ 
code > span.er { color: #FF0000; } /* ErrorTok */

code > span.identifier { color: #404040; }
code > span.number { color: #D02070; }
code > span.string { color: #40A040; }
code > span.comment { color: #808080; font-style: italic; }
code > span.keyword { color: #2020F0; }
code > span.literal { color: #2020F0; }
code > span.operator { color: #000000;}
code > span.paren { color: #000000;}

/* proper positioning of ggplotly graphics, see https://support.bioconductor.org/p/97609/ */

.js-plotly-plot .plotly {
  padding-left: 65px;
}
</style>
  


`svncvplus` is an R package designed for downstream analyses of DNA copy number variations (CNV) and other structural variants (SV).
CNV data can be derived from genotyping and CGH arrays, as well as next generation sequencing; different segmentation algorithms are used to obtain dosage variations (duplications and deletions) across the genome. Alternatively SV calls can be inferred from discordantly aligned reads from whole genome sequencing (WGS) using different algorithms (e.g [manta](https://github.com/Illumina/manta), [lumpy](https://github.com/arq5x/lumpy-sv), etc). SV calls provide linkage information from discordantly aligned reads and read pairs, allowing the discovery of chromosomal translocations and variants that do not necesarily involve dosage change, such as inversions and insertions.  Segmentation CNVs and alignment based SV calls produce orthogonal as well as complementary results. The integration of both data types can by highly informative to understand the somatic alterations driving many cancers and is essential to characterize complex chromosomal alterations such as chromothripsis and chromoplexy.
In summary, `svcnvplus` is a toolkit for the integration of SV datasets, visualization and characterization of complex somatic SVs.

## Index:

* [Install svcnvplus](#install-svcnvplus)
* [Input data](#input-data)
* [Validate data types](#validate-data-types)
    * [Validate segmentation data format](#validate-segmentation-data-format)
    * [Validate structural variant data format](#validate-structural-variant-data-format)
* [CNV analysys and visualization](#cnv-analysys-and-visualization)
    * [CNV frequency plot](#cnv-frequency-plot)
    * [Gene-level CNV](#gene-level-cnv)
    * [Percent genome change](#percent-genome-change)
* [Co-localization of breakpoints](#co\-localization-of-breakpoints)
* [Breakpoint burden](#breakpoint-burden)
* [Identification of shattered regions](#identification-of-shattered-regions)
    * [Chromosome shattering using segmentation data only](#chromosome-shattering-using-segmentation-data-only)
    * [Chromosome shattering using segmentation and SV data](#chromosome-shattering-using-segmentation-and-sv-data)
* [Recurrently shattered regions](#recurrently-shattered-regions)
    * [Recurrently shattered regions plot](#recurrently-shattered-regions-plot)
* [Recurrently altered genes](#recurrently-altered-genes)
    * [Amplifications and deep deletions](amplifications-and-deep-deletions)
    * [Recurrently altered genes using CNV breakpoints](#recurrently-altered-genes-using-cnv-breakpoints)
    * [Recurrently altered genes using SV breakpoints](#recurrently-altered-genes-using-sv-breakpoints)


## Install svcnvplus

Install development version from GitHub
devtools::install_github(gonzolgarcia/svcnvplus")

## Input data

Two data types are allowed:
    * CNV segmentation data
    * SV calls

To explore the basic functionalities of svcnvplus, several data.frames are included `svcnvplus::segdat_lung_ccle` and `svcnvplus::svdat_lung_ccle`. This data.frames contain information about CNV segments and structural variants respectively for lung cancer derived cell lines. This data was obtained from <https://depmap.org/portal/download/>. Both data.frames are lazy loaded with `svcnvplus`


```r
library(svcnvplus)
dim(nbl_segdat)
```

```
## [1] 17680     6
```

```r
head(nbl_segdat)
```

```
##   Sample Chromosome    Start      End Num_markers  Seg_CN
## 1 PAISNS          1    11000   833000         337 -0.0270
## 2 PAISNS          1   835000  2715000         916 -1.0257
## 3 PAISNS          1  2717000  5969000        1552 -0.8316
## 4 PAISNS          1  5971000 12481000        3256 -0.9593
## 5 PAISNS          1 12483000 12777000         148 -0.2305
## 6 PAISNS          1 12779000 15551000        1287 -0.0083
```

```r
dim(nbl_svdat)
```

```
## [1] 7366    8
```

```r
head(nbl_svdat)
```

```
##   TARGET.USI LeftChr LeftPosition LeftStrand RightChr RightPosition RightStrand Type
## 1     PAISNS    chr1     12481576          -     chr7     123358964           +  TRA
## 2     PAISNS    chr1    120543859          -     chr2      65103235           -  TRA
## 3     PAISNS    chr2    231680218          +    chr21      40045998           +  TRA
## 4     PAISNS    chr3     54814482          -    chr17      42657036           +  TRA
## 5     PAISNS    chr4     97761321          -     chr4      97765146           +  INV
## 6     PAISNS    chr4    190936134          +     chr9      68411170           +  TRA
```

## Validate data types

* `validate.seg()` check format for segmentation data.frame
* `validate.sv()` chrek format of a Structural variant data.frame

### Validate segmentation data format

Validate and format segmentation data.frame to be used by svcnvplus package toolkit


```r
segdf <- validate.seg(nbl_segdat)
head(segdf)
```

```
##   sample chrom    start      end probes segmean
## 1 PAISNS  chr1    11000   833000    337 -0.0270
## 2 PAISNS  chr1   835000  2715000    916 -1.0257
## 3 PAISNS  chr1  2717000  5969000   1552 -0.8316
## 4 PAISNS  chr1  5971000 12481000   3256 -0.9593
## 5 PAISNS  chr1 12483000 12777000    148 -0.2305
## 6 PAISNS  chr1 12779000 15551000   1287 -0.0083
```


### Validate structural variant data format 

Validate and format structural variant data.frame to be used by svcnvplus package toolkit


```r
svdf <- validate.sv(nbl_svdat)
head(svdf)
```

```
##   sample chrom1      pos1 strand1 chrom2      pos2 strand2 svclass
## 1 PAISNS   chr1  12481576       -   chr7 123358964       +     TRA
## 2 PAISNS   chr1 120543859       -   chr2  65103235       -     TRA
## 3 PAISNS   chr2 231680218       +  chr21  40045998       +     TRA
## 4 PAISNS   chr3  54814482       -  chr17  42657036       +     TRA
## 5 PAISNS   chr4  97761321       -   chr4  97765146       +     INV
## 6 PAISNS   chr4 190936134       +   chr9  68411170       +     TRA
```

## CNV analysys and visualization

### CNV frequency plot

Visualization of CNV frequencies across the genome 




```r
cnv_freq <- cnv.freq.plot(segdf)  # plot cnv frequencies
```

<img src="figure/plot1-1.png" title="Genome wide CNV frequencies" alt="Genome wide CNV frequencies" style="display: block; margin: auto;" />


```r
head(cnv_freq$freqsum)  # data.frame contains every genomic bin 
```

```
##                       chr   start     end freq.gains freq.loss
## chr1_11000_1011000   chr1   11000 1011000 0.02962963 0.3333333
## chr1_1011000_2011000 chr1 1011000 2011000 0.02962963 0.3333333
## chr1_2011000_3011000 chr1 2011000 3011000 0.02222222 0.3333333
## chr1_3011000_4011000 chr1 3011000 4011000 0.02222222 0.3333333
## chr1_4011000_5011000 chr1 4011000 5011000 0.02222222 0.3407407
## chr1_5011000_6011000 chr1 5011000 6011000 0.02222222 0.3407407
```

### Gene level CNV

Generate a matrix with gene level CNVs from a segmentation file


```r
gene_cnv <- gene.cnv(segdf_clean,genome.v = "hg19",fill.gaps = TRUE,verbose=FALSE)
```

```r
dim(gene_cnv$cnvmat)
```

```
## [1] 22886   135
```


### Percent genome change

Returns per sample percentage of genome with CNV 


```r
pct_change <- pct.genome.changed(segdf)
```

## Co-localization of breakpoints

CNVs (duplications and deletions) are a subset of all structural variants; Both CNV segmentation profiles and structural variants derived from discordant alignments produce orthogonal calls for these genomic events. The function `match.variant.breaks` allows identifying common breakpoints called by both approaches.


```r
common.breaks <- match.variant.breaks(segdf,svdf,maxgap=50000,low.cov = NULL,verbose=FALSE)
```

```
## Error in match.variant.breaks(segdf, svdf, maxgap = 50000, low.cov = NULL, : could not find function "match.variant.breaks"
```

```r
restab <- data.frame(common.breaks$restab)[order(common.breaks$restab$total.sv),]
```

```
## Error in data.frame(common.breaks$restab): object 'common.breaks' not found
```

```r
m2 <- sprintf("%.1f",100*mean(restab$matched.sv/restab$total.sv))
```

```
## Error in mean(restab$matched.sv/restab$total.sv): object 'restab' not found
```

```r
barplot(rbind(restab$matched.sv,restab$total.sv - restab$matched.sv),
        border=NA,las=2,xlab="",horiz=FALSE,cex.main=.7,cex.names=.4, names=rownames(restab))
```

```
## Error in eval(quote(list(...)), env): object 'restab' not found
```

```r
legend("top",paste("SV breaks matched by CNV breaks\n","Average = ",m2,"%",sep=""),bty='n')
```

```
## Error in eval(quote(list(...)), env): object 'm2' not found
```

```r
grid(ny=NULL,nx=NA)
```

```
## Error in int_abline(a = a, b = b, h = h, v = v, untf = untf, ...): plot.new has not been called yet
```

## Breakpoint burden

In addition to percent genome changes, we can measure the total burden of breakpoints derived from CNV segments and SV calls


```r
sv_breaks_df  <- sv.breaks(svdf)  # define breakpoints from SV data
sv_burden <- table(sv_breaks_df$sample)
seg_breaks_df  <- seg.breaks(segdf,fc.pct = 0.2,verbose=FALSE)  # define breakpoints from seg data based on certain CNV change cutoff
seg_burden <- table(seg_breaks_df$sample)
common_samples <- intersect(names(sv_burden),names(seg_burden))
dat <- cbind(sv_burden[common_samples],seg_burden[common_samples])
plot(dat,xlab="SV burden",ylab="CNV breakpoint burden")
```

```
## Warning in min(x): no non-missing arguments to min; returning Inf
```

```
## Warning in max(x): no non-missing arguments to max; returning -Inf
```

```
## Warning in min(x): no non-missing arguments to min; returning Inf
```

```
## Warning in max(x): no non-missing arguments to max; returning -Inf
```

```
## Error in plot.window(...): need finite 'xlim' values
```

<img src="figure/plot3-1.png" title="SV versus CNV breakpoint burden" alt="SV versus CNV breakpoint burden" style="display: block; margin: auto;" />

```r
legend("topright",paste("cor=",cor(dat)[1,2], sep=""))
```


## Identification of shattered regions

Complex chromosomal rearrangements such as chromothripsis and chromoplexy are widespread events in many cancers and may have important pathogenic roles. `svcnvplus` incorporates tools to map and visualize shattered regions across multiple samples.

We used LUNG cancer cell line profiles from the CCLE in order to illustrated these tools:

Validate segmentation and SV data.frames

```r
segdf <- validate.seg(segdat_lung_ccle)
svdf <- validate.sv(svdat_lung_ccle)
```

### Chromosome shattering using segmentation data only

The whole genome is binned into user defined `window.size` (Mb) and slided by `slide.size` (Mb) in order to identify regions with high CNV breakpoint density. Two cutoffs are considered for each genomic bin:\n
    * num.breaks = the minimum number of breakpoints
    * num.sd = the number of standard deviations above the average within a sample
In addition, we evaluate the interquantile average of the distance between breakpoints in a given region:\n
    * dist.iqm.cut (default = 150000 b)


```r
shatt_lung_cnv <- shattered.regions.cnv(segdf, fc.pct = 0.2, clean.brk = 4, window.size = 10,
                                        slide.size = 2,num.breaks = 8, num.sd = 5,  
                                        dist.iqm.cut = 150000,verbose=FALSE)

shatt_lung_cnv$regions.summary$A549_LUNG
```

```
##   chrom     start       end nseg dist.iqm n.brk conf
## 1  chr1 110206904 112706144    5 115758.5     9   lc
## 2  chr3    377402  16241354    6 466057.7    22   HC
## 3  chr4 168970791 176576580    1 778410.0     8   HC
## 4  chr6  25347255  32530221    1 166325.0     8   HC
## 5  chr7 134278307 149847513    3 143582.3    13   lc
## 6 chr15  20586232  30894417    2 690287.2    10   HC
```


### Chromosome shattering using segmentation and SV data

Analogously we can combine CNVs and SVs breakpoins to obtain a more robust evaluation of chromosome shattering (see `?shattered.regions`) 
In addition SVs provide linkage for each SV breakpoint pair which allow for an additional parametter:\n
    * interleaved.cut the minimun percentage (0-1) of interleaved SVs
    





```r
shatt_lung <- shattered.regions(segdf, svdf, fc.pct = 0.2,  min.num.probes = 5, clean.brk = 8,
                                window.size = 10,slide.size = 2, num.seg.breaks = 6, 
                                num.seg.sd = 5, num.sv.breaks = 6, num.sv.sd = 5, 
                                num.common.breaks = 3, num.common.sd = 0, interleaved.cut = 0.33,
                                dist.iqm.cut = 100000,verbose=FALSE)
shatt_lung$regions.summary$SCLC21H_LUNG
```

```
##   chrom  start       end nseg links reg.size dist.iqm.seg dist.iqm.sv n.brk.seg n.brk.sv n.orth.seg n.orth.sv interleaved conf
## 1  chr8 601012 141936592   70     - 1.48e+08     151575.8    105171.7       567      668        446       489  0.02873563   HC
```

Circos plotting is available via [circlize](https://cran.r-project.org/web/packages/circlize/index.html) package wrapper function:


```r
circ.chromo.plot(shatt_lung,sample.id = "SCLC21H_LUNG")
```

<img src="figure/plot4-1.png" title="Circos plot representing c LUNG cancer cell line with chromothripsis" alt="Circos plot representing c LUNG cancer cell line with chromothripsis" style="display: block; margin: auto;" />

### Recurrently shattered regions

We evaluate the null hipothesis that shattered regions (genomic bins) may occour throughout the genome at random; To this end we first create an empirical null distribution based on the sample set we are studying. And compare with the observed distribution. This also allows to define an empirical FDR cutoff.


```r
fdr.test <- freq.p.test(shatt_lung_cnv$high.density.regions.hc, method="bonferroni", p.cut = 0.05)
```

### Recurrently shattered regions plot

We can visualize the aggregate map of shattered regions for all samples with `recurrent.regions.plot`


```r
recurrent.regions.plot(shatt_lung_cnv, fdr = fdr.test$freq.cut)
```

```
## Error in recurrent.regions.plot(shatt_lung_cnv, fdr = fdr.test$freq.cut): could not find function "recurrent.regions.plot"
```

And finally collect groups of samples with shattered chromosomes in recurrent regions as defined by a given fdr cutoff


```r
# obtain genomic bins within above the FDR cutoff
freq.matrix <- apply(shatt_lung_cnv$high.density.regions.hc,2,sum)
textRegions <- names(which(freq.matrix >= fdr.test$freq.cut))
hitRegions <- remove.factors((data.frame(do.call(rbind,strsplit(textRegions," ")))))
hitRegions[,2] <- as.numeric(hitRegions[,2])
hitRegions[,3] <- as.numeric(hitRegions[,3])
colnames(hitRegions) <- c("chr","start","end")
rownames(hitRegions) <-textRegions

# collapes contiguous bins into unique regions
bins2remove <- c()
for(i in 2:nrow(hitRegions)){ 
  if(hitRegions[i,"chr"] == hitRegions[i-1,"chr"] ){
    if(hitRegions[i,"start"] < (hitRegions[i-1,"end"])){
      hitRegions[i,"start"] <- hitRegions[i-1,"start"]
      bins2remove <- c(bins2remove,textRegions[i-1])
    }
  }
}
hitRegionsPost<- hitRegions[setdiff(rownames(hitRegions),bins2remove),]

require(GenomicRanges)
hitRegions_gr <- with(hitRegions, GRanges(chr, IRanges(start=start, end=end)))
hitRegionsPost_gr <- with(hitRegionsPost, GRanges(chr, IRanges(start=start, end=end)))
hits <-GenomicAlignments::findOverlaps(hitRegionsPost_gr,hitRegions_gr)

regList <- list()
for(i in unique(queryHits(hits))) regList[[paste(hitRegionsPost[i,],collapse=" ") ]] <- textRegions[subjectHits(hits)[which(queryHits(hits) == i)]]
# obtain the genomic bins with maximum number of samples
regListPeak <- lapply(regList, function(x) names(which(freq.matrix[x] == max(freq.matrix[x]))))
# collect samples with shattered region in the peaks 
regListPeakSamples <- lapply(regListPeak, function(x) names(which(apply(cbind(shatt_lung_cnv$high.density.regions.hc[,x]),1,sum) > 0)))
```

Beyond this point the user can test case/control hipothesys for chromosome shattering of specific genomic regions...

## Recurrently altered genes

### amplifications and deep deletions

### Recurrently altered genes using CNV breakpoints

Instead of focusing on high-level dosage changes, we evaluate whether CNV break ends overlap with known genes or upstream regions. 


```r
results_cnv <- cnv.gene.breaks(nbl_segdat, fc.pct = 0.2, genome.v="hg19",clean.brk = 8,upstr = 50000,verbose=FALSE)
```

```
## Error in cnv.gene.breaks(nbl_segdat, fc.pct = 0.2, genome.v = "hg19", : could not find function "cnv.gene.breaks"
```

We can obtain a ranking of altered genes by breakpoints overlapping their transcriptions start and end...

```r
barplot(sort(unlist(lapply(results_cnv$geneSamples,length)),decreasing=T)[1:20],las=2)
```

```
## Error in lapply(results_cnv$geneSamples, length): object 'results_cnv' not found
```

... or upstream (50Kb)

```r
barplot(sort(unlist(lapply(results_cnv$upstreamSamples,length)),decreasing=T)[1:20],las=2)
```

```
## Error in lapply(results_cnv$upstreamSamples, length): object 'results_cnv' not found
```

### Recurrently altered genes using SV breakpoints
