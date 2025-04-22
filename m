Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B5DCC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 14:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vjca4SS0LDQaoBRT4ZcgCIXZFJwOWWihMEoq+jbhB/o=; b=r6G6E+qZ9d1R4v7VITBT7NzLfR
	DaneTkKPbyGR3Kh/4V7qvpIw2NbbGNRLkqaHdvGX3UiGyk0wkLjtpwcYDrQH2FxEDM72/dZfQ4DO0
	gU3P6Qe96Frk2VKpFUit9YYISgNz5OXG3HVHiHImhnsDYRu1Vx8D2yPpUQ/mGDeF4yaB8lh9iwbH0
	xQVi/cxE+2pKr+DTXVo7j9mIwGAoirXT75C9d/S+dlIGwcpa/Dm+PO9qovqBBhud2i+VomZLeoNp+
	sJmE0IeKrjYMF3sMHL6TENlm4MN6k4dbYQorYr2NiKLX4g70CB2EpuX2sePjTcmT7H9FQwADDgZnX
	yJ6h8aFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7EQf-00000007SNf-4AJY;
	Tue, 22 Apr 2025 14:16:53 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7DFm-00000007DaS-1BNo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 13:01:36 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 072081F99E;
	Tue, 22 Apr 2025 15:01:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1745326891;
	bh=vjca4SS0LDQaoBRT4ZcgCIXZFJwOWWihMEoq+jbhB/o=; h=From:To:Subject;
	b=C4zXWLtlL3y67SU1zoapsx4icmhYWhMeUCN1+Dr/K5iofMbMRwqEtYbmtBr/diRVo
	 WBE7GTpJmG2QiK0IiWCQR+sBO95Wu/XMZqT6cVREWWdTfiKoaOMx18iYPMhkBEHHJh
	 j4EgkGVlI2GS962j1yky/mfJsEYSkOjKlwNp6MyiEGtnt5ZhHoJ2zRBSjvcWpbb9JG
	 OYeoQ+x1QMIDpEt8MJb2319XF5JN675YzWIgbL19PiUSvUrMpLYcZo6bZPPhLBakhf
	 NHWnuz9c5a50LpziXXGaZCwd8NrQzZRH8U6dodWuS92/Rqfvem54ZP788P3RdrB76K
	 vbkzG8mEnNLhg==
Date: Tue, 22 Apr 2025 15:01:27 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Francesco Dolcini <francesco@dolcini.it>,
	Philippe Schenker <philippe.schenker@impulsing.ch>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: imx8mm-verdin: Link reg_usdhc2_vqmmc to
 usdhc2
Message-ID: <20250422130127.GA238494@francesco-nb>
References: <20250422124619.713235-1-Wojciech.Dubowik@mt.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422124619.713235-1-Wojciech.Dubowik@mt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_060134_917421_4F65DA32 
X-CRM114-Status: GOOD (  13.79  )
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

Hello Wojciech,

On Tue, Apr 22, 2025 at 02:46:15PM +0200, Wojciech Dubowik wrote:
> Define vqmmc regulator-gpio for usdhc2 with vin-supply
> coming from LDO5.
> 
> Without this definition LDO5 will be powered down, disabling
> SD card after bootup. This has been introduced in commit
> f5aab0438ef1 ("regulator: pca9450: Fix enable register for LDO5").
> 
> Fixes: f5aab0438ef1 ("regulator: pca9450: Fix enable register for LDO5")
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
> ---
> v1 -> v2: https://lore.kernel.org/all/20250417112012.785420-1-Wojciech.Dubowik@mt.com/
>  - define gpio regulator for LDO5 vin controlled by vselect signal
> ---
>  .../boot/dts/freescale/imx8mm-verdin.dtsi     | 23 +++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> index 7251ad3a0017..9b56a36c5f77 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> @@ -1206,13 +1220,17 @@ pinctrl_usdhc2_pwr_en: usdhc2pwrengrp {
>  			<MX8MM_IOMUXC_NAND_CLE_GPIO3_IO5		0x6>;	/* SODIMM 76 */
>  	};
>  
> +	pinctrl_usdhc2_vsel: usdhc2vselgrp {
> +		fsl,pins =
> +			<MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x10>; /* PMIC_USDHC_VSELECT */

This needs to be muxed as GPIO, MX8MM_IOMUXC_GPIO1_IO04_GPIO1_IO4

Francesco


