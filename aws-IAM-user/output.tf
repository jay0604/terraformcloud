##output listing with count
# output "id" {
#     value = aws_iam_user.creation[*].id
# }

# output "arn" {
#     value = aws_iam_user.creation[*].arn
# }

#output listing with for_each

output "all_users" {
    value = values(aws_iam_user.username)[*].arn
    
}

output "all_ids" {
     value = values(aws_iam_user.username)[*].unique_id
}

output "policy_Arn" {
    value = aws_iam_user_policy_attachment.read_access[0].policy_arn
}
