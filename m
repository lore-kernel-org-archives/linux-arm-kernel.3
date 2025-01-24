Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4BAC0218B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 14:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MsYLWrXefMP5m34iCp3jAP9mKY5iNXf4rWORER2MwmY=; b=1MkuWQjaKHMSsW9UYqWGMWflJR
	j6fV3SGUZNGC0EGLyLXF5tPw3NTBJPUtk4h/daU/tv6zJU6efSoo4NMjecab2uWdqi9U6W/K0GiiP
	9AmGFqSHLCzrB7vo23GNWxjcQ9B2rhkrM4Y6NoFNyfvv6HGpqRiMMhvLJscD6OQ5OkaebOI/HiZLe
	MekU2BuzQvBtaEQFdZRRsQhPqwsEVPjxT8oTmEXgACh+Ufw7Bg2WbX9KEoNiNdUee/Xt3Z8IrYLz1
	3Pte9WcpVGDZCsTVKHkPPnwktPsrpOPm6Y9m62ZAAyEfm1RkR8oq2rhb6gck7BE8axq6H67SgFnTF
	TinMD3Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbKtW-0000000Es8W-2LhM;
	Fri, 24 Jan 2025 14:42:50 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbKsC-0000000Es4H-265Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 14:41:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1737729688;
 bh=MsYLWrXefMP5m34iCp3jAP9mKY5iNXf4rWORER2MwmY=;
 b=TYZSxalc1sdrMo2BZrvobr+b4qvJ69qsB7iFKOu3PR6ueiFbE5c++K64BrJEWoEGZY3LEhLsn
 QZ6obqulq2Wruf/e7IrDRRSB9mlBDVxEDsOi4O/OS/KyZonu0AVeULYCTbUDeVdUpfzdUaSNBzJ
 gQ3Ct7ufEX1rF8sr0cllq/mP1DwalhLdwau55wRtRKOkWTgAuyZhjteRLiA1ZtkD+Zj+/POXPfX
 HlXdDbwoTrVuGSFaxmTAGzOVJXrMJ0+nm8MXsReYU6IhAtgVPefaoDdx3EopQ42AkVrQQxQnO4b
 Ru4rixIdHzkbskPMHNFZVHCIiB3AwJ0ROCNOLqhCoMiQ==
X-Forward-Email-ID: 6793a67f3e07d3fa850557b4
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <d95d317c-5f6e-42bd-94a9-e1a6c7685e2f@kwiboo.se>
Date: Fri, 24 Jan 2025 15:40:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] Revert "clk: rockchip: Set parent rate for
 DCLK_VOP clock on RK3228"
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, kever.yang@rock-chips.com,
 heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, huangtao@rock-chips.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250124064619.13893-1-zhangqing@rock-chips.com>
 <20250124064619.13893-2-zhangqing@rock-chips.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250124064619.13893-2-zhangqing@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_064128_571456_3F6D78F7 
X-CRM114-Status: GOOD (  16.17  )
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

On 2025-01-24 07:46, Elaine Zhang wrote:
> This reverts commit 1d34b9757523c1ad547bd6d040381f62d74a3189.
> 
> RK3228 Only GPLL and CPLL, GPLL is a common clock, does not allow
> dclk_vop to change its frequency, CPLL is used by GMAC,
> if dclk_vop use CLK_SET_RATE_PARENT and CLK_SET_RATE_NO_REPARENT flags will
> affect the GMAC function.

Please explain how CPLL and GPLL is affected by this? According to TRM
the hdmiphy is default parent (reset value), this is also how similar
clock is defined for RK3328.

  vop_pll_sel  
  Control vop clock PLL source selection.  
  1'b0: select hdmiphy pll clock (reset value)
  1'b1: select vop dclk

Maybe the dclk_vop name is causing confusion, or am I missing something?

Regards,
Jonas

> 
> If the client application does not use GMAC and CPLL is free, make this
> change on the local branch.
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> ---
>  drivers/clk/rockchip/clk-rk3228.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/rockchip/clk-rk3228.c b/drivers/clk/rockchip/clk-rk3228.c
> index ed602c27b624..9c0284607766 100644
> --- a/drivers/clk/rockchip/clk-rk3228.c
> +++ b/drivers/clk/rockchip/clk-rk3228.c
> @@ -409,7 +409,7 @@ static struct rockchip_clk_branch rk3228_clk_branches[] __initdata = {
>  			RK2928_CLKSEL_CON(29), 0, 3, DFLAGS),
>  	DIV(0, "sclk_vop_pre", "sclk_vop_src", 0,
>  			RK2928_CLKSEL_CON(27), 8, 8, DFLAGS),
> -	MUX(DCLK_VOP, "dclk_vop", mux_dclk_vop_p, CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
> +	MUX(DCLK_VOP, "dclk_vop", mux_dclk_vop_p, 0,
>  			RK2928_CLKSEL_CON(27), 1, 1, MFLAGS),
>  
>  	FACTOR(0, "xin12m", "xin24m", 0, 1, 2),


