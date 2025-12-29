Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6A0E92FD9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 20:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B7CgINhDX36iBY06hpy2BBwuJYa2QrZaCKCO1NEBs0o=; b=45VMHNN44vMT0LEmvnni9NA5g9
	Alo8e9oh8Wky7I8349LngrzOxFp6v2sPXEHHn1O6Ef6PcatceHpDxuS5jvP1GCBVAdOl2UfPYBNEP
	C71ujq3V1s2VuuvK6olF5fIOUtEfxRz7op/sl4lQHH0881NVhP9cUWg2X77Yn+vUYb0TaJhIxoppB
	yNXgSrg5dE2p7Yt9S5RHM1UsHLdVJVLrHkRpL2NPfMOysSg4FQZuYqrLNfOPtPnf5nr8jm0m07yoi
	OtjTskMmKn3Gn5HD29dpKd9inSlEEGqYohEmsw8wayRcFwGFy7JuQLWXh+jcSbw88BzgnOMR9eLXH
	YoiBYMxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaK1X-000000043MT-3zwF;
	Mon, 29 Dec 2025 20:39:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaK1W-000000043MM-1aLz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 20:39:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 39EC26000A;
	Mon, 29 Dec 2025 20:39:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C93D4C4CEF7;
	Mon, 29 Dec 2025 20:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767040764;
	bh=pabUwyRj06uXmr6glOxUtgw7My8+0IBUjwVOSXW3zx0=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=Uhdzv5/GWUM6d/mrIv8+hNF5kIWFGuX6qBvE5Rvtyn5K6vYedDlwzgaXBpToKeM8m
	 /0hstvB1sYZCuIoRxSvGBfrK22kKXby4LqyBfUjw601uv84bQYEwZXS8sP90ziEPpi
	 sGuBRt9HrL3ioAFAf/JhXjBaBbshLetTngr8obGuDujbyjv+WxnXIYZl0NylE991U0
	 cnOgGVfk5Mu7nZRShkcOqM+3Ew3EpxUmMb3siewFolVFvjLoqQVKwvwZ+tWwsE5B4F
	 K+AYva9uVR7YLS3j8QDh6QO7ySPAkwx26uSDyQt7GaBP2CaHRZAv9Sa8jT5cYrIVIQ
	 yKo7XK7fLQqqQ==
From: Rob Herring <robh@kernel.org>
Date: Mon, 29 Dec 2025 14:39:24 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kyle Hsieh <kylehsieh1995@gmail.com>
In-Reply-To: <20251224-ventura2_initial_dts-v2-0-f193ba5d4073@gmail.com>
References: <20251224-ventura2_initial_dts-v2-0-f193ba5d4073@gmail.com>
Message-Id: <176703895393.2172377.12837341812506226854.robh@kernel.org>
Subject: Re: [PATCH v2 0/2] Add Meta(Facebook) ventura2 BMC(AST2600)
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


On Wed, 24 Dec 2025 14:44:37 +0800, Kyle Hsieh wrote:
> Summary:
> Add linux device tree entry related to Meta(Facebook) ventura2.
> specific devices connected to BMC(AST2600) SoC.
> 
> Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
> ---
> Changes in v2:
> - Remove unused mdio
> - Link to v1: https://lore.kernel.org/r/20251222-ventura2_initial_dts-v1-0-1f06166c78a3@gmail.com
> 
> ---
> Kyle Hsieh (2):
>       dt-bindings: arm: aspeed: add Meta ventura2 board
>       ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC
> 
>  .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    1 +
>  arch/arm/boot/dts/aspeed/Makefile                  |    1 +
>  .../dts/aspeed/aspeed-bmc-facebook-ventura2.dts    | 2945 ++++++++++++++++++++
>  3 files changed, 2947 insertions(+)
> ---
> base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
> change-id: 20251222-ventura2_initial_dts-909b3277d665
> 
> Best regards,
> --
> Kyle Hsieh <kylehsieh1995@gmail.com>
> 
> 
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
 Base: 9448598b22c50c8a5bb77a9103e2d49f134c9578 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/aspeed/' for 20251224-ventura2_initial_dts-v2-0-f193ba5d4073@gmail.com:

arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: / (facebook,ventura2-rmc): compatible: 'oneOf' conditional failed, one must be fixed:
	'facebook,ventura2-rmc' is not one of ['delta,ahe50dc-bmc', 'facebook,galaxy100-bmc', 'facebook,wedge100-bmc', 'facebook,wedge40-bmc', 'microsoft,olympus-bmc', 'quanta,q71l-bmc', 'tyan,palmetto-bmc', 'yadro,vesnin-bmc']
	'facebook,ventura2-rmc' is not one of ['amd,daytonax-bmc', 'amd,ethanolx-bmc', 'ampere,mtjade-bmc', 'aspeed,ast2500-evb', 'asrock,e3c246d4i-bmc', 'asrock,e3c256d4i-bmc', 'asrock,romed8hm3-bmc', 'asrock,spc621d8hm3-bmc', 'asrock,x570d4u-bmc', 'bytedance,g220a-bmc', 'facebook,cmm-bmc', 'facebook,minipack-bmc', 'facebook,tiogapass-bmc', 'facebook,yamp-bmc', 'facebook,yosemitev2-bmc', 'facebook,wedge400-bmc', 'facebook,wedge400-data64-bmc', 'hxt,stardragon4800-rep2-bmc', 'ibm,mihawk-bmc', 'ibm,mowgli-bmc', 'ibm,romulus-bmc', 'ibm,swift-bmc', 'ibm,witherspoon-bmc', 'ingrasys,zaius-bmc', 'inspur,fp5280g2-bmc', 'inspur,nf5280m6-bmc', 'inspur,on5263m5-bmc', 'intel,s2600wf-bmc', 'inventec,lanyang-bmc', 'lenovo,hr630-bmc', 'lenovo,hr855xg2-bmc', 'portwell,neptune-bmc', 'qcom,centriq2400-rep-bmc', 'supermicro,x11spi-bmc', 'tyan,s7106-bmc', 'tyan,s8036-bmc', 'yadro,nicole-bmc', 'yadro,vegman-n110-bmc', 'yadro,vegman-rx20-bmc', 'yadro,vegman-sx20-bmc']
	'facebook,ventura2-rmc' is not one of ['ampere,mtjefferson-bmc', 'ampere,mtmitchell-bmc', 'aspeed,ast2600-evb', 'aspeed,ast2600-evb-a1', 'asus,x4tf-bmc', 'facebook,bletchley-bmc', 'facebook,catalina-bmc', 'facebook,clemente-bmc', 'facebook,cloudripper-bmc', 'facebook,darwin-bmc', 'facebook,elbert-bmc', 'facebook,fuji-bmc', 'facebook,fuji-data64-bmc', 'facebook,greatlakes-bmc', 'facebook,harma-bmc', 'facebook,minerva-cmc', 'facebook,santabarbara-bmc', 'facebook,ventura2-bmc', 'facebook,yosemite4-bmc', 'facebook,yosemite5-bmc', 'ibm,balcones-bmc', 'ibm,blueridge-bmc', 'ibm,bonnell-bmc', 'ibm,everest-bmc', 'ibm,fuji-bmc', 'ibm,rainier-bmc', 'ibm,sbp1-bmc', 'ibm,system1-bmc', 'ibm,tacoma-bmc', 'inventec,starscream-bmc', 'inventec,transformer-bmc', 'jabil,rbp-bmc', 'nvidia,gb200nvl-bmc', 'qcom,dc-scm-v1-bmc', 'quanta,s6q-bmc', 'ufispace,ncplite-bmc']
	'aspeed,ast2400' was expected
	'aspeed,ast2500' was expected
	from schema $id: http://devicetree.org/schemas/arm/aspeed/aspeed.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: /: failed to match any schema with compatible: ['facebook,ventura2-rmc', 'aspeed,ast2600']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: timer (arm,armv7-timer): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: sdram@1e6e0000 (aspeed,ast2600-sdram-edac): compatible: ['aspeed,ast2600-sdram-edac', 'syscon'] is too long
	from schema $id: http://devicetree.org/schemas/edac/aspeed,ast2400-sdram-edac.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: bus@1e600000 (aspeed,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: syscon@1e6e2000 (aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: adc@1e6e9000 (aspeed,ast2600-adc0): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: adc@1e6e9100 (aspeed,ast2600-adc1): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: crypto@1e6fa000 (aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-acry.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: i2c@400 (aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('aspeed,hw-timeout-ms' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: /ahb/apb/bus@1e78a000/i2c@580/power-monitor@69: failed to match any schema with compatible: ['pmbus']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: /ahb/apb/dma-controller@1e79e000: failed to match any schema with compatible: ['aspeed,ast2600-udma']






