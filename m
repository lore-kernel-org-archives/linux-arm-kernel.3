Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 919CCC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 13:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vq5qWpYQwtAn+8K0fBlNkwMKc2ZES2aYbbqGIKGkRWw=; b=k6CfSiwbQoz7l7jQ8VWVTHLZ8v
	BsZn8hYKBgnaGL0eFTYulBasIaWPqmr2f6TPx7W1ncBWM4b/Icf6jIxJdFKZEe75etRbS2/VJpDpK
	q14poHgFWL+c6HMw8Ol7A3Vn/u2VmO1DDcblFgAEp7+JPffGJpAzik7Oerd3SoEVOx4SRC+CPoy2Q
	oTkYJTzFcHdd3U7V7xWTV+riH9juzWQ9+JWdcqDlpNaNHFGYeKNV0RjfLtpf8Wm4Mlafj+Sjs3p2p
	i+k0VFcqJBi9AODX80tdPFRs2JxG6Uhkx/2weFid7zx6JkrQhxNTFHiyNKlGDkPI6kkHss4EeRXso
	55Swh1mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Ekq-0000000Dz7H-2VOj;
	Fri, 11 Apr 2025 13:49:12 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3EXI-0000000Dwsv-41Y2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 13:35:14 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53BDYgPT2086377
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 08:34:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744378482;
	bh=vq5qWpYQwtAn+8K0fBlNkwMKc2ZES2aYbbqGIKGkRWw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=LM0H+poPMU7hM+cfUkNMeLijFODEYYO0coGabaLfjrtAZ4NLl45vnP/M3Z7tghlzj
	 yKrGfqAnaQKVs0zMEWWDFVF0mEtR1RxFsjH3mVY4aRYLVrGfn3KbWdlybreA174xUP
	 a/Lzd8N/0j09AsZFmQuBLZSO6WKIBIf0GqDNdBe4=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53BDYgMw047723
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Apr 2025 08:34:42 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 08:34:41 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 08:34:42 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53BDYbPA110090;
	Fri, 11 Apr 2025 08:34:38 -0500
Message-ID: <44c3ec3d-2fa3-4a61-8c93-5ef4791fcf8a@ti.com>
Date: Fri, 11 Apr 2025 19:04:36 +0530
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
        <stable@vger.kernel.org>, <u-kumar1@ti.com>
References: <20250409134128.2098195-1-y-abhilashchandra@ti.com>
 <20250409134128.2098195-2-y-abhilashchandra@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250409134128.2098195-2-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_063513_101198_B7112AC2 
X-CRM114-Status: GOOD (  15.02  )
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
> Add device tree nodes for two power regulators on the J721E SK board.
> vsys_5v0: A fixed regulator representing the 5V supply output from the
> LM61460 and vdd_sd_dv: A GPIO-controlled TLV71033 regulator.
>
> J721E-SK schematics: https://www.ti.com/lit/zip/sprr438
> Fixes: 1bfda92a3a36 ("arm64: dts: ti: Add support for J721E SK")

For me does not looks like a fix, you can adding missing nodes


> Cc: stable@vger.kernel.org
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-j721e-sk.dts | 31 ++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
> index 440ef57be294..4965957e6545 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
> @@ -184,6 +184,17 @@ vsys_3v3: fixedregulator-vsys3v3 {
>   		regulator-boot-on;
>   	};
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
>   	vdd_mmc1: fixedregulator-sd {
>   		compatible = "regulator-fixed";
>   		pinctrl-names = "default";
> @@ -211,6 +222,20 @@ vdd_sd_dv_alt: gpio-regulator-tps659411 {
>   			 <3300000 0x1>;
>   	};
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
>   	transceiver1: can-phy1 {
>   		compatible = "ti,tcan1042";
>   		#phy-cells = <0>;
> @@ -613,6 +638,12 @@ J721E_WKUP_IOPAD(0xd4, PIN_OUTPUT, 7) /* (G26) WKUP_GPIO0_9 */
>   		>;
>   	};
>   
> +	vdd_sd_dv_pins_default: vdd-sd-dv-default-pins {
> +		pinctrl-single,pins = <
> +			J721E_IOPAD(0x1dc, PIN_INPUT, 7) /* (Y1) SPI1_CLK.GPIO0_118 */

Shouldn't be this pin be output to control regulator ?


> +		>;
> +	};
> +
>   	wkup_uart0_pins_default: wkup-uart0-default-pins {
>   		pinctrl-single,pins = <
>   			J721E_WKUP_IOPAD(0xa0, PIN_INPUT, 0) /* (J29) WKUP_UART0_RXD */

