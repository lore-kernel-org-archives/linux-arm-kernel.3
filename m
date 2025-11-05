Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1545CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 11:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5jbA9aezDlJiuk2X1xT0BLwTokZ2YLI3EDgl9yTbOXQ=; b=4Ig491NWZo6PN12t5Eq0xXIPPy
	PEd8Nwr5VUR7KxAVbdNKlwQg8QsE2pTAnxSCBinMrkTqVM/dKbFBJK2nJBFi9jJvlhokG50whwSmi
	iuZpJzm2OcNtP8kgXq4c+rM6MdXRJpTYjNyQ9CxDLSxS9PJ0o7jSnIGyp/Ulh4B3zqhbM8kHHQkPN
	iTmzjf7gEvdkBOQHvsynB2VlsGGuPfOUQ/dob0IqaAUIC/kkmC5R/jiSJJqj1dxjFPVrm+XaTQDzQ
	T6JI19RKtCgPHlho1DSAWsZPM+4x9aD24ZTHKjiKmkIqDk9SFR1ZsTNuLBICbaclFgitP3d7LQYMM
	5hoggghA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGc79-0000000DZPZ-0c2g;
	Wed, 05 Nov 2025 11:55:47 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGc76-0000000DZP1-2jit
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 11:55:45 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 94AD01F842;
	Wed,  5 Nov 2025 12:55:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1762343743;
	bh=5jbA9aezDlJiuk2X1xT0BLwTokZ2YLI3EDgl9yTbOXQ=; h=From:To:Subject;
	b=kNpqG3G4Hsyvb9z4ilOi6Dy803JvAxDoY+VekOn3c4RdY4SWM9QzdABbvQ7z/qVt8
	 cuLeVHLAvpOUNdF4eHpe+7auA0bG1W524fOCsCIb1zt8wXpakNWFzbyAO6qt4OldsJ
	 8WYWJHgZGe+kTafoVoElL46+3KoDT/a2bVqL2pC0iSxKIHU9dRQJdT+G2qGQM6jibd
	 u2YMHAT0RqBeFasTjDKmcEnvH3TBGzFZG4peHu4eOxQHFn6MYnAnnceDkq5r35+za9
	 tH4wnP+es9awN8snj2ycAjQPur22vqIU0RBPJOhRhUbXV+tJVNMw5McPeHA+0tU3IC
	 M+xqXL2e8vxrg==
Date: Wed, 5 Nov 2025 12:55:38 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] ARM: dts: imx: move nand related property under
 nand@0
Message-ID: <20251105115538.GA17091@francesco-nb>
References: <20251104-gpmi_dts-v1-0-886865393d0f@nxp.com>
 <20251104-gpmi_dts-v1-3-886865393d0f@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104-gpmi_dts-v1-3-886865393d0f@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_035544_870408_1E52EC20 
X-CRM114-Status: GOOD (  12.09  )
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

Hello Frank,

On Tue, Nov 04, 2025 at 05:27:14PM -0500, Frank Li wrote:
> Add child node nand@0 and move NAND related property under it to align
> modern nand-controller.yaml.
> 
> Fix below CHECK_DTBS warnings:
>   arch/arm/boot/dts/nxp/imx/imx6ull-colibri-aster.dtb: nand-controller@1806000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('nand-ecc-mode', 'nand-ecc-step-size', 'nand-ecc-strength', 'nand-on-flash-bbt' were unexpected)
>         from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
> 
> Since 2019 year, commit
> (212e496935929 dt-bindings: mtd: Add YAML schemas for the generic NAND options)
> NAND related property is preferred located under nand@<n> even though only
> one NAND chip supported.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi           |  6 +++++-
>  arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi              |  6 +++++-
>  arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi      |  6 +++++-
>  arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi |  6 +++++-
>  arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi           |  6 +++++-
>  arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi                |  6 +++++-
>  arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts                 |  6 +++++-
>  arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi               |  6 +++++-
>  arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi  |  6 +++++-
>  arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi               |  6 +++++-
>  arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi            | 12 ++++++++----
>  arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi   | 12 ++++++++----
>  arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi      |  6 +++++-
>  arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts          |  6 +++++-
>  arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi               |  8 ++++++--
>  15 files changed, 82 insertions(+), 22 deletions(-)
> 

Was any of these changes tested? Is the driver able to cope with the
binding change?

Francesco



