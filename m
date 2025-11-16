Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC7BCD4F3E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 12:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kNW9yPvfa/OhtLEXuIIfofqtoj6rCxgnTJJKlGU6kjg=; b=vZZ3HS7JfWcsLEbu/za6/i75hy
	gzdmqbBq9uTAdUr6Gu6xavjRVKyXz1G4HDMPQShGjWSOhyq5dgsq64xPYycSQ493wUq+pwyzZYW3w
	mUzwfWVYV37iKRmQfEAYhRdtlJfyfYqCyOeMFCY/MlkCipnG0OIUSVcKGK9WI3f/AFm3WUbUDGyQm
	jrYtT9Gv9WmAxd+QAsCVUQPEOgQnSN4AFG+3zKp71nUtMlK7oXTBdZfd85O0tobY/JnrkHF0Y8q/Y
	OjN8Ij/1D5M9XlNJyNUZBmg7XeOHi71rhJwdNlGCh70wS4NVwtqWu5J9dTc88H9GifLTMmxid66M3
	wyMV0c3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKblQ-0000000EcWR-2fJJ;
	Sun, 16 Nov 2025 12:21:52 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKblN-0000000EcW4-2eLU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 12:21:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=kNW9yPvfa/OhtLEXuIIfofqtoj6rCxgnTJJKlGU6kjg=;
	b=R5MLfLFNkagzbrOgQ/NYPkwh/zPPi+ubMxzJRVvX1yodJ1sL4JADl7W+HZ0GLJ
	TEOFiOBFgSX/FsUiIrUGTd6BZZfK6c1BZU67zka7J3TcoeMBtNQFVEO9/z3RPJUt
	qp92xrqBT0erQuFQn6s5qd5RkZYGSBKYu4nF9f5cT6y2A=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAXXyeqwRlpCI87AQ--.8095S3;
	Sun, 16 Nov 2025 20:21:01 +0800 (CST)
Date: Sun, 16 Nov 2025 20:20:58 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	"Jiyu Yang (OSS)" <jiyu.yang@oss.nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Reichel <sre@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Steven Price <steven.price@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Xianzhong Li <xianzhong.li@nxp.com>, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev
Subject: Re: [PATCH v4 2/2] arm64: dts: imx95: Describe Mali G310 GPU
Message-ID: <aRnBqgzeotfrdNmy@dragon>
References: <20251102160927.45157-1-marek.vasut@mailbox.org>
 <20251102160927.45157-2-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251102160927.45157-2-marek.vasut@mailbox.org>
X-CM-TRANSID: Mc8vCgAXXyeqwRlpCI87AQ--.8095S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxZr1UGFW8KF43Ww1xZF1rCrg_yoWrJryDpr
	WDCw45Cr4kXr1Ik3WagFW0ka4fuw4kCFyUur1DG3yjyry2qryIqFnIkrnaga4UXF1UGa1U
	trnFqryI9wnxu3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U9iSdUUUUU=
X-Originating-IP: [117.82.150.42]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNw48oWkZwa5RngAA30
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_042150_066391_2D192095 
X-CRM114-Status: GOOD (  18.59  )
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

On Sun, Nov 02, 2025 at 05:09:07PM +0100, Marek Vasut wrote:
> The instance of the GPU populated in i.MX95 is the G310, describe this
> GPU in the DT. Include dummy GPU voltage regulator and OPP tables.

The commit log seems need an update for the regulator part?

Shawn

> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jiyu Yang (OSS) <jiyu.yang@oss.nxp.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Xianzhong Li <xianzhong.li@nxp.com>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
> V2: - Drop regulator-{always,boot}-on from fixed-gpu-reg regulator
>     - Keep the GPU and GPUMIX always enabled
>     - Switch from fsl, to nxp, vendor prefix
>     - Fix opp_table to opp-table
>     - Describe IMX95_CLK_GPUAPB as coregroup clock
>     - Sort interrupts by their names to match bindings
> V3: - Drop perf power domain
>     - Drop reset block controller
> V4: - Add RB from Frank
>     - Drop the now optional GPU regulator
> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 37 ++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index a91e1724ab1a4..e45014d50abef 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -250,6 +250,28 @@ dummy: clock-dummy {
>  		clock-output-names = "dummy";
>  	};
>  
> +	gpu_opp_table: opp-table {
> +		compatible = "operating-points-v2";
> +
> +		opp-500000000 {
> +			opp-hz = /bits/ 64 <500000000>;
> +			opp-hz-real = /bits/ 64 <500000000>;
> +			opp-microvolt = <920000>;
> +		};
> +
> +		opp-800000000 {
> +			opp-hz = /bits/ 64 <800000000>;
> +			opp-hz-real = /bits/ 64 <800000000>;
> +			opp-microvolt = <920000>;
> +		};
> +
> +		opp-1000000000 {
> +			opp-hz = /bits/ 64 <1000000000>;
> +			opp-hz-real = /bits/ 64 <1000000000>;
> +			opp-microvolt = <920000>;
> +		};
> +	};
> +
>  	clk_ext1: clock-ext1 {
>  		compatible = "fixed-clock";
>  		#clock-cells = <0>;
> @@ -2139,6 +2161,21 @@ netc_emdio: mdio@0,0 {
>  			};
>  		};
>  
> +		gpu: gpu@4d900000 {
> +			compatible = "nxp,imx95-mali", "arm,mali-valhall-csf";
> +			reg = <0 0x4d900000 0 0x480000>;
> +			clocks = <&scmi_clk IMX95_CLK_GPU>, <&scmi_clk IMX95_CLK_GPUAPB>;
> +			clock-names = "core", "coregroup";
> +			interrupts = <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "job", "mmu", "gpu";
> +			operating-points-v2 = <&gpu_opp_table>;
> +			power-domains = <&scmi_devpd IMX95_PD_GPU>;
> +			#cooling-cells = <2>;
> +			dynamic-power-coefficient = <1013>;
> +		};
> +
>  		ddr-pmu@4e090dc0 {
>  			compatible = "fsl,imx95-ddr-pmu", "fsl,imx93-ddr-pmu";
>  			reg = <0x0 0x4e090dc0 0x0 0x200>;
> -- 
> 2.51.0
> 


