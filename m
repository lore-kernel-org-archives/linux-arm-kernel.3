Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E17CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 07:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=snt0ZpGOimE9rrHUHPsKGVDPEQfD/KtCqryaGRumJ70=; b=znk3SmABy7UeiqkZLQoQs6Wa/G
	SQAjSkJ+V5ECFQ93ZdnnLO7gEbLxE+mr+U2omsV9ZSN66mDA9+oMDsSg9E5cO9Fa4XPFiGrK00zkH
	I5UDEhGK897kzcI1DjoyLxFuh8joQWXumhJ+tf1Za3yAXb5w6XwSg/y5/rirDgBaxS6rQ11eZRk5M
	rSOitWaE+A0lOUdiZfYkBxdgQnSSMfWvN4zj33B00vosQCzmclX3Kot92W0Xpzjy/BtsUxPYtzD8S
	X/fFjkVXFgHnadA323AFkwOA71GPg4rd3QU6bZBE5ZHmLJm0zEA65xgf+oP7Be3LcY6Jmqofq5YFz
	TNa942hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unueI-00000006pJU-0rJk;
	Mon, 18 Aug 2025 07:51:22 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1untoj-00000006jxa-0rEL;
	Mon, 18 Aug 2025 06:58:06 +0000
X-QQ-mid: zesmtpip4t1755500244t6fc68c41
X-QQ-Originating-IP: sLmbQl3vBpNZ30bWX5N0sBTYr4LYaC7/m/aS7e2wyqY=
Received: from [IPV6:240f:10b:7440:1:e696:3c18 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 18 Aug 2025 14:57:21 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1927108559509469176
Message-ID: <BCD8E43E564BC334+1e45d36f-edc7-4c3c-90c9-7b0f2a52360f@radxa.com>
Date: Mon, 18 Aug 2025 15:57:21 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: rockchip: remove vcc_3v3_pmu regulator
 for Radxa E52C
To: Chukun Pan <amadeus@jmu.edu.cn>, Heiko Stuebner <heiko@sntech.de>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250816080030.183931-1-amadeus@jmu.edu.cn>
 <20250816080030.183931-3-amadeus@jmu.edu.cn>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
In-Reply-To: <20250816080030.183931-3-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OBUGnm9pFasAcNPGHYEMAopgoh5OwK6sDVK9bpqjd4LE8UhdUNPQ9bKd
	Eft9UalMA+yEWVadv5T6zu8vxV885J/dFccTojhVAHOFPp4bMUXBCPSVwxd/LFYHuOK47Dk
	4Pf3qcgL8BXEGSElSYv/4M8iBjpN221bvXwzxf8nlQimUGPyLQFOc72o8jk3WWvQhwvyVJk
	N++pAcPjMhGi6EZwh8mYFVZg8yybg6OL6jAIN7DcfscMlSpCA8Qm9BAnPvA/XkZcLkrF01P
	cU83tt+n0jxG39QLqnam+jEniLdShLddKJpN7FbQ2IQRhhuJ2Ae7yC3JcwKiCT1KRbm4L1o
	55uisvFusSs0snQ/pBidg1zdinBWowBbUbTp7c8FAiQ3SQBuQYY+nIhOCmHoVoOoDd/6qgj
	UodG2CUSlHj/UxAcVPHDdRkZdBlyz6sAK4fqG9pvdQyfmyqzrqx3oUcWNhkOMSa17XUl/Hl
	tw5v+HFbDJHUDLX7y4vkfJ8KD7h3qGV82mlWgSmYDhnD+Bx433C4H/vuMDSSlCygbJcAXYS
	GnUuBjWqcKWV3RO4rzkM7+PZ/y31YoyU4/OE+PQjp36PmdLMnnYOx7ej8A6Rqy4uVBjZVju
	mm1vqI8w1mdjpQ0tpi4GE+V7+7eotK1libg4gEWWS6MPlRetQn+mA3zAeuvXFrUy+u86pYG
	g1Z8L0iK+doHUhhyvrAAPkOpsbObkDjS39ZocN/zY5mCTx9X/ryvHW6198iVAC+/Up8vsy9
	+fVElV2mut9qi7JF001tr4iGW13YAvuTWAYMrXmCX24wgwq7UfcPTNaLwbjtdyveMt+4m1X
	+TNSjx6dHnY53Sl57Uexu6tfzD9aYWezAGfdJukbeaqFefyzxG0b0yJvDyuT6aBdqJ7tFYx
	dA8bU2U7pDMLx3DkNj7CWf2L6B0DHJ3aqhVAhfZeiGRmuJPZ8iLjsey9UFpnQUc42aadKSJ
	H6FS267F7p60Ccr3jSDqVod3S4fvQq+gpNU3Ro0JRGPZmOyoQ/dCAxDiNy1xoW7jBvN4=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_235805_600053_071DA77F 
X-CRM114-Status: GOOD (  13.30  )
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

Hi Chukun,

On 8/16/25 17:00, Chukun Pan wrote:
> According to Radxa E52C Schematic V1.2 [1] page 5, vcc_3v3_pmu
> is directly connected to vcc_3v3_s3 via a 0 ohm resistor.
> The vcc_3v3_pmu is not a new regulator, so remove it.
> 
> [1] https://dl.radxa.com/e/e52c/hw/radxa_e52c_v1.2_schematic.pdf
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>   arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts | 12 +-----------
>   1 file changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts b/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts
> index 1883bd183396..4a3ae95f122f 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts
> @@ -98,16 +98,6 @@ vcc_1v1_nldo_s3: regulator-1v1 {
>   		vin-supply = <&vcc_sysin>;
>   	};
>   
> -	vcc_3v3_pmu: regulator-3v3-0 {
> -		compatible = "regulator-fixed";
> -		regulator-name = "vcc_3v3_pmu";
> -		regulator-always-on;
> -		regulator-boot-on;
> -		regulator-min-microvolt = <3300000>;
> -		regulator-max-microvolt = <3300000>;
> -		vin-supply = <&vcc_3v3_s3>;
> -	};
> -
>   	vcc_3v3_s0: regulator-3v3-1 {
>   		compatible = "regulator-fixed";
>   		regulator-name = "vcc_3v3_s0";
> @@ -255,7 +245,7 @@ eeprom@50 {
>   		reg = <0x50>;
>   		pagesize = <16>;
>   		read-only;
> -		vcc-supply = <&vcc_3v3_pmu>;
> +		vcc-supply = <&vcc_3v3_s3>;

How about the following instead?

@@ -538,7 +538,7 @@ regulator-state-mem {
  				};
  			};

-			vcc_3v3_s3: dcdc-reg8 {
+			vcc_3v3_pmu: vcc_3v3_s3: dcdc-reg8 {
  				regulator-name = "vcc_3v3_s3";
  				regulator-always-on;
  				regulator-boot-on;

Best regards,

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

>   	};
>   };
>   


