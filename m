Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5026EC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 11:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ek6GBAYJeDRPIZjH28p/Q9SJdCsotpdSU7d2WoGn9tU=; b=KWN7k2siVdDc5NSMgYBrv6h4u9
	4x6ZFwP0MfaJ+5iqVF7w/5LMa7Knlv5mADcwFoZRaqyib4H8y3wEB+SyYlwK3WFMvCbq8qS25/CUl
	CJul7quWcQ9taveqY5wprhGDLntlKJhenewsruHGT97gmLTQ81ppHWbiOmGp4aVnLNHYDwqVLRTjo
	7wNgRRpnEaNs6eJxkucyL8p8psOTgQvA/vL2TrIQfQuDh4iezj79nrs03W4gETTIbQnyLBpg4Lv8Z
	Y9jHHEOH77SGNY/OLYmR2BipMwyLmRdHOXtvBxb7JEVuieKWmvGN1xRNVyYLU5hnddWugLZlukedW
	jHWuK8vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE4ZI-000000078Ur-0QqL;
	Sun, 11 May 2025 11:10:04 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE4Uj-000000078Ai-1eaJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 May 2025 11:05:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1746961519;
 bh=ek6GBAYJeDRPIZjH28p/Q9SJdCsotpdSU7d2WoGn9tU=;
 b=hDF9ZEAWDKtbe/TIvELNrfnS21K5PvjhMOwWzX7OERfrW7oz15751QMxS0gQ/CuzU7vHZRBhm
 fcyW/sArKiYOXgVLxpOU3W4jd2M+BSRLGX+pe53XwYI9au//AbaP4Wds4dTPDyceSUH3V02D5zu
 6ChCNJH9aTv/xvtzFEhEUYFjWBKOtXkaIKvOfpjoa/MP8r93wPrpE5shIUXJracTUyK7OQAUkes
 kVCEzXcDWDDYR8FAyf2bAMy/70IrsSswDf1pr0mDCOtGcM6uQ04P5Q1SYEv1lynS4bSmbxHJ3E2
 9TOtDkz30kyxXklUaZ5ETc71UZ1O6IZ2vNXNQgJ3wx9A==
X-Forward-Email-ID: 682084688a98caeef2469b46
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.0.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <4a4c0295-d8f1-4d8a-92e4-34a69b42c728@kwiboo.se>
Date: Sun, 11 May 2025 13:05:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: move rk3528 i2c+uart aliases to
 board files
To: Heiko Stuebner <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250510220106.2108414-1-heiko@sntech.de>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250510220106.2108414-1-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_040521_785392_E3A23765 
X-CRM114-Status: GOOD (  18.39  )
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

Hi Heiko,

On 2025-05-11 00:01, Heiko Stuebner wrote:
> Even though they will be the same for all boards, i2c and uart aliases
> are supposed to live in the individual board files, to not create
> aliases for disabled nodes.

This sounds like something tooling should be able to handle, e.g. U-Boot
use fdtgrep to filter out nodes (and aliases) for the FDT used by early
boot phases.

Maybe DTC just need a feature to remove aliases to disabled nodes?

Also how should overlays handle aliases? Are all overlays suppose to add
aliases for the add-on devices they may enable?

And how should we handle boards with e.g. a 40-pin header where pins
could be muxed to multiple functions. Is it the overlays responsibility
to remove and replace aliases? E.g. if pins can mux between i2c1 and
uart3, and i2c1 was enabled by default.

Regards,
Jonas

> 
> So move the newly added aliases for rk3528 over to the Radxa E20C board,
> which is the only rk3528 board right now.
> 
> Fixes: d3a05f490d04 ("arm64: dts: rockchip: Add I2C controllers for RK3528")
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  .../boot/dts/rockchip/rk3528-radxa-e20c.dts      |  2 ++
>  arch/arm64/boot/dts/rockchip/rk3528.dtsi         | 16 ----------------
>  2 files changed, 2 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
> index 506d54337ece..9f6ccd9dd1f7 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
> @@ -18,8 +18,10 @@ / {
>  
>  	aliases {
>  		ethernet0 = &gmac1;
> +		i2c1 = &i2c1;
>  		mmc0 = &sdhci;
>  		mmc1 = &sdmmc;
> +		serial0 = &uart0;
>  	};
>  
>  	chosen {
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> index cd8ef389ccf3..b2724c969a76 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> @@ -24,22 +24,6 @@ aliases {
>  		gpio2 = &gpio2;
>  		gpio3 = &gpio3;
>  		gpio4 = &gpio4;
> -		i2c0 = &i2c0;
> -		i2c1 = &i2c1;
> -		i2c2 = &i2c2;
> -		i2c3 = &i2c3;
> -		i2c4 = &i2c4;
> -		i2c5 = &i2c5;
> -		i2c6 = &i2c6;
> -		i2c7 = &i2c7;
> -		serial0 = &uart0;
> -		serial1 = &uart1;
> -		serial2 = &uart2;
> -		serial3 = &uart3;
> -		serial4 = &uart4;
> -		serial5 = &uart5;
> -		serial6 = &uart6;
> -		serial7 = &uart7;
>  	};
>  
>  	cpus {


