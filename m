Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64384C3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 08:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QIbwuWHHHeqMRU/dNBr5DksK+qZ8eID81KiYJHT3Y8E=; b=w86psvZZToI3qUB1JyhCEK+7Xm
	3XNXrkwNlK9oQVFBEIkqv64noh0qqJlZ24llIMjvl95P7OxmoaEkJmasp8JeCHsxP8GYIh61refdt
	WTfZ9DNdLbFJ05VsrkYw8UMXlf2MKPmIjpuczW9zawqYrl4cY9zgG5VRFM5EAN2AbO6rzVk/IXLw8
	y+IYTM2VdDW3GyD5FM1JKGn+YX2r4mtyFocGDYGEXpwGSYv0vVEq3Mzzf6D2s8tYFiXH3S9wx/ju9
	y6LvCPkOBsHAF1Z3meVwbHZbYzsKQvD+LNfRXiXIxhK84Nesjm58+8HS1qqDTuRlR3RBpIY2IDtT2
	y0LZH3Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAm1N-00000001Dn5-0skL;
	Fri, 02 May 2025 08:45:25 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAlzR-00000001DaM-12Ka
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 08:43:26 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5428h9Xj3822345
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 03:43:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746175390;
	bh=QIbwuWHHHeqMRU/dNBr5DksK+qZ8eID81KiYJHT3Y8E=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=RjWJ2wWCOn+K4s5nwxatqxd3dIJxYNljO5i+KMwNS2RVVlqNXAJ8pOX0S2ma15qNC
	 VK33T914yJJRBoa5nLQz/I5IJHO16WlWyYYVy/uNWD72q6VYo+aycCOucIGPry2iG3
	 FnnVpc2/UANQOSDb3aZNcAhJa/GsJ8gNiBP24w7M=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5428h9rp059033
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 03:43:09 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 03:43:09 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 03:43:09 -0500
Received: from [172.24.227.193] (devarsh-precision-tower-3620.dhcp.ti.com [172.24.227.193])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5428h4hM108589;
	Fri, 2 May 2025 03:43:05 -0500
Message-ID: <69f6c225-2841-494c-b555-61cbe6b23c02@ti.com>
Date: Fri, 2 May 2025 14:13:04 +0530
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH v1 3/4] arm64: dts: ti: k3-am62x: Add required voltage
 supplies for OV5640
To: Rishikesh Donadkar <r-donadkar@ti.com>, <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <y-abhilashchandra@ti.com>,
        <s-jain1@ti.com>, <jai.luthra@linux.dev>,
        <jai.luthra@ideasonboard.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <imx@lists.linux.dev>
References: <20250429154133.3377962-1-r-donadkar@ti.com>
 <20250429154133.3377962-4-r-donadkar@ti.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20250429154133.3377962-4-r-donadkar@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_014325_382877_35690E7B 
X-CRM114-Status: GOOD (  13.33  )
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
> The device tree overlay for OV5640 requires following voltage
> supplies

As mentioned in ov5640 data-sheet table 8-3 [1]
> 
> AVDD-supply: Analog voltage supply, 2.8 volts
> DOVDD-supply: Digital I/O voltage supply, 1.8 volts
> DVDD-supply: Digital core voltage supply, 1.5 volts
> 

[1]:
Link:
https://cdn.sparkfun.com/datasheets/Sensors/LightImaging/OV5640_datasheet.pdf

> Add them in the overlay.
> 
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>

With above changes,
Reviewed-by: Devarsh Thakkar <devarsht@ti.com>

Regards
Devarsh
> ---
>  .../boot/dts/ti/k3-am62x-sk-csi2-ov5640.dtso  | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-ov5640.dtso b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-ov5640.dtso
> index 7fc7c95f5cd57..fc77fc77fe0b1 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-ov5640.dtso
> +++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-ov5640.dtso
> @@ -15,6 +15,33 @@ clk_ov5640_fixed: ov5640-xclk {
>  		#clock-cells = <0>;
>  		clock-frequency = <12000000>;
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


