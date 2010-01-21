%%%-------------------------------------------------------------------
%%% File    : http_lib.erl
%%% Author  :  <ecka@ECKAX>
%%% Description : 
%%%
%%% Created : 20 Sep 2009 by  <ecka@ECKAX>
%%%-------------------------------------------------------------------
-module(http_lib).

-export([download/1, omx_req/1]).

%%Side-effects
download(Page) ->
    inets:start(),
    {ok, {_,Headers, Body}} = http:request(Page),
    inets:stop(),
    {Headers, Body}.

omx_req(Xml) ->
    inets:start(),
    {ok, {_, Headers, Body}} = http:request(
				 post,
				 {"http://www.nasdaqomxnordic.com/webproxy/DataFeedProxy.aspx",
				  [], "application/x-www-form-urlencoded", Xml}, [], []),
    inets:stop(),
    {Body}.




