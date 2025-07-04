Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD80C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 04:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WD8sfe2YFYOmZs6gSyMvwaJbnuhYswZhRsw7+2d+uh8=; b=JExx5CRKF9xRQ89lY2Tfmnab9l
	mJ/RHxX3nhoB7uU/OnVjNFVZqBAlNAKgno2gwV86S9EpDYRWCWWHPKEMQO3ry6kH+QMeSX+B4XQlr
	vHRQHZ5RAqYkt3TAqxkeQp3gEmAq5h7Ydi8oTvAR0utFAc7FPZ62sjxsEj/jBJlbb5AwIxf1ZC1k8
	Rcqj5KGzHEZzqpYGdygDcBUrFh8PcUYzU2LS8tUhWaDyCCvEbwxae1Be7LG87HcDXMOA1dRjZSFw/
	4r+6Yq9ou/9qpQ+WUlttPPKCF0HTg69WprOuoG1V238fZk1gWroDzNkEADDN98fPOjlR890cTmIgA
	Sa6H/JsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXYT9-0000000DHHl-0RSs;
	Fri, 04 Jul 2025 04:56:15 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXYNo-0000000DGit-1EK9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 04:50:45 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5644oe3u212429;
	Thu, 3 Jul 2025 23:50:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751604640;
	bh=WD8sfe2YFYOmZs6gSyMvwaJbnuhYswZhRsw7+2d+uh8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=piH+/xZNlDizp0UXFQKn1sGm3z/CwNTBdLzVrYGwS5T9YzR8CpRkB6K69kV97wvam
	 enbPPegakpC0jK7gY3I9N7G8ilZVD5zdshM6fDL8mnuSK76gOPzPwprGPP88raSPz6
	 S0D8PKzruZ9eJh1PP3RqpysFHy1HK7276rU9HUCs=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5644oeUi1416277
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 3 Jul 2025 23:50:40 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 3
 Jul 2025 23:50:39 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 3 Jul 2025 23:50:39 -0500
Received: from [172.24.227.245] (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5644oYtb2346939;
	Thu, 3 Jul 2025 23:50:35 -0500
Message-ID: <c9e0c113-f663-426b-8a23-d82300987b98@ti.com>
Date: Fri, 4 Jul 2025 10:20:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] arm64: dts: ti: Add support for AM62D2-EVM
To: Paresh Bhagat <p-bhagat@ti.com>, <nm@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>,
        <devarsht@ti.com>, <s-vadapalli@ti.com>, <andrew@lunn.ch>
References: <20250627115753.2246881-1-p-bhagat@ti.com>
 <20250627115753.2246881-5-p-bhagat@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20250627115753.2246881-5-p-bhagat@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_215044_430113_409B8744 
X-CRM114-Status: UNSURE (   7.36  )
X-CRM114-Notice: Please train this message.
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



