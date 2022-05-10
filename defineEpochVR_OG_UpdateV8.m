function [eps] = defineEpochVR_OG_UpdateV8(nantype, subjID)
% Version update: for new subjects who have longer protocols
% TMslow before negtive short use only last 20 strides
% pos, neg, and neg plus delta short use last 20 strides only (since
% protocol only contains 30 strides)
% Post1 and Post 2 early use only 5 strides
% o.w., early use 20 strides and late use 40 strides

names={'OGbase','PosShort_{late}','OGAfterPosShort','TMSlowPreNegShort',...
    'NegShort_{early}','NegShort_{late}','OGAfterNegShort','TRbase',...
    'Adapt_{SS}','Post1_{Early}','Post1_{Late}','Post2_{Early}','Post2_{Late}',...
    'NegPlusDelta_{late}','OGAfterNegPlus','TMfastBeforePosShort'};

eps=defineEpochs(names,...
                {'OG base','Pos short','OG 1','TM slow',...
                'Neg short','Neg short','OG 2','TR base',...
                'Adaptation','Post 1','Post 1','Post 2','Post 2',...
                'Neg plus delta','OG after neg plus','TM tied 1'},...
                [-40 -20 20 -20,...
                20 -20 20,-40,...
                -40 5 -40 5 -40,...
                 -20 20 -40],...
                [0,0,1,0,...
                1,0,1,0,...
                0,1,0,1,0,...
                0,1,0],...
                [5,5,0,5,...
                0,5,0,5,...
                5,0,5,0,5,...
                5,0,5],...
                nantype);