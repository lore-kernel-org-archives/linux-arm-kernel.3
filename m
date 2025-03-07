Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF47C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 13:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rJQstUN5fH0HeyHiJTPJKF7eWmBiZeeRA2QB4BZaP2k=; b=zMOXRkA9C8pvPow6GoqDeKxSa+
	sgqzMRfCzFsPr9bv524uXBKmedzCZY5xoqrlDcOgEqcCA52hLR3CgweiQoIZ4ujSv7pqbf6ahCwuY
	+cECZWSLCcdqvk5pBaOLu/lRMzNWYwzpx6AWCIcQOLj87+JNJ8SG4tAfD4t87gUICqVUPf4L2TuZs
	MnwrwhQxti2Dx718BnoSSnz+bXc67QX0SUX0QulXho4+u0e/2qoyCHtj/98szcAZn6NOySA7gie5F
	vUi5KKInA53BiiRn/e55+RhktgYNMI2X+6aDHtvBq79uXctvid/nDAbP1dmhv3bw4GktA36tHE6d/
	FekjSt2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqXlc-0000000EKaa-0D2I;
	Fri, 07 Mar 2025 13:29:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqXiE-0000000EK34-36t8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 13:26:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 084FD5C5C2C;
	Fri,  7 Mar 2025 13:23:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71F39C4CED1;
	Fri,  7 Mar 2025 13:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741353961;
	bh=yqUeHKLUWqPb7pEaBgZimIff4G2SozbiDGDTN0fcW6g=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=YIyhPx3chIXecJfkgbuVJSesMmg0y88AL9CU3AVb3kgLB8x7qnouYLDtX54u62EfD
	 O+UmS68TXuoLvNk2tvZhxIzMF29IKTqE+bBr0GX0AWZi9tciN6S+ysRwsByGcPXj8U
	 oyN0Ib5DqRJN/U7GYajw0oclLaPYdHAwmn3gWicGZLc7puCRA7nPu7B764NOMyMoFv
	 dWkjajPbWh+/0+cEkmv4+l2K+DaRz6tXXLSPmT3Jb0qqBaFrCwXqF66YvzIaUlvcWS
	 0+oViuPe2CqTZydvYwUZ+66d0XDLYfYbY1S0GgtBJS0u5ZL0nT8PfFD7fCBAgA8aSO
	 vqop2U3hFAIbQ==
Date: Fri, 07 Mar 2025 07:25:59 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
 linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 linux-kernel@vger.kernel.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org
To: ernestvanhoecke@gmail.com
In-Reply-To: <20250307101758.27943-1-ernest.vanhoecke@toradex.com>
References: <20250307101758.27943-1-ernest.vanhoecke@toradex.com>
Message-Id: <174135385275.4031184.1416379470522159928.robh@kernel.org>
Subject: Re: [PATCH v2 0/2] ARM: dts: apalis/colibri-imx6: Add support for
 v1.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_052602_904643_FCC0C656 
X-CRM114-Status: GOOD (  18.37  )
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


On Fri, 07 Mar 2025 11:17:47 +0100, ernestvanhoecke@gmail.com wrote:
> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> 
> Apalis/Colibri iMX6 V1.2 replaced the STMPE811 ADC/touch controller,
> which is EOL, with the TLA2024 ADC and AD7879 touch controller.
> 
> Accurately describe the new hardware.
> 
> v1.1 of these SoMs is still described by the following DTSI files:
> imx6qdl-apalis.dtsi
> imx6qdl-colibri.dtsi
> 
> The STMPE811 touchscreen controller is no longer disabled by default.
> The STMPE811 is self contained within the SoM, therefore, disabling it
> is not the correct default behavior.
> 
> v1.2 is now supported by a DTSI that modifies v1.1:
> imx6qdl-apalis-v1.2.dtsi
> imx6qdl-colibri-v1.2.dtsi
> 
> For each carrier board using these modules, a new DTS file was added
> that includes the v1.1 DTS and modifies it with this v1.2 DTSI.
> 
> The original DTS can be used for modules up to and including v1.1.
> 
> v2: Fixed the "From" field
> v1: https://lore.kernel.org/all/20250227170556.589668-1-ernest.vanhoecke@toradex.com/
> 
> Ernest Van Hoecke (2):
>   ARM: dts: apalis/colibri-imx6: Enable STMPE811 TS
>   ARM: dts: apalis/colibri-imx6: Add support for v1.2
> 
>  arch/arm/boot/dts/nxp/imx/Makefile            |  9 +++
>  .../dts/nxp/imx/imx6dl-colibri-v1.2-aster.dts | 11 ++++
>  .../nxp/imx/imx6dl-colibri-v1.2-eval-v3.dts   | 11 ++++
>  .../nxp/imx/imx6dl-colibri-v1.2-iris-v2.dts   | 11 ++++
>  .../dts/nxp/imx/imx6dl-colibri-v1.2-iris.dts  | 11 ++++
>  .../nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dts   | 11 ++++
>  .../dts/nxp/imx/imx6q-apalis-v1.2-eval.dts    | 11 ++++
>  .../nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dts  | 11 ++++
>  .../nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dts  | 11 ++++
>  .../dts/nxp/imx/imx6q-apalis-v1.2-ixora.dts   | 11 ++++
>  .../boot/dts/nxp/imx/imx6qdl-apalis-v1.2.dtsi | 57 +++++++++++++++++++
>  arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi |  1 -
>  .../dts/nxp/imx/imx6qdl-colibri-v1.2.dtsi     | 57 +++++++++++++++++++
>  .../arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi |  1 -
>  14 files changed, 222 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-aster.dts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-eval-v3.dts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris-v2.dts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris.dts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis-v1.2.dtsi
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri-v1.2.dtsi
> 
> --
> 2.43.0
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


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/nxp/' for 20250307101758.27943-1-ernest.vanhoecke@toradex.com:

arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dtb: iomuxc-gpr@20e0000: 'ipu1_csi0_mux', 'ipu2_csi1_mux' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dtb: iomuxc-gpr@20e0000: 'ipu1_csi0_mux', 'ipu2_csi1_mux' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dtb: iomuxc-gpr@20e0000: 'ipu1_csi0_mux', 'ipu2_csi1_mux' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dtb: /soc/bus@2100000/i2c@21a0000/pcie-switch@58: failed to match any schema with compatible: ['plx,pex8605']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris.dtb: iomuxc-gpr@20e0000: 'ipu1_csi0_mux', 'ipu1_csi1_mux' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dtb: /soc/ipu@2800000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dtb: /disp0: failed to match any schema with compatible: ['fsl,imx-parallel-display']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dtb: panel-lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dtb: panel-lvds: compatible: ['panel-lvds'] is too short
	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dtb: /soc/ipu@2800000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dtb: /disp0: failed to match any schema with compatible: ['fsl,imx-parallel-display']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dtb: panel-lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dtb: panel-lvds: compatible: ['panel-lvds'] is too short
	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dtb: /soc/ipu@2800000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dtb: /disp0: failed to match any schema with compatible: ['fsl,imx-parallel-display']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dtb: panel-lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dtb: panel-lvds: compatible: ['panel-lvds'] is too short
	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris.dtb: /disp0: failed to match any schema with compatible: ['fsl,imx-parallel-display']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dtb: iomuxc-gpr@20e0000: 'ipu1_csi0_mux', 'ipu2_csi1_mux' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris-v2.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris-v2.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-aster.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-aster.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dtb: /soc/ipu@2800000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dtb: /disp0: failed to match any schema with compatible: ['fsl,imx-parallel-display']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dtb: panel-lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dtb: panel-lvds: compatible: ['panel-lvds'] is too short
	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-eval-v3.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-eval-v3.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dtb: iomuxc-gpr@20e0000: 'ipu1_csi0_mux', 'ipu2_csi1_mux' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-eval-v3.dtb: iomuxc-gpr@20e0000: 'ipu1_csi0_mux', 'ipu1_csi1_mux' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-aster.dtb: iomuxc-gpr@20e0000: 'ipu1_csi0_mux', 'ipu1_csi1_mux' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris-v2.dtb: iomuxc-gpr@20e0000: 'ipu1_csi0_mux', 'ipu1_csi1_mux' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-eval-v3.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-eval-v3.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-eval-v3.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-eval-v3.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-eval-v3.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-eval-v3.dtb: /disp0: failed to match any schema with compatible: ['fsl,imx-parallel-display']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-aster.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dtb: /soc/ipu@2800000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-aster.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dtb: /disp0: failed to match any schema with compatible: ['fsl,imx-parallel-display']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dtb: panel-lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dtb: panel-lvds: compatible: ['panel-lvds'] is too short
	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris-v2.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-aster.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris-v2.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-aster.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-aster.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris-v2.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-aster.dtb: /disp0: failed to match any schema with compatible: ['fsl,imx-parallel-display']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris-v2.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris-v2.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris-v2.dtb: /disp0: failed to match any schema with compatible: ['fsl,imx-parallel-display']






