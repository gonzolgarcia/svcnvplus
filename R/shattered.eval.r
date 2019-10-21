#' 
#'
#' Evaluate shattered regions
#' @param chromo.regs (data.frame) segmentation data with 6 columns: sample, chromosome, start, end, probes, segment_mean
#' @param disp.cut (numeric) copy number change between 2 consecutive segments: i.e (default) cutoff = 0.2 represents a fold change of 0.8 or 1.2
#' @keywords chromothripsis, segmentation, structural variants
#' @export
#' @examples
#' shattered.eval()



shattered.eval <- function(chromo.regs,
                           disp.cut=0.05,
                           verbose=TRUE){
  
  svdat <- chromo.regs$svdat
  segbrk  <- chromo.regs$segbrk
  svbrk <- chromo.regs$svbrk
  
  linked_regions<-list()
  for(cl in names(chromo.regs$regions.summary)){
    if(verbose == TRUE) message(cl)
    regions <-   chromo.regs$regions.summary[[cl]]
    br1 <- segbrk[which(segbrk$sample == cl),2:3]
    br2 <- svbrk[which(svbrk$sample == cl),2:3]
    colnames(br1) <- colnames(br2) <- c("chrom","pos")
    br1.gr <- with(br1, GRanges(chrom, IRanges(start=pos, end=pos)))
    br2.gr <- with(br2, GRanges(chrom, IRanges(start=pos, end=pos)))
    regions_gr <- with(regions, GRanges(chrom, IRanges(start=start, end=end)))
    hits_1 = GenomicAlignments::findOverlaps(regions_gr,br1.gr)
    hits_2 = GenomicAlignments::findOverlaps(regions_gr,br2.gr)
    density.seg <- density.sv <- dist.iqm.seg <- dist.iqm.sv <- n.brek.seg <- n.brek.sv <-  rep(0,nrow(regions))
    for(i in 1:nrow(regions)){
      sites1 <- sort(unique(br1[subjectHits(hits_1)[which(queryHits(hits_1) == i)],"pos"]))
      density.seg[i] <- median(abs(sites1 - mean(sites1)))/(regions[i,"end"]-regions[i,"start"])
      dist.iqm.seg[i]  <- IQM(sites1[2:length(sites1)] - sites1[1:(length(sites1)-1) ],lowQ = 0.2,upQ = 0.8)
      n.brek.seg[i] <- length(sites1)  
      
      sites2 <- sort(unique(br2[subjectHits(hits_2)[which(queryHits(hits_2) == i)],"pos"]))
      density.sv[i] <- median(abs(sites2 - mean(sites2)))/(regions[i,"end"]-regions[i,"start"])
      dist.iqm.sv[i]  <- IQM(sites2[2:length(sites2)] - sites2[1:(length(sites2)-1) ],lowQ = 0.2,upQ = 0.8)
      n.brek.sv[i] <- length(sites2)  
      
    }    
    
    valid <- rep("lc",nrow(chromo.regs$regions.summary[[cl]]))

    if(nrow(chromo.regs$regions.summary[[cl]]) > 1 ){
      sv_ranges_ori <-   with(svdat[which(svdat$sample == cl),], GRanges(chrom1, IRanges(start=pos1, end=pos1)))
      sv_ranges_dest <-   with(svdat[which(svdat$sample == cl),], GRanges(chrom2, IRanges(start=pos2, end=pos2)))
      hits_ori = GenomicAlignments::findOverlaps(regions_gr,sv_ranges_ori)
      hits_dest = GenomicAlignments::findOverlaps(regions_gr,sv_ranges_dest)
      record_mat<- matrix(nrow=0,ncol=2)
      for(i in 1:nrow(regions)){
        for(j in 1:nrow(regions)){
          region_a_hits <- subjectHits(hits_ori)[which(queryHits(hits_ori) == i)]
          region_b_hits <- subjectHits(hits_dest)[which(queryHits(hits_dest) == j)]
          if(length(intersect(region_a_hits,region_b_hits)) > 0 ){
            record_mat <- rbind(record_mat,c(i,j),c(j,i))
          }
          
        }
      }
      links <- rep("",nrow(regions))
      csize <- rep(0,nrow(regions))
      
      for(i in 1:nrow(regions)){
        links[i] <- paste(as.character(sort(unique(c(i, record_mat[which(record_mat[,1] == i),2]) ))),collapse=",")
        csize[i] <- sum(regions[unique(c(i,record_mat[which(record_mat[,1] == i),2])),"end"] - regions[unique(c(i,record_mat[which(record_mat[,1] == i),2])),"start"] )
      }
      valid[sort(unique(c(intersect(which(density.seg >= disp.cut),which(density.sv >= disp.cut)),which(unlist(lapply(strsplit(as.character(links),","),length)) > 1))))] <-"HC"
      chromo.regs$regions.summary[[cl]] <- remove.factors(data.frame(regions,links,csize,density.seg,density.sv,dist.iqm.seg,dist.iqm.sv,n.brek.seg,n.brek.sv,valid))
    }else{
      csize <- regions[,"end"]-regions[,"start"]
      links <- "1"
      if(density.seg > disp.cut && density.sv > disp.cut) valid <- "HC"
      chromo.regs$regions.summary[[cl]] <- remove.factors(data.frame(regions,links,csize,density.seg,density.sv,dist.iqm.seg,dist.iqm.sv,n.brek.seg,n.brek.sv,valid))
    }
  }
  return(chromo.regs)
}

