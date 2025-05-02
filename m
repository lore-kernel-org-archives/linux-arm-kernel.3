Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D67C3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 08:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=byzia56fERYQkK0LYd0FkTzh/NXmDn2U2tbEdsvg97A=; b=L2t/F/qh995a+yOoFgyQ100s9U
	zA+oJfvVfd0EUhuUP+FBP/JhTr97LDsANS5MyQEKrgnhzyCNkFk094f+AaqWryKDKaShKEqkjZN6C
	j4zOO/ebzyIAfDUUoRQE8dKoQXy8rksY8mb00utjHYGioGtf9maN3M11ixBv5KDOv5IXI/I+X334M
	sckZCuulmqQETirpqiITkLtdlr/KVsE2l/lBWPJgQ6TG2YyYBPwiDVsM6t00ImdgmQMX/HQ3LAK+o
	QBR74tRFkxur6+CkuzoMbxnM31v+95PCSmp2yJdwQfio/R9FaZhFZmFm2cZd7b0wrKGKsahRmhlX9
	stlUeJdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAlbH-00000001Bfa-1nU0;
	Fri, 02 May 2025 08:18:27 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAlZL-00000001BYM-03Jf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 08:16:28 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5428Frxg196471
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 03:15:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746173753;
	bh=byzia56fERYQkK0LYd0FkTzh/NXmDn2U2tbEdsvg97A=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=g4hn8mdPZWg14BlNDN48oJAVTlb/PdlH5jzwTq4uJni7UWSNS7vFYudQIHPV16Pdg
	 b+M6iWMEXTbB7oqydodsbXNOMNk4/gfhNfliyi2G62t4hNEXf8mMFV5ekyQS/pug/J
	 xjbGjLSLVMLiSpxWynYj6E8bTGNqVJLH/GNIOU00=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5428Fr6V063765
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 03:15:53 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 03:15:52 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 03:15:52 -0500
Received: from [172.24.227.193] (devarsh-precision-tower-3620.dhcp.ti.com [172.24.227.193])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5428FlR2117383;
	Fri, 2 May 2025 03:15:48 -0500
Message-ID: <f223d5ec-5549-414a-842d-b9aeb80915e5@ti.com>
Date: Fri, 2 May 2025 13:45:47 +0530
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH v1 2/4] arm64: dts: ti: k3-am62x: Add required voltage
 supplies for IMX219
To: Rishikesh Donadkar <r-donadkar@ti.com>, <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <y-abhilashchandra@ti.com>,
        <s-jain1@ti.com>, <jai.luthra@linux.dev>,
        <jai.luthra@ideasonboard.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <imx@lists.linux.dev>
References: <20250429154133.3377962-1-r-donadkar@ti.com>
 <20250429154133.3377962-3-r-donadkar@ti.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20250429154133.3377962-3-r-donadkar@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_011627_150278_F1581EAA 
X-CRM114-Status: GOOD (  15.39  )
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
> The device tree overlay for the IMX219 sensor requires three voltage
> supplies to be defined: VANA (analog), VDIG (digital core), and VDDL
> (digital I/O).
> 
> Add the corresponding voltage supply definitions to avoid dtbs_check
> warnings.
> 

On a side-note device-tree overlay requiring these voltages is an
implied reason, it's mainly because the schematics mention that and
bindings want to capture same topography in device-tree too.

So maybe good to mention that and share schematic link too in commit
message :

https://datasheets.raspberrypi.com/camera/camera-module-2-schematics.pdf

With these changes, feel free to add,

Reviewed-by: Devarsh Thakkar <devarsht@ti.com>

Regards
Devarsh

> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  .../boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso  | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
> index dd090813a32d6..149c59c071823 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
> +++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
> @@ -15,6 +15,33 @@ clk_imx219_fixed: imx219-xclk {
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
> +	reg_1p2v: regulator-1p2v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "1P2V";
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +		vin-supply = <&vcc_3v3_sys>;
> +		regulator-always-on;
> +	};
>  };
>  
>  &main_i2c2 {
> @@ -40,6 +67,10 @@ ov5640: camera@10 {
>  
>  				clocks = <&clk_imx219_fixed>;
>  
> +				VANA-supply = <&reg_2p8v>;
> +				VDIG-supply = <&reg_1p8v>;
> +				VDDL-supply = <&reg_1p2v>;
> +
>  				reset-gpios = <&exp1 13 GPIO_ACTIVE_HIGH>;
>  
>  				port {


