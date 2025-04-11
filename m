Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C1EC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 13:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gboexee6mD0L1jweFt2EEXBwApJzHNO1ztWVUzHiKoM=; b=VZoQO8ILgrMXsEyUkaQdADtJMx
	1ZouiYiFfp4/5oJfdXhhLf7QjdX1pNsOs+LPpQAR7NamwXzK7VW/SOQTG1fwLZvJO9fAX4ZS90K9D
	CZW+n3VREcSD8k5bx2GNgPqZLT+CNKV8eJxpVHIUeqRiox4s7K6Sq0mlnoV2m412Ukq9nQARN75UN
	uqH0InQzvkeF/3D3adRGneLXRWVawDw8Y2txRLS8tF5hNrpABCtto+s/uEMDBMRnKihlqZFJ42oNU
	yU5lpYxl/neY/6AHzimCPTA1Y5+UY95TUghnVwEYxOx6M35r35Yit5zReaRm1h4wBLSFb8I3CRr7a
	onrIQoqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3EfT-0000000DyCN-0imw;
	Fri, 11 Apr 2025 13:43:39 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3EUy-0000000DwOP-3h5D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 13:32:50 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53BDWWYb2086133
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 08:32:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744378352;
	bh=Gboexee6mD0L1jweFt2EEXBwApJzHNO1ztWVUzHiKoM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ubbbPPRoTePNDMPdfLtMBZpmJTGOITP771vSjv2qNk/m54WJmWZEd6mPuKrciEIaC
	 DeNzEG0VetxaLfgDHEtM/94Js/4z87J1JVfg1lt0fE71nLWA6oCsnCd9p+GslJqQHC
	 9uLnFeAhmC/jK+P1OqRzsORAQ94R1tTyhlg3Q4D4=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53BDWW1p021039
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Apr 2025 08:32:32 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 08:32:31 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 08:32:31 -0500
Received: from [10.249.136.157] ([10.249.136.157])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53BDWQDe107922;
	Fri, 11 Apr 2025 08:32:27 -0500
Message-ID: <9d0f7fc5-070d-4475-8569-d3e0e9421313@ti.com>
Date: Fri, 11 Apr 2025 19:02:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] arm64: dts: ti: j721e-sk: Add DT nodes for power
 regulators
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <jai.luthra@linux.dev>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>, <stable@vger.kernel.org>
References: <20250409134128.2098195-1-y-abhilashchandra@ti.com>
 <20250409134128.2098195-2-y-abhilashchandra@ti.com>
Content-Language: en-US
From: "Francis, Neha" <n-francis@ti.com>
In-Reply-To: <20250409134128.2098195-2-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_063249_058446_1295795A 
X-CRM114-Status: GOOD (  14.85  )
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

Hi Abhilash

On 4/9/2025 7:11 PM, Yemike Abhilash Chandra wrote:
> Add device tree nodes for two power regulators on the J721E SK board.
> vsys_5v0: A fixed regulator representing the 5V supply output from the
> LM61460 and vdd_sd_dv: A GPIO-controlled TLV71033 regulator.
> 
> J721E-SK schematics: https://www.ti.com/lit/zip/sprr438
> Fixes: 1bfda92a3a36 ("arm64: dts: ti: Add support for J721E SK")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-j721e-sk.dts | 31 ++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
> index 440ef57be294..4965957e6545 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
> @@ -184,6 +184,17 @@ vsys_3v3: fixedregulator-vsys3v3 {
>  		regulator-boot-on;
>  	};
>  
> +	vsys_5v0: fixedregulator-vsys5v0 {
> +		/* Output of LM61460 */
> +		compatible = "regulator-fixed";
> +		regulator-name = "vsys_5v0";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		vin-supply = <&vusb_main>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
>  	vdd_mmc1: fixedregulator-sd {
>  		compatible = "regulator-fixed";
>  		pinctrl-names = "default";
> @@ -211,6 +222,20 @@ vdd_sd_dv_alt: gpio-regulator-tps659411 {
>  			 <3300000 0x1>;
>  	};
>  
> +	vdd_sd_dv: gpio-regulator-TLV71033 {
> +		compatible = "regulator-gpio";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&vdd_sd_dv_pins_default>;
> +		regulator-name = "tlv71033";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-boot-on;
> +		vin-supply = <&vsys_5v0>;
> +		gpios = <&main_gpio0 118 GPIO_ACTIVE_HIGH>;
> +		states = <1800000 0x0>,
> +			 <3300000 0x1>;
> +	};
> +
>  	transceiver1: can-phy1 {
>  		compatible = "ti,tcan1042";
>  		#phy-cells = <0>;
> @@ -613,6 +638,12 @@ J721E_WKUP_IOPAD(0xd4, PIN_OUTPUT, 7) /* (G26) WKUP_GPIO0_9 */
>  		>;
>  	};
>  
> +	vdd_sd_dv_pins_default: vdd-sd-dv-default-pins {
> +		pinctrl-single,pins = <
> +			J721E_IOPAD(0x1dc, PIN_INPUT, 7) /* (Y1) SPI1_CLK.GPIO0_118 */
> +		>;
> +	};
> +
>  	wkup_uart0_pins_default: wkup-uart0-default-pins {
>  		pinctrl-single,pins = <
>  			J721E_WKUP_IOPAD(0xa0, PIN_INPUT, 0) /* (J29) WKUP_UART0_RXD */

Reviewed-by: Neha Malcom Francis <n-francis@ti.com>

-- 
Thanking You
Neha Malcom Francis


