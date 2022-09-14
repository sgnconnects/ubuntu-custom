#!/usr/bin/env bash
set -eu

_install_package() {
    local PACKAGE="$1"

    if ! dpkg -s "$PACKAGE" &>/dev/null; then
        apt-get -y install "$PACKAGE"
    fi
}

# System
_install_package exfat-fuse
_install_package p7zip-full

# System: install grub package (to work in offline)
_install_package grub-efi-amd64-bin

# GNOME Apps
_install_package audacious
_install_package brasero
_install_package cdrdao
_install_package dvdauthor
_install_package gnome-calculator
_install_package gnome-characters
_install_package gnome-system-monitor
_install_package transmission-gtk
_install_package xournal

# Others
_install_package gstreamer1.0-plugins-bad
_install_package ubuntu-restricted-extras

# Language
_install_package aspell-en
_install_package aspell-pt-br
_install_package hunspell-en-us
_install_package hunspell-pt-br
_install_package hyphen-en-us
_install_package hyphen-pt-br

# My workstation only

# System (For bootiso)
_install_package curl
_install_package extlinux
_install_package syslinux
_install_package wimtools

# GNOME Apps
_install_package audacity
_install_package gparted
_install_package meld
_install_package synaptic

# Graphics
_install_package gimp
_install_package gimp-plugin-registry
_install_package inkscape

# Utilities
_install_package aria2
_install_package evtest
_install_package hexedit
_install_package jpegoptim
_install_package lm-sensors
_install_package parallel
_install_package pdfgrep
_install_package qpdf
_install_package rdfind
_install_package tmux

# Forensic
_install_package foremost
_install_package secure-delete
_install_package testdisk

# Network
_install_package openssh-server

# Multimedia
_install_package ffmpeg
_install_package lame
_install_package mediainfo
_install_package mp3val

# Development
_install_package build-essential
_install_package cdbs
_install_package clang-format
_install_package cmake
_install_package debhelper
_install_package devscripts
_install_package git

# Dev libraries
_install_package freeglut3-dev
_install_package libgtk-3-dev
_install_package libsdl2-mixer-dev
_install_package libsoil-dev
_install_package libwxgtk-media3.0-gtk3-dev
_install_package libwxgtk3.0-gtk3-dev
#_install_package python3-pip
#_install_package python3-venv

# Network
_install_package nmap

# Latex
_install_package pandoc
_install_package texlive
_install_package texlive-extra-utils
_install_package texlive-fonts-extra
_install_package texlive-lang-portuguese
_install_package texlive-latex-extra
_install_package texlive-publishers
_install_package texlive-science
_install_package texlive-xetex
_install_package latexdiff
_install_package latexmk

# VPN
_install_package network-manager-fortisslvpn-gnome

# External
_install_package google-chrome-stable
