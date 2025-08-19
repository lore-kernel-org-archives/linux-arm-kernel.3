Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47565CA0EE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 05:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4wN2pzI1ikS5r+rVDU7HKCplVqluQG6zRxAmzPk80T4=; b=t+E6RNNNroK5263j9CMVOam1k6
	e7Eb5rgdK4JAwnrVj+5oK1qoGZbuDvNpiY4swoCkj4hxnLxLuOj2X+XR09QxKRCFh27YZ6PMsKtmj
	34EytsNkyVjLuBO3U9K5AEjfzwfQIIVR56+Ps4wx788anXdKzNI0jPENeMJ/vMaqpbqsMj4B5FAgU
	56yiM9fUr18eX0X9cE72dRpoCwY1tjlrmibev2aRHzqjKMfFueon86Hqb4ke/mkHNHmFP86RJHFx2
	La4clJJpjKvi9UFVhP+goCPSPezatj7BCQq2RQKgWbmCmicqPyYp7r4q8H+4W7OZEwDRK4FS1mU3u
	7gXnD7yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoEX6-00000009PGu-3BuJ;
	Tue, 19 Aug 2025 05:05:16 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoEUV-00000009P5J-0zmy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 05:02:36 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57J52PBK3322171;
	Tue, 19 Aug 2025 00:02:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755579745;
	bh=4wN2pzI1ikS5r+rVDU7HKCplVqluQG6zRxAmzPk80T4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=xxNHPMLD21aJEZMol/9Gl0h+e6ywGSD47K9wWWqWYiOg/p2NHZQI3tgr/kdDfX0fc
	 YYcpBDTh0znMgdfVIQeGwCE8tUwgBVwqMtIYluOh7LMjp2CrIddr3ImY3NlyOi0Dz2
	 uNVfSV2tDE3x+VmdBjbmf+gCCOUCXdPNMSTyR1AY=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57J52P1B337947
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 19 Aug 2025 00:02:25 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 19
 Aug 2025 00:02:24 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 19 Aug 2025 00:02:24 -0500
Received: from [172.24.20.139] (lt5cd2489kgj.dhcp.ti.com [172.24.20.139])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57J52I422442985;
	Tue, 19 Aug 2025 00:02:19 -0500
Message-ID: <2440e1e4-e594-4037-8856-1181acb47b6e@ti.com>
Date: Tue, 19 Aug 2025 10:32:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] arm64: dts: ti: k3-j721e-main: Add DSI and
 DPHY-TX
To: Harikrishna Shenoy <h-shenoy@ti.com>, <neil.armstrong@linaro.org>,
        <jessica.zhang@oss.qualcomm.com>, <airlied@gmail.com>,
        <simona@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
        <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <vigneshr@ti.com>, <kristo@kernel.org>, <thierry.reding@gmail.com>,
        <sam@ravnborg.org>, <dri-devel@lists.freedesktop.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <s-jain1@ti.com>, <devarsht@ti.com>, <u-kumar1@ti.com>
References: <20250818154746.1373656-1-h-shenoy@ti.com>
 <20250818154746.1373656-3-h-shenoy@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250818154746.1373656-3-h-shenoy@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_220235_374223_19EABA24 
X-CRM114-Status: GOOD (  17.26  )
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


On 8/18/2025 9:17 PM, Harikrishna Shenoy wrote:
> From: Rahul T R <r-ravikumar@ti.com>
>
> TI's J721E SoC supports a DPI to DSI video signal conversion bridge on
> it's platform bus. The IP is from Cadence, and it has a custom TI
> wrapper around it to facilitate integration.
>
> This IP takes the DPI video signals from DSS and alongwith the DPHY IP,
> it transmits DSI video signals out of the SoC.
>
> Add support for DSI bridge and the DPHY-TX.
>
> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 31 +++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> index 5bd0d36bf33e..ce34d68a70f2 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> @@ -1881,6 +1881,37 @@ port@4 {
>   		};
>   	};
>   
> +	dphy2: phy@4480000 {
> +		compatible = "ti,j721e-dphy";
> +		reg = <0x0 0x04480000 0x0 0x1000>;

Please check format change to <0x00 0x04480000 0x00 0x1000> >


> +		clocks = <&k3_clks 296 1>, <&k3_clks 296 3>;
> +		clock-names = "psm", "pll_ref";
> +		#phy-cells = <0>;
> +		power-domains = <&k3_pds 296 TI_SCI_PD_EXCLUSIVE>;
> +		assigned-clocks = <&k3_clks 296 3>;
> +		assigned-clock-parents = <&k3_clks 296 4>;
> +		assigned-clock-rates = <19200000>;
> +		status = "disabled";
> +	};
> +
> +	dsi0: dsi@4800000 {
> +		compatible = "ti,j721e-dsi";
> +		reg = <0x0 0x04800000 0x0 0x100000>, <0x0 0x04710000 0x0 0x100>;
> +		clocks = <&k3_clks 150 1>, <&k3_clks 150 5>;
> +		clock-names = "dsi_p_clk", "dsi_sys_clk";
> +		power-domains = <&k3_pds 150 TI_SCI_PD_EXCLUSIVE>;
> +		interrupt-parent = <&gic500>;

I think default parent is gic, may be you can avoid above line


> +		interrupts = <GIC_SPI 600 IRQ_TYPE_LEVEL_HIGH>;
> +		phys = <&dphy2>;
> +		phy-names = "dphy";
> +		status = "disabled";
> +
> +		dsi0_ports: ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +	};
> +
>   	dss: dss@4a00000 {
>   		compatible = "ti,j721e-dss";
>   		reg =

