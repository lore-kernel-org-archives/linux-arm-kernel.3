Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CB5C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 10:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iye7H9J0i3pG7Uaq2wwx9o/eYl/3IUwYdrp1Dd+t7Bc=; b=xf+mGGmTooq7hkAhtn9iPIHK2y
	G6dd72WENd/NfuZvRkXgB5FmXEUN1IaFIUmEUPRlzhzbCjIazKMQWp/4wgEuryNu2xX3REd/9oQ59
	JZZEQIrLrC/YrqQPNpItbm00OlVyjwLmP+1kylKaFzKWwUPQcQx4hI7I8XKui0GmCC2PjVnQTmJSB
	594AtoUxyMj/i+d1+xEVAATT8itzWzOejRXNYt+Gqt7cXgtmZUFjRUD6A6wRnATXvyrqgKfil1zUi
	MFYnf0yjzx8ZR1YH4FfFdg4SNDHaYB3C4Cg6pLPmS4Bm8ok06MJWFAaXGEzWkLRX6JfONQrNPEXRu
	D1YPknRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubcWv-00000004nBy-09WR;
	Tue, 15 Jul 2025 10:04:57 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubcHS-00000004kNh-3IxR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 09:49:00 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56F9mmxZ2586251;
	Tue, 15 Jul 2025 04:48:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752572928;
	bh=Iye7H9J0i3pG7Uaq2wwx9o/eYl/3IUwYdrp1Dd+t7Bc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=rpFrNW6XDvSiLGHJoEi2dVeKyKZoYAkQ8xLkzym2uJV704Ut35HHjJa3dqklnMCPi
	 sKKRrLd6TAPOl3+VCtY/fdN7zPmjf64LwkbGeOLs4dBPJrFYIEoM3j4Ty6QjaK+WYC
	 38n19I0VGIp9jeW1AlByCpxOAix6y7/GVyYSQU3w=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56F9mmLk1178036
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 15 Jul 2025 04:48:48 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 15
 Jul 2025 04:48:48 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 15 Jul 2025 04:48:48 -0500
Received: from [172.24.227.166] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.166])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56F9miVG2359263;
	Tue, 15 Jul 2025 04:48:45 -0500
Message-ID: <3ab4f645-8062-4ed6-8fd3-96dd3eb6de0b@ti.com>
Date: Tue, 15 Jul 2025 15:18:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] arm64: dts: ti: k3-am68-sk: Enable DSI on
 DisplayPort-0
To: Vignesh Raghavendra <vigneshr@ti.com>, <nm@ti.com>,
        <devicetree@vger.kernel.org>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <u-kumar1@ti.com>
References: <20250624082619.324851-1-j-choudhary@ti.com>
 <20250624082619.324851-8-j-choudhary@ti.com>
 <4765b426-e625-4563-a748-7edb40e3b260@ti.com>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <4765b426-e625-4563-a748-7edb40e3b260@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_024858_926066_7E4180DD 
X-CRM114-Status: GOOD (  13.03  )
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

Hi,

