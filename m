Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDEE6CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 19:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K+pD1/lRr/4mmTnBPehC81T74P56Ge8BqWh3bekqW2c=; b=lcHEAuAwavoTW8SEdIHA8oyLwH
	44X3e8PLk+DB1DnvU1lRG4PUlDyQvvnzvWloRmRiNZRaE+OCPL4AojvsBsX9hAFtXpnIGg9ptU0nB
	z2rIFoAnaSi9CCTnvBbleFndcOK4ecphOfHzb77lckj/PYUnVllEqCLPaIIpQfpNIinpwqWeDHSar
	3Y6XoIJjhOga1KTK8+w4Cfqkmh6QOm/UiKdDcP8y36HmMaj/WT8c/QDChVg/jMop32Yoi8uXZ/4sq
	/JoQu55wZ1vjetCr0UOlFRlHv0W5J7exBD2it+QCfcDRtpybDH3AFFlI41emX/w7BbNCXr8RdKayv
	zj9y88IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWON-00000001abJ-2ts3;
	Tue, 02 Sep 2025 19:10:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQu5-0000000HaI2-0l9t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 13:18:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E7FA543F84;
	Tue,  2 Sep 2025 13:18:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70CC6C4CEED;
	Tue,  2 Sep 2025 13:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756819108;
	bh=+8yfthSijc95vqMaDpPZVo/AICpcYNlVWfPmxU6cweM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Kjdeqm8sfAcIATBjGpEcCUsXSq477Sd8JSkPuk69/E5nUNFI/xPI7s2Gy150H/Ocp
	 c2VBYNzKeItKkLcM9EHmiHHBG8rUGkCzyZJkcRm7pNm+p05L+T/Sq9+ZlOgk+Ok0km
	 mVSOuzm9FRzkFeT7eb+F79CF6p4jJLlsUAFA0/0plHtgok3f5nr3zxk29wBxBMQKGe
	 f7pIJxwSb/3m2mrtbVev67Y0TuiU9eE3A4GjKsu41NyYd/vR0rHiTPASVMSK3DeItY
	 3oXYM/L39uRczk7leIDmbwGgqJPPWOML+jXZfI+bEz7IwQJEtxuLTeyaSZz61rqkhP
	 Wj8FXNUwmbNLg==
Date: Tue, 02 Sep 2025 08:18:26 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: kuba@kernel.org, mripard@kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 davem@davemloft.net, linux-sunxi@lists.linux.dev, wens@csie.org
To: Conley Lee <conleylee@foxmail.com>
In-Reply-To: <tencent_64909A540A8CD9063D28DEFD0A684AF9B709@qq.com>
References: <tencent_64909A540A8CD9063D28DEFD0A684AF9B709@qq.com>
Message-Id: <175678731491.878219.3817330096416761457.robh@kernel.org>
Subject: Re: [PATCH] arm: dts: sun4i-emac enable dma rx in sun4i
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_061829_259078_97527379 
X-CRM114-Status: GOOD (  15.20  )
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


On Mon, 01 Sep 2025 17:04:03 +0800, Conley Lee wrote:
> The current sun4i-emac driver supports receiving data packets using DMA,
> but this feature is not enabled in the device tree (dts) configuration.
> This patch enables the DMA receive option in the dts file.
> 
> Signed-off-by: Conley Lee <conleylee@foxmail.com>
> ---
>  arch/arm/boot/dts/allwinner/sun4i-a10.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
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
 Base: tags/next-20250829 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/allwinner/' for tencent_64909A540A8CD9063D28DEFD0A684AF9B709@qq.com:

arch/arm/boot/dts/allwinner/sun4i-a10-jesurun-q5.dtb: ethernet@1c0b000 (allwinner,sun4i-a10-emac): Unevaluated properties are not allowed ('dma-names', 'dmas' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/allwinner,sun4i-a10-emac.yaml#
arch/arm/boot/dts/allwinner/sun4i-a10-a1000.dtb: ethernet@1c0b000 (allwinner,sun4i-a10-emac): Unevaluated properties are not allowed ('dma-names', 'dmas' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/allwinner,sun4i-a10-emac.yaml#
arch/arm/boot/dts/allwinner/sun4i-a10-cubieboard.dtb: ethernet@1c0b000 (allwinner,sun4i-a10-emac): Unevaluated properties are not allowed ('dma-names', 'dmas' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/allwinner,sun4i-a10-emac.yaml#
arch/arm/boot/dts/allwinner/sun4i-a10-olinuxino-lime.dtb: ethernet@1c0b000 (allwinner,sun4i-a10-emac): Unevaluated properties are not allowed ('dma-names', 'dmas' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/allwinner,sun4i-a10-emac.yaml#
arch/arm/boot/dts/allwinner/sun4i-a10-itead-iteaduino-plus.dtb: ethernet@1c0b000 (allwinner,sun4i-a10-emac): Unevaluated properties are not allowed ('dma-names', 'dmas' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/allwinner,sun4i-a10-emac.yaml#
arch/arm/boot/dts/allwinner/sun4i-a10-pcduino.dtb: ethernet@1c0b000 (allwinner,sun4i-a10-emac): Unevaluated properties are not allowed ('dma-names', 'dmas' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/allwinner,sun4i-a10-emac.yaml#
arch/arm/boot/dts/allwinner/sun4i-a10-marsboard.dtb: ethernet@1c0b000 (allwinner,sun4i-a10-emac): Unevaluated properties are not allowed ('dma-names', 'dmas' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/allwinner,sun4i-a10-emac.yaml#
arch/arm/boot/dts/allwinner/sun4i-a10-hackberry.dtb: ethernet@1c0b000 (allwinner,sun4i-a10-emac): Unevaluated properties are not allowed ('dma-names', 'dmas' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/allwinner,sun4i-a10-emac.yaml#
arch/arm/boot/dts/allwinner/sun4i-a10-ba10-tvbox.dtb: ethernet@1c0b000 (allwinner,sun4i-a10-emac): Unevaluated properties are not allowed ('dma-names', 'dmas' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/allwinner,sun4i-a10-emac.yaml#
arch/arm/boot/dts/allwinner/sun4i-a10-pcduino2.dtb: ethernet@1c0b000 (allwinner,sun4i-a10-emac): Unevaluated properties are not allowed ('dma-names', 'dmas' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/allwinner,sun4i-a10-emac.yaml#






