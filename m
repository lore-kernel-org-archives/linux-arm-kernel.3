Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5368CE8E91
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 16:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T1JEy5dQVqT3Exv2llzpbZ0TKkQo0SdwNV7WxaOT/7I=; b=qMoHjfcXDLYYcAcDiw4dMNnyiW
	POIngGwHnlIyyjoS1b9dC7OVhQjctpmCBz8o0tBN6zAcfX6T2t+twE8OkmX5yNKvrpYwfvU+F0bYS
	MbFqaFzscSbwu2XNs/LSrrZvCobNy+AgjYkZLGPJNrc0WVCDOHmTxjEz5aRnvHTrCwdF0nIul4Y2r
	nX43Ch+fHs1Hn3O+cbDAryFbKfDYxEEi8emU9dIAOBgf5uhY+lq5aA6IDi9/WnDNQVnkgwS02Gvj1
	dkJiTnKiorGtRhJOXshOW/GoVrO/rWvXPAT5Q+PzhijSZLrwa4iWaVv9CFbSrLNbNi/Vs8sB0Qzln
	XVUlEKOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t40qh-000000017af-2iN0;
	Thu, 24 Oct 2024 16:38:11 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t40lt-000000016de-43NY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 16:33:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 23B73A456B2;
	Thu, 24 Oct 2024 16:33:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2152EC4CEE4;
	Thu, 24 Oct 2024 16:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729787591;
	bh=dFE27spZWGGO3O/FjVqS8Zieq3e6deQvtK3NGGzcags=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=W1qnisCaCBgHhfVH21VLCugCbkPveN/I0dehMFziAHUowWUsZDx16ngMW5Amei5Bp
	 gvXAFX/S3ji45hm47hlr7zYS2a6LZejXBdpm7MJp1GcVw3feM6nvEb6R4XVcp4peAz
	 hatgELAu/NhN3pIz+JkxolnpI3al5NvVJpN4LY49DRNCjhtordl64rqNWBqPNQp3fj
	 oL4iibNLimakT06gzoADnll2Q6HdNJL9pPkblz7F7sMgw9nFojoghNIDeunSCiOk5N
	 Xun3AzhsHHG0xOoRtt2P3XCjkpkM/+KA6ftpITm/mVE540H/U3b37hm+KhNY0JyOLz
	 fnU5AahcFoCVA==
Date: Thu, 24 Oct 2024 11:33:10 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, 
 Shawn Guo <shawnguo@kernel.org>, imx@lists.linux.dev
In-Reply-To: <20241021173631.299143-1-andreas@kemnade.info>
References: <20241021173631.299143-1-andreas@kemnade.info>
Message-Id: <172978739415.623377.16255873190403430164.robh@kernel.org>
Subject: Re: [PATCH 0/3] ARM: dts: add Kobo Clara 2E
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_093314_164449_9F0070D3 
X-CRM114-Status: GOOD (  13.34  )
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


On Mon, 21 Oct 2024 19:36:28 +0200, Andreas Kemnade wrote:
> Add a basic device tree for the Kobo Clara 2E Ebook reader.
> It is equipped with an i.MX6SLL SoC. EPDC PMIC drivers
> are not ready for mainline yet.
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


New warnings running 'make CHECK_DTBS=y nxp/imx/imx6sll-kobo-clara2e-a.dtb nxp/imx/imx6sll-kobo-clara2e-b.dtb' for 20241021173631.299143-1-andreas@kemnade.info:

arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dtb: spdif@2004000: compatible:0: 'fsl,imx6sl-spdif' is not one of ['fsl,imx35-spdif', 'fsl,vf610-spdif', 'fsl,imx6sx-spdif', 'fsl,imx8qm-spdif', 'fsl,imx8qxp-spdif', 'fsl,imx8mq-spdif', 'fsl,imx8mm-spdif', 'fsl,imx8mn-spdif', 'fsl,imx8ulp-spdif']
	from schema $id: http://devicetree.org/schemas/sound/fsl,spdif.yaml#
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dtb: spdif@2004000: compatible: ['fsl,imx6sl-spdif', 'fsl,imx35-spdif'] is too long
	from schema $id: http://devicetree.org/schemas/sound/fsl,spdif.yaml#
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dtb: spdif@2004000: clock-names:9: 'spba' was expected
	from schema $id: http://devicetree.org/schemas/sound/fsl,spdif.yaml#
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dtb: /soc/bus@2000000/spba-bus@2000000/spdif@2004000: failed to match any schema with compatible: ['fsl,imx6sl-spdif', 'fsl,imx35-spdif']
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-a.dtb: spdif@2004000: compatible:0: 'fsl,imx6sl-spdif' is not one of ['fsl,imx35-spdif', 'fsl,vf610-spdif', 'fsl,imx6sx-spdif', 'fsl,imx8qm-spdif', 'fsl,imx8qxp-spdif', 'fsl,imx8mq-spdif', 'fsl,imx8mm-spdif', 'fsl,imx8mn-spdif', 'fsl,imx8ulp-spdif']
	from schema $id: http://devicetree.org/schemas/sound/fsl,spdif.yaml#
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-a.dtb: spdif@2004000: compatible: ['fsl,imx6sl-spdif', 'fsl,imx35-spdif'] is too long
	from schema $id: http://devicetree.org/schemas/sound/fsl,spdif.yaml#
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-a.dtb: spdif@2004000: clock-names:9: 'spba' was expected
	from schema $id: http://devicetree.org/schemas/sound/fsl,spdif.yaml#
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-a.dtb: /soc/bus@2000000/spba-bus@2000000/spdif@2004000: failed to match any schema with compatible: ['fsl,imx6sl-spdif', 'fsl,imx35-spdif']
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
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dtb: anatop@20c8000: '#address-cells', '#size-cells', 'regulator-3p0@20c8120' do not match any of the regexes: 'pinctrl-[0-9]+', 'regulator-((1p1)|(2p5)|(3p0)|(vddcore)|(vddpu)|(vddsoc))$'
	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-anatop.yaml#
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dtb: regulator-3p0@20c8120: Unevaluated properties are not allowed ('reg' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/anatop-regulator.yaml#
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-a.dtb: anatop@20c8000: '#address-cells', '#size-cells', 'regulator-3p0@20c8120' do not match any of the regexes: 'pinctrl-[0-9]+', 'regulator-((1p1)|(2p5)|(3p0)|(vddcore)|(vddpu)|(vddsoc))$'
	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-anatop.yaml#
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-a.dtb: regulator-3p0@20c8120: Unevaluated properties are not allowed ('reg' was unexpected)
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
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dtb: /soc/bus@2000000/pinctrl@20e0000: failed to match any schema with compatible: ['fsl,imx6sll-iomuxc']
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
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-a.dtb: /soc/bus@2000000/pinctrl@20e0000: failed to match any schema with compatible: ['fsl,imx6sll-iomuxc']
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






