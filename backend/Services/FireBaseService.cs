using Firebase.Auth;
using Firebase.Storage;

namespace backend.Services{
    public class FireBaseService{
        private static string apiKey = "AIzaSyB2YO8qiqCJpO1RswmujgFP_WwENhTSUWY";
        private static string bucket = "mern-project-a8fcd.appspot.com";
        private static string authEmail = "prn_project@gmail.com";
        private static string authPassword = "123@123";
        
        public async Task<string> UploadFile(string filePath){
            // Get any Stream - it can be FileStream, MemoryStream or any other type of Stream
            var stream = File.Open(filePath, FileMode.Open);

            //authentication
            var auth = new FirebaseAuthProvider(new FirebaseConfig(apiKey));
            var a = await auth.SignInWithEmailAndPasswordAsync(authEmail, authPassword);
            
            
            
            // Constructr FirebaseStorage, path to where you want to upload the file and Put it there
            var task = new FirebaseStorage(
                bucket,
                new FirebaseStorageOptions
                {
                    AuthTokenAsyncFactory = () => Task.FromResult(a.FirebaseToken),
                    ThrowOnCancel = true,
                })
                .Child("FoodPictures")
                .Child(filePath.Split('\\').Last())
                .PutAsync(stream);

            // Track progress of the upload
            // task.Progress.ProgressChanged += (s, e) => Console.WriteLine($"Progress: {e.Percentage} %");

            // await the task to wait until upload completes and get the download url
            var downloadUrl = await task;
            return downloadUrl;
        }
        
    }
}