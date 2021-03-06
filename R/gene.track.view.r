#' 
#' Plot genome tracks in local genomic regions
#' @param chr (character) chromosome (e.g chr9)
#' @param start (numeric) genomic coordinate from specified chromosome to start plotting
#' @param end (numeric) genomic coordinate from specified chromosome to stop plotting
#' @param symbol (character) gene acceoted hgnc symbol to retrieve coordinates and area plotting ()
#' @param upstr (numeric) distance upstream specified gene to extend the area plotted
#' @param dnstr (numeric) distance downstream specified gene to extend the area plotted
#' @param genome.v (hg19 or hg38) reference genome version to draw chromosome limits and centromeres
#' @param addlegend (logic) 
#' @param addtext (logic) 
#' @param plot (logic)
#' @param summary (logic) whether the function shoud return CNV segment 'segbrk' and SV 'svbrk' breakpoints tabular output
#' @return a data.frame with gene isoform annotations and/or plot into open device
#' @param ... additional plot parameters from graphics plot function 
#' @keywords CNV, segmentation
#' @export
#' @examples
#' 
#' gene.track.view(symbol="PTPRD", genome.v="hg19")


gene.track.view <- function(chr=NULL, start=NULL, stop=NULL, 
                       symbol=NULL,upstr=NULL,dnstr=NULL,
                       genome.v="hg19",
                       cex.text=0.6,
                       addtext=TRUE,
                       plot = TRUE,
                       summary=TRUE,
                       ...){
    
    if(genome.v %in% c("hg19","GRCh37")){
        refseq <- refseq_hg19
        refseq@data <- refseq@data[order(refseq@data$txStart)]
        refseq_gr <- with(refseq@data, GRanges(chrom, IRanges(start=txStart, end=txEnd), symbol=name2,transcript=name)) 
    }else if(genome.v %in% c("hg38","GRCh38")){
        refseq <- refseq_hg38
        refseq@data <- refseq@data[order(refseq@data$txStart),]
        refseq_gr <- with(refseq@data, GRanges(chrom, IRanges(start=txStart, end=txEnd), symbol=name2,transcript=name)) 
    }else{stop("Unspecified, or non available genome")}
    
    # define genomic region to plot
    if(!is.null(symbol) && symbol %in% refseq@data$name2){
        isonames <- refseq@data$name2[which(refseq@data$name2 == symbol)]
        names(isonames) <- refseq@data$name[which(refseq@data$name2 == symbol)]
        
        strand <- refseq@data$strand[which(refseq@data$name2 == symbol)][1]
        if(is.null(upstr)) upstr= 10000
        if(is.null(dnstr)) dnstr= 5000
        chr <- unique(refseq@data$chrom[which(refseq@data$name2 == symbol)])
        if(strand == "-"){
            start <- min(refseq@data$txStart[which(refseq@data$name2 == symbol)]) - dnstr
            stop <- max(refseq@data$txEnd[which(refseq@data$name2 == symbol)]) + upstr
        }else{
            start <- min(refseq@data$txStart[which(refseq@data$name2 == symbol)]) - upstr
            stop <- max(refseq@data$txEnd[which(refseq@data$name2 == symbol)]) + dnstr
        }
    }else if(!is.null(chr) && !is.null(start) && !is.null(stop)){
        coordgr <- with(data.frame(chr,start,stop), GRanges(chr, IRanges(start=start, end=stop))) 
        isonames <- refseq_gr[queryHits(GenomicAlignments::findOverlaps(refseq_gr,coordgr))]@elementMetadata$symbol
        names(isonames) <- refseq_gr[queryHits(GenomicAlignments::findOverlaps(refseq_gr,coordgr))]@elementMetadata$transcript
        if(length(isonames) == 0) stop("There is no transcripts in specified coordinates!")        
    }else{
        stop("Genomic coordinates or a valid hgnc gene symbol must be provided!")
    }
    
    isonames_list <- sapply(unique(isonames), function(i) names(which(isonames==i)),simplify = FALSE)
    exons_coord <- sapply(names(isonames), function(i) cbind(refseq@exonStarts[[i]],refseq@exonEnds[[i]]) ,simplify = FALSE)
    refseq_df <- refseq@data[which(refseq@data$name %in% names(exons_coord)),]
    rownames(refseq_df) <- names(exons_coord)
if(plot == TRUE){
    geneRanges <- t(sapply(names(isonames), function(i)
        c(min(refseq@data$txStart[which(refseq@data$name == i)]),max(refseq@data$txEnd[which(refseq@data$name == i)]))))

    hits <- findOverlaps(IRanges(geneRanges[,1],geneRanges[,2]))
    hitsNames  <- data.frame(names(isonames)[queryHits(hits)],names(isonames)[subjectHits(hits)])
    maxOverlaps <- max(table(hitsNames[,1]))
    
    ylimit <- 1 + 0.5*maxOverlaps
    plot(x=NULL,y=NULL,xlim=range(c(start,stop)),ylim=range(c(-1.5,ylimit)),
         xaxt='n',yaxt='n',xlab='',ylab='',bty='n',...)
    
    
    rect(-1e6,0,1e16,10000,col = "grey90")
    
    seqYpos <- rep(seq(0.1,ylimit,ylimit/maxOverlaps ),length(isonames_list)) +0.5
    isoct <- 0

    for(gene in names(isonames_list)){
        
        for(iso in isonames_list[[gene]]){
            isoct <- isoct +1
            ypos <- seqYpos[isoct]
            refseq_iso <-  refseq_df[which(refseq_df$name == iso)]
            
            iso_length <- refseq_iso$txEnd - refseq_iso$txStart
            plot_length <-  stop-start
            narrows <- ceiling(20*iso_length/plot_length)
            arrow_x <- seq(refseq_iso$txStart,refseq_iso$txEnd , iso_length/narrows)
            
            strandpos <- exons_coord[[iso]][1,1]-(stop-start)/100
            if(refseq_iso$strand == "-" ){ 
                points(strandpos, ypos, pch="-", col="red")
                arrows(arrow_x[2:(narrows+1)]+plot_length/200,rep(ypos,narrows), arrow_x[1:narrows],rep(ypos,narrows),length=0.1)
            }else if(refseq_iso$strand == "+" ){
                points(strandpos,ypos,pch="+",cex=1,col="blue")
                arrows(arrow_x[1:narrows]-plot_length/200,rep(ypos,narrows),arrow_x[2:(narrows+1)],rep(ypos,narrows),length=0.1)
            }
            
            lines(matrix(c(refseq_iso$txStart,refseq_iso$txEnd, ypos, ypos), 2, 2), lwd=2)
            
            bordercolor <- "black"; bgcolor<-"grey"
            for(i in 1:nrow(exons_coord[[iso]])){ 
                polygon(rbind(
                    c(exons_coord[[iso]][i,1],ypos+0.2),
                    c(exons_coord[[iso]][i,1],ypos-0.2),
                    c(exons_coord[[iso]][i,2],ypos-0.2),
                    c(exons_coord[[iso]][i,2],ypos+0.2)
                ),lwd=1,col=bgcolor,border=bordercolor)
            }
            if(addtext == TRUE){
                text(refseq_iso$txEnd,ypos,label=iso,cex=cex.text,pos=4)
            }
        }
    }
    
    interval <- round((stop - start)/5000) * 1000
    xlabs <- seq(floor(start/10000)*10000, ceiling(stop/10000)*10000,interval)
    axis(1, at = xlabs, lwd.ticks=1.5 ,pos=0, ...)
    mtext(gsub("chr","Chromosome ",chr), at=xlabs[1],side=1, cex=1)
    
}
    if(summary){
        return(
            refSeqDat(data=refseq@data[which(refseq@data$name %in% unlist(isonames_list))],
                exonStarts = refseq@exonStarts[unlist(isonames_list)],
                exonEnds = refseq@exonEnds[unlist(isonames_list)],
                genome.v=genome.v)
               )
    }
}

