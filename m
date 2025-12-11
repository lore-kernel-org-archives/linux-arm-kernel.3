Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A21CD41C3C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 14:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=frzh+UN34EhRr88zl7A0WKTrjUwHajM31hBfzRLj1lc=; b=o0gebpGU+2Y2xpnmO5lMhpngkp
	deURoIuc96ax6bT6ox0Vk6P9SypBV/UTCtiuQYT0sjuuC1jsMTlSw1sF9JFMftRoDZ1bn2u+xN9Bh
	H5VKX5OEo+3W7COZBRFNeRRzRUuYFxNxnioMuoZvIaYknKAGC5T27+lAu8KOcT4lc4C9lyQqj9Y2H
	XyCurt1/aMLAbcbfQdSeBz81wp7CBcVUOTM3Qg9NHhDfnSsRp9g2G9MjJMztKOrDRCM3jhzxJySAG
	WVMRTS1RbQh3uThqZYaOh0cbHp820B8230lCXSPcidUxTuzC/oHU8usNxmGvih3VdoE45RK85BG0u
	auvGiJgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vThKf-0000000Gheu-2gxR;
	Thu, 11 Dec 2025 14:07:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vThKd-0000000Ghe9-2Guq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 14:07:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E04704437F;
	Thu, 11 Dec 2025 14:07:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97F5DC116B1;
	Thu, 11 Dec 2025 14:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765462066;
	bh=vcRg1Eqi3odp7RefN9n5Z70f73goUkg5nxx720202Vc=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=roDUA2KHXrLZqRTAerROurGDYD6CGUgQEGdx69SsrlSvt+G8+AZDSryMeTFfO41+D
	 lYjZtPLhzCbKSXBZZz9MPNU0Yu4XKLkTxPVjRWG5sbbrRhOh4MjDjVigBHY6fC0qzO
	 9i9uIVJ0gJ2thItLg7wNEi2zmnDdpuUO8dp/JYZQ50pWmogLgpAJCaEVFnqHHz55oX
	 0TaGQ/y6CWsgD6Ors1S4OFqfpjVIAF9nf+oWQ8JZ6kTVUIx9sTP1Ekc2wCyMrkfoq1
	 bNcmTWMfs/Uo5yR2rj8obmBFwah07TrFEYaBarNzYQoHzVD4PTSzjg5ulzqqqO5kJa
	 l1BH10c5Rip2A==
From: Rob Herring <robh@kernel.org>
Date: Thu, 11 Dec 2025 08:07:44 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Cc: joel@jms.id.au, cosmo.chou@quantatw.com, krzk+dt@kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, andrew@codeconstruct.com.au, 
 conor+dt@kernel.org, devicetree@vger.kernel.org
To: Cosmo Chou <chou.cosmo@gmail.com>
In-Reply-To: <20251211080311.242771-1-chou.cosmo@gmail.com>
References: <20251211080311.242771-1-chou.cosmo@gmail.com>
Message-Id: <176546187995.970978.16806289735144663383.robh@kernel.org>
Subject: Re: [PATCH] ARM: dts: aspeed: bletchley: Fix dt-schema warnings
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_060747_598210_03FE36E6 
X-CRM114-Status: GOOD (  14.10  )
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


On Thu, 11 Dec 2025 16:03:11 +0800, Cosmo Chou wrote:
> Update the device tree to fix dt-schema warnings:
> - Use generic node names for SPI, LEDs, and GPIO keys.
> - Update SPI GPIO properties to use the "-gpios" suffix.
> - Remove unused address/size cells from pca9539 nodes.
> - Use 'aspeed,int-vref-microvolt' in ADC nodes.
> - Remove unused 'aspeed,hw-timeout-ms' from i2c13.
> 
> Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
> ---
>  .../aspeed/aspeed-bmc-facebook-bletchley.dts  | 100 ++++++++++--------
>  1 file changed, 54 insertions(+), 46 deletions(-)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20251211 (exact match)
 Base: tags/next-20251211 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/aspeed/' for 20251211080311.242771-1-chou.cosmo@gmail.com:

arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: adc@1e6e9000 (aspeed,ast2600-adc0): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: adc@1e6e9100 (aspeed,ast2600-adc1): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml






