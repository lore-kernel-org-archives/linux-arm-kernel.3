Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AAA0E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 17:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RFTki9l8Pd7DO+lJi7BdT1ZPP7s7u+oyjhx6pQO0qZQ=; b=3dvLYwjiWG7TKdMO3rXS2+SebV
	uQDtx4M+dT9xXK5QQEioPhL82sMoKyW674AqfzEjb/ANhhI6N4zCyVoL6TU5V1t5f4foeoTkfkSoA
	w04gqzRngdKi1iOCWo5uRyDmAPxXJi0kVXrEVhKY8Tf8BJ3AOTFJzDdS9+8PWED3oA54VmAb1Krb4
	thNKHefZ3+eMAM0zZrFr/KqQCnNKLPbJRAQpodYyparDLdDVrEY2zzvpD8B4wzDkfDWomvG28VctK
	D4EU5kdOpujsWiAoucC37tTvSOK/OKyLbSE9X4B7XcwisRbC6jq/fQQ6x2x4lTxVli3782Qs9cjHm
	iL72ZfDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKm0-00000002evv-2dKT;
	Thu, 19 Dec 2024 17:57:20 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKZE-00000002bfo-3rW7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 17:44:10 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOKZ3-0001dj-JS; Thu, 19 Dec 2024 18:43:57 +0100
Message-ID: <a30baba6-6252-4c69-b6a7-e4099e823920@pengutronix.de>
Date: Thu, 19 Dec 2024 18:43:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] arm64: dts: imx8mp-skov: use I2C5 for DDC
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Oleksij Rempel
 <o.rempel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241219-skov-dt-updates-v1-0-38bf80dc22df@pengutronix.de>
 <20241219-skov-dt-updates-v1-3-38bf80dc22df@pengutronix.de>
 <Z2RZG7pAElG3TGLx@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <Z2RZG7pAElG3TGLx@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_094408_960961_6CA83F7B 
X-CRM114-Status: GOOD (  24.98  )
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

Hello Frank,

On 19.12.24 18:34, Frank Li wrote:
> On Thu, Dec 19, 2024 at 08:25:27AM +0100, Ahmad Fatoum wrote:
>> The HDMI DDC pads can be muxed either to an i.MX I2C controller or
>> to a limited I2C controller within the Designware HDMI bridge.
>>
>> So far we muxed the pads to the HDMI bridge, but the i.MX I2C controller
>> is the better choice:
> 
> Switch to the i.MX I2C controller because
> 
>>
>>   - We use DDC/CI commands for display brightness configuration, but the
>>     Linux driver refuses[1] transfers to/from address 0x37, because the
>>     controller doesn't support multi-byte requests.
> 
>       Designware HDMI Limited I2C controller doesn't support multi-byte
> requests and display brightness configuration by DDC/CI command need it.
> 
>>
>>   - The driver doesn't support I2C bus recovery, but we need that,
>>     because some HDMI panels used with the board can be flaky.
> 
>       Designware HDMI Limited I2C controller doesn't support I2C bus
> recovery.
> 
>>
>> As the i.MX I2C controller doesn't have either of these limitations,
>> let's make use of it instead.
> 
> Reduntant. can be removed.

Sorry, I am very much open to review feedback, but I fail to see how
your subjective take improves things.

Thanks,
Ahmad




> 
> Frank
>>
>> [1]: https://lore.kernel.org/all/20190722181945.244395-1-mka@chromium.org/
>>
>> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
>> ---
>>  .../boot/dts/freescale/imx8mp-skov-revb-hdmi.dts   | 26 ++++++++++++++++++++--
>>  1 file changed, 24 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dts b/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dts
>> index c1ca69da3cb8..206116be8166 100644
>> --- a/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dts
>> +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dts
>> @@ -9,12 +9,34 @@ / {
>>  	compatible = "skov,imx8mp-skov-revb-hdmi", "fsl,imx8mp";
>>  };
>>
>> +&i2c5 {
>> +	pinctrl-names = "default", "gpio";
>> +	pinctrl-0 = <&pinctrl_i2c5>;
>> +	pinctrl-1 = <&pinctrl_i2c5_gpio>;
>> +	scl-gpios = <&gpio3 26 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>> +	sda-gpios = <&gpio3 27 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>> +	clock-frequency = <100000>;
>> +	status = "okay";
>> +};
>> +
>>  &iomuxc {
>>  	pinctrl_hdmi: hdmigrp {
>>  		fsl,pins = <
>> -			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL		0x1c3
>> -			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA		0x1c3
>>  			MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD			0x19
>>  		>;
>>  	};
>> +
>> +	pinctrl_i2c5: i2c5grp {
>> +		fsl,pins = <
>> +			MX8MP_IOMUXC_HDMI_DDC_SCL__I2C5_SCL			0x400001c2
>> +			MX8MP_IOMUXC_HDMI_DDC_SDA__I2C5_SDA			0x400001c2
>> +		>;
>> +	};
>> +
>> +	pinctrl_i2c5_gpio: i2c5gpiogrp {
>> +		fsl,pins = <
>> +			MX8MP_IOMUXC_HDMI_DDC_SCL__GPIO3_IO26			0x400001c2
>> +			MX8MP_IOMUXC_HDMI_DDC_SDA__GPIO3_IO27			0x400001c2
>> +		>;
>> +	};
>>  };
>>
>> --
>> 2.39.5
>>
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

