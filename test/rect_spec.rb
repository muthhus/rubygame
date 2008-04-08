
require 'rubygame'
include Rubygame


describe Rect, "(new)" do
  it "can be created from an Array of 4 numerics" do
    r = Rect.new([1,2,3,4])
    r.to_ary.should == [1,2,3,4]
  end

  it "can be created from another Rect" do
    base = Rect.new([1,2,3,4])
    r = Rect.new( base )
    r.to_ary.should == [1,2,3,4]
  end

  it "can be created from two Arrays of 2 numerics" do
    r = Rect.new([1,2],[3,4])
    r.to_ary.should == [1,2,3,4]
  end

  it "can be created from 4 Numerics" do
    r = Rect.new(1,2,3,4)
    r.to_ary.should == [1,2,3,4]
  end
end


describe Rect, "(new_from_object)" do
  it "can be created from an Array of 4 numerics" do
    r = Rect.new_from_object( [1,2,3,4] )
    r.to_ary.should == [1,2,3,4]
  end

  it "can be created from another Rect" do
    base = Rect.new([1,2,3,4])
    r = Rect.new_from_object( base )
    r.to_ary.should == [1,2,3,4]
  end

  it "can be created from an Object whose #rect is a Rect" do
    m = mock( "rect", :rect => Rect.new([1,2,3,4]) )
    r = Rect.new_from_object( m )
    r.to_ary.should == [1,2,3,4]
  end

  it "can be created from an Object whose #rect is an Array of 4 numerics" do
    m = mock( "rect", :rect => [1,2,3,4] )
    r = Rect.new_from_object( m )
    r.to_ary.should == [1,2,3,4]
  end
end



describe Rect, "(attribute readers)" do
  before(:each) do
    @rect = Rect.new([1,2,3,4])
  end

  it "should have an x attribute reader" do
    @rect.x.should == 1
  end

  it "should have a y attribute reader" do
    @rect.y.should == 2
  end

  it "should have a w attribute reader" do
    @rect.w.should == 3
  end

  it "should have a width attribute reader" do
    @rect.width.should == 3
  end

  it "should have an h attribute reader" do
    @rect.h.should == 4
  end

  it "should have a height attribute reader" do
    @rect.height.should == 4
  end

  it "should have an [] reader" do
    @rect[0].should == 1
    @rect[1].should == 2
    @rect[2].should == 3
    @rect[3].should == 4
  end

  it "should have a size reader" do
    @rect.size.should == [3,4]
  end
end


describe Rect, "(attribute writers)" do
  before(:each) do
    @rect = Rect.new([1,2,3,4])
  end

  it "should have an x attribute writer" do
    @rect.x = 11
    @rect.x.should == 11
  end

  it "should have a y attribute writer" do
    @rect.y = 12
    @rect.y.should == 12
  end

  it "should have a w attribute writer" do
    @rect.w = 13
    @rect.w.should == 13
  end

  it "should have a width attribute writer" do
    @rect.width = 13
    @rect.width.should == 13
  end

  it "should have an h attribute writer" do
    @rect.h = 14
    @rect.h.should == 14
  end

  it "should have a height attribute writer" do
    @rect.height = 14
    @rect.height.should == 14
  end

  it "should have an [] writer" do
    @rect[0] = 11
    @rect[1] = 12
    @rect[2] = 13
    @rect[3] = 14
    @rect.to_ary.should == [11,12,13,14]
  end

  it "should have a size writer" do
    @rect.size = [13,14]
    @rect.size.should == [13,14]
  end
end



describe Rect, "(side readers)" do
  before(:each) do
    @rect = Rect.new([1,2,3,4])
  end

  it "should have a left side" do
    @rect.left.should == 1
  end

  it "should have a right side" do
    @rect.right.should == 1+3
  end

  it "should have a top side" do
    @rect.top.should == 2
  end

  it "should have a bottom side" do
    @rect.bottom.should == 2+4
  end
end


describe Rect, "(side writers)" do
  before(:each) do
    @rect = Rect.new([1,2,3,4])
  end

  it "should have a left side writer" do
    @rect.left = 11
    @rect.left.should == 11
    @rect.x.should == 11
  end

  it "writing left side should not change width" do
    @rect.left = 11
    @rect.width.should == 3
  end

  it "should have a right side writer" do
    @rect.right = 23
    @rect.right.should == 23
    @rect.x.should == 20
  end

  it "writing right side should not change width" do
    @rect.right = 23
    @rect.width.should == 3
  end

  it "should have a top side writer" do
    @rect.top = 12
    @rect.top.should == 12
    @rect.y.should == 12
  end

  it "writing top side should not change height" do
    @rect.top = 12
    @rect.height.should == 4
  end

  it "should have a bottom side writer" do
    @rect.bottom = 24
    @rect.bottom.should == 24
    @rect.y.should == 20
  end

  it "writing bottom side should not change height" do
    @rect.bottom = 24
    @rect.height.should == 4
  end
