Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEA3C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 14:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LVIv+Euugq4tGgOroUBB26lcmJe4QB+yarX/KrXGKoU=; b=TuupTNnuTSNJcGjgp6CloHs9j1
	HyalMMhtvH+I1BqxIRZoEpcRmwYsAuTd07xfP/BYAykFFQYTS738UVwJjUzxdVikB4FUMrrrf9e6e
	B3NHo+VLHFpFPTBZH14Z94b0DwjIs9nuUvhPxhH+dZjoNnvHGOAATsGE5PpL3jUGmbjPhmgYIMQr1
	ddc9dLCwXO6GIYvQ+17AWzJ/ZB+q79FJks/gt5KwUoKl5Y6wONI13pGpJrcuAwSguSaWLSR6PV0Qh
	J3Q/yhwErSq+kQD3XC/H2a8CIHmFkztIUJHrQc1BX20zjfOx8XALxgfpKfFoZD9jnKZWRausAgizw
	ZlbXPS0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QED-0000000DJVg-2ENX;
	Thu, 17 Apr 2025 14:28:33 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5OuK-0000000D4hV-17ck
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 13:03:58 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id B71961F91A;
	Thu, 17 Apr 2025 15:03:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1744895028;
	bh=LVIv+Euugq4tGgOroUBB26lcmJe4QB+yarX/KrXGKoU=; h=From:To:Subject;
	b=KPzhyH1WrJIKuXn4iDgsC61lXzCe1axXYyM9GRAGE4fsHLHTnE1wAqWGZwfS71ft/
	 nA0ZpkIoMNpVG8On6N+KDyb5ttYOEERQ4IWBTolo/A2cjwB/nhLdB/CGaqiQTlf2OM
	 /gSGRJDD8Lr6PSKZjNK8AXLJc4ZqSVQL+V4GkMC53obPRlvHHWgipM4GR0I5+mSGbn
	 KKWmuEsMXuXmzbktwZlDCWTdCsFzXyFe1GnOUP9uJpdLcctRzzgN5bxc/+20wDuU9Y
	 vBNiWRRq3YA0jxNMExpISjRCEOFuqgp+vByQIX6uAk0qLQmmvjCyVM70p9tEU552pe
	 wsPG/35PlJDAA==
Date: Thu, 17 Apr 2025 15:03:42 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mm-verdin: Link reg_nvcc_sd to usdhc2
Message-ID: <20250417130342.GA18817@francesco-nb>
References: <20250417112012.785420-1-Wojciech.Dubowik@mt.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417112012.785420-1-Wojciech.Dubowik@mt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_060357_211877_09B8DF2A 
X-CRM114-Status: GOOD (  17.32  )
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
thanks very much for your patch.

On Thu, Apr 17, 2025 at 01:20:11PM +0200, Wojciech Dubowik wrote:
> Link LDO5 labeled reg_nvcc_sd from PMIC to align with
> hardware configuration specified in the datasheet.
> 
> Without this definition LDO5 will be powered down, disabling
> SD card after bootup. This has been introduced in commit
> f5aab0438ef1 (regulator: pca9450: Fix enable register for LDO5).
> 
> Fixes: f5aab0438ef1 (regulator: pca9450: Fix enable register for LDO5)
> Cc: stable@vger.kernel.org
> 
> Signed-off-by: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> index 7251ad3a0017..6307c5caf3bc 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> @@ -785,6 +785,7 @@ &usdhc2 {
>  	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_cd>;
>  	pinctrl-3 = <&pinctrl_usdhc2_sleep>, <&pinctrl_usdhc2_cd_sleep>;
>  	vmmc-supply = <&reg_usdhc2_vmmc>;
> +	vqmmc-supply = <&reg_nvcc_sd>;

I am worried just doing this will have some side effects.

Before this patch, the switch between 1v8 and 3v3 was done because we
have a GPIO, connected to the PMIC, controlled by the USDHC2 instance
(MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT, see pinctrl_usdhc2).

With your change both the PMIC will be programmed with a different
voltage over i2c and the GPIO will also toggle. It does not sound like
what we want to do.

Maybe we should have a "regulator-gpio" with vin-supply =
<&reg_nvcc_sd>, as we recently did here
https://lore.kernel.org/all/20250414123827.428339-1-ivitro@gmail.com/T/#m2964f1126a6732a66a6e704812f2b786e8237354
?

Francesco


