Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA9E6CF2567
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 07:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zS8dTaDJtlAMs1Nq7ElsWdSDK7IORrVNkxO7z0yRBwA=; b=IjMEF7AFUN7JC9x/5IDsXxJ533
	/g2fFiGgqHIepN1A0N3wtg4ynK9pC8WRCZD0IkB3ZwvSW2e7LwNrgpplxMwazSh6Gwja8IpMw1dmo
	iZAlePXYF7rJpsGXGvAv2PFAI8Eal1RaOxWzvUWntnFEJDSl5VQEk/+7xOfbRhgspMOcIeZEeXrsx
	AKbJB7ixSE1V440BhqwabcwDHAphc/NTvcl4Rzv4ZXfao+PRkVjWNDT96LX2h+r3NYzGHXfAYshJQ
	Weil8nFyu291RXrhIrYRllV3qc4gewg+Y1bnGFUKPkgkFEHSfFa5F28TP1nS2BQqGHhcKIXZgEgoy
	NFUeJc6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLcrO-00000002jOC-1PZr;
	Wed, 19 Nov 2025 07:44:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLcrI-00000002jNd-39uX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 07:44:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6BEEC419B4;
	Wed, 19 Nov 2025 07:44:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 636B3C19423;
	Wed, 19 Nov 2025 07:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763538248;
	bh=SXE3nXw7XOrEOQ/b+5rPODGnW8nNIRQBjWRoQoB8Khc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uCSA4//xIK7UVtJpvWGoPLClWBxjWjuWZOCmnragDxeurIuDXTnLOBmQ6OnK4i+Kk
	 QwmoEs1y4CJ0hzYArjE4EF7r3zskOasHAcqh12O9uaIBAeGoR4gTJA/mbjCBq647QH
	 lajHRYs9YoBQcGeBUuS5FCmc3jNux/FTYZdcErsgLkyIOU0vxMe1k5+lPG5z3hcngB
	 4PTuVE92g4Tdu4N4qbvcETNlbfngQdGmx8AuhahuIzS9BpqVgPWBVdeqeN4epXTfvt
	 Ww03LwVLn77urpcEPcHifbk+MwEKz6GCo6HjfRPlhr4WQyeLsuoLSP5oxtfCt7fthg
	 0ylOPs1752GhA==
Date: Wed, 19 Nov 2025 08:44:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com, 
	sboyd@kernel.org, Frank.Li@nxp.com, hongxing.zhu@nxp.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: imx95: fix hsio_blk_ctl reg map
Message-ID: <20251119-speedy-delectable-hawk-93fade@kuoka>
References: <20251118074055.2523766-1-xu.yang_2@nxp.com>
 <20251118074055.2523766-4-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251118074055.2523766-4-xu.yang_2@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_234408_837359_21006525 
X-CRM114-Status: GOOD (  15.56  )
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

On Tue, Nov 18, 2025 at 03:40:55PM +0800, Xu Yang wrote:
> The HSIO block control register map should be 0x4c010000~0x4c01FFFF.
> Correct the start address and set length to 0x100 for available
> registers.
> 
> Fixes: 3c8d7b5d2bed ("arm64: dts: imx95: add ref clock for pcie nodes")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index 1292677cbe4e..21c9df445be0 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -1774,9 +1774,9 @@ usb3_dwc3: usb@4c100000 {
>  			};
>  		};
>  
> -		hsio_blk_ctl: syscon@4c0100c0 {
> +		hsio_blk_ctl: syscon@4c010000 {
>  			compatible = "nxp,imx95-hsio-blk-ctl", "syscon";
> -			reg = <0x0 0x4c0100c0 0x0 0x1>;
> +			reg = <0x0 0x4c010000 0x0 0x100>;
>  			#clock-cells = <1>;
>  			clocks = <&clk_sys100m>;
>  			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
> @@ -1844,7 +1844,7 @@ pcie0: pcie@4c300000 {
>  				 <&scmi_clk IMX95_CLK_HSIOPLL>,
>  				 <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
>  				 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>,
> -				 <&hsio_blk_ctl 0>;
> +				 <&hsio_blk_ctl IMX95_CLK_HSIOMIX_PCIE_CLK_GATE>;

This is unrelated change, nothing explained in commit msg. Please do not
combine independent changes into one commit. Non-fixes with
fixes either

Best regards,
Krzysztof


