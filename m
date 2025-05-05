Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C3BC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 04:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2tG/hP70MpeKfFLue11e+68DdSS5RzRgjC80Ey3Fa/c=; b=fgHJdGuGlU6XM+vlmdAZDHB4c2
	By8362HnX8I+QkgqsyQC0uSkKgSMrIbCCs7ob1v1Mv96OLwHGXc7jktHp24hdGPrwrJjzvvKa0fyj
	9dzw0jNVJqefps3WvPuculzjB1D2jP6cso8XK59aoM1pDyjOxfvRxTwpMSgBWzOJWfvKzC/mGod9N
	tiCKhTo7YEpdW3BaUN7MXkLMPZrlppeRS61uzb7lyjyqye4NeM5ygJ1DKvw+9ZVj2VqgyrdajX0+d
	E0cYR6GBjEMRDgBIPeNNx3ci4L4tP8kYG1def9EO7D9G3yeQY1NbnUUO0tfkM4lsJCu6A+cARzxx7
	VAQ3u4iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBn34-00000006MbS-1856;
	Mon, 05 May 2025 04:03:22 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBn13-00000006MRQ-1uC0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 04:01:19 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 545415Dr123988
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 4 May 2025 23:01:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746417665;
	bh=2tG/hP70MpeKfFLue11e+68DdSS5RzRgjC80Ey3Fa/c=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=jaYlpGPAuOxR8C/9rEOiTi1QbHdb9FJUUFhjMLX8nJbUjh/MSva5WABvqHVTlf5Hf
	 mNRP9A0Rx4GMHFpuO7kIXlLikv20NtMoNIW6hQeyznFSABaGn+UEBm4m0PovrMQMbK
	 YtCc7yaP/d8B9Oiaj7mEcGOXc4EHawb8qX5iQ7UY=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 545415or017932
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 4 May 2025 23:01:05 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 4
 May 2025 23:01:04 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 4 May 2025 23:01:04 -0500
Received: from [10.249.140.90] ([10.249.140.90])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 545410RA127426;
	Sun, 4 May 2025 23:01:01 -0500
Message-ID: <4bddfa36-7cdb-4e74-b356-8ec4d7fb55aa@ti.com>
Date: Mon, 5 May 2025 09:30:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am62-main: Add PRUSS-M node
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hari Nagalla <hnagalla@ti.com>
References: <20250430144343.972234-1-jm@ti.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <20250430144343.972234-1-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_210117_743114_9A569624 
X-CRM114-Status: GOOD (  16.53  )
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

Hi Judith,

On 4/30/2025 8:13 PM, Judith Mendez wrote:
> From: Kishon Vijay Abraham I <kishon@ti.com>
>
> Add the DT node for the PRUSS-M processor subsystem that is present
> on the K3 AM62x SoCs. The K3 AM62x family of SoC has one PRUSS-M
> instance and it has two Programmable Real-Time Units (PRU0 and PRU1).
>
> Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
> [ Judith: Fix pruss_iclk id for pruss_coreclk_mux ]
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
> Changelog:
> - drop internal tags
> - rebase against ti-k3-dts-next
> - fix header


Reviewed-by: Beleswar Padhi <b-padhi@ti.com>

Thanks,
Beleswar

>
> Link to v1:
> https://lore.kernel.org/linux-devicetree/20250108222048.818835-1-jm@ti.com/
> ---
>   arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 90 ++++++++++++++++++++++++
>   1 file changed, 90 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> index 7d355aa73ea2..ee53e663b5bd 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> @@ -1079,6 +1079,96 @@ dphy0: phy@30110000 {
>   		status = "disabled";
>   	};
>   
> +	pruss: pruss@30040000 {
> +		compatible = "ti,am625-pruss";
> +		reg = <0x00 0x30040000 0x00 0x80000>;
> +		power-domains = <&k3_pds 81 TI_SCI_PD_EXCLUSIVE>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0x00 0x30040000 0x80000>;
> +
> +		pruss_mem: memories@0 {
> +			reg = <0x0 0x2000>,
> +			      <0x2000 0x2000>,
> +			      <0x10000 0x10000>;
> +			reg-names = "dram0", "dram1", "shrdram2";
> +		};
> +
> +		pruss_cfg: cfg@26000 {
> +			compatible = "ti,pruss-cfg", "syscon";
> +			reg = <0x26000 0x200>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0x0 0x26000 0x2000>;
> +
> +			clocks {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				pruss_coreclk_mux: coreclk-mux@3c {
> +					reg = <0x3c>;
> +					#clock-cells = <0>;
> +					clocks = <&k3_clks 81 0>,  /* pruss_core_clk */
> +						 <&k3_clks 81 14>; /* pruss_iclk */
> +					assigned-clocks = <&pruss_coreclk_mux>;
> +					assigned-clock-parents = <&k3_clks 81 14>;
> +				};
> +
> +				pruss_iepclk_mux: iepclk-mux@30 {
> +					reg = <0x30>;
> +					#clock-cells = <0>;
> +					clocks = <&k3_clks 81 3>,	/* pruss_iep_clk */
> +						 <&pruss_coreclk_mux>;	/* pruss_coreclk_mux */
> +					assigned-clocks = <&pruss_iepclk_mux>;
> +					assigned-clock-parents = <&pruss_coreclk_mux>;
> +				};
> +			};
> +		};
> +
> +		pruss_intc: interrupt-controller@20000 {
> +			compatible = "ti,pruss-intc";
> +			reg = <0x20000 0x2000>;
> +			interrupt-controller;
> +			#interrupt-cells = <3>;
> +			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "host_intr0", "host_intr1",
> +					  "host_intr2", "host_intr3",
> +					  "host_intr4", "host_intr5",
> +					  "host_intr6", "host_intr7";
> +		};
> +
> +		pru0: pru@34000 {
> +			compatible = "ti,am625-pru";
> +			reg = <0x34000 0x3000>,
> +			      <0x22000 0x100>,
> +			      <0x22400 0x100>;
> +			reg-names = "iram", "control", "debug";
> +			firmware-name = "am62x-pru0-fw";
> +			interrupt-parent = <&pruss_intc>;
> +			interrupts = <16 2 2>;
> +			interrupt-names = "vring";
> +		};
> +
> +		pru1: pru@38000 {
> +			compatible = "ti,am625-pru";
> +			reg = <0x38000 0x3000>,
> +			      <0x24000 0x100>,
> +			      <0x24400 0x100>;
> +			reg-names = "iram", "control", "debug";
> +			firmware-name = "am62x-pru1-fw";
> +			interrupt-parent = <&pruss_intc>;
> +			interrupts = <18 3 3>;
> +			interrupt-names = "vring";
> +		};
> +	};
> +
>   	gpmc0: memory-controller@3b000000 {
>   		compatible = "ti,am64-gpmc";
>   		power-domains = <&k3_pds 80 TI_SCI_PD_EXCLUSIVE>;

