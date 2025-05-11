Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE07C3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 10:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=capnI/bdaBa0d68B1BfknB4kyjMQVSGq7MKbN0/U7Z4=; b=vV5PQRDUxX6rzdnSS007JUVrpG
	y6iTeQcwGCVF1tg9W0dZTD8ilavWmsCQvaukUyTTutAQpJr9EVz9JLy3yeUFjARMS0sR9zVyEWbP+
	QFha/dlQqaCQi193bb61kiI/K1O30CBABUbQZs9mE2U+jOYCr64vrbaBQw6fROG4ryoeNbDmp0vb9
	/kgaRSSyZq2i6kGa4Hpa7xTtDsgla4Xc5j7dHGt1WBQfzJFH9gfd7xow/rD2DiwEZ7VqnIRyhrYqj
	layq5MQMSUSam2ao1XatyeHg++aj3RLeI6w/WMU2kaCevhRwbytd+1zTU6d8b+odKUzTqwNodRlDQ
	tFeYhTHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE46p-000000075m7-2OQ2;
	Sun, 11 May 2025 10:40:39 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE44k-000000075bE-0LnB;
	Sun, 11 May 2025 10:38:31 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 209C525BE1;
	Sun, 11 May 2025 12:38:25 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GxEtpmilfeGs; Sun, 11 May 2025 12:38:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746959904; bh=FDjXCaSUAFTz8h1Cfb+Yw4ryg7CBI6pXjTaPHanJXIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ElkXcjg4P8dgjxzokPxKWdrbYZJxCuw6FhacHSxNdXGGBIH8WxzRyGnUsVsCRqkib
	 NEfCe71/pseFcwL7NI/2Ra1o8jpaZv7eCSpg/1Wku4ecHmEAWQP3T6tqhSpm7K/avc
	 vIcH11oFI3qd3CYjfupDDXYnR8RuFWF2gauVIr4HPOjKumL33ljv8n71pq0VTIwzh1
	 pljTIyr5VYMLvPGYlxf8s5KqVz3nlLdG5TbXaQXHGC8XH08c44HhDUGQXy9shPgblh
	 G2g6Iasg4VZmMqyeErwGFnVmIUxL3CfW/73u5LsKnhmp79js5gOUxyIoqM04RFpWct
	 iL1sGr/vlN2Ow==
Date: Sun, 11 May 2025 10:38:05 +0000
From: Yao Zi <ziyao@disroot.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] arm64: dts: rockchip: move rk3528 i2c+uart aliases to
 board files
Message-ID: <aCB-AVcZLvFw6mRS@pie.lan>
References: <20250510220106.2108414-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250510220106.2108414-1-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_033830_540915_302253EB 
X-CRM114-Status: GOOD (  17.36  )
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

On Sun, May 11, 2025 at 12:01:06AM +0200, Heiko Stuebner wrote:
> Even though they will be the same for all boards, i2c and uart aliases
> are supposed to live in the individual board files, to not create
> aliases for disabled nodes.
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

Reviewed-by: Yao Zi <ziyao@disroot.org>

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
> -- 
> 2.47.2
> 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

