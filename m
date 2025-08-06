Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33485C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 14:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5iEqtOP0A5/sTeerMuobOUe8pe0wyq2g5Y5dbcZAzz8=; b=tfBcqtrPFaCzm/NXDQHpQXjimy
	JfR0MPUWUaPGBU7RYcKm8t16pRiv9Bj07I7Roqq9zlqbplcK69d+ks3FYYQgeteDM5bAstdZRG75n
	6G0ZWQGwShDzQq8Vx4skWJS5+LKuFlL7rutoZxAQa5hzhvYicrrQu0mUUJSbdc9hKGrQCzoKy7EN5
	QXXC+B72ZRuCxKEPbSTQgy5pVsX1aS04yZLr4bC0q/922y0qrDAi2mbEe31+lKJ5ku1l++RhF/sBF
	8wZFL/D7of1xkpxinUwU+G5oRq2h4sVo2Oha3XJoNDUxcn6saZTOdm2+Rn9KKP7uYehj03y1bG4lp
	SToHNARQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujfMC-0000000FTJ4-1ekW;
	Wed, 06 Aug 2025 14:43:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujfJg-0000000FSyZ-18eH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 14:40:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A409245DDE;
	Wed,  6 Aug 2025 14:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7447BC4CEFC;
	Wed,  6 Aug 2025 14:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754491231;
	bh=EblJcM6UV2Fk655c6OrUU4cocp87gisfHSYUOgjEB6c=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=oDjRysBFpjCnpdQr+LR9E3FtM2mhSTCDF8AFOG3eWTzY4LMn55igeqzirY52s/2+z
	 QvJ8OUxQXGCYRJTkcHE9TVMsXHFcIY3QDrVFPylIAcRl5bt8iWjir5EkxF5F9vZpan
	 ZmCANTDMcpw37Gy+41p2g3zWm4CdRzEW5hRxDbZWRrXydSYmot6lukP3W+IRzgyx0I
	 1vE3gIuC/9jujON+0CooH4zuC2OSGh2I6sMrWnJroyro7qvO0HSyya4gJIwEaixHb1
	 O5svdpx/kMUvILsphnrNMe/D8Zxd8aZAJ+t0xQhaNUcHBugKPgFxL4YJ7oKQ7Fke2A
	 NtB2edeP1lr7g==
Date: Wed, 06 Aug 2025 09:40:30 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, kernel@pengutronix.de, 
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-kernel@vger.kernel.org
To: Marc Kleine-Budde <mkl@pengutronix.de>
In-Reply-To: <20250806-stm32mp15-m_can-add-reset-v1-1-9d81f9c29d65@pengutronix.de>
References: <20250806-stm32mp15-m_can-add-reset-v1-1-9d81f9c29d65@pengutronix.de>
Message-Id: <175449112394.639563.13302025438302529927.robh@kernel.org>
Subject: Re: [PATCH] ARM: dts: stm32: add resets property to m_can nodes in
 the stm32mp153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_074032_353357_7ACC109F 
X-CRM114-Status: GOOD (  13.01  )
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


On Wed, 06 Aug 2025 10:59:12 +0200, Marc Kleine-Budde wrote:
> On the STM32MP153 the m_cam IP cores (a.k.a. FDCAN) have an external
> shared reset in the RCC. Add the reset to both m_can nodes.
> 
> Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
> ---
>  arch/arm/boot/dts/st/stm32mp153.dtsi | 2 ++
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
 Base: using specified base-commit 1a32f7427eb3d1248bc64cd745b93f88cc838933

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/st/' for 20250806-stm32mp15-m_can-add-reset-v1-1-9d81f9c29d65@pengutronix.de:

arch/arm/boot/dts/st/stm32mp157c-ev1.dtb: can@4400e000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
arch/arm/boot/dts/st/stm32mp153c-lxa-tac-gen3.dtb: can@4400e000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
arch/arm/boot/dts/st/stm32mp153c-lxa-tac-gen3.dtb: can@4400f000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen2.dtb: can@4400e000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
arch/arm/boot/dts/st/stm32mp157c-dhcom-picoitx.dtb: can@4400e000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
arch/arm/boot/dts/st/stm32mp157c-dhcom-picoitx.dtb: can@4400f000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dtb: can@4400f000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
arch/arm/boot/dts/st/stm32mp157c-dhcom-pdk2.dtb: can@4400e000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
arch/arm/boot/dts/st/stm32mp153c-dhcor-drc-compact.dtb: can@4400e000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen1.dtb: can@4400e000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
arch/arm/boot/dts/st/stm32mp153c-mecio1r1.dtb: can@4400e000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
arch/arm/boot/dts/st/stm32mp153c-dhcom-drc02.dtb: can@4400e000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
arch/arm/boot/dts/st/stm32mp153c-dhcom-drc02.dtb: can@4400f000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dtb: can@4400f000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dtb: can@4400e000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dtb: can@4400e000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dtb: can@4400f000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dtb: can@4400e000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dtb: can@4400f000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb: can@4400e000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#






