Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99439C02183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 15:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RwpA8xODhzN3xLYmkbGM7YwDr68SjVQSY2NFZwecLcw=; b=PdUXdFUTv+NXulI3zei/RVOSO6
	BTE72JJr4yotRM0gI9Q8adFwDzuvX/ZqdGdVHJSt6sKy3swZpz+XFeG4czSF4K77SWsCONy1O5hHi
	jmTmZQ+qt87FwCwhUYCb6QW5f5SVLFCtiD06DNHCRZ4O3M1HDnT9ZfqMrUvrpCfOK/mYSV+9wVgsw
	D0Zgm/ngUcybiOWU+OBZCpvoGtDEoDz38Ws6JKMEa0rFSdz3Ii9dcH5QNw45Bg0E1QB1fRIFiakQc
	Xmc+eGQNMF0hC6f4sBQ7nZ0qb18leAWwNgcjKTcu6m3vOCPzY+bpJya3cflsdEOR69dMNld4nXYYm
	qtUOBOfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMp4-00000005kYc-3yui;
	Mon, 13 Jan 2025 15:57:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMKM-00000005ciC-4B57
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 15:26:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 959DB5C5612;
	Mon, 13 Jan 2025 15:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A0B1C4CEE2;
	Mon, 13 Jan 2025 15:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736781966;
	bh=5GmGthLpYKunN5PaKte3BBzy6UppfieKww7/WXUP5fA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=GWpRYI/2DdvEHmcIowU64Rkn7Km1medSGOtScIVhKoMtIGA7Zu5Qrazfk9p4G2uIa
	 1WFsIg0MOhWDtYkhf1UeGufO4PxyeSa7B2GWF2XKoBonf/kt+vlgOnJu+Ej066C0ll
	 nYdfmW70wT6nvXb3aKxSBBexbp3uqVKuOH7HEIoObwdEkPkt6WWxt1aXXyAs2TuWSY
	 ldvWzxayMwf1OXlhDTOPrcKTaEUmnucFQVJL3k4KrXXMDTtRJ+xI6SFRO23eK80qXf
	 R7uSBy6s4a3bkvxAV3KAOHo+r2bFF5+0P8OhxnSEvDBjn1lhev1uGUAY8jUkeE7uOV
	 k+EBFdu3RJmTg==
Date: Mon, 13 Jan 2025 09:26:05 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: shawnguo@kernel.org, imx@lists.linux.dev, krzk+dt@kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Fabio Estevam <festevam@denx.de>, conor+dt@kernel.org, 
 kernel@pengutronix.de
To: Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20250112124127.994141-1-festevam@gmail.com>
References: <20250112124127.994141-1-festevam@gmail.com>
Message-Id: <173678159815.2153167.409339104856435537.robh@kernel.org>
Subject: Re: [PATCH] ARM: dts: vfxxx: Fix the CAAM job ring node names
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_072607_119292_FEB88C37 
X-CRM114-Status: GOOD (  13.84  )
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


On Sun, 12 Jan 2025 09:41:27 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> According to fsl,sec-v4.0.yaml, the job ring node names
> should be 'jr'.
> 
> Change them to fix the following dt-schema warnings:
> 
> crypto@400f0000: 'jr0@1000', 'jr1@2000' do not match any of the regexes:
> '^jr@[0-9a-f]+$', '^rtic@[0-9a-f]+$', 'pinctrl-[0-9]+'
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  arch/arm/boot/dts/nxp/vf/vfxxx.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
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


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/nxp/' for 20250112124127.994141-1-festevam@gmail.com:

arch/arm/boot/dts/nxp/mxs/imx28-cfa10036.dtb: spi@80010000: $nodename:0: 'spi@80010000' does not match '^mmc(@.*)?$'
	from schema $id: http://devicetree.org/schemas/mmc/mxs-mmc.yaml#
arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: /ahb/flash@20020000: failed to match any schema with compatible: ['nxp,lpc3220-slc']
arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: /soc/dcu@2ce0000: failed to match any schema with compatible: ['fsl,ls1021a-dcu']
arch/arm/boot/dts/nxp/imx/imx53-usbarmory.dtb: /soc/bus@50000000/iomuxc-gpr@53fa8000: failed to match any schema with compatible: ['fsl,imx53-iomuxc-gpr', 'syscon']
arch/arm/boot/dts/nxp/imx/imx6q-lxr.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
arch/arm/boot/dts/nxp/imx/imx6q-gw553x.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
arch/arm/boot/dts/nxp/imx/imx6qp-tx6qp-8137.dtb: iomuxc-gpr@20e0000: 'ipu1_csi0_mux', 'ipu2_csi1_mux' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
arch/arm/boot/dts/nxp/imx/imx6q-gw53xx.dtb: ds1672@68: $nodename:0: 'ds1672@68' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
arch/arm/boot/dts/nxp/imx/imx53-mba53.dtb: /soc/bus@50000000/ldb@53fa8008: failed to match any schema with compatible: ['fsl,imx53-ldb']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']






