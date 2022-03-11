import svgwrite


#def get_coor(pt):
#    pass
#
#def draw_arc(height, straight_length, coor_a, coor_b):
#
#
#
#def draw_matching(matching, drawer):
#    for a, b in matching:
#        coor_a = get_coor(a)
#        coor_b = get_coor(b)

dwg = svgwrite.Drawing('temperley_lieb.svg', profile='tiny')
dwg.add(dwg.path([]))
dwg.save()
