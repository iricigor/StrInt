using System.Management.Automation;

namespace StrInt
{
    [Cmdlet(VerbsCommon.Get,"StrIntPower")]
    [OutputType(typeof(string))]
    public class StrIntPowerCommand : PSCmdlet
    {
        [Parameter(
            Mandatory = true,
            Position = 0,
            ValueFromPipeline = true,
            ValueFromPipelineByPropertyName = true),
            ValidatePattern("^\\d+$")]
        public string[] Number { get; set; }

        [Parameter(
            Mandatory = true,
            Position = 1),
            ValidatePattern("^\\d+$")]
        public string Exponent { get; set; }

        // This method gets called once for each cmdlet in the pipeline when the pipeline starts executing
        protected override void BeginProcessing()
        {
            WriteVerbose("Begin!");
        }

        // This method will be called for each input received from the pipeline to this cmdlet; if no input is received, this method is not called
        protected override void ProcessRecord()
        {
            WriteVerbose("Processing...");
            foreach (string singleNumber in Number) {
                string result = Helper.Power(singleNumber, Exponent);
                WriteObject(result);
            }
        }

        // This method will be called once at the end of pipeline execution; if no input is received, this method is not called
        protected override void EndProcessing()
        {
            WriteVerbose("End!");
        }
    }
}
