Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0225C282C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 14:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iPoV+ZpqQ3PWmFZkuxZp0eZQaQXXehElRRa9ElE8DY8=; b=n/wmlsIMpbm46tXHj0AzcgqG+2
	EweFVhIhaNEyDGtBAxmuncdYu+cUjeSGRgt8TwfEUeIdegKciZi3tcKot9h0zWpCGscfB45KDRnRk
	uBSo98QCHqF4CUMyw5aSqitan1pOTuhZuGsxEVqZtOZgB5gMtrIDLaZa90Jb9OtSlXSL8pbsQJTG1
	/0pEUwRYNSm/GVdnM9sNTFUvfV4szeQlKW0Uw6uszpzijK8DLwYob6b37umrieZdfRVUaE/8qCYhK
	eN7sc9OHLwjwKtdpIWe3ooXlLNCRO8PNDLF+VF2zIEVDGx5VCdFUoDq2OM7EphWduSfOjB8K69Mqy
	CJRNIeUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to1cY-0000000BJyQ-3hsG;
	Fri, 28 Feb 2025 14:45:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to1HQ-0000000BFT0-327W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 14:23:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5F09661F64;
	Fri, 28 Feb 2025 14:23:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 741C5C4CED6;
	Fri, 28 Feb 2025 14:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740752635;
	bh=imtC1b2Zt5O+kWIgI4T/K6hVYDtoitkEABdlSgp1tlA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=cqIzyxCXFHpEln6m74m1toIc4WkDWDgNLB7QEUnsrlzFUOyRwJEqq8cHPfxf72lpn
	 zoCSnLvVHvW4tnYd8OqL350Z434mK4CelWznvuSVO3oa1Al7V9kTBqC536aEGskDg6
	 1d/tqUA8DU/vpqa3Hp7zCxiRn5PzoxIhvylfYl92oQwncFvQbqaBCm21iczLDmSLG6
	 E4qBqfa8NjBKtjvHTqUxrx5bJ+S8nc1pExz35ybbcE826ji0ALynY2QUD0jFcRRkkG
	 Z2meneq9l3Bu8J+TnDJs8I6CB7FnXTN3+3Vr4G9v24QLy2GLw1GzT8t7UPYew8FVN2
	 ZGZuxwi4s7hvA==
Date: Fri, 28 Feb 2025 08:23:53 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: imx@lists.linux.dev, Fabio Estevam <festevam@gmail.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
In-Reply-To: <20250227170556.589668-1-ernest.vanhoecke@toradex.com>
References: <20250227170556.589668-1-ernest.vanhoecke@toradex.com>
Message-Id: <174075232542.2756045.6013809147332771142.robh@kernel.org>
Subject: Re: [PATCH 0/2] ARM: dts: apalis/colibri-imx6: Add support for
 v1.2
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


On Thu, 27 Feb 2025 18:04:51 +0100, Ernest Van Hoecke wrote:
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


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/nxp/' for 20250227170556.589668-1-ernest.vanhoecke@toradex.com:

arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dtb: iomuxc-gpr@20e0000: 'ipu1_csi0_mux', 'ipu2_csi1_mux' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dtb: iomuxc-gpr@20e0000: 'ipu1_csi0_mux', 'ipu2_csi1_mux' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris.dtb: iomuxc-gpr@20e0000: 'ipu1_csi0_mux', 'ipu1_csi1_mux' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dtb: /soc/bus@2100000/i2c@21a0000/pcie-switch@58: failed to match any schema with compatible: ['plx,pex8605']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dtb: iomuxc-gpr@20e0000: 'ipu1_csi0_mux', 'ipu2_csi1_mux' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dtb: /soc/ipu@2800000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dtb: /soc/ipu@2800000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dtb: /disp0: failed to match any schema with compatible: ['fsl,imx-parallel-display']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris.dtb: /disp0: failed to match any schema with compatible: ['fsl,imx-parallel-display']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dtb: panel-lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dtb: panel-lvds: compatible: ['panel-lvds'] is too short
	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dtb: /disp0: failed to match any schema with compatible: ['fsl,imx-parallel-display']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dtb: panel-lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dtb: panel-lvds: compatible: ['panel-lvds'] is too short
	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dtb: /soc/ipu@2800000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dtb: /disp0: failed to match any schema with compatible: ['fsl,imx-parallel-display']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dtb: panel-lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dtb: panel-lvds: compatible: ['panel-lvds'] is too short
	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dtb: iomuxc-gpr@20e0000: 'ipu1_csi0_mux', 'ipu2_csi1_mux' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris-v2.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris-v2.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-aster.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-aster.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris-v2.dtb: iomuxc-gpr@20e0000: 'ipu1_csi0_mux', 'ipu1_csi1_mux' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dtb: /soc/ipu@2800000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dtb: iomuxc-gpr@20e0000: 'ipu1_csi0_mux', 'ipu2_csi1_mux' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dtb: /disp0: failed to match any schema with compatible: ['fsl,imx-parallel-display']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-aster.dtb: iomuxc-gpr@20e0000: 'ipu1_csi0_mux', 'ipu1_csi1_mux' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dtb: panel-lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dtb: panel-lvds: compatible: ['panel-lvds'] is too short
	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris-v2.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris-v2.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris-v2.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris-v2.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris-v2.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris-v2.dtb: /disp0: failed to match any schema with compatible: ['fsl,imx-parallel-display']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-eval-v3.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-eval-v3.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-aster.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-aster.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-aster.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dtb: /soc/ipu@2800000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-aster.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-aster.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-aster.dtb: /disp0: failed to match any schema with compatible: ['fsl,imx-parallel-display']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dtb: /disp0: failed to match any schema with compatible: ['fsl,imx-parallel-display']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dtb: panel-lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dtb: panel-lvds: compatible: ['panel-lvds'] is too short
	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-eval-v3.dtb: iomuxc-gpr@20e0000: 'ipu1_csi0_mux', 'ipu1_csi1_mux' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-eval-v3.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-eval-v3.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-eval-v3.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-eval-v3.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-eval-v3.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-eval-v3.dtb: /disp0: failed to match any schema with compatible: ['fsl,imx-parallel-display']






