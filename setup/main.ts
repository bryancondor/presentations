import { defineAppSetup } from '@slidev/types'

export default defineAppSetup(({ app }) => {
  app.config.globalProperties.$baseUrl = import.meta.env.BASE_URL
})
