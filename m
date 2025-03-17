Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5582C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 20:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I1+rp5hCMEzg8sbe0btoe7s4gWqVRG9MsDuG1JT2EGw=; b=UAiHpcVNQRiG5d2Us2aT4tL6iM
	QNEhcw0I/1VIUJnDU1U8pnA3A7r4qMN8eaub4staWAayKV6RI+b6TVWkMuH1C86Oy66h0yS/u6QIr
	zehGFIR3nRQK55U4pmTPHaaD7ruXsABD8E8CLrFfjQVqVMnA092PlyUzXGoXhFsDMZ+3GvzMw2FxV
	jKOnKYZciEfmy3u7XUmgs1qDtwpNEZEzLk5L10u9Cxg6dXe/kFXkOKdmQzquWwDYL9f1tUVsq4884
	MfnAQx0exnEbQIfz2nSdsM0/N05ddyRb6n1dcBWnAwx6Bh8I4HCKPPl17fDlqxlPpK5m/kvbq3bKG
	/FXXEgOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuHFA-00000003vNw-0hDm;
	Mon, 17 Mar 2025 20:39:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuHDS-00000003vCF-2F75
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 20:37:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0AB255C2BCA;
	Mon, 17 Mar 2025 20:35:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C76EC4CEE3;
	Mon, 17 Mar 2025 20:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742243861;
	bh=aXqJ/pis7CyCbe3dFyicCUqHQk/5npXUAYLRJ48VhpE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=KSsYA7uRKzdXFAuqhX9P2fst3OX9TeQJZuRqxJs8GCrvLsscBDx0fyNv442eDOllN
	 OeWYytyu+bCTnvlepAy1LCAmvr8GgtVi0q9jmExNhfbKTCRd8QYVc5jmXXnNjL2Z2T
	 BZZmMef9h8bkdDRoZ2wq2l3O9gFadyLhL1KENsuu2nCLLMId7SePuV2vrDPpbXGMUb
	 P8b6F1EqXCadq4Yh/mCfvL66jNBg2iYKbCMGDWJmMyeihlW61o+6IHc0DHhVMKz+iL
	 88NTWhuKGqkRDaTSW4XI1pbYyp7DBbvXkZeyVGA64CkiYJrOeeZXKJHqhL/xsZJYbB
	 um2Ww+xGXac6w==
Date: Mon, 17 Mar 2025 15:37:40 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: daniel.baluta@gmail.com, shengjiu.wang@nxp.com, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 shawnguo@kernel.org, mathieu.poirier@linaro.org, festevam@gmail.com, 
 aisheng.dong@nxp.com, krzk+dt@kernel.org, s.hauer@pengutronix.de, 
 a.fatoum@pengutronix.de, frank.li@nxp.com, conor+dt@kernel.org, 
 kernel@pengutronix.de, iuliana.prodan@nxp.com, imx@lists.linux.dev, 
 laurentiu.mihalcea@nxp.com
To: Daniel Baluta <daniel.baluta@nxp.com>
In-Reply-To: <20250317133306.2003909-1-daniel.baluta@nxp.com>
References: <20250317133306.2003909-1-daniel.baluta@nxp.com>
Message-Id: <174224352689.683565.9145622703259276578.robh@kernel.org>
Subject: Re: [PATCH v5 0/5] Configure imx8mp dsp node for rproc usage
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_133742_687981_7401A4CD 
X-CRM114-Status: GOOD (  18.49  )
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


