<script setup>
import { ref } from "vue";

const router = useRouter();

const menuList = [
  {
    icon: "mdi-clipboard-list",
    title: "Todos",
    color: "blue",
    path: "/",
  },
  {
    icon: "mdi-check-all",
    title: "Done",
    color: "green",
    path: "done",
  },
  {
    icon: "mdi-delete",
    title: "Trash",
    color: "gray",
    path: "trash",
  },
  {
    icon: "mdi-account-cog",
    title: "Setting",
    color: "indigo",
    path: "setting",
  },
  {
    icon: "mdi-logout",
    title: "Logout",
    color: "red",
    path: "auth",
  },
];

const drawer = ref(null);
</script>
<template>
  <v-app id="inspire">
    <v-navigation-drawer v-model="drawer">
      <v-sheet
        class="pa-4 d-flex flex-column justify-center align-center"
        color="grey-lighten-4"
      >
        <v-avatar lass="mb-4" color="grey-darken-1" size="80">
          <span class="text-h3">A</span>
        </v-avatar>

        <div>asliddin@google.com</div>
      </v-sheet>

      <v-divider />

      <v-list density="compact">
        <v-list-item
          v-for="{ icon, title, color, path } in menuList"
          :key="icon"
          :title="title"
          link
          @click="router.push(path)"
        >
          <template v-slot:prepend>
            <v-icon :icon="icon" :color="color" />
          </template>
          <template v-if="!['auth', 'setting'].includes(path)" v-slot:append>
            <v-badge :color="color" :content="color.length" inline></v-badge>
          </template>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>

    <v-app-bar>
      <v-app-bar-nav-icon
        v-if="!drawer"
        @click="drawer = !drawer"
      ></v-app-bar-nav-icon>
      <v-app-bar-title class="text-center">Todo App</v-app-bar-title>
    </v-app-bar>

    <v-main>
      <v-container class="pa-3" fluid>
        <NuxtPage />
      </v-container>
    </v-main>
  </v-app>
</template>
