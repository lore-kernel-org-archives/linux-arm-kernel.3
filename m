Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1032CFA454
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 16:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cxfnVxjxs+e2TMfqcU/zti9/A8hiBCMmmh5nnYqaFHY=; b=QAlvpMEkEMrq62WAESU4cBWh70
	KqoUpYTp/nrpkCtMsH+3WutEL9KorqZ3aJSPdA81b8OiInQujKFEj7jFDfJyjj3qnDSi8oryOJshE
	tvViHVTK1taz4wXuP8hxKPswxzJ4kd05cLXiF+q80pXRSF+1XLLdP7LfcMpj6VrRZNDFDcXYOZaQV
	4Xs88vdR86p7NXpnaV/jeefQfU7yWoY1hdRxcnSpXW0q66YvTM2oH8vqatvx6rufm0IlFWInsoxqR
	AWKy/ovoA1l3BiXEAKoxAk6d2d30BnFyvN2pvyaVHdgiqLy1dwQkM101Lh8Otr/smdp32iuxabQFb
	cEPXAXaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3egX-0000000FFPg-0RYo;
	Wed, 23 Oct 2024 16:58:13 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3cvP-0000000EsYy-1BUf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 15:05:28 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49NF5LMN071286;
	Wed, 23 Oct 2024 10:05:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729695921;
	bh=cxfnVxjxs+e2TMfqcU/zti9/A8hiBCMmmh5nnYqaFHY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=jvyLBVS8exSaB5VCINBrlNUsLaKuPIwkeN/K9p4A9hFhKP2n5Xxz5bwp5Oo9/N2mw
	 pLZ5m6vyBWr0A9Iusqv6QadYEvWvVrqVFlvYclX/tj9zFO8Os95DfkK70x/B7i9OMU
	 JmcvsqQWNBcQPmt6pHNrrqyuKWoF/aMXhUy396oI=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49NF5LJS006302
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Oct 2024 10:05:21 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 23
 Oct 2024 10:05:20 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 23 Oct 2024 10:05:21 -0500
Received: from [172.24.227.91] (psdkl-workstation0.dhcp.ti.com [172.24.227.91])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49NF5GnA065172;
	Wed, 23 Oct 2024 10:05:17 -0500
Message-ID: <942f988f-8228-43e0-9b29-41fccddcaaf1@ti.com>
Date: Wed, 23 Oct 2024 20:35:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/12] arm64: dts: ti: k3-j7200: Add bootph-*
 properties
To: Manorit Chawdhry <m-chawdhry@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Neha Malcom Francis <n-francis@ti.com>,
        Udit
 Kumar <u-kumar1@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
        Siddharth Vadapalli
	<s-vadapalli@ti.com>, Andrew Davis <afd@ti.com>
References: <20241023-b4-upstream-bootph-all-v5-0-a974d06370ab@ti.com>
 <20241023-b4-upstream-bootph-all-v5-6-a974d06370ab@ti.com>
Content-Language: en-US
From: Aniket Limaye <a-limaye@ti.com>
In-Reply-To: <20241023-b4-upstream-bootph-all-v5-6-a974d06370ab@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_080527_547408_CEF88EA5 
X-CRM114-Status: GOOD (  14.53  )
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



On 23/10/24 12:27, Manorit Chawdhry wrote:
> Adds bootph-* properties to the leaf nodes to enable bootloaders to
> utilise them.
> 
> Following adds bootph-* to
> - System controller nodes that allow controlling power domain, clocks, etc.
> - secure_proxy_sa3/secure_proxy_main mboxes for communication with
>    System Controller
> - mcu_ringacc/mcu_udmap for DMA to SMS
> - chipid for detection soc information.
> - mcu_timer0 for bootloader tick-timer.
> - hbmc_mux for enabling Hyperflash support
> - ESM nodes for enabling ESM support.
> - wkup_vtm for enabling Adaptive voltage scaling(AVS) support
> 
> Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>

Thanks for the patch!

Reviewed-by: Aniket Limaye <a-limaye@ti.com>

