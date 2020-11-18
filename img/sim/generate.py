#!/usr/bin/env python3

import numpy as np
from PIL import Image


class Particle:
    def __init__(self, position, color):
        self.position = position
        self.color = color

    def __str__(self):
        return f'Particle(position={self.position}, color={self.color}'


def init_particles(n=25, offset=(0, 0)):
    edge_length = np.uint8(np.sqrt(n))
    init = np.array([0, 0]) - edge_length // 2 + np.array(offset)
    positions = [init + np.array([x, y]) for x in np.arange(edge_length) for y in np.arange(edge_length)
                 if x * edge_length + y <= n]
    colors = np.random.randint(200, size=(n, 3))
    return [Particle(p, c) for (p, c) in zip(positions, colors)]


def tick(particles):
    pos = [p.position.tolist() for p in particles]
    for p in particles:
        new_pos = p.position + np.random.randint(low=-1, high=2, size=2)
        if new_pos.tolist() not in pos:
            p.position = new_pos


def dump(particles, file_name, world_size=(21, 21), border=True):
    n, m = world_size
    world = np.ones((n, m, 3), dtype=np.uint8) * 255

    for p in particles:
        x, y = p.position + np.array(world_size) // 2
        if x < n and y < m:
            world[x, y, :] = p.color

    img = world.repeat(3, axis=0).repeat(3, axis=1)
    n, m = img.shape[:2]
    if border:
        border_color = np.ones(3) * 100
        border_color2 = np.ones(3) * 200
        for x in range(n):
            img[x, 0, :] = border_color
            img[x, m - 1, :] = border_color

        for y in range(m):
            img[0, y, :] = border_color
            img[n - 1, y, :] = border_color

        for x in range(1, n - 1):
            img[x, 1, :] = border_color2
            img[x, m - 2, :] = border_color2

        for y in range(1, m - 1):
            img[1, y, :] = border_color2
            img[n - 2, y, :] = border_color2

    Image.fromarray(img).save(file_name)
    print('Image written to:', file_name)


if __name__ == '__main__':
    np.random.seed(0)

    particles = init_particles(offset=(5, 5))
    dump(particles, file_name='dust_fake.png')

    particles = init_particles(offset=(0, 0))
    dump(particles, file_name='dust_init.png')

    dt = 5
    for _ in range(dt):
        tick(particles)
    dump(particles, file_name='dust_t1.png')

    for _ in range(dt):
        tick(particles)
    dump(particles, file_name='dust_t2.png')

    for _ in range(2 * 2 * dt):
        tick(particles)
    dump(particles, file_name='dust_t3.png')
