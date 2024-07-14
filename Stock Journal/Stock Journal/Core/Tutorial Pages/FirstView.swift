
import SwiftUI

struct FirstView: View {
    var body: some View {
        NavigationView{
            
            ZStack{
                Color(.black).ignoresSafeArea()
                VStack{
                    Image("Title").resizable().frame(width: 600, height: 750).ignoresSafeArea()
                }
                VStack {
                    Spacer().frame(width: 100,height: 500)
                    (Text("Store").foregroundColor(.blue) + Text(" &")+Text(" Use").foregroundColor(.orange) + Text(" information                                       when you need it"))
                        .font(.largeTitle).fontWeight(.bold).foregroundColor(Color.white).multilineTextAlignment(.center).frame(width: 400,height: 100)
                    
                    NavigationLink(destination: TutorialView(),label: { Text("How it works ?").fontWeight(.bold).foregroundColor(.black).frame(width: 280, height: 50).background(Color(.white)).cornerRadius(10).transition(.slide)
                    })
                    Spacer().frame(width: 100,height: 10)
                    
                    NavigationLink(destination: LoginView(),label: {
                        Text("Skip the Tutorial").font(.callout).fontWeight(.light)
                        
                    })
                }
            }
            
            
        }
    }
}


struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