> ---
>   arch/arm64/boot/dts/ti/k3-j7200-main.dtsi       |  2 ++
>   arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi | 11 +++++++++++
>   2 files changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
> index 9386bf3ef9f6..ac9c0a939461 100644
> --- a/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
> @@ -136,6 +136,7 @@ secure_proxy_main: mailbox@32c00000 {
>   			      <0x00 0x32800000 0x00 0x100000>;
>   			interrupt-names = "rx_011";
>   			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
> +			bootph-all;
>   		};
>   
>   		hwspinlock: spinlock@30e00000 {
> @@ -1527,6 +1528,7 @@ main_r5fss0_core1: r5f@5d00000 {
>   	main_esm: esm@700000 {
>   		compatible = "ti,j721e-esm";
>   		reg = <0x0 0x700000 0x0 0x1000>;
> +		bootph-pre-ram;
>   		ti,esm-pins = <656>, <657>;
>   	};
>   };
> diff --git a/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi
> index 5097d192c2b2..7e9ad2301937 100644
> --- a/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi
> @@ -21,16 +21,19 @@ dmsc: system-controller@44083000 {
>   		k3_pds: power-controller {
>   			compatible = "ti,sci-pm-domain";
>   			#power-domain-cells = <2>;
> +			bootph-all;
>   		};
>   
>   		k3_clks: clock-controller {
>   			compatible = "ti,k2g-sci-clk";
>   			#clock-cells = <2>;
> +			bootph-all;
>   		};
>   
>   		k3_reset: reset-controller {
>   			compatible = "ti,sci-reset";
>   			#reset-cells = <2>;
> +			bootph-all;
>   		};
>   	};
>   
> @@ -44,6 +47,7 @@ mcu_timer0: timer@40400000 {
>   		assigned-clocks = <&k3_clks 35 1>;
>   		assigned-clock-parents = <&k3_clks 35 2>;
>   		power-domains = <&k3_pds 35 TI_SCI_PD_EXCLUSIVE>;
> +		bootph-pre-ram;
>   		ti,timer-pwm;
>   	};
>   
> @@ -191,6 +195,7 @@ wkup_conf: bus@43000000 {
>   		chipid: chipid@14 {
>   			compatible = "ti,am654-chipid";
>   			reg = <0x14 0x4>;
> +			bootph-all;
>   		};
>   	};
>   
> @@ -344,6 +349,7 @@ mcu_ringacc: ringacc@2b800000 {
>   			      <0x00 0x28440000 0x00 0x40000>;
>   			reg-names = "rt", "fifos", "proxy_gcfg",
>   				    "proxy_target", "cfg";
> +			bootph-all;
>   			ti,num-rings = <286>;
>   			ti,sci-rm-range-gp-rings = <0x1>; /* GP ring range */
>   			ti,sci = <&dmsc>;
> @@ -363,6 +369,7 @@ mcu_udmap: dma-controller@285c0000 {
>   				    "tchan", "rchan", "rflow";
>   			msi-parent = <&main_udmass_inta>;
>   			#dma-cells = <1>;
> +			bootph-all;
>   
>   			ti,sci = <&dmsc>;
>   			ti,sci-dev-id = <236>;
> @@ -383,6 +390,8 @@ secure_proxy_mcu: mailbox@2a480000 {
>   		reg = <0x0 0x2a480000 0x0 0x80000>,
>   		      <0x0 0x2a380000 0x0 0x80000>,
>   		      <0x0 0x2a400000 0x0 0x80000>;
> +		bootph-pre-ram;
> +
>   		/*
>   		 * Marked Disabled:
>   		 * Node is incomplete as it is meant for bootloaders and
> @@ -534,6 +543,7 @@ hbmc_mux: mux-controller@47000004 {
>   			reg = <0x00 0x47000004 0x00 0x4>;
>   			#mux-control-cells = <1>;
>   			mux-reg-masks = <0x0 0x2>; /* HBMC select */
> +			bootph-all;
>   		};
>   
>   		hbmc: hyperbus@47034000 {
> @@ -652,6 +662,7 @@ wkup_vtm0: temperature-sensor@42040000 {
>   		      <0x00 0x42050000 0x00 0x350>;
>   		power-domains = <&k3_pds 154 TI_SCI_PD_EXCLUSIVE>;
>   		#thermal-sensor-cells = <1>;
> +		bootph-pre-ram;
>   	};
>   
>   	mcu_esm: esm@40800000 {
> 

