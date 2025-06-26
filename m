Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E34AC7EE33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 11:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pdqJ3/ldB4zuQCaDnWbImn2eySoaM0afbT1+2XUy9J0=; b=0bgF3CgKu2hsA8x1LleIFYynpQ
	b/h4OO25i9bDC89uUJBa9SFLgnXcdNC3kvmjb4w3HQrJe3nju/boGyuGakpX5SytSL4h/Zi0SyyTe
	988zSr4O9cWtSoCiUD4uh/k+hIc5SikGEzod/Hs5pKXtL78DTtIt1Lc/tlJzsGkuTxMsRWsgEaWyN
	VI/HRt5VnLLaOCv9aDLS1CuxxtfeSi97zf+PZgdpxf/CCwPIknhDL0VFbI6UHfHs+T4YgSybbOn7P
	S7z7iq6AmzIY7j/q0lY1+6SadzW/J/F40RXefWjlIe2MZIWRWPV007a9vJWODrfCK3rL/LoGseqxc
	KKcDBbbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUlFA-0000000BToa-1SbQ;
	Thu, 26 Jun 2025 11:58:16 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUjwW-0000000BIa6-0U5o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 10:34:57 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55QAYql52391124;
	Thu, 26 Jun 2025 05:34:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750934092;
	bh=pdqJ3/ldB4zuQCaDnWbImn2eySoaM0afbT1+2XUy9J0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=EZ2oMctZVZApUtrJijsJRvVhgoS3zGvOLgr3frisLx+HD6anG1y1/JvK8IEsxcJ7q
	 IKwBbW4ZZ0C2Fk//YO80M0uKb22hQc6p09zjtKjJc6g4A36bptnXSOyrcO+qvCRMEe
	 zpE+5rUUJmsvoHNGfnmbifxpfWycSPTsS+L798GE=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55QAYqan2165138
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 26 Jun 2025 05:34:52 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 26
 Jun 2025 05:34:51 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 26 Jun 2025 05:34:51 -0500
Received: from [172.24.31.248] (lt5cd2489kgj.dhcp.ti.com [172.24.31.248])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55QAYl0f855804;
	Thu, 26 Jun 2025 05:34:48 -0500
Message-ID: <b37efc4e-0959-47a0-8fae-6cb35899752e@ti.com>
Date: Thu, 26 Jun 2025 16:04:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: ti: k3-j721s2-common-proc-board:
 Enable DisplayPort-1
To: Jayesh Choudhary <j-choudhary@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <devicetree@vger.kernel.org>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <u-kumar1@ti.com>
References: <20250624082619.324851-1-j-choudhary@ti.com>
 <20250624082619.324851-7-j-choudhary@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250624082619.324851-7-j-choudhary@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_033456_245940_43E05A7F 
X-CRM114-Status: GOOD (  16.35  )
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


On 6/24/2025 1:56 PM, Jayesh Choudhary wrote:
> Enable DSI display for J721S2 EVM.
>
> Add the endpoint nodes to describe connection from:
> DSS => DSI Bridge => DSI to eDP bridge => DisplayPort-1
>
> Set status for all required nodes for DisplayPort-1 as 'okay'.
>
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>   .../dts/ti/k3-j721s2-common-proc-board.dts    | 89 +++++++++++++++++++
>   1 file changed, 89 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
> index 793d50344fad..efe857a50bb1 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
> @@ -93,6 +93,29 @@ vdd_sd_dv: gpio-regulator-TLV71033 {
>   			 <3300000 0x1>;
>   	};
>   
> +	dp1_pwr_3v3: regulator-dp1-prw {
> +		compatible = "regulator-fixed";
> +		regulator-name = "dp1-pwr";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&exp4 1 GPIO_ACTIVE_HIGH>; /* P1 - DP1_PWR_SW_EN */
> +		enable-active-high;
> +		regulator-always-on;

Please check once, if this regulator falls under regulator-always-on case,

I can imagine a case, where DP1 is not used and still regulator is kept on


> +	};
> +
> +	dp1: connector-dp1 {
> +		compatible = "dp-connector";
> +		label = "DP1";
> +		type = "full-size";
> +		dp-pwr-supply = <&dp1_pwr_3v3>;
> +
> +		port {
> +			dp1_connector_in: endpoint {
> +				remote-endpoint = <&dp1_out>;
> +			};
> +		};
> +	};
> +
>   	transceiver1: can-phy1 {
>   		compatible = "ti,tcan1043";
>   		#phy-cells = <0>;
> @@ -563,3 +586,69 @@ &main_mcan5 {
>   	pinctrl-0 = <&main_mcan5_pins_default>;
>   	phys = <&transceiver4>;
>   };
> +
> +&dss {
> +	/*
> +	 * DSS on J721S2-EVM supports DP on VP0 and DSI on VP2.
> +	 * These clock assignments are chosen to enable the following outputs:
> +	 * VP0 - DisplayPort SST
> +	 * VP2 - DSI
> +	 */
> +	status = "okay";
> +	assigned-clocks = <&k3_clks 158 2>,
> +			  <&k3_clks 158 14>;
> +	assigned-clock-parents = <&k3_clks 158 3>,
> +				 <&k3_clks 158 16>;
> +};
> +
> +&dss_ports {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	port@2 {
> +		reg = <2>;
> +		dpi2_out: endpoint {
> +			remote-endpoint = <&dsi0_in>;
> +		};
> +	};
> +};
> +
> +&dsi0_ports {
> +	port@0 {
> +		reg = <0>;
> +		dsi0_out: endpoint {
> +			remote-endpoint = <&dp1_in>;
> +		};
> +	};
> +
> +	port@1 {
> +		reg = <1>;
> +		dsi0_in: endpoint {
> +			remote-endpoint = <&dpi2_out>;
> +		};
> +	};
> +};
> +
> +&dsi_edp_bridge_ports {
> +	port@0 {
> +		reg = <0>;
> +		dp1_in: endpoint {
> +			remote-endpoint = <&dsi0_out>;
> +		};
> +	};
> +
> +	port@1 {
> +		reg = <1>;
> +		dp1_out: endpoint {
> +			remote-endpoint = <&dp1_connector_in>;
> +		};
> +	};
> +};
> +
> +&dphy_tx0 {
> +	status = "okay";
> +};
> +
> +&dsi0 {
> +	status = "okay";
> +};

