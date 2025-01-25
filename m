Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CF1C0218C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jan 2025 21:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PLiub32TzGOVCaRQu14Q2l8GT6j31oGwqg3AtHjXG9A=; b=d5Y+e4JTY2XRN8rx77HQPSx5v8
	2aBgkhHx15cba6zxKU49YxfuGEOFSR7YKvno50g1EpyaF1HFRPEBRLRaC2ul/XYd6j0sbpyj2dslH
	tcc62n3mLBD8QXh24PImrmrINfC+mv9YtTTxjcAwDFEf+J/qAsAmkS+/lSiwkI9Grk/6On6aWv4B3
	9z3KB3kIh9o0le5M0V2uwbkkARU+PjsBHj7p0Osal3D2E7AH4qH9MQ2LAPxdxrPxw24cDh3TGgFI4
	F9/J3iIDc+RUv9BkGDAuouqaAe2XAUluOIRjvVt3fA5W+7/rBddG9i9ETeB7CQlp1CAef8sp3JyHU
	sX2p8jBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbnjh-0000000GnFI-20bP;
	Sat, 25 Jan 2025 21:30:37 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbniM-0000000Gn7r-1gXN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jan 2025 21:29:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1737840553;
 bh=PLiub32TzGOVCaRQu14Q2l8GT6j31oGwqg3AtHjXG9A=;
 b=WcLMEX5Xxa4rJf8Y27ya8MKjgTAIxSR0FEcDFz3sYJeRAs4aCLAfcbK+cX62GdA8XxSav/nJr
 gd08csi6DiHQBufXHs/93KJVSmemANNz9IBoV2GCAQ63wh7TyiZ08NUE0evktP7RePg8yopc5K4
 HNAIyDaJB99UZgeZRa7mvgPnEwbDdTxlQi6pteeppOB4dNcGDY9Ct+E6bhYSkaPNFFOwuC4pRBd
 MD2FecKKyTNvZE/B623CkEek4OO1bwGib+7mIMTOBnn7APZ3ZsNekubGJXDG3cKp9jdLC6zHQeh
 rbUkp/gqiWoYrdjr+kFATw4fkFCGJ75dHXakJG2iQXjg==
X-Forward-Email-ID: 6795578c58390289d47a0c06
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <e0bef56d-0777-4467-8ddc-3b8b23d7ac21@kwiboo.se>
Date: Sat, 25 Jan 2025 22:28:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] Revert "clk: rockchip: Set parent rate for
 DCLK_VOP clock on RK3228"
To: Elaine Zhang <zhangqing@rock-chips.com>, Alex Bee <knaerzche@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, kever.yang@rock-chips.com,
 heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, huangtao@rock-chips.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250125011545.15547-1-zhangqing@rock-chips.com>
 <20250125011545.15547-2-zhangqing@rock-chips.com>
 <8752cfda-b90a-4296-a08b-054b177aa586@gmail.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <8752cfda-b90a-4296-a08b-054b177aa586@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250125_132914_785346_0173AC4C 
X-CRM114-Status: GOOD (  21.60  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Elaine,

On 2025-01-25 06:38, Alex Bee wrote:
> Hi Elaine,
> 
> Am 25.01.25 um 02:15 schrieb Elaine Zhang:
>> This reverts commit 1d34b9757523c1ad547bd6d040381f62d74a3189.
>>
>> RK3228 Only GPLL and CPLL, GPLL is a common clock, does not allow
>> dclk_vop to change its frequency, CPLL is used by GMAC,
>> if dclk_vop use CLK_SET_RATE_PARENT and CLK_SET_RATE_NO_REPARENT flags will
>> affect the GMAC function.
>>
> how do you come to this conclusion?
> 
> On the RK3228, hdmiphy is the default parent of dclk_vop, a clock that is
> not even generated by the CRU but is the output of an external HDMI PHY.
> The CLK_SET_RATE_NO_REPARENT flag ensures that the parent of dclk_vop never
> changes to sclk_vop_pre (and thus never uses CPLL or GPLL). With
> CLK_SET_RATE_PARENT we only ensure that we can use all rates of [0] since
> there is no divider between dclk_vop and hdmiphy. Overall it is pretty much
> the same situation as for RK3328, which handles these clocks in the same
> way (see dclk_lcdc for RK3328).

I came to similar conclusion for v1 of this patch, see [2].

Maybe we should assign clk parent in DT similar to rk3328.dtsi to make
it extra clear that hdmiphy should be used as parent?

  assigned-clocks = <&cru DCLK_VOP>;
  assigned-clock-parents = <&cru SCLK_HDMI_PHY>;

Also for next revert patch you send, please include the patch author in
the recipient list :-)

[2] https://lore.kernel.org/all/d95d317c-5f6e-42bd-94a9-e1a6c7685e2f@kwiboo.se/

Regards,
Jonas

> 
> Regards,
> Alex
> 
> [0] [1] 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c?h=v6.13#n293
>> If the client application does not use GMAC and CPLL is free, make this
>> change on the local branch.
>>
>> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
>> ---
>>   drivers/clk/rockchip/clk-rk3228.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/rockchip/clk-rk3228.c b/drivers/clk/rockchip/clk-rk3228.c
>> index ed602c27b624..9c0284607766 100644
>> --- a/drivers/clk/rockchip/clk-rk3228.c
>> +++ b/drivers/clk/rockchip/clk-rk3228.c
>> @@ -409,7 +409,7 @@ static struct rockchip_clk_branch rk3228_clk_branches[] __initdata = {
>>   			RK2928_CLKSEL_CON(29), 0, 3, DFLAGS),
>>   	DIV(0, "sclk_vop_pre", "sclk_vop_src", 0,
>>   			RK2928_CLKSEL_CON(27), 8, 8, DFLAGS),
>> -	MUX(DCLK_VOP, "dclk_vop", mux_dclk_vop_p, CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
>> +	MUX(DCLK_VOP, "dclk_vop", mux_dclk_vop_p, 0,
>>   			RK2928_CLKSEL_CON(27), 1, 1, MFLAGS),
>>   
>>   	FACTOR(0, "xin12m", "xin24m", 0, 1, 2),
> 
> 


