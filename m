Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED70C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 11:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H0XzuvKr2H3izEYnq/eQQn05fht77syXyK4//sspygU=; b=tlCigzqgGvkpmLmAWiu3he81js
	61FPW/VPe5A2yHvhuX0hmJ3Fn6WCN6O+iKzI6ZyJh/TiDFCBcSRNIy4rdWP+ZIbbMTdA93dJWY7sf
	23grKlOUKIu9B6Gm2w++pOsrpXJoRry20DtVL+4rRK0RUYAZEvZ9o4eRoTTohpDSKZbKuaRiOtTos
	qeV4w4WxtwkbWeeueRQlTjLUXun2RRU7S42yUNofAnsQ48mi6VBy/QijBtv/jeRDsPsSezHiXupsn
	STDbH4aBOsfINtBHB30I23g5YD6Gw7WlQGPSCH6h3lIZUNu33dxVUd5eA3upjpyMlFvlMJRZXgGu+
	XmWpzG3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGnF-0000000Bng8-26cn;
	Tue, 06 May 2025 11:49:01 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCF95-0000000BVGP-0jJT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 10:03:30 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 546A3ClT476718
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 May 2025 05:03:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746525792;
	bh=H0XzuvKr2H3izEYnq/eQQn05fht77syXyK4//sspygU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Be55V0rDPHXa2bT6htWlKcICO4EnqPapDcm4Tpg50HWcwBJXB3FxXiXAlcaFddQCs
	 lZYXU8XMESkw2LYm3cHjfaaaEQPRJJjkS9FR7WIgQTTs/NKiFrWzWl5J+f9qUqxWwh
	 AxIjiXqaVWSAU3UX9rHqrr4Pqae3vJfZfQ1IC/LM=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 546A3CnD020417
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 May 2025 05:03:12 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 May 2025 05:03:11 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 May 2025 05:03:12 -0500
Received: from [172.24.227.193] (devarsh-precision-tower-3620.dhcp.ti.com [172.24.227.193])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 546A37dW120035;
	Tue, 6 May 2025 05:03:08 -0500
Message-ID: <575fdd99-a7a9-430b-bc94-5809edd42fa4@ti.com>
Date: Tue, 6 May 2025 15:33:06 +0530
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH 2/2] arm64: dts: ti: k3-am625-beagleplay: Add required
 voltage supplies for TEVI-OV5640
To: Rishikesh Donadkar <r-donadkar@ti.com>, <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <y-abhilashchandra@ti.com>,
        <s-jain1@ti.com>, <jai.luthra@linux.dev>,
        <jai.luthra@ideasonboard.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250506045225.1246873-1-r-donadkar@ti.com>
 <20250506045225.1246873-3-r-donadkar@ti.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20250506045225.1246873-3-r-donadkar@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_030327_310330_FCDB05C4 
X-CRM114-Status: GOOD (  12.99  )
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

On 06/05/25 10:22, Rishikesh Donadkar wrote:
> The device tree overlay for TEVI-OV5640 requires following voltage
> supplies:
> 
> AVDD-supply: Analog voltage supply, 2.8 volts
> DOVDD-supply: Digital I/O voltage supply, 1.8 volts
> DVDD-supply: Digital core voltage supply, 3.3 volts
> 
> Add them in the overlay.
> 
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>

Reviewed-by: Devarsh Thakkar <devarsht@ti.com>

Regards
Devarsh
> ---
>  .../k3-am625-beagleplay-csi2-tevi-ov5640.dtso | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtso b/arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtso
> index 81a2763d43c65..8a7a9ece08af6 100644
> --- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtso
> +++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtso
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
> +		vin-supply = <&vdd_3v3>;
> +		regulator-always-on;
> +	};
> +
> +	reg_1p8v: regulator-1p8v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "1P8V";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&vdd_3v3>;
> +		regulator-always-on;
> +	};
> +
> +	reg_3p3v: regulator-3p3v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "3P3V";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vdd_3v3>;
> +		regulator-always-on;
> +	};
>  };
>  
>  &main_gpio0 {
> @@ -39,6 +66,10 @@ ov5640: camera@3c {
>  		clocks = <&clk_ov5640_fixed>;
>  		clock-names = "xclk";
>  
> +		AVDD-supply = <&reg_2p8v>;
> +		DOVDD-supply = <&reg_1p8v>;
> +		DVDD-supply = <&reg_3p3v>;
> +
>  		port {
>  			csi2_cam0: endpoint {
>  				remote-endpoint = <&csi2rx0_in_sensor>;