On 27/06/25 17:27, Paresh Bhagat wrote:
> +&main_pmx0 {
> +	main_uart0_pins_default: main-uart0-default-pins {
> +		pinctrl-single,pins = <
> +			AM62DX_IOPAD(0x01c8, PIN_INPUT, 0) /* (E14) UART0_RXD */
> +			AM62DX_IOPAD(0x01cc, PIN_OUTPUT, 0) /* (D15) UART0_TXD */
> +		>;
> +		bootph-all;
> +	};
> +
> +	main_i2c0_pins_default: main-i2c0-default-pins {
> +		pinctrl-single,pins = <
> +			AM62DX_IOPAD(0x01e0, PIN_INPUT_PULLUP, 0) /* (D17) I2C0_SCL */
> +			AM62DX_IOPAD(0x01e4, PIN_INPUT_PULLUP, 0) /* (E16) I2C0_SDA */
> +		>;
> +		bootph-all;
> +	};
> +
> +	main_i2c1_pins_default: main-i2c1-default-pins {
> +		pinctrl-single,pins = <
> +			AM62DX_IOPAD(0x01e8, PIN_INPUT_PULLUP, 0) /* (C17) I2C1_SCL */
> +			AM62DX_IOPAD(0x01ec, PIN_INPUT_PULLUP, 0) /* (E17) I2C1_SDA */
> +		>;
> +		bootph-all;
> +	};
> +
> +	main_i2c2_pins_default: main-i2c2-default-pins {
> +		pinctrl-single,pins = <
> +			AM62DX_IOPAD(0x00b0, PIN_INPUT_PULLUP, 1) /* (M22) GPMC0_CSn2.I2C2_SCL */
> +			AM62DX_IOPAD(0x00b4, PIN_INPUT_PULLUP, 1) /* (M20) GPMC0_CSn3.I2C2_SDA */
> +		>;
> +	};
> +
> +	main_mmc0_pins_default: main-mmc0-default-pins {
> +		pinctrl-single,pins = <
> +			AM62DX_IOPAD(0x0220, PIN_INPUT_PULLUP, 0) /* (Y6) MMC0_CMD */
> +			AM62DX_IOPAD(0x0218, PIN_OUTPUT, 0) /* (AB7) MMC0_CLK */
> +			AM62DX_IOPAD(0x0214, PIN_INPUT_PULLUP, 0) /* (AA6) MMC0_DAT0 */
> +			AM62DX_IOPAD(0x0210, PIN_INPUT_PULLUP, 0) /* (AB6) MMC0_DAT1 */
> +			AM62DX_IOPAD(0x020c, PIN_INPUT_PULLUP, 0) /* (Y7) MMC0_DAT2 */
> +			AM62DX_IOPAD(0x0208, PIN_INPUT_PULLUP, 0) /* (AA7) MMC0_DAT3 */
> +			AM62DX_IOPAD(0x0204, PIN_INPUT_PULLUP, 0) /* (Y8) MMC0_DAT4 */
> +			AM62DX_IOPAD(0x0200, PIN_INPUT_PULLUP, 0) /* (W7) MMC0_DAT5 */
> +			AM62DX_IOPAD(0x01fc, PIN_INPUT_PULLUP, 0) /* (W9) MMC0_DAT6 */
> +			AM62DX_IOPAD(0x01f8, PIN_INPUT_PULLUP, 0) /* (AB8) MMC0_DAT7 */
> +		>;
> +		bootph-all;
> +	};
> +
> +	main_mmc1_pins_default: main-mmc1-default-pins {
> +		pinctrl-single,pins = <
> +			AM62DX_IOPAD(0x023c, PIN_INPUT, 0) /* (C21) MMC1_CMD */
> +			AM62DX_IOPAD(0x0234, PIN_OUTPUT, 0) /* (E22) MMC1_CLK */
> +			AM62DX_IOPAD(0x0230, PIN_INPUT, 0) /* (B22) MMC1_DAT0 */
> +			AM62DX_IOPAD(0x022c, PIN_INPUT_PULLUP, 0) /* (D21) MMC1_DAT1 */
> +			AM62DX_IOPAD(0x0228, PIN_INPUT_PULLUP, 0) /* (C22) MMC1_DAT2 */
> +			AM62DX_IOPAD(0x0224, PIN_INPUT_PULLUP, 0) /* (D22) MMC1_DAT3 */

Double check PULLUP here.. There seems to be external PULLUPs on the
board. Do you still need internal pulls?

> +			AM62DX_IOPAD(0x0240, PIN_INPUT, 0) /* (E18) MMC1_SDCD */

> +			AM62DX_IOPAD(0x0244, PIN_INPUT, 0) /* (D18) MMC1_SDWP */

This pin isn't needed/connected right?

> +		>;
> +		bootph-all;
> +	};
> +
> +	main_mdio0_pins_default: main-mdio0-default-pins {
> +		pinctrl-single,pins = <
> +			AM62DX_IOPAD(0x160, PIN_OUTPUT, 0) /* (V12) MDIO0_MDC */
> +			AM62DX_IOPAD(0x15c, PIN_INPUT, 0) /* (V13) MDIO0_MDIO */
> +		>;
> +		bootph-all;
> +	};
> +
> +	main_rgmii1_pins_default: main-rgmii1-default-pins {
> +		pinctrl-single,pins = <
> +			AM62DX_IOPAD(0x14c, PIN_INPUT, 0) /* (AB16) RGMII1_RD0 */
> +			AM62DX_IOPAD(0x150, PIN_INPUT, 0) /* (V15) RGMII1_RD1 */
> +			AM62DX_IOPAD(0x154, PIN_INPUT, 0) /* (W15) RGMII1_RD2 */
> +			AM62DX_IOPAD(0x158, PIN_INPUT, 0) /* (V14) RGMII1_RD3 */
> +			AM62DX_IOPAD(0x148, PIN_INPUT, 0) /* (AA16) RGMII1_RXC */
> +			AM62DX_IOPAD(0x144, PIN_INPUT, 0) /* (AA15) RGMII1_RX_CTL */
> +			AM62DX_IOPAD(0x134, PIN_INPUT, 0) /* (Y17) RGMII1_TD0 */
> +			AM62DX_IOPAD(0x138, PIN_INPUT, 0) /* (V16) RGMII1_TD1 */
> +			AM62DX_IOPAD(0x13c, PIN_INPUT, 0) /* (Y16) RGMII1_TD2 */
> +			AM62DX_IOPAD(0x140, PIN_INPUT, 0) /* (AA17) RGMII1_TD3 */
> +			AM62DX_IOPAD(0x0130, PIN_OUTPUT, 0) /* (AB17) RGMII1_TXC */
> +			AM62DX_IOPAD(0x012c, PIN_OUTPUT, 0) /* (W16) RGMII1_TX_CTL */
> +		>;
> +		bootph-all;
> +	};
> +
> +	main_rgmii2_pins_default: main-rgmii2-default-pins {
> +		pinctrl-single,pins = <
> +			AM62DX_IOPAD(0x0184, PIN_INPUT, 0) /* (AA21) RGMII2_RD0 */
> +			AM62DX_IOPAD(0x0188, PIN_INPUT, 0) /* (Y20) RGMII2_RD1 */
> +			AM62DX_IOPAD(0x018c, PIN_INPUT, 0) /* (AB21) RGMII2_RD2 */
> +			AM62DX_IOPAD(0x0190, PIN_INPUT, 0) /* (AB20) RGMII2_RD3 */
> +			AM62DX_IOPAD(0x0180, PIN_INPUT, 0) /* (AA20) RGMII2_RXC */
> +			AM62DX_IOPAD(0x017c, PIN_INPUT, 0) /* (W18) RGMII2_RX_CTL */
> +			AM62DX_IOPAD(0x016c, PIN_INPUT, 0) /* (AA19) RGMII2_TD0 */
> +			AM62DX_IOPAD(0x0170, PIN_INPUT, 0) /* (Y18) RGMII2_TD1 */
> +			AM62DX_IOPAD(0x0174, PIN_INPUT, 0) /* (AA18) RGMII2_TD2 */
> +			AM62DX_IOPAD(0x0178, PIN_INPUT, 0) /* (W17) RGMII2_TD3 */
> +			AM62DX_IOPAD(0x0168, PIN_OUTPUT, 0) /* (AB19) RGMII2_TXC */
> +			AM62DX_IOPAD(0x0164, PIN_OUTPUT, 0) /* (Y19) RGMII2_TX_CTL */
> +		>;
> +		bootph-all;
> +	};
> +
> +	main_gpio1_ioexp_intr_pins_default: main-gpio1-ioexp-intr-default-pins {
> +		pinctrl-single,pins = <
> +			AM62DX_IOPAD(0x01d4, PIN_INPUT, 7) /* (C15) UART0_RTSn.GPIO1_23 */
> +		>;
> +	};
> +
> +	vddshv_sdio_pins_default: vddshv-sdio-default-pins {
> +		pinctrl-single,pins = <
> +			AM62DX_IOPAD(0x1F4, PIN_OUTPUT, 7) /* (M19) GPMC0_CLK.GPIO1_31 */

					^^^ use lower case hexadecimals

> +		>;
> +		bootph-all;
> +	};
> +};
> +

-- 
Regards
Vignesh
https://ti.com/opensource


