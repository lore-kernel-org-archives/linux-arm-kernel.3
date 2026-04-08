Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F8F1073CBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 13:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dUTQ7ghapDdlGeDg2pF8cHjtQXnGgKocViwEoS9GNLQ=; b=oPl54cNrK25p4yxbZY+i4r+aOB
	uG8MD0NSF4NmpX9l17oi9NR13ZOz6iwyUXyGtlAMQkrk+0pPh14PAqWQ44EkZYqXuKQ/SiE1ndDAU
	0AQBTWCJWiNgtWkcNFGpSvQSZL08/yHQmN3LdmqLhDOVo93i+LtLUqwbtV2Eez4hPU4xecxcFgr39
	gZNaC7ZWnLw35HTJjqprr3omjH+A00+CfsmIYlDJxbBg9wlihOuyKAi6vSyzO5lOxHZoVAfIZx0Ii
	z3BHEo54pNYV3Er5+XblInFhgN4wA6PIbBtorr8fa2WAuTj7+mNi90qTUItprRvdl4xaK82ayLkWL
	/norQe/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wATPA-00000008xBS-2Uh5;
	Wed, 08 Apr 2026 13:57:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wATP8-00000008xAr-1EjD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 13:57:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 916FC267F
	for <linux-arm-kernel@lists.infradead.org>; Wed,  8 Apr 2026 06:57:05 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 22F963F641
	for <linux-arm-kernel@lists.infradead.org>; Wed,  8 Apr 2026 06:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775656631; bh=DtgfAHIcG2yL3Uyz3ksmN6rTp9I1YSd/gQUgwKu2M3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KVtZ2ZKVLfEwtplmFRaUyTKJsIl3KOAWBAOPAaiSIl5DRddLg3KKKwxOKDdUwVfz6
	 EcwLJMd3llsZoh+R6X/F4EXLcAO/rCqRY2/IgQJcjv7ABg/v5cxZqsZgBWbb314+BE
	 LaqafAZomIoH7utTqtUXYPHQagIUGj8O1nZW8QDg=
Date: Wed, 8 Apr 2026 14:56:47 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Guangliu Ding <guangliu.ding@nxp.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] arm64: dts: imx952: Describe Mali G310 GPU
Message-ID: <adZeny_sRg7t_A3j@e142607>
References: <20260407-master-v3-1-5a05cea0c521@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260407-master-v3-1-5a05cea0c521@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_065714_463259_9B950117 
X-CRM114-Status: GOOD (  20.43  )
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

On Tue, Apr 07, 2026 at 11:15:03AM +0800, Guangliu Ding wrote:
> Support Mali G310 GPU on i.MX952 board. Describe this GPU in the DT.
> Include dummy GPU voltage regulator and OPP tables.
> 
> A hardware GPU auto clock‑gating mechanism has been introduced,
> enabling GPUMIX to automatically manage the GPU clock. This improves
> overall response time.
> 
> Signed-off-by: Guangliu Ding <guangliu.ding@nxp.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
> This series enable Mali G310 GPU support on i.MX952 boards, the same GPU
> IP as the instance on i.MX95 boards.
> ---
> Changes in v3:
> - Follow the order of interrupts/interrupt-names in arm,mali-valhall-csf.yaml.
> - Drop dt-bindings change in arm,mali-valhall-csf.yaml.
> - Replace "nxp,imx952-mali" with "nxp,imx95-mali" in compatible.
> - Link to v2: https://patch.msgid.link/20260401-master-v2-0-20d3fbcd19d6@nxp.com
> 
> Changes in v2:
> - Improve patch description, adding more GPU information.
> - Remove Reviewed-by tag.
> - Link to v1: https://patch.msgid.link/20260331-master-v1-0-65c8e318d462@nxp.com
> ---
>  arch/arm64/boot/dts/freescale/imx952.dtsi | 36 +++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx952.dtsi b/arch/arm64/boot/dts/freescale/imx952.dtsi
> index 91fe4916ac04..ced09e7a1dc5 100644
> --- a/arch/arm64/boot/dts/freescale/imx952.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx952.dtsi
> @@ -318,6 +318,28 @@ usbphynop2: usbphynop2 {
>  		clock-names = "main_clk";
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
>  	soc {
>  		compatible = "simple-bus";
>  		#address-cells = <2>;
> @@ -1262,5 +1284,19 @@ usbmisc2: usbmisc@4c200200 {
>  			reg = <0x0 0x4c200200 0x0 0x200>,
>  			      <0x0 0x4c010014 0x0 0x4>;
>  		};
> +
> +		gpu: gpu@4d900000 {
> +			compatible = "nxp,imx95-mali", "arm,mali-valhall-csf";
> +			reg = <0 0x4d900000 0 0x480000>;
> +			interrupts = <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "job", "mmu", "gpu";
> +			clocks = <&scmi_clk IMX952_CLK_GPU>;
> +			clock-names = "core";
> +			power-domains = <&scmi_devpd IMX952_PD_GPU>;
> +			operating-points-v2 = <&gpu_opp_table>;
> +			dynamic-power-coefficient = <1013>;
> +		};
>  	};
>  };
> 
> ---
> base-commit: 0138af2472dfdef0d56fc4697416eaa0ff2589bd
> change-id: 20260331-master-7ec7ff0fe1b2
> 
> Best regards,
> --  
> Guangliu Ding <guangliu.ding@nxp.com>
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯

