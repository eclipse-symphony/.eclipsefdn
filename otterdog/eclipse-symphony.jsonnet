local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-symphony') {
  settings+: {
    billing_email: "webmaster@eclipse-foundation.org",
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "",
    name: "Eclipse Symphony",
    plan: "free",
    readers_can_create_discussions: true,
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  _repositories+:: [
    orgs.newRepo('symphony') {
      description: "Symphony project",
      has_discussions: true,
      has_projects: false,
      has_wiki: false,
    },
    orgs.newRepo('symphony-website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Symphony project website",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },
  ],
}
