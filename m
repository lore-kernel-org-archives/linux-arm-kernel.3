Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AEE6C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 17:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DTgI03Mb2guSbNjbgohk2ODS86HEBC4CplwUVNmAa0I=; b=opkZQafH3gEwnuUNh9Axgf/Wtg
	rYjgjDrHsTRewqDKF9CJZ2H2EKojywMFknFKPxDyUX+fw51rUGygDxkqEVP/GJ8w108UJL6c3MY0O
	Hukx+nUordKljHv+eg8INmrZfYWKoN5cCU3+oA1iMIk8YIt/tipfb2j/cyJVFbWIHRX8ttAbq/mly
	i1h5h07GIAty5+y+hC4NyF8eGyHY3yseoaly1gsRF5ZAaHcmAzCHB5oxaumSOaQyyjecdYx+Nrkgo
	bLyO9bo4cH3lnhJ1DTPGcywHXiMwe3MfF3+AH1br+KuHC870m6yRoC9HHSO+0R89AvaG6m7ZH9f1Z
	sQ7+cxkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93tj-000000068g6-1eD5;
	Tue, 22 Sep 2026 17:03:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93ti-000000068fl-1hce;
	Tue, 22 Sep 2026 17:03:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2389142E81;
	Tue, 22 Sep 2026 17:03:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4995F1F000FF;
	Tue, 22 Sep 2026 17:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790096594;
	bh=DTgI03Mb2guSbNjbgohk2ODS86HEBC4CplwUVNmAa0I=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=dxf06q/cfVdRc+b9A3STWRA0UWGDXlKXGJvWITgIYlNSzK3Cujfv2zQh7kDpaa6bX
	 /9LasdNdUBAjHzz2yRUdmGjaeueKsI80375q2iIEJaa7r3XT6GSB2KtKqBHD4AkRkT
	 pKIQhXRJr0zBqcPYFpD/TOpGuIdsB0Rddz01va4QQ73GpWAPrBJ+WGedlLqjinn5WH
	 E/auFJGb3Qf9HbyAa/84wZWJa4DOdyO5Og/K6SWUU0py0yhYpbfA+RZFY9ix5ff0X7
	 EftFWNgSzEdOG9rbRpd4KjNOOUT5rVRMazCOXpqwYnxMDwmL8sSnYBGJx39seh2IQr
	 5KsMgWWG+HlhA==
Subject: Re: [net PATCH] net: ethernet: mediatek: only enable WED for ARM64
 architecture
From: netdev-bot+sashiko@kernel.org
To: yangshiji66@outlook.com
Cc: netdev@vger.kernel.org, nbd@nbd.name, lorenzo@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 stable@vger.kernel.org
Date: Tue, 22 Sep 2026 17:03:12 +0000
Message-ID: <179009659284.2160803.2402786454793152027@kernel.org>
In-Reply-To: =?utf-8?q?=3COSZPR01MB8140B889AD227E0B547F5F87BC872=40OSZPR01MB?=
 =?utf-8?q?8140=2Ejpnprd01=2Eprod=2Eoutlook=2Ecom=3E?=
References: =?utf-8?q?=3COSZPR01MB8140B889AD227E0B547F5F87BC872=40OSZPR01MB8?=
 =?utf-8?q?140=2Ejpnprd01=2Eprod=2Eoutlook=2Ecom=3E?=
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] Inappropriate `Fixes:` tag: the commit claims to fix
  804775dfc288 ("net: ethernet: mtk_eth_soc: add support for Wireless…

--

net: ethernet: mediatek: only enable WED for ARM64 architecture

This narrows the dependency of the hidden def_bool symbol
NET_MEDIATEK_SOC_WED so it is only enabled on ARM64 ARCH_MEDIATEK
builds, on the grounds that only MT7622 and MT798x implement WED.

> diff --git a/drivers/net/ethernet/mediatek/Kconfig b/drivers/net/ethernet/mediatek/Kconfig
> index 2ba361f8ce7d..7737f2f15478 100644
> --- a/drivers/net/ethernet/mediatek/Kconfig
> +++ b/drivers/net/ethernet/mediatek/Kconfig

>     Fixes: 804775dfc288 ("net: ethernet: mtk_eth_soc: add support for Wireless Ethernet Dispatch (WED)")

[Severity: Medium]

Is the Fixes: tag appropriate here?  The changelog does not describe a
defect, only a hardware-scope observation and a prediction:

    Currently, only MT7622 and MT798x SoCs support WED features. They
    are all ARM64 platforms. And it is unlikely that MediaTek will
    release a new net chip based on ARM32 architecture in the future.

As far as I can tell nothing misbehaves on 32-bit today.  WED is only
instantiated when the ethernet DT node carries a mediatek,wed phandle:

drivers/net/ethernet/mediatek/mtk_eth_soc.c:mtk_probe() {
	...
	np = of_parse_phandle(pdev->dev.of_node,
			      "mediatek,wed", i);
	if (!np)
		break;
	...
	mtk_wed_add_hw(np, eth, eth->base + wdma_base, wdma_phy, i);
	...
}

and git grep wed arch/arm/boot/dts/mediatek returns no matches, so no
32-bit MediaTek platform can reach mtk_wed_add_hw().

There also does not appear to be any 64-bit-only construct that a
depends on ARM64 would be repairing: mtk_wed.c, mtk_wed_wo.c,
mtk_wed_mcu.c and mtk_wed.h contain no readq/writeq, no >> 32 address
splitting and no CONFIG_64BIT conditionals (the only CONFIG_64BIT use in
the directory is in mtk_eth_soc.h, which this symbol does not gate).

> @@ -8,7 +8,7 @@ config NET_VENDOR_MEDIATEK
>  if NET_VENDOR_MEDIATEK
>  
>  config NET_MEDIATEK_SOC_WED
> -	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	depends on (ARCH_MEDIATEK && ARM64) || COMPILE_TEST
>  	def_bool NET_MEDIATEK_SOC != n

Since the Fixes: tag makes this a candidate for stable backporting, could
this silently flip a config symbol in released kernels?  On a stable tree
with 32-bit ARCH_MEDIATEK, the depends on line becomes false and
NET_MEDIATEK_SOC_WED is a hidden def_bool, so make olddefconfig drops
mtk_wed*.o from the build with no prompt or warning.

Would it make sense to drop the Fixes: tag and describe this as a build
scope cleanup instead?

One more question on the ARM64 condition itself: if something in the WED
code really is not buildable on 32-bit, does the || COMPILE_TEST branch
leave that unaddressed, since it still builds the identical code on
non-ARM64 targets?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/OSZPR01MB8140B889AD227E0B547F5F87BC872%40OSZPR01MB8140.jpnprd01.prod.outlook.com

