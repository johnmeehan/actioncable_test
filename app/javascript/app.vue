<template>
  <div id="app">
    <h2>Some status message from the server:</h2>
    <p>{{ talk }}</p>
  </div>
</template>

<script>
export default {
  data() {
    return {
      message: "Waiting for messages...."
    };
  },
  created: function() {
    const vm = this;
    this.$consumer.subscriptions.create(
      { channel: "MessageChannel" },
      {
        received(data) {
          console.log("DATA:", data);
          vm.message = data.message;
        }
      }
    );
  },
  computed: {
    talk: function() {
      return this.message;
    }
  }
};
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
