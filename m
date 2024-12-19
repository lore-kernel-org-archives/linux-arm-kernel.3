Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC1BBE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 17:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2keXyRYGTYke+Ow0tLWWzxl5XV1mPe5UAeszke21Y0I=; b=n44XcWX8Bj2zMLWNgq8kEtgQw7
	NiNAi4ye/+G7aFLOV1GfnSfNCTM61AQfGcr3uWZDxBh+oevexs/mp0188yMLpGdctKDS7187Sb2iR
	BkT+gqi1eBFH4mpoPjhOh4Vdk1nYSuOJLaBU/3+o/PDYPD7O+6UrFIaLfd8e+UBiq6x+009rN0YvB
	zeeyhhO0xSG2aUxb7Hk9bKoiHwfapXnhjGfUromVD0AQGS8FVhslceoQ7VyNejWyeIp+Jn+kYDAnv
	mquUXP0vk5E86txuZBWNfRDHJpLxOvO4Ys0lWE+JP/oL1semGdc7g9LVBCLLE4dok7s6Y7wJHXm4Q
	LpcvEnfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKij-00000002drU-2Op8;
	Thu, 19 Dec 2024 17:53:57 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKVz-00000002b5t-2VF6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 17:40:49 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOKVh-0000ky-NV; Thu, 19 Dec 2024 18:40:29 +0100
Message-ID: <f085aa33-f0b7-49e7-bbfc-d3728d3e3e8c@pengutronix.de>
Date: Thu, 19 Dec 2024 18:40:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] arm64: dts: imx8mp-skov: describe HDMI display
 pipeline
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Oleksij Rempel
 <o.rempel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241219-skov-dt-updates-v1-0-38bf80dc22df@pengutronix.de>
 <20241219-skov-dt-updates-v1-4-38bf80dc22df@pengutronix.de>
 <Z2RZY/gvQ0qqDjqv@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <Z2RZY/gvQ0qqDjqv@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_094047_649536_E77E82F5 
X-CRM114-Status: GOOD (  20.85  )
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

On 19.12.24 18:35, Frank Li wrote:
> On Thu, Dec 19, 2024 at 08:25:28AM +0100, Ahmad Fatoum wrote:
>> From: Oleksij Rempel <o.rempel@pengutronix.de>
>>
>> Back when this device tree was first added, there were no i.MX8MP
>> HDMI bindings upstream yet. This has changed now, so let's use them
>> to describe the HDMI on the imx8mp-skov-revb-hdmi board.
> 
> Skip your story.

I am sure you don't mean it this way, but the way you phrase it
sounds a bit rude.

> Just said
> 
> Add HDMI display pipeline for imx8mp-skov-revb-hdmi board.

That's already what my commit message title says.
I am not a fan of just repeating the commit message title
in the commit message body.

Unless you have a concrete problem with my commit message,
I'd prefer to keep it the way it is.

Thanks,
Ahmad

> 
> Frank
>>
>> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
>> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
>> ---
>>  .../boot/dts/freescale/imx8mp-skov-revb-hdmi.dts      | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dts b/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dts
>> index 206116be8166..32a429437cbd 100644
>> --- a/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dts
>> +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dts
>> @@ -9,6 +9,21 @@ / {
>>  	compatible = "skov,imx8mp-skov-revb-hdmi", "fsl,imx8mp";
>>  };
>>
>> +&hdmi_pvi {
>> +	status = "okay";
>> +};
>> +
>> +&hdmi_tx {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pinctrl_hdmi>;
>> +	ddc-i2c-bus = <&i2c5>;
>> +	status = "okay";
>> +};
>> +
>> +&hdmi_tx_phy {
>> +	status = "okay";
>> +};
>> +
>>  &i2c5 {
>>  	pinctrl-names = "default", "gpio";
>>  	pinctrl-0 = <&pinctrl_i2c5>;
>> @@ -19,6 +34,10 @@ &i2c5 {
>>  	status = "okay";
>>  };
>>
>> +&lcdif3 {
>> +	status = "okay";
>> +};
>> +
>>  &iomuxc {
>>  	pinctrl_hdmi: hdmigrp {
>>  		fsl,pins = <
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

