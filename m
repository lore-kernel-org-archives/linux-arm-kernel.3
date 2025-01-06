Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6F9E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 15:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=doKqOtbmtdZeFs8BJV5D5NDjyYbH2KQ6uLFTpD5rQ10=; b=fAjokf1WM8liN6lB/c5rqbWqH9
	MyAbXbZb4n/7AX9mi6BdFWC/Yf+aiYvPzz5HcgIjYIZygyMxyslL7NiCgTYDJAn9mvswqvo/huAOA
	+A8SSHjD18WQv5hoKPY8JisJzoABTq89ymj3UZo+ukMLNS3P1ljyzxuTCaD6cuNL37gOzDS29CHBJ
	cRIkRA21M6X4mvLaDkYnb49GU6/2+xslu4ZWnbxeI5yZ+igMD2eYG3fzsAUGpkyG+3y8VGxf/4aj0
	WhA615pUK0BAPb7Tfi/2Mizy1QDq9/nhuOOITit/89fiU1aZ7YS9Q883CNE9OwT3DMVO4cAYMVmK5
	EHoxSDBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUp2T-00000001lvz-24ud;
	Mon, 06 Jan 2025 15:29:09 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUp1H-00000001lbd-2wiA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 15:27:57 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tUp14-0001QG-DH; Mon, 06 Jan 2025 16:27:42 +0100
Message-ID: <d4728cc0-8f1b-4c0a-8133-527d68643d26@pengutronix.de>
Date: Mon, 6 Jan 2025 16:27:41 +0100
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
 <a30baba6-6252-4c69-b6a7-e4099e823920@pengutronix.de>
 <Z2RzoITPUmZFoX09@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <Z2RzoITPUmZFoX09@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_072755_739258_C96A0863 
X-CRM114-Status: GOOD (  23.49  )
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

On 19.12.24 20:27, Frank Li wrote:
> On Thu, Dec 19, 2024 at 06:43:56PM +0100, Ahmad Fatoum wrote:
>> Hello Frank,
>>
>> On 19.12.24 18:34, Frank Li wrote:
>>> On Thu, Dec 19, 2024 at 08:25:27AM +0100, Ahmad Fatoum wrote:
>>>> The HDMI DDC pads can be muxed either to an i.MX I2C controller or
>>>> to a limited I2C controller within the Designware HDMI bridge.
>>>>
>>>> So far we muxed the pads to the HDMI bridge, but the i.MX I2C controller
>>>> is the better choice:
>>>
>>> Switch to the i.MX I2C controller because
>>>
>>>>
>>>>   - We use DDC/CI commands for display brightness configuration, but the
>>>>     Linux driver refuses[1] transfers to/from address 0x37, because the
>>>>     controller doesn't support multi-byte requests.
>>>
>>>       Designware HDMI Limited I2C controller doesn't support multi-byte
>>> requests and display brightness configuration by DDC/CI command need it.
>>>
>>>>
>>>>   - The driver doesn't support I2C bus recovery, but we need that,
>>>>     because some HDMI panels used with the board can be flaky.
>>>
>>>       Designware HDMI Limited I2C controller doesn't support I2C bus
>>> recovery.
>>>
>>>>
>>>> As the i.MX I2C controller doesn't have either of these limitations,
>>>> let's make use of it instead.
>>>
>>> Reduntant. can be removed.
>>
>> Sorry, I am very much open to review feedback, but I fail to see how
>> your subjective take improves things.
> 
> Ref https://docs.kernel.org/process/submitting-patches.html
> 
> "Describe your changes in imperative mood, e.g. “make xyzzy do frotz”
> instead of “[This patch] makes xyzzy do frotz” or “[I] changed xyzzy to do
> frotz”, as if you are giving orders to the codebase to change its behaviour."
> 
> Avoid use "we(same as "I" in above example) ..."

We is replaced by passive voice in v2.

Cheers,
Ahmad

> 
> Frank
> 
>>
>> Thanks,
>> Ahmad
>>
>>
>>
>>
>>>
>>> Frank
>>>>
>>>> [1]: https://lore.kernel.org/all/20190722181945.244395-1-mka@chromium.org/
>>>>
>>>> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
>>>> ---
>>>>  .../boot/dts/freescale/imx8mp-skov-revb-hdmi.dts   | 26 ++++++++++++++++++++--
>>>>  1 file changed, 24 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dts b/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dts
>>>> index c1ca69da3cb8..206116be8166 100644
>>>> --- a/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dts
>>>> +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dts
>>>> @@ -9,12 +9,34 @@ / {
>>>>  	compatible = "skov,imx8mp-skov-revb-hdmi", "fsl,imx8mp";
>>>>  };
>>>>
>>>> +&i2c5 {
>>>> +	pinctrl-names = "default", "gpio";
>>>> +	pinctrl-0 = <&pinctrl_i2c5>;
>>>> +	pinctrl-1 = <&pinctrl_i2c5_gpio>;
>>>> +	scl-gpios = <&gpio3 26 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>>>> +	sda-gpios = <&gpio3 27 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>>>> +	clock-frequency = <100000>;
>>>> +	status = "okay";
>>>> +};
>>>> +
>>>>  &iomuxc {
>>>>  	pinctrl_hdmi: hdmigrp {
>>>>  		fsl,pins = <
>>>> -			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL		0x1c3
>>>> -			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA		0x1c3
>>>>  			MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD			0x19
>>>>  		>;
>>>>  	};
>>>> +
>>>> +	pinctrl_i2c5: i2c5grp {
>>>> +		fsl,pins = <
>>>> +			MX8MP_IOMUXC_HDMI_DDC_SCL__I2C5_SCL			0x400001c2
>>>> +			MX8MP_IOMUXC_HDMI_DDC_SDA__I2C5_SDA			0x400001c2
>>>> +		>;
>>>> +	};
>>>> +
>>>> +	pinctrl_i2c5_gpio: i2c5gpiogrp {
>>>> +		fsl,pins = <
>>>> +			MX8MP_IOMUXC_HDMI_DDC_SCL__GPIO3_IO26			0x400001c2
>>>> +			MX8MP_IOMUXC_HDMI_DDC_SDA__GPIO3_IO27			0x400001c2
>>>> +		>;
>>>> +	};
>>>>  };
>>>>
>>>> --
>>>> 2.39.5
>>>>
>>>
>>
>>
>> --
>> Pengutronix e.K.                           |                             |
>> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
>> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
>> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

