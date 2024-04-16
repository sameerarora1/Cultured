//
//  MovieView.swift
//  Cultured
//
//  Created by Datta Kansal on 3/29/24.
//

import SwiftUI

struct MovieView: View {
    //    var actors = [(String, String] = [("")]
    //    @State var actors = [Actor]()
    @StateObject var viewModel = MovieViewModel()
    @ObservedObject var vm: ViewModel
    
    var body: some View {
        ZStack() {
            VStack() {
                ZStack {
                    BackButton()
                    Image("MovieBg")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.37)
                }
                
                Spacer()
                    .frame(height: UIScreen.main.bounds.height * 0.67)
            }
            
            VStack() {
                Spacer()
                    .frame(height: UIScreen.main.bounds.height * 0.34)
                ScrollView(.vertical) {
                    Text("Movies/TV")
                        .frame(maxWidth: UIScreen.main.bounds.width * (8/9), alignment: .leading)
                        .font(Font.custom("Quicksand-SemiBold", size: 32))
                        .foregroundColor(Color(red: 19/255, green: 145/255, blue: 234/255))
                        .padding(.top, 20)
                    Text(vm.current_user?.country ?? "Mexico")
                        .frame(maxWidth: UIScreen.main.bounds.width * (8/9), alignment: .leading)
                        .font(Font.custom("Sf-pro-display", size: 16))
                        .foregroundColor(Color(red: 148/255, green: 148/255, blue: 148/255))
                    
                    Spacer()
                        .frame(height: UIScreen.main.bounds.height / 35)
                    Text("Actor Spotlight")
                        .frame(maxWidth: UIScreen.main.bounds.width * (8/9), alignment: .leading)
                        .font(Font.custom("Quicksand-Mediium", size: 24))
                        .foregroundColor(.cDarkGray)
                    
                    VStack {
                        if viewModel.actors.isEmpty {
                            Text("No Results")
                        } else {
                            ScrollView(.horizontal) {
                                LazyHStack {
                                    ForEach(viewModel.actors, id: \.id) { actor in
                                        VStack {
                                            AsyncImage(url: actor.actorProfile) { image in
                                                image
                                                    .resizable()
                                                    .scaledToFill()
                                            } placeholder: {
                                                ProgressView()
                                            }
                                            .frame(width: 100, height: 90)
                                            .aspectRatio(contentMode: .fit)
                                            .foregroundStyle(.black)
                                            
                                            .frame(width: 100, height: 90)
                                            .background(Color.cGreen)
                                            .clipShape(.circle)
                                            
                                            .padding(.trailing, 15)
                                            Text("\(actor.name)")
                                                .font(.system(size: 18))
                                                .frame(width: 100, height: 50)
                                                .lineLimit(6)
                                                .minimumScaleFactor(0.8)
                                                .multilineTextAlignment(.center)
                                                .foregroundColor(Color.cDarkGray)
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal, 18)
                        }
                    }
                    Spacer()
                        .frame(height: UIScreen.main.bounds.height / 35)
                    
                    Text("In Theaters")
                        .frame(maxWidth: UIScreen.main.bounds.width * (8/9), alignment: .leading)
                        .font(Font.custom("Quicksand-Mediium", size: 24))
                        .foregroundColor(Color.cDarkGray)
                    
                    VStack {
                        if viewModel.movies.isEmpty {
                            Text("No Results")
                        } else {
                            ScrollView(.horizontal) {
                                LazyHStack {
                                    ForEach(viewModel.movies, id: \.id) { movie in
                                        VStack {
                                            AsyncImage(url: movie.moviePoster) { image in
                                                image
                                                    .resizable()
                                                    .scaledToFill()
                                            } placeholder: {
                                                ProgressView()
                                            }
                                            .frame(width: 150, height: 207)
                                            .aspectRatio(contentMode: .fit)
                                            .foregroundStyle(.black)

                                            
                                            .frame(width: 150, height: 207)
                                            .background(Color.cGreen)
                                            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                                            
                                            Text("\(movie.title)")
                                                .font(.system(size: 18))
                                                .frame(width: 150, height: 50)
                                                .lineLimit(6)
                                                .minimumScaleFactor(0.8)
                                                .multilineTextAlignment(.center)
                                                .foregroundColor(Color.cDarkGray)
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal, 18)
                        }
                    }
                    .onAppear {
                        viewModel.loadMovies()
                        viewModel.loadActors()
                    }
                }
                .background(Color.cPopover)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            }
        }
        Spacer()
    }
}
//#Preview {
//    MovieView()
//}
