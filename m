Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 244BDC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 09:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XhYCISopNOwB8EooELWfSyKr1OQU1R0XEY/I8CEqY70=; b=aBukwjkXWXl1YIXaizSsw3C2ku
	vZ1N1E70bw29IRH3R23gkgi2Lue0TMNs2LuD1J7Wne4I5q4+BEkdmJfVEcyyUBGV41efPVmQDuobd
	dkcZ/vzBcMGfUtMgG3e4SlYZcFGE+sgR6kpeNPbSSaq+AZSWnMuIskEstsXjPhJp6aNdS0ZP0ANs7
	Vtih7AxGYzyrpggDzaizRZTe3+aV1enBKA5Ght+Jvyel6g0gbPAUvAfR/H7wK83HGPvazq5dP3LAc
	1qI9amYAdly+XxA3jLqf5S1QojiMU+Mk4zbJRSHdLDt/fTAGgNp0YdVwjDyBC4TnVmSX1H+W0k7pD
	iJ7zioDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAmYb-00000001KFn-2JBm;
	Fri, 02 May 2025 09:19:45 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAmMl-00000001IKk-0TiG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 09:07:32 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54297Mj03827006
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 04:07:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746176842;
	bh=XhYCISopNOwB8EooELWfSyKr1OQU1R0XEY/I8CEqY70=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Wk53frdpOGsul8Uxo1G8WZU1GdwCGTzubUEXLuYheUl5zIY78E3f65U0LakQRXi3C
	 szGTLwv/K8vUMxYH9Bn8Ii1TbrqBGBdb73w+5OxGyW6qnXkW6xuNzEsmmz14JbZTuC
	 ZNSQNkZfAW9l5NjU/pNFUYmmb/phVCGDp0OtGTvY=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54297Mwm129971
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 04:07:22 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 04:07:22 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 04:07:22 -0500
Received: from [172.24.227.193] (devarsh-precision-tower-3620.dhcp.ti.com [172.24.227.193])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54297HF2052163;
	Fri, 2 May 2025 04:07:18 -0500
Message-ID: <f73d24a6-7da6-4bcc-95ba-9d84b865a7a7@ti.com>
Date: Fri, 2 May 2025 14:37:16 +0530
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH v1 4/4] arm64: dts: ti: k3-am62x: Add required voltage
 supplies for TEVI-OV5640
To: Rishikesh Donadkar <r-donadkar@ti.com>, <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <y-abhilashchandra@ti.com>,
        <s-jain1@ti.com>, <jai.luthra@linux.dev>,
        <jai.luthra@ideasonboard.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <imx@lists.linux.dev>
References: <20250429154133.3377962-1-r-donadkar@ti.com>
 <20250429154133.3377962-5-r-donadkar@ti.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20250429154133.3377962-5-r-donadkar@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_020731_323635_D252DFA3 
X-CRM114-Status: GOOD (  13.71  )
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



On 29/04/25 21:11, Rishikesh Donadkar wrote:
> The device tree overlay for TEVI-OV5640 requires following voltage
> supplies:
> 
> AVDD-supply: Analog voltage supply, 2.8 volts
> DOVDD-supply: Digital I/O voltage supply, 1.8 volts
> DVDD-supply: Digital core voltage supply, 1.5 volts
> 

I think this contradicts the voltage mentioned in TEVI-OV56540 doc [1]
which mention digital voltage as 3.3 volts ?

> Add them in the DT overlay.
> 

[1]:
https://www.technexion.com/wp-content/uploads/2023/09/product-brief_tevi-ov5640.pdf

Regards
Devarsh
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  .../dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso  | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso
> index b6bfdfbbdd984..123ab0e5e8dfa 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso
> +++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso
> @@ -15,6 +15,33 @@ clk_ov5640_fixed: ov5640-xclk {
>  		#clock-cells = <0>;
>  		clock-frequency = <24000000>;
>  	};
> +
> +	reg_2p8v: regulator-2p8v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "2P8V";
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +		vin-supply = <&vcc_3v3_sys>;
> +		regulator-always-on;
> +	};
> +
> +	reg_1p8v: regulator-1p8v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "1P8V";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&vcc_3v3_sys>;
> +		regulator-always-on;
> +	};
> +
> +	reg_1p5v: regulator-1p5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "1P5V";
> +		regulator-min-microvolt = <1500000>;
> +		regulator-max-microvolt = <1500000>;
> +		vin-supply = <&vcc_3v3_sys>;
> +		regulator-always-on;
> +	};
>  };
>  
>  &main_i2c2 {
> @@ -40,6 +67,11 @@ ov5640: camera@3c {
>  
>  				clocks = <&clk_ov5640_fixed>;
>  				clock-names = "xclk";
> +
> +				AVDD-supply = <&reg_2p8v>;
> +				DOVDD-supply = <&reg_1p8v>;
> +				DVDD-supply = <&reg_1p5v>;
> +
>  				powerdown-gpios = <&exp1 13 GPIO_ACTIVE_LOW>;
>  
>  				port {


