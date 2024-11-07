<script setup lang="ts">
import {ref} from 'vue'
import {useToast} from 'primevue/usetoast'
import {ItineraryPictures} from "@/model/itineraryPictures";

import * as fs from "fs";
import {WordPress} from "@/wordpress.ts";


const originalImage: Ref<null | HTMLImageElement> = ref(null);

const text = ref()
const toast = useToast()
const greet = () => {
  console.log('greet called')
  toast.add({severity: 'success', summary: 'Toast demo', detail: text.value})
}

const wpConfig = {
  url: 'https://www.hiproadtrips.com',
  username: 'hiproadtrips.com',
  password: 'LkJQ Wbhr A9Xm MySE L0N1 qN1u'
};

async function postToWordpress() {
  console.log('wp1');
  // const wpConfig = {
  //   url: 'https://www.hiproadtrips.com',
  //   username: 'hiproadtrips.com',
  //   password: 'LkJQ Wbhr A9Xm MySE L0N1 qN1u'
  // };

// Create an instance of the Wordpress class
  const wp = new WordPress(wpConfig);
  console.log('wp2');


  // create an object to represent the post, including the featured_media field
  const post = {
    title: "Your Post Title",
    content: 'this is the post content',
    status: "draft",
    categories: [],
    tags: [],
    // featured_media: mediaResponse.id
  };
  // console.log('wp4');


  // create the post using the Wordpress API
  const postResponse = await wp.createPost(post);
  // log a message to the console indicating that the post was created successfully
  // console.log(`Post created! link: ${postResponse}`);

  console.log('wp5');
}

const uploadImage = async () => {
  try {
    // Get the image element
    const imgElement = document.getElementById('exampleImage') as HTMLImageElement;


    // const wpConfig = {
    //   url: 'https://www.hiproadtrips.com',
    //   username: 'hiproadtrips.com',
    //   password: 'LkJQ Wbhr A9Xm MySE L0N1 qN1u'
    // };

// Create an instance of the Wordpress class
    const wp = new WordPress(wpConfig);
    // Call the uploadImage method
    console.log(`image ${imgElement}`);
    const mediaResponse = await wp.uploadImage(imgElement);

    // Update the imageUrl with the uploaded image URL
    console.log(`uploaded media id ${mediaResponse.id}`);


    // You can use the imageUrl as needed in your application
  } catch (error) {
    console.error('Error uploading image:', error);
  }
};


const uploadPostWithFeatureImage = async () => {
  try {
    // Get the image element
    const imgElement = document.getElementById('exampleImage') as HTMLImageElement;

    const wp = new WordPress(wpConfig);
    // Call the uploadImage method
    console.log(`image ${imgElement}`);
    const mediaResponse = await wp.uploadImage(imgElement);

    // Update the imageUrl with the uploaded image URL
    console.log(`uploaded media id ${mediaResponse.id}`);

    // create an object to represent the post, including the featured_media field
    const post = {
      title: "Your Post Title with feature",
      content: `
    <h2>Heading 2</h2>
    <p>This is the content of your post.</p>
    <h3>Heading 3</h3>
    <p>More content goes here.</p>
    <img src="${mediaResponse.source_url}" alt="Alt text for the image" />
  `,
      status: "draft",
      categories: [],
      tags: [],
      featured_media: mediaResponse.id
    };
    // console.log('wp4');


    // create the post using the Wordpress API
    const postResponse = await wp.createPost(post);
    console.log(`postResponse: ${postResponse}`)


    // You can use the imageUrl as needed in your application
  } catch (error) {
    console.error('Error uploading image:', error);
  }
};

// const adjustSaturation = async (imageUrl: string) => {
//   console.log('1');
//   const originalImageFromUrl = await loadImageFromUrl(imageUrl);
//   console.log('2');
//
//   const canvas = document.createElement('canvas');
//   const ctx = canvas.getContext('2d');
//   console.log('3');
//
//
//   if (ctx) {
//     console.log('4');
//
//     canvas.width = originalImageFromUrl.width;
//     canvas.height = originalImageFromUrl.height;
//
//     // Adjust saturation (you can modify this value)
//     ctx.filter = 'saturate(200%)';
//     console.log('5');
//
//
//     ctx.drawImage(originalImageFromUrl, 0, 0, originalImageFromUrl.width, originalImageFromUrl.height);
//
//     console.log('6');
//
//     // Convert the canvas content back to a data URL
//     originalImage.value = canvas.toDataURL('image/jpeg');
//     console.log('1');
//
//   }
// };

// const loadImageFromUrl = (url: string): Promise<HTMLImageElement> => {
//   return new Promise((resolve, reject) => {
//     const img = new Image();
//     img.onload = () => resolve(img);
//     img.onerror = reject;
//     img.src = url;
//   });
// };

async function getWordPressCategories() {

  const siteUrl = 'https://www.hiproadtrips.com';

// Replace 'your-blog/wp-json/wp/v2/categories' with the correct endpoint for categories


  const categoriesEndpoint = `${siteUrl}/wp-json/wp/v2/categories`;  //or tags

// Make a GET request to retrieve categories
  fetch(categoriesEndpoint)
      .then(response => response.json())
      .then(categories => {
        // Do something with the categories data
        console.log(categories);
      })
      .catch(error => {
        console.error('Error fetching categories:', error);
      });
}

</script>

<template>
  <main>
    <div class="container flex flex-col" >

      <img id="exampleImage" height="200" width="200"
           src="https://images.pexels.com/photos/19752355/pexels-photo-19752355/free-photo-of-bridge.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
           alt="Example Image" crossorigin="anonymous">


      <span class="p-float-label">
        <InputText id="txt" v-model="text"/>
        <label for="txt">Text</label>
      </span>
      <Button label="Greet" @click="getWordPressCategories" icon="pi pi-user"></Button>

      <Button label="Create wordpress post" @click="postToWordpress" icon="pi pi-user"></Button>
      <Button label="Upload image" @click="uploadImage" icon="pi pi-user"></Button>
      <Button label="Upload post with image" @click="uploadPostWithFeatureImage" icon="pi pi-user"></Button>
<!--      <Button label="Saturation" @click="adjustSaturation" icon="pi pi-user"></Button>-->


    </div>
  </main>
</template>

<style scoped>
.container {
  display: flex;
  align-items: center;
  justify-content: center;
  min-height: 80vh;
}
</style>
