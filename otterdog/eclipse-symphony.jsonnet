local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-symphony') {
  settings+: {
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "",
    name: "Eclipse Symphony",
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
      branch_protection_rules: [
        # https://otterdog.readthedocs.io/en/stable/reference/organization/repository/branch-protection-rule/
        orgs.newBranchProtectionRule("main") {
            dismisses_stale_reviews: true,
            requires_pull_request: true,
            required_approving_review_count: 1,
            requires_status_checks: true,
            requires_strict_status_checks: true,
            requires_conversation_resolution: true,
            bypass_pull_request_allowances+: [
              "@eclipse-symphony-bot",
              "@github-actions",
            ],
        },
      ],
    },
    orgs.newRepo('symphony-website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Symphony project website",
      web_commit_signoff_required: false,
    },
  ],
}
