provider "local" {

}

resource "local_file" "foo" {
    # path.module = 현재 파일이 위치한 경로
    filename = "${path.module}/foo.txt"
    content  = "Hello World!"
}