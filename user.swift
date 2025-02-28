import SwiftUI
struct MenuItem {
    var icon: String
    var title: String
}

// Estrutura para criar itens do menu clicáveis
struct UserMenuItem<Destination: View>: View {
    var icon: String
    var title: String
    var destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.black)
                    .frame(width: 30, height: 50)
                Text(title)
                    .foregroundColor(.black)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.black)
            }
            .padding(.vertical, 10)
        }
    }
}

struct User: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.white
                VStack {
                    VStack {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.black)
                        
                        Text("Olá, user!")
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                            .padding(.top, 10)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 350)
                    .background(Color.orange)
                    .cornerRadius(30.0)
                    .ignoresSafeArea()
                    List {
                        UserMenuItem(icon: "person.fill", title: "Minha Conta", destination: Home())
                        UserMenuItem(icon: "calendar", title: "Minhas Sessões", destination: Home())
                        UserMenuItem(icon: "doc.text.fill", title: "Meus Planos", destination: Home())
                        UserMenuItem(icon: "leaf.fill", title: "Planos de cuidados", destination: Home())
                        UserMenuItem(icon: "heart.fill", title: "Meus Favoritos", destination: Home())
                    }
                    .listStyle(PlainListStyle())
                    .frame(maxWidth: .infinity, maxHeight: 550)
                    .scrollContentBackground(.hidden)
                }
            }
        }
    }
}

#Preview {
    User()
}
