output "security_group_http" {
    value = aws_security_group.allow_http.id
}

output "security_group_tls" {
 value = aws_security_group.allow_tls.id
}