end



describe Rect, "(center readers)" do
  before(:each) do
    @rect = Rect.new([1,2,3,4])
  end

  it "should have a center reader" do
    @rect.center.should == [2,4]
  end

  it "should have a centerx reader" do
    @rect.centerx.should == 2
  end

  it "should have a centery reader" do
    @rect.centery.should == 4
  end
end


describe Rect, "(center writers)" do
  before(:each) do
    @rect = Rect.new([1,2,3,4])
  end

  it "should have a center writer" do
    @rect.center = [12,14]
    @rect.center.should == [12,14]
    @rect.x.should == 11
    @rect.y.should == 12
  end

  it "should have a centerx writer" do
    @rect.centerx = 12
    @rect.centerx.should == 12
    @rect.x.should == 11
  end

  it "should have a centery writer" do
    @rect.centery = 14
    @rect.centery.should == 14
    @rect.y.should == 12
  end
end



describe Rect, "(corner readers)" do
  before(:each) do
    @rect = Rect.new([1,2,3,4])
  end

  it "should have a topleft reader" do
    @rect.topleft.should == [1,2]
  end

  it "should have a topright reader" do
    @rect.topright.should == [1+3,2]
  end

  it "should have a bottomleft reader" do
    @rect.bottomleft.should == [1,2+4]
  end

  it "should have a bottomright reader" do
    @rect.bottomright.should == [1+3,2+4]
  end
end


describe Rect, "(corner writers)" do
  before(:each) do
    @rect = Rect.new([1,2,3,4])
  end

  it "should have a topleft writer" do
    @rect.topleft = [11,12]
    @rect.topleft.should == [11,12]
    @rect.x.should == 11
    @rect.y.should == 12
  end
  
  it "writing topleft should not change size" do 
    @rect.topleft = [11,12]
    @rect.size.should == [3,4]
  end

  it "should have a topright writer" do
    @rect.topright = [14,12]
    @rect.topright.should == [14,12]
    @rect.x.should == 11
    @rect.y.should == 12
  end

  it "writing topright should not change size" do 
    @rect.topright = [14,12]
    @rect.size.should == [3,4]
  end

  it "should have a bottomleft writer" do
    @rect.bottomleft = [11,16]
    @rect.bottomleft.should == [11,16]
    @rect.x.should == 11
    @rect.y.should == 12
  end

  it "writing bottomleft should not change size" do 
    @rect.bottomleft = [11,16]
    @rect.size.should == [3,4]
  end

  it "should have a bottomright writer" do
    @rect.bottomright = [14,16]
    @rect.bottomright.should == [14,16]
    @rect.x.should == 11
    @rect.y.should == 12
  end

  it "writing bottomright should not change size" do 
    @rect.bottomright = [14,16]
    @rect.size.should == [3,4]
  end
end



describe Rect, "(midpoint readers)" do 
  before(:each) do
    @rect = Rect.new([1,2,3,4])
  end

  it "should have a midleft reader" do 
    @rect.midleft.should == [1,4]
  end

  it "should have a midright reader" do 
    @rect.midright.should == [4,4]
  end

  it "should have a midtop reader" do 
    @rect.midtop.should == [2,2]
  end

  it "should have a midbottom reader" do 
    @rect.midbottom.should == [2,6]
  end
end


describe Rect, "(midpoint writers)" do 
  before(:each) do
    @rect = Rect.new([1,2,3,4])
  end

  it "should have a midleft writer" do 
    @rect.midleft = [11,14]
    @rect.midleft.should == [11,14]
    @rect.x.should == 11
    @rect.y.should == 12
  end
  
  it "writing midleft should not change size" do 
    @rect.midleft = [11,14]
    @rect.size.should == [3,4]
  end

  it "should have a midright writer" do 
    @rect.midright = [14,14]
    @rect.midright.should == [14,14]
    @rect.x.should == 11
    @rect.y.should == 12
  end

  it "writing midright should not change size" do 
    @rect.midright = [14,14]
    @rect.size.should == [3,4]
  end

  it "should have a midtop writer" do 
    @rect.midtop = [12,12]
    @rect.midtop.should == [12,12]
    @rect.x.should == 11
    @rect.y.should == 12
  end

  it "writing midtop should not change size" do 
    @rect.midtop = [12,12]
    @rect.size.should == [3,4]
  end

  it "should have a midbottom writer" do 
    @rect.midbottom = [12,16]
    @rect.midbottom.should == [12,16]
    @rect.x.should == 11
    @rect.y.should == 12
  end

  it "writing midbottom should not change size" do 
    @rect.midbottom = [12,16]
    @rect.size.should == [3,4]
  end
end



describe Rect, "(clamping to larger rect)" do 
  before(:each) do
    @rect  = Rect.new([0,0,30,40])
    @other = Rect.new([50,50,100,100])
  end

  it "should move to be inside the other rect" do 
    @rect.clamp(@other).topleft.should == [50,50]
  end

  it "should stay the same size" do 
    @rect.clamp(@other).size.should == [30,40]
  end

  it "clamp should not modify the original rect" do 
    @rect.clamp(@other)
    @rect.to_ary.should == [0,0,30,40]
  end

  it "clamp! should modify the original rect" do 
    @rect.clamp!(@other)
    @rect.to_ary.should == [50,50,30,40]
  end
end


describe Rect, "(clamping to smaller rect)" do 
  before(:each) do
    @rect  = Rect.new([0,0,30,40])
    @other = Rect.new([25,25,10,10])
  end

  it "should move to be centered on the other rect" do 
    @rect.clamp(@other).center.should == [30,30]
  end

  it "should stay the same size" do 
    @rect.clamp(@other).size.should == [30,40]
  end

  it "clamp should not modify the original rect" do 
    @rect.clamp(@other)
    @rect.to_ary.should == [0,0,30,40]
  end

  it "clamp! should modify the original rect" do 
    @rect.clamp!(@other)
    @rect.to_ary.should == [15,10,30,40]
  end
end


describe Rect, "(clamping to already-containing rect)" do 
  before(:each) do
    @rect  = Rect.new([0,0,30,40])
    @other = Rect.new([0,0,50,50])
  end

  it "should stay in the same place" do 
    @rect.clamp(@other).should == @rect
  end

  it "should stay the same size" do 
    @rect.clamp(@other).size.should == [30,40]
  end
end



describe Rect, "(clipping to overlapping rect)" do 
  before(:each) do
    @rect  = Rect.new([0,0,30,40])
    @other = Rect.new([10,10,100,100])
  end

  it "should clip to be inside the other rect" do 
    @rect.clip(@other).topleft.should == [10,10]
  end

  it "the overlapping sides should not change" do 
    @rect.clip(@other).bottomright.should == [30,40]
  end

  it "clip should not modify the original rect" do 
    @rect.clip(@other)
    @rect.to_ary.should == [0,0,30,40]
  end

  it "clip! should modify the original rect" do 
    @rect.clip!(@other)
    @rect.to_ary.should == [10,10,20,30]
  end
end


describe Rect, "(clipping to non-overlapping rect)" do 
  before(:each) do
    @rect  = Rect.new([0,0,30,40])
    @other = Rect.new([100,100,100,100])
  end

  it "should not move" do 
    @rect.clip(@other).topleft.should == [0,0]
  end

  it "should have size [0,0]" do 
    @rect.clip(@other).size.should == [0,0]
  end

  it "clamp should not modify the original rect" do 
    @rect.clip(@other)
    @rect.to_ary.should == [0,0,30,40]
  end

  it "clip! should modify the original rect" do 
    @rect.clip!(@other)
    @rect.to_ary.should == [0,0,0,0]
  end
end


describe Rect, "(clipping to already-containing rect)" do 
  before(:each) do
    @rect  = Rect.new([0,0,30,40])
    @other = Rect.new([0,0,100,100])
  end

  it "should stay in the same place" do 
    @rect.clip(@other).topleft.should == [0,0]
  end

  it "should stay the same size" do 
    @rect.clip!(@other).size.should == [30,40]
  end
end



