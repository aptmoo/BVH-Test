workspace "BVH-Test"
   architecture "x64"
   configurations { "Debug", "Release", "Dist" }
   startproject "App"

project "App"
   kind "ConsoleApp"
   language "C++"
   cppdialect "C++20"
   targetdir "Binaries/"
   staticruntime "off"

   files { "Source/**.h", "Source/**.cpp" }

   includedirs
   {
      "Source",
   }

   links
   {
      "glfw", "GL", "raylib"
   }

   targetdir ("../Binaries/")
   objdir ("../Binaries/Intermediates/")

   filter "system:windows"
       systemversion "latest"
       defines { "PLATFORM_WINDOWS" }

    filter "system:linux"
       defines { "PLATFORM_LINUX" }
       libdirs { "/usr/lib", "../lib", }

   filter "configurations:Debug"
       defines { "DEBUG" }
       runtime "Debug"
       symbols "On"

   filter "configurations:Release"
       defines { "RELEASE" }
       runtime "Release"
       optimize "On"
       symbols "On"

   filter "configurations:Dist"
       defines { "DIST" }
       runtime "Release"
       optimize "On"
       symbols "Off"