On 26/06/25 12:04, Vignesh Raghavendra wrote:
> 
> 
> On 24/06/25 13:56, Jayesh Choudhary wrote:
>> Enable DSI support for AM68-SK platform.
>>
>> Add DT node for DSI2eDP bridge. The DSI to eDP bridge is sn65dsi86
>> on the board.
>>
>> Add the endpoint nodes to describe connection from:
>> DSS => DSI => SN65DSI86 bridge => DisplayPort-0
>>
>> Set status for all required nodes for DisplayPort-0 as 'okay'.
>>
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>> ---
>>   .../boot/dts/ti/k3-am68-sk-base-board.dts     | 96 +++++++++++++++++++
>>   1 file changed, 96 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
>> index 5fa70a874d7b..aef63ae2994c 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
>> @@ -135,6 +135,35 @@ transceiver4: can-phy3 {
>>   		max-bitrate = <5000000>;
>>   	};
>>   
>> +	edp0_refclk: clock-edp0-refclk {
>> +		#clock-cells = <0>;
>> +		compatible = "fixed-clock";
>> +		clock-frequency = <19200000>;
>> +	};
>> +
>> +	dp0_pwr_3v3: fixedregulator-dp0-pwr {
> 
> use std node name: regulator-...

Okay! In v3, I will change this.

> 
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "dp0-pwr";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +		gpio = <&exp2 2 GPIO_ACTIVE_HIGH>;     /*P0 - DP0_3V3 _EN */
>> +		enable-active-high;
>> +		regulator-always-on;
>> +	};
>> +
>> +	dp0: dp0-connector {
>> +		compatible = "dp-connector";
>> +		label = "DP0";
>> +		type = "full-size";
>> +		dp-pwr-supply = <&dp0_pwr_3v3>;
>> +
>> +		port {
>> +			dp0_connector_in: endpoint {
>> +				remote-endpoint = <&dp0_out>;
>> +			};
>> +		};
>> +	};
>> +
>>   	connector-hdmi {
>>   		compatible = "hdmi-connector";
>>   		label = "hdmi";
>> @@ -605,6 +634,39 @@ exp2: gpio@20 {
>>   		gpio-line-names = "HDMI_PDn","HDMI_LS_OE",
>>   				  "DP0_3V3_EN","eDP_ENABLE";
>>   	};
>> +
>> +	dsi_edp_bridge: dsi-edp-bridge@2c {
>> +		compatible = "ti,sn65dsi86";
>> +		reg = <0x2c>;
>> +		clock-names = "refclk";
>> +		clocks = <&edp0_refclk>;
>> +		enable-gpios = <&exp2 3 GPIO_ACTIVE_HIGH>;
>> +		vpll-supply = <&vsys_io_1v8>;
>> +		vccio-supply = <&vsys_io_1v8>;
>> +		vcca-supply = <&vsys_io_1v2>;
>> +		vcc-supply = <&vsys_io_1v2>;
>> +
>> +		dsi_edp_bridge_ports: ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			port@0 {
>> +				reg = <0>;
>> +
>> +				dp0_in: endpoint {
>> +					remote-endpoint = <&dsi0_out>;
>> +				};
>> +			};
>> +
>> +			port@1 {
>> +				reg = <1>;
>> +
>> +				dp0_out: endpoint {
>> +					remote-endpoint = <&dp0_connector_in>;
>> +				};
>> +			};
>> +		};
>> +	};
>>   };
>>   
>>   &main_sdhci1 {
>> @@ -699,6 +761,15 @@ dpi_out0: endpoint {
>>   			remote-endpoint = <&tfp410_in>;
>>   		};
>>   	};
>> +
>> +	/* DSI */
>> +	port@2 {
>> +		reg = <2>;
>> +
>> +		dpi0_out: endpoint {
>> +			remote-endpoint = <&dsi0_in>;
>> +		};
>> +	};
>>   };
>>   
>>   &serdes_ln_ctrl {
>> @@ -756,3 +827,28 @@ &usb0 {
>>   	phys = <&serdes0_usb_link>;
>>   	phy-names = "cdns3,usb3-phy";
>>   };
>> +
>> +&dphy_tx0 {
>> +	status = "okay";
>> +};
>> +
>> +&dsi0 {
>> +	status = "okay";
>> +};
>> +
>> +&dsi0_ports {
>> +
>> +	port@0 {
>> +		reg = <0>;
>> +		dsi0_out: endpoint {
>> +			remote-endpoint = <&dp0_in>;
>> +		};
>> +	};
>> +
>> +	port@1 {
>> +		reg = <1>;
>> +		dsi0_in: endpoint {
>> +			remote-endpoint = <&dpi0_out>;
>> +		};
>> +	};
>> +};
> 

