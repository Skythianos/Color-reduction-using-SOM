function [IDX, C]=SOM(X,NetSize)

    X=X';
    
    nSample=size(X,2);
    pTrain=0.1;
    nTrain=round(pTrain*nSample);
    XTrain=X(:,randperm(nSample));
    XTrain=XTrain(:,1:nTrain);

    % Create a Self-Organizing Map
    net = selforgmap(NetSize);

    % Train the Network
    net = train(net,XTrain);

    % Create Outputs
    y = net(X);
    IDX=vec2ind(y);

    % Get Centers
    C=net.IW{1};
    
end
