include {
    path = find_in_parent_folders()
}

terraform {
    source = "../..//src"
}

inputs = {
    read_capacity  = 1
    write_capacity = 1
}