<?php


ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
$isRun = false;

// Start session
if(!session_id()){
    session_start();
}

require_once __DIR__ . '/vendor/autoload.php'; // change path as needed

    $fb = new Facebook\Facebook([
        'app_id' => '134977392095288',
        'app_secret' => 'f27dc8f13e1fcbaf202c9788b3ebbe64',
        'default_graph_version' => 'v2.10',
    ]);

     if($isRun){

                // Get redirect login helper
                $helper = $fb->getRedirectLoginHelper();

                  session_destroy();

                // Try to get access token
                try {
                    if(isset($_SESSION['facebook_access_token'])){
                        $accessToken = $_SESSION['facebook_access_token'];
                        echo $accessToken;
                    }else{
                          $accessToken = $helper->getAccessToken();
                          echo $accessToken;
                    }
                } catch(FacebookResponseException $e) {
                     echo 'Graph returned an error: ' . $e->getMessage();
                      exit;
                } catch(FacebookSDKException $e) {
                    echo 'Facebook SDK returned an error: ' . $e->getMessage();
                      exit;
                }

                $response = $fb->get('/me?fields=id,name,email', $accessToken );

                $user = $response->getGraphUser();

     }

$userId = '2017675818384643';
$accessToken = 'EAAB6wtZBCMDgBAOBtpYygZCsXvziTi85ZALRf0dvOcBl7vJx4SsxawJh037E9aQZCQfWCm3lYynns9M1B4vf9HvuMML7MrFTQZBdfnnb3jC0sJI63LWOWavgTPIZAZAHQlXa6t6TjPPs7UEwV5TYgyanm1KZCZC2JRi0gBjtJNMXtyi69CDTmGSGPWxfuAlqfiXttne06eZA50bQlD0pOhPtXQgtKOWw7eRnk7CZCXSxXed1AZDZD';


die('Hello Shiv!');

$pagesResponse = $fb->get('/me/accounts', $accessToken );
$pagesEdge     = $pagesResponse->getGraphEdge();
$pagesDecoded  = json_decode($pagesEdge);
$pages         = [];
foreach($pagesDecoded as $key => $page){
   array_push($pages,[
        'id' => $page->id,
        'access_token' => $page->access_token,
        'name' => $page->name,
   ]);
}


function uploadPhotos($fb,$accessToken,$pages,$photos)
{
    $photoIdArray = array();
    foreach($photos as $key => $photo) {
        $params = array(
            "url" => $photo,
            "published" => false
        );
        try {
            $postResponse = $fb->post('/' . $pages[0]['id'] . '/photos', $params , $pages[0]['access_token']);
            $photoId = $postResponse->getDecodedBody();
            if(!empty($photoId["id"])) {
                $photoIdArray[] = $photoId["id"];
            }
        } catch (FacebookResponseException $e) {
            // display error message
            //print $e->getMessage();
           // exit();
        } catch (FacebookSDKException $e) {
            //print $e->getMessage();
           // exit();
        }
    }
    return $photoIdArray;
}

function uploadVideos($fb,$accessToken,$pages,$videos)
{
    $videoIdArray = array();
    foreach($videos as $key => $video) {
        $params = array(
            "file_url" => $video,
            "published" => false
        );
        try {
            $videoResponse = $fb->post('/' . $pages[0]['id'] . '/videos', $params , $pages[0]['access_token']);
            $videoId = $videoResponse->getDecodedBody();
            if(!empty($videoId["id"])) {
                $videoIdArray[] = $videoId["id"];
            }
        } catch (FacebookResponseException $e) {
            // display error message
            //print $e->getMessage();
           // exit();
        } catch (FacebookSDKException $e) {
            //print $e->getMessage();
           // exit();
        }
    }
    return $videoIdArray;
}


 $photos = [ 
            "https://i.picsum.photos/id/437/536/354.jpg?hmac=9lVLK0-iKfpvTKsgUqGT6LsdfjFieOwvuJXx3L1UL_Q",
            "https://i.picsum.photos/id/924/536/354.jpg?hmac=Y6aefSHI4hWiyAyEVv0oAdD9aFeuNDOSSF-3q1Veeec",
            "https://i.picsum.photos/id/128/536/354.jpg?hmac=pCYNKsYogBpCUxVsJbYskR7nC2a1X2Y5YVgCtUOlX8E",
         ];
 
 $videos = [
       'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'
 ];

     // $photosIds = uploadPhotos($fb,$accessToken,$pages,$photos);
//        $photosIds  = uploadVideos($fb,$accessToken,$pages,$videos);
     die('Hello Shiv!');
     $params = [
       //  'link' => 'www.google.com',
         'message' => 'Messsage ' . rand('1000','9999'),
         'published' => true,
         'source' => $fb->videoToUpload('http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4')
     ];
     
     // foreach($photosIds as $k => $photoId) {
     //      $params["attached_media"][$k] = '{"media_fbid":"' . $photoId . '"}';
     // }

     echo '<pre>';
     print_r($params);
     die;

     
     try {
       $response = $fb->post('/' . $pages[0]['id'] . '/feed', $params , $pages[0]['access_token']);
     } catch(Facebook\Exceptions\FacebookResponseException $e) {
       echo 'Graph returned an error: '.$e->getMessage();
       exit;
     } catch(Facebook\Exceptions\FacebookSDKException $e) {
       echo 'Facebook SDK returned an error: '.$e->getMessage();
       exit;
     }

     $graphNode = $response->getGraphNode();
     echo '<pre>';
     print_r($graphNode);
     die;

// Create Post
// $data = [
//      'link' => 'www.google.com',
//      'message' => 'Your message here',
//      'source' => 'https://i.picsum.photos/id/925/200/300.jpg?grayscale&hmac=vpSuMkKTsIfPxgrtSWmGL5wH9aXPknmWsf7szEWtVQA'
// ];

 
//  try {
//    $response = $fb->post('/' . $pages[0]['id'] . '/feed', $data , $pages[0]['access_token']);
//  } catch(Facebook\Exceptions\FacebookResponseException $e) {
//    echo 'Graph returned an error: '.$e->getMessage();
//    exit;
//  } catch(Facebook\Exceptions\FacebookSDKException $e) {
//    echo 'Facebook SDK returned an error: '.$e->getMessage();
//    exit;
//  }

//  $graphNode = $response->getGraphNode();
//  echo '<pre>';
//  print_r($graphNode);
//  die;
?>

