import flet as ft

def main(page: ft.Page):
    page.title = "Wistom - Rumo ao conhecimento"
    page.vertical_alignment = ft.MainAxisAlignment.CENTER
    
    text = ft.Text("Olá do Flet rodando dentro do Docker!", size=20)
    
    def button_clicked(e):
        text.value = "Botão clicado com sucesso!"
        page.update()

    button = ft.ElevatedButton(text="Clique em mim", on_click=button_clicked)

    page.add(
        ft.Row([text], alignment=ft.MainAxisAlignment.CENTER),
        ft.Row([button], alignment=ft.MainAxisAlignment.CENTER)
    )

if __name__ == "__main__":
    # Importante: defina view=ft.WEB_BROWSER e o host/port correspondentes
    ft.app(target=main, view=ft.WEB_BROWSER, port=8550, host="0.0.0.0")