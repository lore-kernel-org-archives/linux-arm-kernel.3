Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9CDC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 01:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=il6jYmKN5cX/c+7UWVto+Oj1n4hFtbCu8p1XCz3TiEE=; b=0HbCDi/cCDBtMiZYR+Z7Fp0tmu
	E69l8N6XrOo2ZmkXUsVe9l46+4BBalnQuur5/qxs0GzzUxtR9OdJncIaxu0ME5s59z6bHf1fr6+i2
	zo7xZxc/1EElrRTfnycFH5rXWE3j9HbyhBS09A+3hfASY6fAjJkdfvyiPVJyYxf9gzC8zWGzwfI47
	g6z6FBz7D69d1enaRHfcAf8/EUbmb6PQjgzS3mbgiiIyGS3GBrZ61weTvOi7oeVMZIEcXSEirZNMO
	idgqnGUAEDe27pKlw1liZQ3ctzBXuGmyfPRsIk1DdIQb7AU5lkzh3b6fF2blgKTprLFMaA6ve4Xep
	u35KWOFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tleMM-00000007IIg-0t1D;
	Sat, 22 Feb 2025 01:31:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tleKs-00000007I9l-0Sdo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 01:29:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 18D815C5D49;
	Sat, 22 Feb 2025 01:29:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E390C4CED6;
	Sat, 22 Feb 2025 01:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740187780;
	bh=M/8afILG/fiSMw6cLfHMqMulnTBlFbWMNBSND4QBAuE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=V8srSeKjQCkRGONBXy9ePBQV4CUVrRdTUDJwg7i/A7oOmgCMNQLWkvMcQ+i/5+i/m
	 CmOUI/22IW+5nH1nHgxGH0LUJ+SlCtCxMw0OfKEv3N/VS5KXymn2qGzyZzuQr7B/h+
	 nwBrColLbfUC+1L+d12ux/VnAX533oZobVDJS2vBmJUTvYrMqY9bXDWnVgG6OwfU0F
	 P29wqoT74KE3Eq4cAOTsOcJ5mL9unybZFJgf6I3msDUHQLlgjRenOKNjbg5PNSstuD
	 TXU7WnWsCa8XkABpBVycl8MVGYCBomwVkMIHMRiTzgD+OCY6zTqYPig95sNFHudgKs
	 o+K7owCl1VxAQ==
Date: Fri, 21 Feb 2025 19:29:38 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Shawn Guo <shawnguo@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Conor Dooley <conor.dooley@microchip.com>, devicetree@vger.kernel.org, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev
To: Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20250221-imx95_15x15-v4-0-385ee8e03dfd@nxp.com>
References: <20250221-imx95_15x15-v4-0-385ee8e03dfd@nxp.com>
Message-Id: <174018774174.599965.6492650307461479037.robh@kernel.org>
Subject: Re: [PATCH v4 0/4] arm64: dts: add imx95_15x15_evk boards support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_172942_263383_036DAB49 
X-CRM114-Status: GOOD (  14.78  )
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


On Fri, 21 Feb 2025 16:15:56 -0500, Frank Li wrote:
> Add related binding doc.
> 
> Add imx95_15x15_evk boards, which have big difference with imx95_19x19_evk
> boards.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Changes in v4:
> - Add usb typce part
> - Link to v3: https://lore.kernel.org/r/20250220-imx95_15x15-v3-0-247777ed91c4@nxp.com
> 
> Changes in v3:
> - Add Rob and Conor's ack tags
> - Remove undocument property (need doube check why dtb-check have not
> report warning).
> 
> - Link to v2: https://lore.kernel.org/r/20250114-imx95_15x15-v2-0-2457483bc99d@nxp.com
> 
> Changes in v2:
> - fixed typo 'inctrl-names'.
> - Link to v1: https://lore.kernel.org/r/20250113-imx95_15x15-v1-0-8c20cbaab9ed@nxp.com
> 
> ---
> Frank Li (4):
>       dt-bindings: arm: fsl: add i.MX95 15x15 EVK board
>       arm64: dts: imx95: Add #io-channel-cells = <1> for adc node
>       arm64: dts: imx95: Add i3c1 and i3c2
>       arm64: dts: imx95: Add imx95-15x15-evk support
> 
>  Documentation/devicetree/bindings/arm/fsl.yaml    |    1 +
>  arch/arm64/boot/dts/freescale/Makefile            |    1 +
>  arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts | 1130 +++++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx95.dtsi          |   27 +
>  4 files changed, 1159 insertions(+)
> ---
> base-commit: 3d34d52fb62b250297279c3d95b2562180a44569
> change-id: 20250110-imx95_15x15-6a64db8c0187
> 
> Best regards,
> ---
> Frank Li <Frank.Li@nxp.com>
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250221-imx95_15x15-v4-0-385ee8e03dfd@nxp.com:

arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: pcie@4c300000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux'] is too short
	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: pcie@4c380000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux'] is too short
	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#