describe Rect, "(collide_array)" do 
  before(:each) do 
    @rect = Rect.new([0,0,30,40])
  end

  it "should return the index of the first colliding rect" do 
    a = [Rect.new([100,100,20,20]), 
         Rect.new([-10,-10,20,20]), 
         Rect.new([0,0,20,20])]
    @rect.collide_array(a).should == 1
  end

  it "should return nil if no rects collide" do 
    a = [Rect.new([100,100,20,20]), 
         Rect.new([-100,-100,20,20]),
         Rect.new([200,20,20,20])]
    @rect.collide_array(a).should == nil
  end
end


describe Rect, "(collide_array_all)" do 
  before(:each) do 
    @rect = Rect.new([0,0,30,40])
  end

  it "should return the indices of all colliding rects" do 
    a = [Rect.new([100,100,20,20]), 
         Rect.new([-10,-10,20,20]), 
         Rect.new([0,0,20,20])]
    @rect.collide_array_all(a).should == [1,2]
  end

  it "should return an empty array if no rects collide" do 
    a = [Rect.new([100,100,20,20]), 
         Rect.new([-100,-100,20,20]), 
         Rect.new([200,20,20,20])]
    @rect.collide_array_all(a).should == []
  end
end



describe Rect, "(collide_hash)" do 
  before(:each) do 
    @rect = Rect.new([0,0,30,40])
  end

  it "should return the first pair with a colliding rect in value" do 
    h = {:foo => Rect.new([100,100,20,20]),
         :bar => Rect.new([-10,-10,20,20]), 
         :baz => Rect.new([0,0,20,20])}
    @rect.collide_hash(h).should == {:bar => Rect.new([-10,-10,20,20])}
  end

  it "should return nil if no rects collide" do 
    h = {:foo => Rect.new([100,100,20,20]),
         :bar => Rect.new([-100,-100,20,20]), 
         :baz => Rect.new([200,20,20,20])}
    @rect.collide_hash(h).should == nil
  end
end


describe Rect, "(collide_hash_all)" do 
  before(:each) do 
    @rect = Rect.new([0,0,30,40])
  end

  it "should return the all pairs with a colliding rect in value" do 
    h = {:foo => Rect.new([100,100,20,20]),
         :bar => Rect.new([-10,-10,20,20]), 
         :baz => Rect.new([0,0,20,20])}
    @rect.collide_hash_all(h).should == {:bar => Rect.new([-10,-10,20,20]),
                                         :baz => Rect.new([0,0,20,20])}
  end

  it "should return an empty hash if no rects collide" do 
    h = {:foo => Rect.new([100,100,20,20]),
         :bar => Rect.new([-100,-100,20,20]), 
         :baz => Rect.new([200,20,20,20])}
    @rect.collide_hash_all(h).should == {}
  end
end



describe Rect, "(collide_point?)" do 
  before(:each) do 
    @rect = Rect.new([0,0,30,40])
  end

  it "should collide with points inside its borders" do 
    @rect.collide_point?(15,20).should be_true
  end

  it "should collide with points touching its borders" do 
    @rect.collide_point?(30,40).should be_true
  end

  it "should not collide with points outside its borders" do 
    @rect.collide_point?(31,40).should be_false
  end
end


describe Rect, "(collide_rect?)" do 
  before(:each) do 
    @rect = Rect.new([0,0,30,40])
  end

  it "should collide with Rects completely inside its borders" do 
    @other = Rect.new([10,10,10,10])
    @rect.collide_rect?(@other).should be_true
  end

  it "should collide with Rects partially inside its borders" do 
    @other = Rect.new([25,35,10,10])
    @rect.collide_rect?(@other).should be_true
  end

  it "should collide with Rects touching its borders" do 
    @other = Rect.new([30,30,10,10])
    @rect.collide_rect?(@other).should be_true
  end

  it "should not collide with Rects completely outside its borders" do 
    @other = Rect.new([100,100,10,10])
    @rect.collide_rect?(@other).should be_false
  end
end


describe Rect, "(contain?)" do 
  before(:each) do 
    @rect = Rect.new([0,0,30,40])
  end

  it "should contain Rects completely inside its borders" do 
    @other = Rect.new([10,10,10,10])
    @rect.contain?(@other).should be_true
  end

  it "should contain Rects inside but touching its borders" do 
    @other = Rect.new([20,30,10,10])
    @rect.contain?(@other).should be_true
  end

  it "should not contain Rects partially inside its borders" do 
    @other = Rect.new([25,35,10,10])
    @rect.contain?(@other).should be_false
  end

  it "should not contain Rects completely outside its borders" do 
    @other = Rect.new([100,100,10,10])
    @rect.contain?(@other).should be_false
  end
