# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Godot 4.4 space physics game featuring a ship controlled by directional thrusters. Uses 2D physics with zero gravity.

## Development Commands

- **Run the game**: Open `project.godot` in Godot Editor and press F5
- **Main scene**: `game.tscn` (configured as main scene)

## Architecture

**Core System**: Physics-based ship movement using thruster components
- `Ship` (RigidBody2D): Applies forces from active thrusters in `_physics_process()`
- `Thruster` (Sprite2D): Input-responsive components with particle effects
- `Game` (Node2D): Root scene with input handling

**Input**: WASD for directional thrusters, R to reset ship position, ESC to quit

**Physics**: Zero gravity environment with force-based movement calculations