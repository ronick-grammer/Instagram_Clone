//
//  ProfileHeaderView.swift
//  InstagramSwiftUI
//
//  Created by RONICK on 2021/06/28.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                
                KFImage(URL(string: viewModel.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .padding(.leading)
                
                Spacer()
                
                HStack(spacing: 16) {
                    UserStatView(value: viewModel.user.stats?.postCount ?? 0, title: "Posts")
                    UserStatView(value: viewModel.user.stats?.followerCount ?? 0, title: "Followers")
                    UserStatView(value: viewModel.user.stats?.followingCount ?? 0, title: "Following")
                }.padding(.trailing, 10)
            }
            
            Text(viewModel.user.fullname)
                .font(.system(size: 15, weight: .semibold))
                .padding([.leading, .top])
            
            Text(viewModel.user.username)
                .font(.system(size: 15))
                .padding(.leading)
                .padding(.top, 1)
            
        
            HStack {
                Spacer()
                
                ProfileActionButtonView(viewModel: viewModel)
                
                Spacer()
            }.padding(.top)
            
        }
        
    }
}


/*
struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
*/
