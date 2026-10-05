Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D638ACA5FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 09:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2rF1+ysFAoUBVu9HLCXelaf+0gW06xdxdvh6wQc3nA=; b=Pi8DcTWq7ysuAHL9d/lHHDZfds
	vbiobROROZS59h18yVtRQp6k1kPV3mJYWRmH4dgBGCwpfskC5URFtGFVaVrOY6KUV8eDpby8hzVq9
	XYi4Um+kq1HOjFlLfw7ha3Tfxi0/KJTvrjUgZEIKHpVQd8XrzQiZi8Kv9kP0JJ7pBP9Vkcp2ow3Ok
	2tZocAAzjKyYnsrH2xknuC2u1E/SSVN1vQY2e8DZLaOgOYfemVInBCcXDua/+ISlq76jtUbInupAK
	Dd5NokRBxw0MTZqhhHbwqYqL9RTaqEWYOec3T5PRo2lkwSmQlJn67eTN+IyvfEB4GqvhaSTmPssCv
	Tr+lHswA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDeaS-0000000FvRs-36m1;
	Mon, 05 Oct 2026 09:02:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDeaQ-0000000FvR9-0sHy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 09:02:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50279152B;
	Mon,  5 Oct 2026 02:02:13 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 62B473F66F;
	Mon,  5 Oct 2026 02:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791190936; bh=wzKbXcm9aX7tddsl1dJRDbixjLaOCm42RIzbP5lg+5Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BWUNNiOdSkAjCx/IrsnnuZPHK2MQ2nujJ8LoSUkIn6VrEYUzdLL9Mv9EF+A4BPRIL
	 d6U7CO5/r+w7SziIcjVnSQD3GMX1h6pWF2pAJuVXXkAZrSVCM3Lgw60iN35eQx1/e6
	 5aMEwUajUHrIWyqQwVtsBi4/l5dMrhFp18PkN6I4=
Message-ID: <2c75983e-5e63-4613-a9a8-055015d04bbf@arm.com>
Date: Mon, 5 Oct 2026 11:02:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARM: dts: sun8i-r40: Add SID node and THS calibration
To: Otavio Salvador <otavio@ossystems.com.br>, Chen-Yu Tsai
 <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Srinivas Kandagatla
 <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261003012534.418820-3-otavio@ossystems.com.br>
 <20261003012534.418820-5-otavio@ossystems.com.br>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261003012534.418820-5-otavio@ossystems.com.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_020218_437545_C0DA1C85 
X-CRM114-Status: GOOD (  21.67  )
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

Hi Otavio,

thanks for sending the patch!

On 10/3/26 03:25, Otavio Salvador wrote:
> Without the calibration cell, the THS driver leaves the sensor
> calibration registers at their reset value (0x800) and the reported
> temperatures drift from the real die temperature by a chip-dependent
> offset.
> 
> Add the SID node at 0x01c1b000 and wire the thermal sensor to its
> factory calibration at eFuse offset 0x40, one 16-bit word for each of
> the two sensors.
> 
> The R40 user manual gives the size of the thermal sensor key (32 bits)
> but not its offset. The vendor SDK key map names 0x48 "thermal_sensor",
> but that word is zero on all the boards checked. On an A40i running the
> Boardcon vendor kernel, the THS_0_1_CDATA register holds exactly the
> eFuse word at 0x40 (0x08780875), which confirms the location.

So in some U-Boot BSP sources on github I see 
arch/arm/include/asm/arch-sun8iw11p1/sid.h putting the sensor at 0x34 
(like the H3 or A64).
Can you check the values there? I see that Tina-Linux puts them at 0x40, 
as you reported, and it's probably more reliable there than in the 
U-Boot sources, but it's worth double checking.

The rest looks alright (checked the manual and how the compatible string 
is handled in the driver), so if you can confirm that it's 0x40:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Thanks,
Andre

> 
> Tested on two Boardcon EMA40i (A40i) boards: THS_0_1_CDATA now holds
> the eFuse word at 0x40 of each chip (0x082d0822 and 0x083d0838) instead
> of the reset value 0x08000800.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>   arch/arm/boot/dts/allwinner/sun8i-r40.dtsi | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi b/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi
> index f0ed802a9d08e..c7c9cad695ca4 100644
> --- a/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi
> +++ b/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi
> @@ -485,6 +485,18 @@ ohci1: usb@1c19400 {
>   			status = "disabled";
>   		};
>   
> +		sid: efuse@1c1b000 {
> +			compatible = "allwinner,sun8i-r40-sid",
> +				     "allwinner,sun50i-a64-sid";
> +			reg = <0x01c1b000 0x400>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			ths_calibration: thermal-sensor-calibration@40 {
> +				reg = <0x40 0x4>;
> +			};
> +		};
> +
>   		ehci2: usb@1c1c000 {
>   			compatible = "allwinner,sun8i-r40-ehci", "generic-ehci";
>   			reg = <0x01c1c000 0x100>;
> @@ -832,7 +844,8 @@ ths: thermal-sensor@1c24c00 {
>   			clock-names = "bus", "mod";
>   			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
>   			resets = <&ccu RST_BUS_THS>;
> -			/* TODO: add nvmem-cells for calibration */
> +			nvmem-cells = <&ths_calibration>;
> +			nvmem-cell-names = "calibration";
>   			#thermal-sensor-cells = <1>;
>   		};
>   


