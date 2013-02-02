using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

using System.IO;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Runtime.Serialization;
namespace Cascade.Web.Controllers
{
    public class CustomMultipartFormDataStreamProvider : MultipartFormDataStreamProvider
    {
        public CustomMultipartFormDataStreamProvider(string path)
            : base(path)
        {
        }

        public override string GetLocalFileName(System.Net.Http.Headers.HttpContentHeaders headers)
        {
            var name = !string.IsNullOrWhiteSpace(headers.ContentDisposition.FileName) ? headers.ContentDisposition.FileName : "NoName";
            return name.Replace("\"", string.Empty);
        }
    }
    [DataContract]
    public class FileDesc
    {
        [DataMember]
        public string name { get; set; }

        [DataMember]
        public string path { get; set; }

        [DataMember]
        public long size { get; set; }

        public FileDesc(string n, string p, long s)
        {
            name = n;
            path = p;
            size = s;
        }
    }
    public static class test
    {
        public static bool TryGetFormFieldValue(this IEnumerable<HttpContent> contents, string dispositionName, out string formFieldValue)
        {
            if (contents == null)
            {
                throw new ArgumentNullException("contents");
            }

            HttpContent content = contents.FirstDispositionNameOrDefault(dispositionName);
            if (content != null)
            {
                formFieldValue = content.ReadAsStringAsync().Result;
                return true;
            }

            formFieldValue = null;
            return false;
        }
    }
    public class FileUploaderController : ApiController
    {
        public async Task<HttpResponseMessage> PostFile()
        {
            // Check if the request contains multipart/form-data.
            if (!Request.Content.IsMimeMultipartContent())
            {
                throw new HttpResponseException(new HttpResponseMessage( HttpStatusCode.UnsupportedMediaType));
            }

            string root = HttpContext.Current.Server.MapPath("~/App_Data");
            var provider = new MultipartFormDataStreamProvider(root);

            try
            {
                StringBuilder sb = new StringBuilder(); // Holds the response body

                // Read the form data and return an async task.
                await Request.Content.ReadAsMultipartAsync(provider);

                //// This illustrates how to get the form data.
                //foreach (var key in provider.FormData.AllKeys)
                //{
                //    foreach (var val in provider.FormData.GetValues(key))
                //    {
                //        sb.Append(string.Format("{0}: {1}\n", key, val));
                //    }
                //}

                //// This illustrates how to get the file names for uploaded files.
                //foreach (var file in provider.FileData)
                //{
                //    FileInfo fileInfo = new FileInfo(file.LocalFileName);
                //    sb.Append(string.Format("Uploaded file: {0} ({1} bytes)\n", fileInfo.Name, fileInfo.Length));
                //}
                return new HttpResponseMessage()
                {
                    //Content = new StringContent(sb.ToString())
                    Content = new StringContent("Uploaded....")
                };
            }
            catch (System.Exception e)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, e);
            }
        }
        //public async Task<HttpResponseMessage> Post()
        //{
        //    string folderName = "App_Data/UploadedFiles";
        //    string PATH = HttpContext.Current.Server.MapPath("~/" + folderName);
        //    string rootUrl = Request.RequestUri.AbsoluteUri.Replace(Request.RequestUri.AbsolutePath, String.Empty);

        //    if (Request.Content.IsMimeMultipartContent())
        //    {
        //        var streamProvider = new CustomMultipartFormDataStreamProvider(PATH);
        //        // Read the form data and return an async task.
        //        await Request.Content.ReadAsMultipartAsync(streamProvider);
        //        //var task = Request.Content.ReadAsMultipartAsync(streamProvider).ContinueWith<IEnumerable<FileDesc>>(t =>
        //        //{

        //        //    if (t.IsFaulted || t.IsCanceled)
        //        //    {
        //        //        throw new HttpResponseException(new HttpResponseMessage(HttpStatusCode.InternalServerError));
        //        //    }

        //        //    //var fileInfo = streamProvider.FileData.Select(i =>
        //        //    //{
        //        //    //    var info = new FileInfo(i.LocalFileName);
        //        //    //    return new FileDesc(info.Name, rootUrl + "/" + folderName + "/" + info.Name, info.Length / 1024);
        //        //    //});
        //        //    //return fileInfo;
        //        //});
        //        //return task;
        //    }
        //    else
        //    {
        //        throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotAcceptable, "This request is not properly formatted"));
        //    }
        //    return new HttpResponseMessage();

        //}


        //public async Task<List<string>> Post()
        //{
        //    // Check if the request contains multipart/form-data.
        //    if (!Request.Content.IsMimeMultipartContent())
        //    {
        //        throw new HttpResponseException(new HttpResponseMessage(HttpStatusCode.UnsupportedMediaType));
        //    }

        //    string root = HttpContext.Current.Server.MapPath("~/App_Data");
        //    var provider = new MultipartFormDataStreamProvider(root);
        //    MultipartFormDataStreamProvider streamProvider = new MultipartFormDataStreamProvider(root);
        //    List<string> result = new List<string>();
        //    try
        //    {
        //        IEnumerable<HttpContent> bodyparts = await Request.Content.ReadAsMultipartAsync(streamProvider);

        //        // The submitter field is the entity with a Content-Disposition header field with a "name" parameter with value "submitter"
        //        string submitter;
        //        if (!bodyparts.TryGetFormFieldValue("submitter", out submitter))
        //        {
        //            submitter = "unknown";
        //        }

        //        // Get a dictionary of local file names from stream provider.
        //        // The filename parameters provided in Content-Disposition header fields are the keys.
        //        // The local file names where the files are stored are the values.
        //        IDictionary<string, string> bodyPartFileNames = streamProvider.BodyPartFileNames;

        //        // Create response containing information about the stored files.
                
        //        result.Add(submitter);

        //        IEnumerable<string> localFiles = bodyPartFileNames.Select(kv => kv.Value);
        //        result.AddRange(localFiles);

                
        //    }
        //    catch (System.Exception e)
        //    {
        //        result.Add(e.Message); 
        //    }
        //    return result;
        //}

    }
}
#region comments
/*
public async Task<List<string>> PostMultipartStream()
   4:     {
   5:         // Verify that this is an HTML Form file upload request
   6:         if (!Request.Content.IsMimeMultipartContent("form-data"))
   7:         {
   8:             throw new HttpResponseException(HttpStatusCode.UnsupportedMediaType);
   9:         }
  10:  
  11:         // Create a stream provider for setting up output streams that saves the output under c:\tmp\uploads
  12:         // If you want full control over how the stream is saved then derive from MultipartFormDataStreamProvider
  13:         // and override what you need.
  14:         MultipartFormDataStreamProvider streamProvider = new MultipartFormDataStreamProvider("c:\\tmp\\uploads");
  15:  
  16:         // Read the MIME multipart content using the stream provider we just created.
  17:         IEnumerable<HttpContent> bodyparts = await Request.Content.ReadAsMultipartAsync(streamProvider);
  18:  
  19:         // The submitter field is the entity with a Content-Disposition header field with a "name" parameter with value "submitter"
  20:         string submitter;
  21:         if (!bodyparts.TryGetFormFieldValue("submitter", out submitter))
  22:         {
  23:             submitter = "unknown";
  24:         }
  25:  
  26:         // Get a dictionary of local file names from stream provider.
  27:         // The filename parameters provided in Content-Disposition header fields are the keys.
  28:         // The local file names where the files are stored are the values.
  29:         IDictionary<string, string> bodyPartFileNames = streamProvider.BodyPartFileNames;
  30:  
  31:         // Create response containing information about the stored files.
  32:         List<string> result = new List<string>();
  33:         result.Add(submitter);
  34:  
  35:         IEnumerable<string> localFiles = bodyPartFileNames.Select(kv => kv.Value);
  36:         result.AddRange(localFiles);
  37:  
  38:         return result;
  39:     }
 */
#endregion