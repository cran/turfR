\name{turf.combos}
\alias{turf.combos}
\title{Combination sets used in TURF analysis}
\description{Generate combination sets to be used in TURF analysis, formatted for use in \code{turf}. Can be used to generate
  all possible combinations of \emph{n} choose \emph{k} or Monte Carlo simulated subsets of combinations involving the same
  \emph{n} items.
}

\usage{
turf.combos(n, k, ...)
}

\arguments{
  \item{n}{Required. Scalar indicating the number of items to be included in the TURF algorithm; 0 < \emph{n} < (\code{ncol(data)} - 1).
    Non-integer values are coerced using \code{floor(}\emph{n}\code{)}.
  }
  \item{k}{Required. Vector of length 1 to \emph{n} containing any values 1 to \emph{n} indicating the combination sizes to be evaluated 
    by the TURF algorithm. Non-integer values are coerced using \code{floor(}\emph{k}\code{)}.
  }
  \item{...}{Optional. Additional arguments controlling behavior and output of the TURF algorithm. See \code{turf.args}. Arguments indicated
    here must match named arguments in \code{turf.args}.  
  }
}

\details{
  Generally, it is only necessary to call \code{turf.combos} independently of \code{turf} if the user wishes to manually modify combination sets 
  that will be evaluated. See \code{turf} and \code{turf.args} for additional information on usage.
} 

\value{
  A list of \code{length(}\emph{k}\code{)} elements, each of which is comprised of a \emph{p} x \emph{n} matrix of zeroes and ones. Rows
  (\emph{p}) are individual combinations to be evaluted by the TURF algorithm. Columns (\emph{n}) correspond to items and must be in the same
  order as the items variables in \code{data} submitted to TURF. Ones indicate that an item is included in a given combination. Each \emph{i}th 
  element contains only combinations of the size indicated by the \emph{i}th position of \emph{k}. 
}

\references{
  Adler, T.J., Smith, C. & Dumont, J. 2010. Optimizing product portfolios using discrete choice modeling and TURF. In: S. Hess,
  A. Daly (Eds), \emph{Choice modeling: the state-of-the-art and the state-of-practice; proceedings from the Inaugural 
  International Choice Modeling Conference}. Emerald Publishing Group Ltd., pp. 485-497.
  
  Krieger, A.M. & Green, P.E. 2000. Turf revisited: Enhancements to toal unduplicated reach and frequency analysis. \emph{Marketing
  Research}, 12, 30-36.
  
  Markowitz, L. 2005. Going beyond TURF to complement and extend existing product lines. \emph{Ipsos-Insight}, November 2005.
  
  Miaoulis, G., Free, V. & Parsons, H. 1990. TURF: A new planning approach for product line extensions. \emph{Marketing Research},
  March, pp. 28-40.
}

\examples{
  ##Example 1
  ##Generate all combinations of 3, 4, 5 and 6 items drawn from 10 items.
  ex1 <- turf.combos(10, 3:6)
  colSums(ex1[[2]])
 
  ##Example 2
  ##Pass additional arguments
  data(turf_ex_data)
  psims <- colSums(turf_ex_data[,-c(1:2)]) / sum(turf_ex_data[,2])
  psims <- psims / sum(psims)
  ex2 <- turf.combos(10, 4, mc=TRUE, nsims=100, psims=psims)
  colSums(ex2[[1]])  
  
}