Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748A5CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 17:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rTUmVCjZwM7PQPWvSKdDMN6x4dpJeSnKTI7jgtFLTK4=; b=eMjmtj6XMZqwX6WFTZgzaW5PWj
	NjpVd7F2XBKFPkljgcdRn/2PP9cXcWNmVIzsvzZfnC/trRVq8kKhzuXn0xbzj/A+bw1ISxIDecc/7
	QHHGoWC5bcBwIEDF8/KS+7ClV+XkE3pzaBHX8hUAoDlYwXOQbR/5qyVa29/c/VVrXPbF07XFhKzkX
	qVRZlm+BZpED+TEu+nUAIv9+TBzREkDujwBbnvd11s4UIMOUwAz1OnK1R+JZ4cPPabPkftALlO2yu
	wzHZJ5gwlfxMqll3ZdZlZi6sukE1Qw1YylrpIsRhnD0IP9muRT5nwPJCaoDN4OO5rrfFBzuIdg0DN
	B/Tvorsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9SAc-00000005d6W-1sAu;
	Thu, 16 Oct 2025 17:53:46 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9SAY-00000005d63-15fJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 17:53:44 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59GHraPw071442;
	Thu, 16 Oct 2025 12:53:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760637216;
	bh=rTUmVCjZwM7PQPWvSKdDMN6x4dpJeSnKTI7jgtFLTK4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=CzDioRcWcP0GJuH1NJhcuSw/ZX0N0Sg3REZFvgB5AlpguzXTaL+wgUnRxNB49xgTQ
	 E6+77nybuWBm9PSVeaJdXIh7LgTlJOWVAGDa6nTomEYccJSo/GcEoN3uPVhzwSj1i8
	 ZrZfs7XvTslyYMrAx/vJaT6V4F09942lEy6lFeko=
Received: from DLEE212.ent.ti.com (dlee212.ent.ti.com [157.170.170.114])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59GHraTY1792417
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 16 Oct 2025 12:53:36 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Oct
 2025 12:53:36 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 16 Oct 2025 12:53:36 -0500
Received: from [128.247.29.251] (dmz007xyy.dhcp.ti.com [128.247.29.251])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59GHraWQ4129879;
	Thu, 16 Oct 2025 12:53:36 -0500
Message-ID: <19b16368-9ec8-40d8-9389-1dc48f28dd2a@ti.com>
Date: Thu, 16 Oct 2025 12:53:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am62d2-evm: Fix regulator properties
To: Paresh Bhagat <p-bhagat@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>
References: <20250916090736.2299127-1-p-bhagat@ti.com>
Content-Language: en-US
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Organization: PMIC
In-Reply-To: <20250916090736.2299127-1-p-bhagat@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_105342_482986_5D81E76E 
X-CRM114-Status: GOOD (  14.99  )
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

Hi Paresh,

On 9/16/25 4:07 AM, Paresh Bhagat wrote:
> Fix missing supply for regulators TLV7103318QDSERQ1 and TPS22918DBVR.
> Correct padconfig and gpio for TLV7103318QDSERQ1.
>
> Reference Docs
> Datasheet - https://www.ti.com/lit/ug/sprujd4/sprujd4.pdf
> Schematics - https://www.ti.com/lit/zip/sprcal5
>
> Fixes: 1544bca2f188e ("arm64: dts: ti: Add support for AM62D2-EVM")
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>
> Boot logs
> https://gist.github.com/paresh-bhagat12/9a4a1aec5119ceedb386743921432c91

Reviewed-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>

>
> Tag used
> next-20250915
>
>   arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
> index 83af889e790a..d202484eec3f 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
> @@ -146,6 +146,7 @@ vdd_mmc1: regulator-4 {
>   		regulator-name = "vdd_mmc1";
>   		regulator-min-microvolt = <3300000>;
>   		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vcc_3v3_sys>;
>   		regulator-boot-on;
>   		enable-active-high;
>   		gpio = <&exp1 3 GPIO_ACTIVE_HIGH>;
> @@ -165,14 +166,16 @@ vcc_3v3_sys: regulator-5 {
>   	};
>   
>   	vddshv_sdio: regulator-6 {
> +		/* output of TLV7103318QDSERQ1 */
>   		compatible = "regulator-gpio";
>   		regulator-name = "vddshv_sdio";
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&vddshv_sdio_pins_default>;
>   		regulator-min-microvolt = <1800000>;
>   		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vcc_5v0>;
>   		regulator-boot-on;
> -		gpios = <&main_gpio1 31 GPIO_ACTIVE_HIGH>;
> +		gpios = <&main_gpio0 59 GPIO_ACTIVE_HIGH>;
>   		states = <1800000 0x0>,
>   			 <3300000 0x1>;
>   		bootph-all;
> @@ -334,7 +337,7 @@ AM62DX_IOPAD(0x01d4, PIN_INPUT, 7) /* (C15) UART0_RTSn.GPIO1_23 */
>   
>   	vddshv_sdio_pins_default: vddshv-sdio-default-pins {
>   		pinctrl-single,pins = <
> -			AM62DX_IOPAD(0x1f4, PIN_OUTPUT, 7) /* (M19) GPMC0_CLK.GPIO1_31 */
> +			AM62DX_IOPAD(0x00f0, PIN_INPUT, 7) /* (Y21) GPIO0_59 */
>   		>;
>   		bootph-all;
>   	};

-- 
Best,
Shree Ramamoorthy
PMIC Software Engineer



