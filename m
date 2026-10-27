Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719EA606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 00:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rulEpeKY;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=PWL363Gd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FSAxfmic52ND3G8dQDz0tc2KBUjw/SYV9wPYI5DUcGg=; b=rulEpeKY4YfgXn
	wt9wMmUEKzqUftcupdcTpcXUXS2i4ZuwgKHSSsMXpNU8uIfftOnIfHMfx5hEY79U2PKDJ0TLcx65R
	aBRumZo1GkDA/CTXoG+hFV3Hku5ZnVVF49yUh5WAwrfPFzUWANDX9gDJqMVKV1Z65ShbESDPeavsq
	dCmtgzZvyBZp+hhzJdDidIqqXSo/UTMq2mP0hogreRY7BUY+lf0Nvql7QPNv8HRXNIPuTjiLo0s25
	xoIDG7vaFgTgyDkMv/I36vY79YMiGjgLCVq10f5kGOkU4DqLJNCFIvUJ3xD+dzxsE7a0J+sqsAewz
	qZ4BaG5h7F35M15Q42Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLVUP-00000003Z8A-104V;
	Tue, 27 Oct 2026 00:56:33 +0000
Received: from mail-m6034.netease.com ([210.79.60.34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLVUJ-00000003Z6J-2FDp;
	Tue, 27 Oct 2026 00:56:32 +0000
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 526ea9e6d;
	Tue, 27 Oct 2026 08:56:23 +0800 (GMT+08:00)
Message-ID: <edacd4f1-1124-4439-9eda-633c7a4a6f8c@rock-chips.com>
Date: Tue, 27 Oct 2026 08:56:19 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Artem Shimko <a.shimko.dev@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Simon Xue <xxm@rock-chips.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Add the watchdog reset to RK3399
To: iav@iav.lv, Heiko Stuebner <heiko@sntech.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20261027-rk3399-wdt-reset-v1-1-de9615abb0ec@iav.lv>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20261027-rk3399-wdt-reset-v1-1-de9615abb0ec@iav.lv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa17adbbbac03a4kunma90a6e004743a1
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTktOVkJNSR8ZHR9PSx9LGFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=PWL363GdUjW1784OfG7j+YKI7o/gFsCMvKUsjaCHhA2WFslocJsNLRvCL1YreVxr+O45uyPM7Kq0juXgChueXnqPDFWX1pVeiw6ZNVXF4zq/pSJ9+Ny2sH198XWu9XqoxmnM6JNY43W0p0Djo4vSlFTdq3AGMa3oQifoaCUsM9c=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=FSAxfmic52ND3G8dQDz0tc2KBUjw/SYV9wPYI5DUcGg=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_175628_117868_00101D9D 
X-CRM114-Status: GOOD (  17.16  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Cc: Simon

在 2026/10/27 星期二 8:20, Igor Velkov via B4 Relay 写道:
> From: Igor Velkov <iav@iav.lv>
> 
> The RK3399 watchdog at 0xff848000 is reset by SRST_P_WDT0 (bit 5 of
> CRU_SOFTRST_CON20), but its node has no resets property. Its clock is
> gated from SECURE_GRF_SOC_CON3[8], out of reach for Linux, so without
> the reset dw_wdt_stop() can only set WDOG_HW_RUNNING and the watchdog
> keeps counting through s2idle: on a Kobol Helios64 and a ROCK Pi 4A,
> s2idle longer than the watchdog timeout ends in a watchdog reset.
> 
> With the reset line dw_wdt_stop() can stop the watchdog, and with
> "watchdog: dw_wdt: manage reset line during system suspend/resume" the
> driver holds it in reset while the system sleeps.
> 
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
> The dw_wdt side is applied in the watchdog tree:
> https://lore.kernel.org/r/20261024140854.25664-3-a.shimko.dev@gmail.com
> ---
>   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
> index c46e58d4af0d..7b71b24c1f51 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
> @@ -1748,6 +1748,7 @@ watchdog@ff848000 {
>   		reg = <0x0 0xff848000 0x0 0x100>;
>   		clocks = <&cru PCLK_WDT>;
>   		interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH 0>;
> +		resets = <&cru SRST_P_WDT0>;
>   	};
>   
>   	rktimer: rktimer@ff850000 {
> 
> ---
> base-commit: d2abcbb905b0e4b2e06b257fa1e5bcf4faa6dbda
> change-id: 20261027-rk3399-wdt-reset-c58d2111609d
> 
> Best regards,


