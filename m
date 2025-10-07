Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 518BBCCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 18:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VOc/6DotKCEMW9Sbnc/xyg+5eFLjWqB7jFNv6VD59hc=; b=UsWGGpuDH+1fjxSmVDrCtDwCDN
	QS9MKsBAAUjC6RgW0nrCA8EE2WXKxle8eQJJUpKB57SPJ+XIZzWXsz+AHzfZpfDERVsLUyF+Iri5s
	ZR2aymzCBvT+3igrvWnFWMukJNIv4cJj7h+vZqipsGm1Ax25Oz6LwY1ubjxH6vHvsPKYaYpStfPOO
	Z3cs0jbwrFYvs/4kmgPYZBTkPdpPYQlhSGQb6hrRuv/egFrgXbZwgmKZeyS3NILRt8+Efv2y7NeEe
	33uPo3FfXlBh+nj70euoWzuy2ah47j4qR1wQq2gP98bH+zDoTH5k3JLu8dBbZczHofIqN5YnksT69
	8iGXMByA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6C5z-00000002XCh-03hr;
	Tue, 07 Oct 2025 18:07:31 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6C5w-00000002XCB-0rCc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 18:07:29 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 597I7NCX3810025;
	Tue, 7 Oct 2025 13:07:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759860443;
	bh=VOc/6DotKCEMW9Sbnc/xyg+5eFLjWqB7jFNv6VD59hc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=BuaE95XydtLi+HxoJuzf/NGrknvu7AU+C5os5kym5Lp1LwbTG2V4f0gkeKGS0BRMo
	 YIy+Po1jr75jjVVVw53gDhkDHZd/XubDoXdDnXuJjCw9X4QfbCXK72Nvb1imsch19U
	 0tMwb4Ni6TSJW4lvtyf8Wd8XjSZJFfxYuALWP8m8=
Received: from DFLE203.ent.ti.com (dfle203.ent.ti.com [10.64.6.61])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 597I7Njr058437
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Oct 2025 13:07:23 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 7 Oct
 2025 13:07:22 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 7 Oct 2025 13:07:22 -0500
Received: from [10.247.24.40] (lt5cd3040qtn.dhcp.ti.com [10.247.24.40])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 597I7MrK1288932;
	Tue, 7 Oct 2025 13:07:22 -0500
Message-ID: <ff900ce3-ba9e-454b-ae79-0be06618616c@ti.com>
Date: Tue, 7 Oct 2025 13:07:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: ti: k3-am62d2-evm: Enable PMIC
To: Paresh Bhagat <p-bhagat@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>
References: <20250919032806.707926-1-p-bhagat@ti.com>
 <20250919032806.707926-3-p-bhagat@ti.com>
Content-Language: en-US
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
In-Reply-To: <20250919032806.707926-3-p-bhagat@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_110728_381060_3C661084 
X-CRM114-Status: GOOD (  14.04  )
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

On 9/18/2025 10:28 PM, Paresh Bhagat wrote:
> Add support for TPS65224 PMIC family on wakeup I2C0 bus. This 
> device provides regulators (bucks and LDOs), along with GPIOs, 
> and monitors SOC's MCU error signal.
>
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 91 ++++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
> index 9a74df221f2a..155abd97b799 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
> @@ -214,6 +214,14 @@ AM62DX_MCU_IOPAD(0x0030, PIN_OUTPUT, 0) /* (C8) WKUP_UART0_RTSn */
>  		>;
>  		bootph-all;
>  	};
> +
> +	wkup_i2c0_pins_default: wkup-i2c0-default-pins {
> +		pinctrl-single,pins = <
> +			AM62DX_MCU_IOPAD(0x004c, PIN_INPUT, 0) /* (D13) WKUP_I2C0_SCL */
> +			AM62DX_MCU_IOPAD(0x0050, PIN_INPUT, 0) /* (E13) WKUP_I2C0_SDA */
> +		>;
> +		bootph-all;
> +	};
>  };
>  
>  /* WKUP UART0 is used for DM firmware logs */
> @@ -464,6 +472,89 @@ &main_i2c2 {
>  	status = "okay";
>  };
>  
> +&wkup_i2c0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&wkup_i2c0_pins_default>;
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	tps65224: pmic@48 {
> +		compatible = "ti,tps65224-q1";
> +		reg = <0x48>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pmic_irq_pins_default>;
> +		interrupt-parent = <&main_gpio1>;
> +		interrupts = <31 IRQ_TYPE_EDGE_FALLING>;
> +		ti,primary-pmic;
> +
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		buck12-supply = <&vcc_3v3_sys>;
> +		buck3-supply = <&vcc_3v3_sys>;
> +		buck4-supply = <&vcc_3v3_sys>;
> +		ldo1-supply = <&vcc_3v3_sys>;
> +		ldo2-supply = <&vcc_3v3_sys>;
> +		ldo3-supply = <&vcc_3v3_sys>;
> +
> +		regulators {
> +			buck12: buck12 {
> +				regulator-name = "vdd_core";
> +				regulator-min-microvolt = <850000>;
> +				regulator-max-microvolt = <850000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +				bootph-all;
> +			};
> +
> +			buck3: buck3 {
> +				regulator-name = "dvdd1v8";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +				bootph-all;
> +			};
> +
> +			buck4: buck4 {
> +				regulator-name = "vdds_ddr";
> +				regulator-min-microvolt = <1100000>;
> +				regulator-max-microvolt = <1100000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +				bootph-all;
> +			};
> +
> +			ldo1: ldo1 {
> +				regulator-name = "vdda_1v8";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +				bootph-all;
> +			};
> +
> +			ldo2: ldo2 {
> +				regulator-name = "dvdd3v3";
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +				bootph-all;
> +			};
> +
> +			ldo3: ldo3 {
> +				regulator-name = "vddr_core";
> +				regulator-min-microvolt = <850000>;
> +				regulator-max-microvolt = <850000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +				bootph-all;
> +			};
> +		};
> +	};
> +};
> +

The PMIC node looks correct based on tps6594.yaml + test log regulator summary.
Reviewed-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>

>  &sdhci0 {
>  	/* eMMC */
>  	non-removable;

