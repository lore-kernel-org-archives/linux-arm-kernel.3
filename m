Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB24DCA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 18:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sGFQAyqZxGto/xbejaJELBnPG5mkf1KODe3C1Ny1nQA=; b=ba1q0jSXvPXwh5FETRmQYjROo7
	T3S1WOKGpchHAt0yeRlIYCz07uPNwm08GOPOoPjiJsUvE7AQgMjlktYyRmToDtUy+5X7dEK+0I9Rk
	sw0tz4acDIbgW4qzAifQD42kkaHYhUgTB4vNiJ5/qRpuiK+NgxD6iE6ZCoa76zmKVXsHzCRAu8ZQ3
	vwG7+3Pt0RWca09W+hidlQFa9nzhH042UwI63Qjo/TF+1NDyv8rdSKcKKMl1sp9ZfZx4LT2/enPVa
	LUQAishGXM2i6LWzFCcb6D5/t36ojJOlGKpe+Ma/+YOm0ESQsBxJPtC0YLlMPvkMlMCh2WdkhDmXR
	+OT7+Apw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBzMt-000000071F0-3JqW;
	Wed, 30 Sep 2026 18:49:29 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBzMo-000000071Cj-0tZf;
	Wed, 30 Sep 2026 18:49:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=sGFQAyqZxGto/xbejaJELBnPG5mkf1KODe3C1Ny1nQA=; b=KVXHartTcoPYRK0T7Rp6T/Gxwk
	23fOxS7kuOUfBGvP2/D8UPK5zsagMcS+XzrIbPxHXoa+aoYKmZ515A2ZTiaVVKkL5dANe28UxaIgb
	PxNEHkKJFpJII9DZOwsMV7Hl6OWK/s0rtvsvVmBepyVbdzhTQt16iUDz1UqulILQR2sFXRU1qpZA8
	gO3q1peISvPIRhQLc9OwgAe5Ts8LR75CcGp/9qCQQnKxcgYHZSR3jhA+P/142Bs2VfhzE8NDGrUAg
	RUiutKALPGsXRBHdQ+1yEiB0kfPr9JAUyLZYI4baz9EpTmv42rvAsSxFGi5hNwpmiyFu3ThWPsKq0
	4lY5AwAA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH 0/4] Clean up invalid MMC properties in Rockchip board DTs
Date: Wed, 30 Sep 2026 20:49:14 +0200
Message-ID: <179079409722.2398180.5227943339366758061.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <1790147498-47766-1-git-send-email-shawn.lin@rock-chips.com>
References: <1790147498-47766-1-git-send-email-shawn.lin@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_114923_007254_248CF3B0 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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


On Wed, 23 Sep 2026 15:11:34 +0800, Shawn Lin wrote:
> The MMC nodes in both arch/arm64/boot/dts/rockchip and
> arch/arm/boot/dts/rockchip contain a few properties that
> contradict the card type the node actually describes.
> 
> 
> 
> Shawn Lin (4):
>   arm64: dts: rockchip: Remove broken-cd on Rock 5 ITX SDIO
>   arm64: dts: rockchip: Remove cap-sd-highspeed on Rock Pi S eMMC
>   arm64: dts: rockchip: Remove cap-mmc-highspeed from SD-only slots
>   ARM: dts: rockchip: Remove cap-mmc-highspeed from Omega4 sdmmc0
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: rockchip: Remove broken-cd on Rock 5 ITX SDIO
      commit: 7c841000c377a3997e64f45c938dd77bfbd74cc6
[3/4] arm64: dts: rockchip: Remove cap-mmc-highspeed from SD-only slots
      commit: c7502a43087748277cf5c55d5a414672e82426c6
[4/4] ARM: dts: rockchip: Remove cap-mmc-highspeed from Omega4 sdmmc0
      commit: b86f1ad2e69b3ef2c1bb46f2b585ac8aff44cad2

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

