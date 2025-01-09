Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0CCE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 15:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=siW7vfCoksPXHtZa/15GuRuHr9BAfX44jN6/44ucx+4=; b=x6dLiM41PntE+ifj8MggjED25J
	S2yZavUWw2EyFAgfPRp/gprTjplUS8IY/vYHWvnLPGj5jGODTND/DnS83DK2mHaU4ypmCS2g2LYTV
	wjrIdHghjIjY79xg+s/9sXeXc6Tuu3rvYD8ww80YFTMjyjSWxWbLh0/H4YX6TPEwmJV8VVEk/MVim
	9UWyAIU/vAyq2zy2k53G2Ezc01YssGzcekz7F/mEnlK4FqylLKIcuBxFYM1/duVdX/eNtsjGyHcWn
	ocupOkfRY6EhlE/flRK2Z/jvrDEk2Q7dAR7ehJGww2T+jyIsmWBlBfgl6qLDL5QBCeerw0TacRta5
	CwRyz4rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuwU-0000000CZcF-1Ji7;
	Thu, 09 Jan 2025 15:59:30 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuvG-0000000CZV6-35mF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 15:58:16 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 509Fw31P2983124
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Jan 2025 09:58:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736438283;
	bh=siW7vfCoksPXHtZa/15GuRuHr9BAfX44jN6/44ucx+4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=CwuvB0MWu+dRhb5JRiybB5efrVRPM5uAYynmW5DtCp/TpFIrgFOHkWKnBoPsEBvMr
	 HNAV1IV2nyT5qCV0fzPMEU9dNvhJh0mYowpk589BW1mm0/IVWlzxhw8tfA5cjP9//y
	 6UPZYjNJtNikpO7jQHz0GGxm4IBXgxvVSGAhceEs=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 509Fw3qf053208
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Jan 2025 09:58:03 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 9
 Jan 2025 09:58:02 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 9 Jan 2025 09:58:02 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 509Fw2Pi128225;
	Thu, 9 Jan 2025 09:58:02 -0600
Message-ID: <90f47fae-a493-471d-8fe6-e7df741161be@ti.com>
Date: Thu, 9 Jan 2025 09:58:02 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: ti: k3-j721e-beagleboneai64: Enable
 ACSPCIE output for PCIe1
To: Romain Naour <romain.naour@smile.fr>, <devicetree@vger.kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>,
        <conor+dt@kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>,
        <kristo@kernel.org>, <vigneshr@ti.com>, <nm@ti.com>,
        Romain Naour
	<romain.naour@skf.com>,
        Siddharth Vadapalli <s-vadapalli@ti.com>
References: <20250109102627.1366753-1-romain.naour@smile.fr>
 <20250109102627.1366753-2-romain.naour@smile.fr>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250109102627.1366753-2-romain.naour@smile.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_075814_958999_62454AD4 
X-CRM114-Status: GOOD (  23.79  )
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

On 1/9/25 4:26 AM, Romain Naour wrote:
> From: Romain Naour <romain.naour@skf.com>
> 
> Unlike the SK-TDA4VM (k3-j721e-sk) board, there is no clock generator
> (CDCI6214RGET) on the BeagleBone AI-64 (k3-j721e-beagleboneai64) to
> provide PCIe refclk signal to PCIe Endponts. So the ACSPCIE module must
> provide refclk through PCIe_REFCLK pins.
> 
> Use the new "ti,syscon-acspcie-proxy-ctrl" property to enable ACSPCIE
> module's PAD IO Buffers.
> 
> Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
> Signed-off-by: Romain Naour <romain.naour@skf.com>
> ---
> With this patch, we can remove "HACK: Sierra: Drive clock out" patch
> applied on vendor kernel for BeagleBone AI-64:
> https://openbeagle.org/beagleboard/linux/-/commit/ad65d7ef675966cdbc5d75f2bd545fad1914ba9b
> 
> v4: no change
> 
> v3:
>   - update "acspcie0_proxy_ctrl" compatible to "ti,j721e-acspcie-proxy-ctrl"
>     since this property is specific to j721e variant.
> 
> v2:
>   - use generic style comments
>   - use "syscon" as generic node name for "acspcie0_proxy_ctrl" node
>   - Keep the compatible "ti,j784s4-acspcie-proxy-ctrl" since the
>     ACSPCIE buffer and its functionality is the same across all K3 SoCs.
>     (Siddharth Vadapalli)
> 
>     "The compatible "ti,j784s4-acspcie-pcie-ctrl" should be reused for
>     J721E and all other K3 SoCs.
>     For example, see:
>     https://lore.kernel.org/r/20240402105708.4114146-1-s-vadapalli@ti.com/
>     which introduced "ti,am62p-cpsw-mac-efuse" compatible.
> 
>     The same compatible is reused across all K3 SoCs:
>     https://lore.kernel.org/r/20240628151518.40100-1-afd@ti.com/ "
> ---
>   arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts |  5 +++++
>   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi          | 10 ++++++++--
>   2 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
> index fb899c99753e..741ad2ba6fdb 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
> @@ -859,6 +859,11 @@ &pcie1_rc {
>   	num-lanes = <2>;
>   	max-link-speed = <3>;
>   	reset-gpios = <&main_gpio0 22 GPIO_ACTIVE_HIGH>;
> +	/*
> +	 * There is no on-board or external reference clock generators,
> +	 * use refclk from the ACSPCIE module's PAD IO Buffers.
> +	 */
> +	ti,syscon-acspcie-proxy-ctrl = <&acspcie0_proxy_ctrl 0x3>;
>   };
>   
>   &ufs_wrapper {
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> index af3d730154ac..32a232a90100 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> @@ -5,6 +5,7 @@
>    * Copyright (C) 2016-2024 Texas Instruments Incorporated - https://www.ti.com/
>    */
>   #include <dt-bindings/phy/phy.h>
> +#include <dt-bindings/phy/phy-cadence.h>
>   #include <dt-bindings/phy/phy-ti.h>
>   #include <dt-bindings/mux/mux.h>
>   
> @@ -82,6 +83,11 @@ ehrpwm_tbclk: clock-controller@4140 {
>   			reg = <0x4140 0x18>;
>   			#clock-cells = <1>;
>   		};
> +
> +		acspcie0_proxy_ctrl: syscon@18090 {
> +			compatible = "ti,j721e-acspcie-proxy-ctrl", "syscon";
> +			reg = <0x18090 0x4>;
> +		};

You'll still need to add to the J721e system controller binding or this
will throw a DT check warning, something like this:

diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
index 378e9cc5fac2a..3323f3bc976e0 100644
--- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
+++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
@@ -68,6 +68,12 @@ patternProperties:
      description:
        The node corresponding to SoC chip identification.
  
+  "^acspcie-ctrl@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/mfd/syscon.yaml#
+    description:
+      This is the ASPCIe control region.
+
  required:
    - compatible
    - reg

>   	};
>   
>   	main_ehrpwm0: pwm@3000000 {
> @@ -979,8 +985,8 @@ pcie1_rc: pcie@2910000 {
>   		max-link-speed = <3>;
>   		num-lanes = <2>;
>   		power-domains = <&k3_pds 240 TI_SCI_PD_EXCLUSIVE>;
> -		clocks = <&k3_clks 240 1>;
> -		clock-names = "fck";
> +		clocks = <&k3_clks 240 1>, <&serdes1 CDNS_SIERRA_DERIVED_REFCLK>;
> +		clock-names = "fck", "pcie_refclk";
>   		#address-cells = <3>;
>   		#size-cells = <2>;
>   		bus-range = <0x0 0xff>;

