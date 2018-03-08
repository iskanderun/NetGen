# script to test the link between Fortran and R

#' @export
star = function(a,b){
  ## res holds the results for the Fortran call
  res =.Fortran("multiply",as.integer(a),as.integer(b),c=integer(1))
  return(res$c)
}
