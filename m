Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95EACC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 11:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kRolmEIKli9p4hwGQbbTqvQScgVEcFqSWTOIe6ZE1zk=; b=oG1vEMrD/ct3+mLmWvIw1nmhdO
	MJ+RnEvcmHvU9JexpfVSP8xyVt5GgbF7XcdWWRtFxcY+PZpy1m/CHlaLM0TxMrC7RlyLSgCVj5kWq
	Eg6+pOqSlj5QcVVkzjAOe8erXn0RMdQOzp0Zv5My59RY7OIIogM9ZuDRNH6FPtKqzo/eNHg84pnd6
	aJznRu8lb0hb0AtsimrHoxw3E38xMqu//0xHnqtdh0zp/VMOwfuhDKPLggyGSEMzE+/24rbKRcRaF
	v4jtE6fm0w8GQ0alkFNuHbEu+ve/Fl6W/mpdz4TpcPpEO/T9lUJLvhB728HqdV9+SVed3CYNA+dL/
	QZXwZ8Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUkhC-0000000BOHX-0nQa;
	Thu, 26 Jun 2025 11:23:10 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUjoH-0000000BGuZ-0RVH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 10:26:26 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55QAQKgr1717299;
	Thu, 26 Jun 2025 05:26:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750933580;
	bh=kRolmEIKli9p4hwGQbbTqvQScgVEcFqSWTOIe6ZE1zk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Dqr/FcpZtcob14n36+suv1WrtLyCFM7my+SoTgaYneC/rWMNHD0nx4t74xxVlCBBG
	 Yi4lAvl/CXg4E3v1FMPLCOJFlccduD9LdmFLkHm1td6mVCaZW9IhhPIo26z2QT6a2H
	 h1TNPpXsYCyB+c5YjclgVOdMfaQZuzuSPjN3ckuw=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55QAQKaf1892556
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 26 Jun 2025 05:26:20 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 26
 Jun 2025 05:26:19 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 26 Jun 2025 05:26:19 -0500
Received: from [172.24.31.248] (lt5cd2489kgj.dhcp.ti.com [172.24.31.248])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55QAQFXk1106020;
	Thu, 26 Jun 2025 05:26:16 -0500
Message-ID: <a5b61958-98fa-48a7-9499-b6e238c5945a@ti.com>
Date: Thu, 26 Jun 2025 15:56:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] arm64: dts: ti: k3-j721s2-common-proc-board: Add
 main_i2c4 instance
To: Jayesh Choudhary <j-choudhary@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <devicetree@vger.kernel.org>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <u-kumar1@ti.com>
References: <20250624082619.324851-1-j-choudhary@ti.com>
 <20250624082619.324851-5-j-choudhary@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250624082619.324851-5-j-choudhary@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_032625_239444_114D73D9 
X-CRM114-Status: GOOD (  12.39  )
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
> Add dt node for main_i2c4 instance along with required pinmuxing.
> Also add the gpio expander 'exp4' required by display connector.
>
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>   .../dts/ti/k3-j721s2-common-proc-board.dts    | 24 +++++++++++++++++++
>   1 file changed, 24 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
> index e2fc1288ed07..793d50344fad 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
> @@ -148,6 +148,13 @@ J721S2_IOPAD(0x060, PIN_INPUT_PULLUP, 13) /* (AC27) MCASP2_AXR1.I2C3_SDA */
>   		>;
>   	};
>   
> +	main_i2c4_pins_default: main-i2c4-default-pins {
> +		pinctrl-single,pins = <
> +			J721S2_IOPAD(0x014, PIN_INPUT_PULLUP, 8) /* (AD25) I2C4_SCL */

Please check once for i2c clock, pin should be in input or output pull 
up mode.


> +			J721S2_IOPAD(0x010, PIN_INPUT_PULLUP, 8) /* (AF28) I2C4_SDA */
> +		>;
> +	};
> +
>   	main_i2c5_pins_default: main-i2c5-default-pins {
>   		pinctrl-single,pins = <
>   			J721S2_IOPAD(0x01c, PIN_INPUT, 8) /* (Y24) MCAN15_TX.I2C5_SCL */
> @@ -370,6 +377,23 @@ exp2: gpio@22 {
>   	};
>   };
>   
> +&main_i2c4 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&main_i2c4_pins_default>;
> +	clock-frequency = <400000>;
> +
> +	exp4: gpio@20 {
> +		compatible = "ti,tca6408";
> +		reg = <0x20>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		gpio-line-names = "DP0_PWR_SW_EN", "DP1_PWR_SW_EN", "UB981_PDB",
> +				  "UB981_GPIO0", "UB981_GPIO1", "UB981_GPIO2",
> +				  "UB981_GPIO3", "PWR_SW_CNTL_DSI0#";
> +	};
> +};
> +
>   &main_i2c5 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&main_i2c5_pins_default>;

