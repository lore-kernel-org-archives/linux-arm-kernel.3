Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0F1CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 00:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZfWGsdJls7SdqVfyKp+uumlTP6omkqIotCCL2edg4g=; b=S+Mq0lnjXLCgEMcEYL3cCGcaxE
	s1JpFHp3BH+wFjD4bJRNFKvvVX5tkltcWFgyLYk2az/D5w7VUkIMKtKujcxhsR3Noby7XIhPahy+P
	RyTlGGdsHFvs3IZmX/4ELL4Wh+A0jjWMQOR7PicJWdk9WygqlOLFd3SHDIm8P21i9LUCdqi2kuA9v
	wTTJ5Me9BWvR9YMdXKdwE3qy22Oc5nJ0vOxP7BeiRV6PcS1ZvWfX4IuaKvP4xdnyBP0ohXG0sEj9g
	TFTns9NX33nstCIRSUf++ttoHN67NwbYDRQP23NZMqyGM+1zR3Zlcd8/ylf4OE86F7QpGAZSu15+I
	k1Dz1lOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz2gP-0000000Fp2z-37EP;
	Thu, 18 Sep 2025 00:39:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz2gN-0000000Fp2H-2hpv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 00:39:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4455F41838;
	Thu, 18 Sep 2025 00:39:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BBFBC4CEE7;
	Thu, 18 Sep 2025 00:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758155970;
	bh=a75lhk+xgj4a6qR5ZsY/lmRJGeQMFkEJZWE3IgPCtIo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Ty5Ef03tAJzpoz+XIPXuRIzkkpXYoHt2BMsB9KWT+jy2MEKMJ0FHYFZ5RhbBuhxyt
	 R7ZkHF1aSnzqMm0WsvVahUPre/erQRjU3TNH43HUh2abKvCXqkiE57hcVFmz4mYbh8
	 nDSY+oJFz5RvSc0ulNDT/H1VhApylmvgmcOjFrKYkCUklasO2O0DZgBe7ZqT4I9qzw
	 /zKvj91yiPj8CHLFLz4dDTOz9x5VR3wIvka6ps2tQk4cYXs4fJBY/rgoIo1rbAdVo3
	 f/DpkFP7cGJt1GkIim0reC1i6smLVcU5QPKfxvqWjIXCn0OYJeWgznHjPwXA8S2CG5
	 GhEKD3IA+LhCA==
Date: Wed, 17 Sep 2025 19:39:27 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Magnus Damm <magnus.damm@gmail.com>, linux-aspeed@lists.ozlabs.org, 
 devicetree@vger.kernel.org, Joel Stanley <joel@jms.id.au>, 
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Kevin Tung <kevin.tung.openbmc@gmail.com>
In-Reply-To: <20250917075334.4044607-1-kevin.tung.openbmc@gmail.com>
References: <20250917075334.4044607-1-kevin.tung.openbmc@gmail.com>
Message-Id: <175815587102.3804257.11804671658691330900.robh@kernel.org>
Subject: Re: [PATCH v1 2/2] ARM: dts: aspeed: yosemite5: Add Meta Yosemite5
 BMC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_173931_728579_CCD3D986 
X-CRM114-Status: GOOD (  15.30  )
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


On Wed, 17 Sep 2025 15:53:32 +0800, Kevin Tung wrote:
> Add device tree for the Meta (Facebook) Yosemite5 compute node,
> based on the AST2600 BMC.
> 
> The Yosemite5 platform provides monitoring of voltages, power,
> temperatures, and other critical parameters across the motherboard,
> CXL board, E1.S expansion board, and NIC components. The BMC also
> logs relevant events and performs appropriate system actions in
> response to abnormal conditions.
> 
> Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
> ---
>  .../aspeed/aspeed-bmc-facebook-yosemite5.dts  | 1063 +++++++++++++++++
>  1 file changed, 1063 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
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
 Base: failed to guess base

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/aspeed/' for 20250917075334.4044607-1-kevin.tung.openbmc@gmail.com:

arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: / (facebook,yosemite5-bmc): compatible: 'oneOf' conditional failed, one must be fixed:
	'facebook,yosemite5-bmc' is not one of ['delta,ahe50dc-bmc', 'facebook,galaxy100-bmc', 'facebook,wedge100-bmc', 'facebook,wedge40-bmc', 'microsoft,olympus-bmc', 'quanta,q71l-bmc', 'tyan,palmetto-bmc', 'yadro,vesnin-bmc']
	'facebook,yosemite5-bmc' is not one of ['amd,daytonax-bmc', 'amd,ethanolx-bmc', 'ampere,mtjade-bmc', 'aspeed,ast2500-evb', 'asrock,e3c246d4i-bmc', 'asrock,e3c256d4i-bmc', 'asrock,romed8hm3-bmc', 'asrock,spc621d8hm3-bmc', 'asrock,x570d4u-bmc', 'bytedance,g220a-bmc', 'facebook,cmm-bmc', 'facebook,minipack-bmc', 'facebook,tiogapass-bmc', 'facebook,yamp-bmc', 'facebook,yosemitev2-bmc', 'facebook,wedge400-bmc', 'facebook,wedge400-data64-bmc', 'hxt,stardragon4800-rep2-bmc', 'ibm,mihawk-bmc', 'ibm,mowgli-bmc', 'ibm,romulus-bmc', 'ibm,swift-bmc', 'ibm,witherspoon-bmc', 'ingrasys,zaius-bmc', 'inspur,fp5280g2-bmc', 'inspur,nf5280m6-bmc', 'inspur,on5263m5-bmc', 'intel,s2600wf-bmc', 'inventec,lanyang-bmc', 'lenovo,hr630-bmc', 'lenovo,hr855xg2-bmc', 'portwell,neptune-bmc', 'qcom,centriq2400-rep-bmc', 'supermicro,x11spi-bmc', 'tyan,s7106-bmc', 'tyan,s8036-bmc', 'yadro,nicole-bmc', 'yadro,vegman-n110-bmc', 'yadro,vegman-rx20-bmc', 'yadro,vegman-sx20-bmc']
	'facebook,yosemite5-bmc' is not one of ['ampere,mtjefferson-bmc', 'ampere,mtmitchell-bmc', 'aspeed,ast2600-evb', 'aspeed,ast2600-evb-a1', 'asus,x4tf-bmc', 'facebook,bletchley-bmc', 'facebook,catalina-bmc', 'facebook,clemente-bmc', 'facebook,cloudripper-bmc', 'facebook,darwin-bmc', 'facebook,elbert-bmc', 'facebook,fuji-bmc', 'facebook,fuji-data64-bmc', 'facebook,greatlakes-bmc', 'facebook,harma-bmc', 'facebook,minerva-cmc', 'facebook,santabarbara-bmc', 'facebook,yosemite4-bmc', 'ibm,blueridge-bmc', 'ibm,everest-bmc', 'ibm,fuji-bmc', 'ibm,rainier-bmc', 'ibm,sbp1-bmc', 'ibm,system1-bmc', 'ibm,tacoma-bmc', 'inventec,starscream-bmc', 'inventec,transformer-bmc', 'jabil,rbp-bmc', 'nvidia,gb200nvl-bmc', 'qcom,dc-scm-v1-bmc', 'quanta,s6q-bmc', 'ufispace,ncplite-bmc']
	'aspeed,ast2400' was expected
	'aspeed,ast2500' was expected
	from schema $id: http://devicetree.org/schemas/arm/aspeed/aspeed.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: /: failed to match any schema with compatible: ['facebook,yosemite5-bmc', 'aspeed,ast2600']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: timer (arm,armv7-timer): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: bus@1e600000 (aspeed,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: ethernet@1e670000 (aspeed,ast2600-mac): Unevaluated properties are not allowed ('ncsi-package' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: syscon@1e6e2000 (aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: adc@1e6e9000 (aspeed,ast2600-adc0): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: adc@1e6e9100 (aspeed,ast2600-adc1): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: crypto@1e6fa000 (aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-acry.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2600-ibt-bmc']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: /ahb/apb/dma-controller@1e79e000: failed to match any schema with compatible: ['aspeed,ast2600-udma']






