Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0766CC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 20:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ErFJtx/TdDMaqHfT/raCDjsoYFvvuToo5iyvrVV/XM=; b=kkBFH8QzmIf59yuEr8AVJHyIpJ
	OzmHbFZQCi/K8B8C9+nwqI9L/4a7t6uTkxrqRFf+adxLZSU/D7DErRcQ6v0Cp6GZ7ot8mWOXo5Kls
	3ozXHdyg1XrXhXGZBsyGNFW2I/HlIveP0YtLmhlZVYTtRs25eZUJ5iIcmQ/xQM+Qo8hfygk44vXtt
	+ksHVFC7G497qXsjV+OBuP58QAxvTowX1T8KUZaaVpYNAh6+1ALyr9s/qXwmDa6B6vsDY62Xs8Yqd
	B5dAe6XSS6OuQRFfqyUHJzIZuvCPsLxZAnq7UGoplFVE239Sdw/DP5tIQsk+WTLRXL7Bv1ISpNst1
	DNL0Hn1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1a4-00000001NGz-2oAk;
	Tue, 25 Feb 2025 20:31:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1IC-00000001Jtt-3MXl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 20:12:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 14A225C7042;
	Tue, 25 Feb 2025 20:11:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D552C4CEDD;
	Tue, 25 Feb 2025 20:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740514354;
	bh=o9Fk+gFtqkDJKzeh44jxcdnyRxWUtu90QSRKPJrniEc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=IZe9QkngILC30nEEw6qustbEinAHZUpnbbyBWhBiJ5t9ACmDcyle2GBpv1kQoQKRY
	 rdfml+O8SwzX1C14iWVjFOHo2PoX38okfy3kcXeHZWRgWpczzm2299orjG0kYWZgJF
	 A8/XCMTptDdpa6eFYHwcqciZPWmVAY59Gj2D319QrSd8l6W8ZTwI5iaRkSd8MC0dCD
	 /z4fiHuaMxiqSz1acpXyDAnhod1vDKW636BPDg4fuL9sbxyncESeqghn/FpsN3eEg1
	 nhJGV9sWh8Szq0lOuRpy09sGL5+JfCHbtdec3zwfGQgVfiAPUydrvzV89y8IWfYgLe
	 7IMHhKL+mX+8A==
Date: Tue, 25 Feb 2025 14:12:32 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: s.hauer@pengutronix.de, festevam@gmail.com, shawnguo2@yeah.net, 
 shawnguo@kernel.org, linux-kernel@vger.kernel.org, kernel@pengutronix.de, 
 linux-arm-kernel@lists.infradead.org, hongxing.zhu@nxp.com, 
 conor+dt@kernel.org, krzk+dt@kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org
To: Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20250224170751.146840-1-Frank.Li@nxp.com>
References: <20250224170751.146840-1-Frank.Li@nxp.com>
Message-Id: <174051415001.2971194.5351687405398277268.robh@kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: imx95: add ref clock for pcie nodes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_121236_963281_10C02528 
X-CRM114-Status: GOOD (  10.78  )
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


On Mon, 24 Feb 2025 12:07:51 -0500, Frank Li wrote:
> Add "ref" clock for i.MX95's pcie and fix below CHECK_DTBS warnings:
> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie@4c300000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux'] is too short
> 	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 25 ++++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250224170751.146840-1-Frank.Li@nxp.com:

arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie-ep@4c300000: clocks: [[27, 87], [27, 36], [27, 35], [27, 88], [73, 0]] is too long
	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie-ep@4c300000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux', 'ref'] is too long
	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie-ep@4c300000: clocks: [[27, 87], [27, 36], [27, 35], [27, 88], [73, 0]] is too long
	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie-ep@4c300000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux', 'ref'] is too long
	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie-ep@4c380000: clocks: [[27, 87], [27, 36], [27, 35], [27, 88], [73, 0]] is too long
	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie-ep@4c380000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux', 'ref'] is too long
	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie-ep@4c380000: clocks: [[27, 87], [27, 36], [27, 35], [27, 88], [73, 0]] is too long
	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie-ep@4c380000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux', 'ref'] is too long
	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#