On Mon, 17 Mar 2025 15:33:01 +0200, Daniel Baluta wrote:
> DSP found in i.MX8MP SOC can be used by multiple frameworks in order to
> enable various applications:
>         - rproc/rpmsg framework, used to load for example Zephyr samples
>         - Sound Open Firmware, used to enable various audio processing
>           pipelines.
> 
> Current dsp node was configured with SOF in mind but it doesn't work
> well with imx8mp-evk dts. SOF controls audio IPs from firmware side
> while imx8mp-evk.dts preffers to control audio IPs from Linux side.
> 
> So, configure 'dsp' node to be used with rproc scenario and later will
> add a separate dts or an overlay to configure the node for SOF.
> 
> This patch series configures and enables dsp node to be used with rproc.
> 
> Changes since v4:
> (https://lore.kernel.org/linux-arm-kernel/Z6zGLn3B6SVXhTV1@lizhi-Precision-Tower-5810/T/)
> 	- after comments received on v4, we implemented the run/stall
> 	  bits using reset controller API (changes merged ->
> https://patchwork.kernel.org/project/linux-arm-kernel/cover/20250311085812.1296243-1-daniel.baluta@nxp.com/)
>         - drop patches related to DSP run/stall/reset via syscon
> 	- picked up patch related to using run_stall via reset
> 	  controller API.
> 
> Daniel Baluta (5):
>   arm64: dts: imx8mp: Use resets property
>   arm64: dts: imx8mp: Add mu2 root clock
>   arm64: dts: imx8mp: Configure dsp node for rproc usage
>   arm64: dts: imx8mp: Add DSP clocks
>   arm64: dts: Add dsp rproc related mem regions
> 
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 10 +++++++++
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi    | 22 +++++++++++++-------
>  2 files changed, 25 insertions(+), 7 deletions(-)
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250317133306.2003909-1-daniel.baluta@nxp.com:

arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: dsp@3b6e8000: memory-region: [[142]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: dsp@3b6e8000: memory-region: [[105]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: dsp@3b6e8000: memory-region: [[156]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: dsp@3b6e8000: memory-region: [[127]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: dsp@3b6e8000: memory-region: [[164]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: dsp@3b6e8000: memory-region: [[102]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: dsp@3b6e8000: memory-region: [[129]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: dsp@3b6e8000: memory-region: [[132]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: dsp@3b6e8000: memory-region: [[118]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: dsp@3b6e8000: memory-region: [[165]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: dsp@3b6e8000: memory-region: [[105]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: dsp@3b6e8000: memory-region: [[140]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtb: dsp@3b6e8000: memory-region: [[142]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-ivy.dtb: dsp@3b6e8000: memory-region: [[162]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: dsp@3b6e8000: memory-region: [[120]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: dsp@3b6e8000: memory-region: [[163]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: dsp@3b6e8000: memory-region: [[155]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: dsp@3b6e8000: memory-region: [[164]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: dsp@3b6e8000: memory-region: [[119]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: dsp@3b6e8000: memory-region: [[158]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: dsp@3b6e8000: memory-region: [[131]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: dsp@3b6e8000: memory-region: [[111]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: dsp@3b6e8000: memory-region: [[134]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: dsp@3b6e8000: memory-region: [[130]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: dsp@3b6e8000: memory-region: [[152]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: dsp@3b6e8000: memory-region: [[130]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: dsp@3b6e8000: memory-region: [[148]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: dsp@3b6e8000: memory-region: [[136]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtb: dsp@3b6e8000: memory-region: [[142]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: dsp@3b6e8000: memory-region: [[169]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: dsp@3b6e8000: memory-region: [[156]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dtb: dsp@3b6e8000: memory-region: [[160]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-ivy.dtb: dsp@3b6e8000: memory-region: [[157]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: dsp@3b6e8000: memory-region: [[159]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: dsp@3b6e8000: memory-region: [[153]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dtb: dsp@3b6e8000: memory-region: [[150]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx-2x.dtb: dsp@3b6e8000: memory-region: [[132]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb: dsp@3b6e8000: memory-region: [[123]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: dsp@3b6e8000: memory-region: [[144]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: dsp@3b6e8000: memory-region: [[160]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: dsp@3b6e8000: memory-region: [[131]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dtb: dsp@3b6e8000: memory-region: [[107]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dtb: dsp@3b6e8000: memory-region: [[158]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: dsp@3b6e8000: memory-region: [[129]] is too short
	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#






