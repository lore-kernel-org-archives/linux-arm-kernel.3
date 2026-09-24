Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDAEDC98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 16:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Z6hK1wJOvRpU/CGhkbccoyVt+96evFlvSWCRsULX+k=; b=UxlHCAB94CL80WZ9KlJra4XyP9
	x6QSM4jHIIPWWETUnPI773U0AeisUss+0pqKUusohMLrCAcHiGnTMR5VFXAz5MiMogm0LW6nHqD+c
	4JTAIklFwCKFTr79+b4FuIqzSVwZS004N6RB+Z2DzSYNt5ewYnvABOZ/c2goBI4EclE+zILp4irLo
	LQqg4sptekiGlumUPDE8HoyefOyfjvpiL9+0B7sIt7LDqUfLrwA4s+wAhfMD3g1aZPl10GmV/41s9
	kaUiT/fpNhQsY9sXl+Ip0WxN+gvgJT+7Y7+GEnOZzG2Cl3E3dCOk9nsPagpAFnl1C6YrfGJh4E7ZK
	O70J/DIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9luZ-0000000BVtc-1BYQ;
	Thu, 24 Sep 2026 16:03:03 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9luW-0000000BVre-0Uvt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 16:03:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1790265777;
 bh=4Z6hK1wJOvRpU/CGhkbccoyVt+96evFlvSWCRsULX+k=;
 b=D3YsLwMNaJfRPq+ppJcriT30EIpDIa37YXLqxSSwvGMksoKScUpybiE8Is6AFXm2kUKpJr3IE
 QmMx/XrFmO9CRTz5PsLulxdNDaZbYa/L1BJBnbyUMRlQK/vEplto52QXLAF9Bqx314qhxB1tPoz
 DH9xRWONkg/HKBXLuoVrq0AXYQ49u/TFWLoZOAelAD/L0XPIZsyE8UrjMIo4HwpMm7Gxwys2kic
 c783i/bD6G/7M8TGawnCgqwobJzzR4TS2VvHBQNz4lTRykwNZMKU9bOkAFJh04Jf4t5Wi4S18tr
 vXn7L5fJ8xk+BEIj8DtHx41E7nqasM+1w8+ksDd0dSTA==
X-Forward-Email-ID: 6ab549aec3cf5b1855119e7f
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.16.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <d3c0b1c9-a9fe-42c1-b865-dd1a8cc4e416@kwiboo.se>
Date: Thu, 24 Sep 2026 18:02:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: rockchip: Remove cap-sd-highspeed on Rock
 Pi S eMMC
To: Shawn Lin <shawn.lin@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <1790147498-47766-1-git-send-email-shawn.lin@rock-chips.com>
 <1790147498-47766-3-git-send-email-shawn.lin@rock-chips.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <1790147498-47766-3-git-send-email-shawn.lin@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_090300_544179_1695483B 
X-CRM114-Status: GOOD (  13.60  )
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

Hi,

On 9/23/2026 9:11 AM, Shawn Lin wrote:
> cap-sd-highspeed declares SD high-speed support and has no place on
> the non-removable eMMC node. Drop it.
> 
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> ---
> 
>  arch/arm64/boot/dts/rockchip/rk3308-rock-pi-s.dts | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3308-rock-pi-s.dts b/arch/arm64/boot/dts/rockchip/rk3308-rock-pi-s.dts
> index c1e3098..677d129 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3308-rock-pi-s.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3308-rock-pi-s.dts
> @@ -133,7 +133,6 @@
>  
>  &emmc {
>  	cap-mmc-highspeed;
> -	cap-sd-highspeed;

The Rock Pi S board has two similar revisions that is supported by this
DT, one has onboard SD NAND Flash and the other one has onboard eMMC
supported by the emmc dw-mshc.

So this board should have both cap-mmc-highspeed and cap-sd-highspeed
here to support best speed depending on board revision.

Regards,
Jonas

>  	no-sdio;
>  	non-removable;
>  	pinctrl-names = "default";


