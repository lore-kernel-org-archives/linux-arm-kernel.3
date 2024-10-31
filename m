Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A79CAE68946
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 02:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=28U+nh8FVrgKSuKmcrwPvhNybP+FrYOipupVGrWsW+0=; b=uSWzI41JVNX67BYl1SRUnwlgL/
	lIEhUC2ZkH2Se36cD1FMABdTCBkRtbpf76Hupe1nvpHt5QWMpXYRa/2DV0UkaI7NCHbgm4FdKI2LK
	qnB622lshaLmQZRGlqswMLVxAeq+mGTC9VIQplJq+3vYbrqeBHs2i4SBAcoTGC/gbEkp26RPzscio
	fWSxBbK8Vriwr7zg88aSpCILngIM3LU95N2p2/78C3S/yXc7E1JXfXx8GdincJyqNzg1t7OnAzYRe
	qVJpcTCF093rzNX7TaQ+s71nIiVteTOMoNh7xKJ5yix/s2/VYapz3iFE5yQXLnh38wVbITyHRQFRA
	Wvxyb1OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Kwd-00000002M6d-2Dcl;
	Thu, 31 Oct 2024 02:29:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Kuy-00000002Lut-06Ui
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 02:28:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2A898A43D45;
	Thu, 31 Oct 2024 02:26:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8722FC4CED0;
	Thu, 31 Oct 2024 02:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730341690;
	bh=01Uc3zvzqd3XKCvxftrNCCaSDMkTv/ZTi6vvS6fRpeY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=okt6lcuP7P1d7jmgXkcOoALiR2Qq6T0WCVjJEb1Ie7vKAJ3py6myNBfdF/crgzJKE
	 Cm6vTMJYsSuekDKMBaVTxZomno4RguNyGaPzsvEOrWbeXWoY04q8t/bvdJnBhN9N5y
	 tfyd0G0HO0BSQvfJptBJ0EUGQLwNARtO/fm5HthF/l4E53Aru6ZPZIu5j87Wz0c5oi
	 B6AY1b+mPNGGgAhHkqSrAVJLIlqY6XhLm2Vy7GFGQw9QEbnKYZ8nQ7A+qaROFcFNz+
	 qMtUU+4WJnrNSnBHfhrPPj6DkFmMAfLsIW/Ya8y2f9egrzGiWKaR7bvU+uc8t9XeGm
	 ACqA0UYVQhhKg==
Date: Wed, 30 Oct 2024 21:28:09 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>
In-Reply-To: <20241030232746.2644502-1-andreas@kemnade.info>
References: <20241030232746.2644502-1-andreas@kemnade.info>
Message-Id: <173034159281.3087396.381274219122389189.robh@kernel.org>
Subject: Re: [PATCH v3 0/3] ARM: dts: add Kobo Clara 2E
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_192812_223612_0B370275 
X-CRM114-Status: GOOD (  14.61  )
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


On Thu, 31 Oct 2024 00:27:43 +0100, Andreas Kemnade wrote:
> Add a basic device tree for the Kobo Clara 2E Ebook reader.
> It is equipped with an i.MX6SLL SoC. EPDC PMIC drivers
> are not ready for mainline yet.
> 
> Changes in V3:
> - removed 30MegaOhm current sense resistor nonsense
> 
> Changes in V2:
> - improved commit message about devices without binding
> 
> Andreas Kemnade (3):
>   dt-bindings: arm: fsl: add compatible strings for Kobo Clara 2E
>   ARM: dts: imx: Add devicetree for Kobo Clara 2E
>   ARM: imx_v6_v7_defconfig: Enable drivers for Kobo Clara 2E
> 
>  .../devicetree/bindings/arm/fsl.yaml          |   8 +
>  arch/arm/boot/dts/nxp/imx/Makefile            |   2 +
>  .../dts/nxp/imx/imx6sll-kobo-clara2e-a.dts    |  23 +
>  .../dts/nxp/imx/imx6sll-kobo-clara2e-b.dts    |  23 +
>  .../nxp/imx/imx6sll-kobo-clara2e-common.dtsi  | 514 ++++++++++++++++++
>  arch/arm/configs/imx_v6_v7_defconfig          |   2 +
>  6 files changed, 572 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-a.dts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-common.dtsi
> 
> --
> 2.39.5
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


New warnings running 'make CHECK_DTBS=y nxp/imx/imx6sll-kobo-clara2e-a.dtb nxp/imx/imx6sll-kobo-clara2e-b.dtb' for 20241030232746.2644502-1-andreas@kemnade.info:

arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dtb: spdif@2004000: compatible:0: 'fsl,imx6sl-spdif' is not one of ['fsl,imx35-spdif', 'fsl,vf610-spdif', 'fsl,imx6sx-spdif', 'fsl,imx8qm-spdif', 'fsl,imx8qxp-spdif', 'fsl,imx8mq-spdif', 'fsl,imx8mm-spdif', 'fsl,imx8mn-spdif', 'fsl,imx8ulp-spdif']
	from schema $id: http://devicetree.org/schemas/sound/fsl,spdif.yaml#
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dtb: spdif@2004000: compatible: ['fsl,imx6sl-spdif', 'fsl,imx35-spdif'] is too long
	from schema $id: http://devicetree.org/schemas/sound/fsl,spdif.yaml#
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dtb: spdif@2004000: clock-names:9: 'spba' was expected
	from schema $id: http://devicetree.org/schemas/sound/fsl,spdif.yaml#
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dtb: /soc/bus@2000000/spba-bus@2000000/spdif@2004000: failed to match any schema with compatible: ['fsl,imx6sl-spdif', 'fsl,imx35-spdif']
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dtb: serial@2034000: dma-name: b'rx\x00tx\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dtb: timer@2098000: compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx6sl-gpt'] is too short
	'fsl,imx1-gpt' was expected
	'fsl,imx21-gpt' was expected
	'fsl,imx27-gpt' was expected
	'fsl,imx31-gpt' was expected
	'fsl,imx6sl-gpt' is not one of ['fsl,imx25-gpt', 'fsl,imx50-gpt', 'fsl,imx51-gpt', 'fsl,imx53-gpt', 'fsl,imx6q-gpt']
	'fsl,imx6dl-gpt' was expected
	'fsl,imx6sl-gpt' is not one of ['fsl,imx6ul-gpt', 'fsl,imx7d-gpt']
	from schema $id: http://devicetree.org/schemas/timer/fsl,imxgpt.yaml#
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dtb: anatop@20c8000: '#address-cells', '#size-cells', 'regulator-3p0@20c8120' do not match any of the regexes: 'pinctrl-[0-9]+', 'regulator-((1p1)|(2p5)|(3p0)|(vddcore)|(vddpu)|(vddsoc))$'
	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-anatop.yaml#
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dtb: regulator-3p0@20c8120: Unevaluated properties are not allowed ('reg' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/anatop-regulator.yaml#
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dtb: interrupt-controller@20dc000: compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx6sll-gpc', 'fsl,imx6q-gpc'] is too long
	'fsl,imx6sll-gpc' is not one of ['fsl,imx6q-gpc']
	'fsl,imx6sll-gpc' is not one of ['fsl,imx6qp-gpc', 'fsl,imx6sl-gpc', 'fsl,imx6sx-gpc', 'fsl,imx6ul-gpc']
	from schema $id: http://devicetree.org/schemas/power/fsl,imx-gpc.yaml#
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dtb: interrupt-controller@20dc000: 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/power/fsl,imx-gpc.yaml#
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dtb: interrupt-controller@20dc000: 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/power/fsl,imx-gpc.yaml#
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dtb: interrupt-controller@20dc000: 'pgc' is a required property
	from schema $id: http://devicetree.org/schemas/power/fsl,imx-gpc.yaml#
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dtb: /soc/bus@2000000/interrupt-controller@20dc000: failed to match any schema with compatible: ['fsl,imx6sll-gpc', 'fsl,imx6q-gpc']
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dtb: pinctrl@20e0000: 'uart2grp-sleep' does not match any of the regexes: 'grp$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx35-pinctrl.yaml#
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dtb: /soc/bus@2000000/csi@20e8000: failed to match any schema with compatible: ['fsl,imx6sll-csi', 'fsl,imx6s-csi']
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dtb: /soc/bus@2000000/csi@20e8000: failed to match any schema with compatible: ['fsl,imx6sll-csi', 'fsl,imx6s-csi']
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dtb: lcd-controller@20f8000: compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx6sll-lcdif', 'fsl,imx28-lcdif'] is too long
	'fsl,imx6sll-lcdif' is not one of ['fsl,imx23-lcdif', 'fsl,imx28-lcdif', 'fsl,imx6sx-lcdif', 'fsl,imx8mp-lcdif', 'fsl,imx93-lcdif']
	'fsl,imx6sx-lcdif' was expected
	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dtb: lcd-controller@20f8000: clocks: [[2, 129], [2, 123], [2, 0]] is too long
	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dtb: lcd-controller@20f8000: clock-names: ['pix', 'axi', 'disp_axi'] is too long
	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-a.dtb: spdif@2004000: compatible:0: 'fsl,imx6sl-spdif' is not one of ['fsl,imx35-spdif', 'fsl,vf610-spdif', 'fsl,imx6sx-spdif', 'fsl,imx8qm-spdif', 'fsl,imx8qxp-spdif', 'fsl,imx8mq-spdif', 'fsl,imx8mm-spdif', 'fsl,imx8mn-spdif', 'fsl,imx8ulp-spdif']
	from schema $id: http://devicetree.org/schemas/sound/fsl,spdif.yaml#
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-a.dtb: spdif@2004000: compatible: ['fsl,imx6sl-spdif', 'fsl,imx35-spdif'] is too long
	from schema $id: http://devicetree.org/schemas/sound/fsl,spdif.yaml#
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-a.dtb: spdif@2004000: clock-names:9: 'spba' was expected
	from schema $id: http://devicetree.org/schemas/sound/fsl,spdif.yaml#
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-a.dtb: /soc/bus@2000000/spba-bus@2000000/spdif@2004000: failed to match any schema with compatible: ['fsl,imx6sl-spdif', 'fsl,imx35-spdif']
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-a.dtb: serial@2034000: dma-name: b'rx\x00tx\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-a.dtb: timer@2098000: compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx6sl-gpt'] is too short
	'fsl,imx1-gpt' was expected
	'fsl,imx21-gpt' was expected
	'fsl,imx27-gpt' was expected
	'fsl,imx31-gpt' was expected
	'fsl,imx6sl-gpt' is not one of ['fsl,imx25-gpt', 'fsl,imx50-gpt', 'fsl,imx51-gpt', 'fsl,imx53-gpt', 'fsl,imx6q-gpt']
	'fsl,imx6dl-gpt' was expected
	'fsl,imx6sl-gpt' is not one of ['fsl,imx6ul-gpt', 'fsl,imx7d-gpt']
	from schema $id: http://devicetree.org/schemas/timer/fsl,imxgpt.yaml#
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-a.dtb: anatop@20c8000: '#address-cells', '#size-cells', 'regulator-3p0@20c8120' do not match any of the regexes: 'pinctrl-[0-9]+', 'regulator-((1p1)|(2p5)|(3p0)|(vddcore)|(vddpu)|(vddsoc))$'
	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-anatop.yaml#
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-a.dtb: regulator-3p0@20c8120: Unevaluated properties are not allowed ('reg' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/anatop-regulator.yaml#
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-a.dtb: interrupt-controller@20dc000: compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx6sll-gpc', 'fsl,imx6q-gpc'] is too long
	'fsl,imx6sll-gpc' is not one of ['fsl,imx6q-gpc']
	'fsl,imx6sll-gpc' is not one of ['fsl,imx6qp-gpc', 'fsl,imx6sl-gpc', 'fsl,imx6sx-gpc', 'fsl,imx6ul-gpc']
	from schema $id: http://devicetree.org/schemas/power/fsl,imx-gpc.yaml#
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-a.dtb: interrupt-controller@20dc000: 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/power/fsl,imx-gpc.yaml#
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-a.dtb: interrupt-controller@20dc000: 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/power/fsl,imx-gpc.yaml#
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-a.dtb: interrupt-controller@20dc000: 'pgc' is a required property
	from schema $id: http://devicetree.org/schemas/power/fsl,imx-gpc.yaml#
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-a.dtb: /soc/bus@2000000/interrupt-controller@20dc000: failed to match any schema with compatible: ['fsl,imx6sll-gpc', 'fsl,imx6q-gpc']
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-a.dtb: pinctrl@20e0000: 'uart2grp-sleep' does not match any of the regexes: 'grp$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx35-pinctrl.yaml#
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-a.dtb: /soc/bus@2000000/csi@20e8000: failed to match any schema with compatible: ['fsl,imx6sll-csi', 'fsl,imx6s-csi']
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-a.dtb: /soc/bus@2000000/csi@20e8000: failed to match any schema with compatible: ['fsl,imx6sll-csi', 'fsl,imx6s-csi']
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-a.dtb: lcd-controller@20f8000: compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx6sll-lcdif', 'fsl,imx28-lcdif'] is too long
	'fsl,imx6sll-lcdif' is not one of ['fsl,imx23-lcdif', 'fsl,imx28-lcdif', 'fsl,imx6sx-lcdif', 'fsl,imx8mp-lcdif', 'fsl,imx93-lcdif']
	'fsl,imx6sx-lcdif' was expected
	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-a.dtb: lcd-controller@20f8000: clocks: [[2, 129], [2, 123], [2, 0]] is too long
	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-a.dtb: lcd-controller@20f8000: clock-names: ['pix', 'axi', 'disp_axi'] is too long
	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#






