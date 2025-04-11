Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78C0C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 14:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qQDSFd0KgWBYuvyGNC6FIuW3TAEXHe3afLsrb7vpjYk=; b=gnWh8O+g/mV/hiVkiSWMilIMxU
	DRCbx1dSdZodS3ipOpz4oYE7pXDc8ROPFORQYg0d9AR/qLJmkfJp7QPNIrOzFHXQHVWy1IYas+UwE
	GGB0LQgmqe7aaSn9TvrMYGeGMEVVugGlWZA+qy0N4jxNxaqNHMkhyv0jwsJ7OjbzKMiwE93LDPFQb
	Ja4egIQSAjIGSHDMIuegAux9uFdkwsbdtWSCau2U+b02VXw/oP9cbu9NHxqNKLqLqm6XodCva5Iuk
	pPZOl0PaXPN7Yk03RyD+l/qgaWsiIZ6x6RES7SXTNDPr06Le7jwlAf93cns4CEjcgi2WShQbxOQ/m
	KeJQi/dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3FDT-0000000E3rW-1WTe;
	Fri, 11 Apr 2025 14:18:47 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Em3-0000000DzK5-1frP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 13:50:28 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53BDoJUS2141356
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 08:50:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744379419;
	bh=qQDSFd0KgWBYuvyGNC6FIuW3TAEXHe3afLsrb7vpjYk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=SR5jd+omWQxFX6UsqjsPKJ90ihXVqD9unyjxmpgtOwxUWqzaiAGqu+/+jjisWUfZk
	 +WE12+qo/scn+FIl4BsRZoTY1FrVvLWk7j5+i8bflzxwUroKQX+ExD41QTVPhB2l8L
	 qlrxRuy3vo36UxIaEBzPUACKcMxqdba+I8Hu2sRw=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53BDoJCD031578
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Apr 2025 08:50:19 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 08:50:19 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 08:50:18 -0500
Received: from [10.249.136.157] ([10.249.136.157])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53BDoDJO001396;
	Fri, 11 Apr 2025 08:50:14 -0500
Message-ID: <293dfbda-841b-4a5a-85ac-6a6c2df5df09@ti.com>
Date: Fri, 11 Apr 2025 19:20:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] arm64: dts: ti: am68-sk: Fix regulator hierarchy
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <jai.luthra@linux.dev>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>, <stable@vger.kernel.org>
References: <20250409134128.2098195-1-y-abhilashchandra@ti.com>
 <20250409134128.2098195-3-y-abhilashchandra@ti.com>
Content-Language: en-US
From: "Francis, Neha" <n-francis@ti.com>
In-Reply-To: <20250409134128.2098195-3-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_065027_532052_A102AB07 
X-CRM114-Status: GOOD (  15.29  )
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

On 4/9/2025 7:11 PM, Yemike Abhilash Chandra wrote:
> Update the vin-supply of the TLV71033 regulator from LM5141 (vsys_3v3) to
> LM61460 (vsys_5v0) to match the schematics. Add a fixed regulator node for
> the LM61460 5V supply to support this change.
> 
> AM68-SK schematics: https://www.ti.com/lit/zip/sprr463
> Fixes: a266c180b398 ("arm64: dts: ti: k3-am68-sk: Add support for AM68 SK base board")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
> index 11522b36e0ce..5fa70a874d7b 100644
> --- a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
> @@ -44,6 +44,17 @@ vusb_main: regulator-vusb-main5v0 {
>  		regulator-boot-on;
>  	};
>  
> +	vsys_5v0: regulator-vsys5v0 {
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
>  	vsys_3v3: regulator-vsys3v3 {
>  		/* Output of LM5141 */
>  		compatible = "regulator-fixed";
> @@ -76,7 +87,7 @@ vdd_sd_dv: regulator-tlv71033 {
>  		regulator-min-microvolt = <1800000>;
>  		regulator-max-microvolt = <3300000>;
>  		regulator-boot-on;
> -		vin-supply = <&vsys_3v3>;
> +		vin-supply = <&vsys_5v0>;
>  		gpios = <&main_gpio0 49 GPIO_ACTIVE_HIGH>;
>  		states = <1800000 0x0>,
>  			 <3300000 0x1>;

Reviewed-by: Neha Malcom Francis <n-francis@ti.com>

-- 
Thanking You
Neha Malcom Francis


