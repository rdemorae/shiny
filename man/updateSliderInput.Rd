% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/update-input.R
\name{updateSliderInput}
\alias{updateSliderInput}
\title{Change the value of a slider input on the client}
\usage{
updateSliderInput(session, inputId, label = NULL, value = NULL,
  min = NULL, max = NULL, step = NULL)
}
\arguments{
\item{session}{The \code{session} object passed to function given to
\code{shinyServer}.}

\item{inputId}{The id of the input object.}

\item{label}{The label to set for the input object.}

\item{value}{The value to set for the input object.}

\item{min}{Minimum value.}

\item{max}{Maximum value.}

\item{step}{Step size.}
}
\description{
Change the value of a slider input on the client
}
\details{
The input updater functions send a message to the client, telling it to
change the settings of an input object. The messages are collected and sent
after all the observers (including outputs) have finished running.

The syntax of these functions is similar to the functions that created the
inputs in the first place. For example, \code{\link{numericInput}()} and
\code{updateNumericInput()} take a similar set of arguments.

Any arguments with NULL values will be ignored; they will not result in any
changes to the input object on the client.

For \code{\link{radioButtons}()}, \code{\link{checkboxGroupInput}()} and
\code{\link{selectInput}()}, the set of choices can be cleared by using
\code{choices=character(0)}.
}
\examples{
## Only run this example in interactive R sessions
if (interactive()) {
  shinyApp(
    ui = fluidPage(
      sidebarLayout(
        sidebarPanel(
          p("The first slider controls the second"),
          sliderInput("control", "Controller:", min=0, max=20, value=10,
                       step=1),
          sliderInput("receive", "Receiver:", min=0, max=20, value=10,
                       step=1)
        ),
        mainPanel()
      )
    ),
    server = function(input, output, session) {
      observe({
        val <- input$control
        # Control the value, min, max, and step.
        # Step size is 2 when input value is even; 1 when value is odd.
        updateSliderInput(session, "receive", value = val,
          min = floor(val/2), max = val+4, step = (val+1)\%\%2 + 1)
      })
    }
  )
}
}
\seealso{
\code{\link{sliderInput}}
}