end



describe Rect, "(inflate)" do 
  before(:each) do 
    @rect = Rect.new([0,0,30,40])
  end

  it "size should increase by the inflation value" do 
    @rect.inflate(10,20).size.should == [40,60]
  end

  it "position should move by half the inflation value" do 
    @rect.inflate(10,20).topleft.should == [-5,-10]
  end

  it "can be inflated by a negative amount to shrink" do 
    @rect.inflate(-10,-20).should == Rect.new([5,10,20,20])
  end

  it "inflate should not modify the original rect" do 
    @rect.inflate(10,20)
    @rect.should == Rect.new([0,0,30,40])
  end

  it "inflate! should modify the original rect" do 
    @rect.inflate!(10,20)
    @rect.should == Rect.new([-5,-10,40,60])
  end
end



describe Rect, "(move)" do 
  before(:each) do 
    @rect = Rect.new([0,0,30,40])
  end

  it "should change the rect's position" do 
    @rect.move(10,10).topleft.should == [10,10]
  end

  it "should not change the rect's size" do 
    @rect.move(10,10).size.should == [30,40]
  end

  it "move should not modify the original rect" do 
    @rect.move(10,10)
    @rect.should == Rect.new([0,0,30,40])
  end

  it "move! should modify the original rect" do 
    @rect.move!(10,10)
    @rect.should == Rect.new([10,10,30,40])
  end
end



describe Rect, "(normalize)" do 
  it "should have no effects on rects with positive sizes" do 
    rect = Rect.new([0,0,30,40])
    rect.normalize.should == rect
  end

  it "should change the position of rects with negative sizes" do 
    rect = Rect.new([0,0,-30,-40])
    rect.normalize.topleft.should == [-30,-40]
  end

  it "should make positive the size of rects with negative sizes" do 
    rect = Rect.new([0,0,-30,-40])
    rect.normalize.size.should == [30,40]
  end

  it "normalize should not affect the original rect" do 
    rect = Rect.new([0,0,-30,-40])
    rect.normalize
    rect.should == Rect.new([0,0,-30,-40])
  end

  it "normalize! should affect the original rect" do 
    rect = Rect.new([0,0,-30,-40])
    rect.normalize!
    rect.should == Rect.new([-30,-40,30,40])
  end
end



describe Rect, "(union)" do 
  before(:each) do 
    @rect = Rect.new([0,0,30,40])
  end

  it "should expand to contain the other rect" do 
    @other = Rect.new([20,20,40,40])
    @rect.union(@other).should == Rect.new([0,0,60,60])
  end

  it "should not change if it already contains the other rect" do 
    @other = Rect.new([5,5,10,10])
    @rect.union(@other).should == Rect.new([0,0,30,40])
  end

  it "union should not modify the original rect" do 
    @rect.union( Rect.new([20,20,40,40]) )
    @rect.should == Rect.new([0,0,30,40])
  end

  it "union! should modify the original rect" do 
    @rect.union!( Rect.new([20,20,40,40]) )
    @rect.should == Rect.new([0,0,60,60])
  end
end


describe Rect, "(union_all)" do 
  before(:each) do 
    @rect = Rect.new([0,0,30,40])
  end

  it "should expand to contain the other rect" do 
    @others = [Rect.new([20,20,40,40]), Rect.new([-20,-20,40,40])]
    @rect.union_all(@others).should == Rect.new([-20,-20,80,80])
  end

  it "should not change if it already contains the other rects" do 
    @others = [Rect.new([5,5,10,10]), Rect.new([0,0,20,20])]
    @rect.union_all(@others).should == Rect.new([0,0,30,40])
  end

  it "union_all should not modify the original rect" do 
    @others = [Rect.new([20,20,40,40]), Rect.new([-10,-20,40,40])]
    @rect.union_all(@others)
    @rect.should == Rect.new([0,0,30,40])
  end

  it "union! should modify the original rect" do 
    @others = [Rect.new([20,20,40,40]), Rect.new([-20,-20,40,40])]
    @rect.union_all!(@others)
    @rect.should == Rect.new([-20,-20,80,80])
  end
end



describe Surface, "(make_rect)" do 
  before(:each) do 
    @surface = Surface.new([30,40])
  end

  it "rect should be at position [0,0]" do 
    @surface.make_rect.topleft.should == [0,0]
  end

  it "rect should have the same size as the surface" do 
    @surface.make_rect.size.should == [30,40]
  end
end
