Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C24CE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 18:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t1PhOhmC/ntjgpp5zcq/fYqbnOxQcxlnd0kMf7dsF1I=; b=e6aUcC5JhJLwNwdq5rG5AosR7k
	X+2IGtJVXwR7or3HtGMmTgFG66cxOhx84VpLRHfZIQ9sEZTWUhfBo7vV8kEYF6GvhBQakG8ylDPin
	ZzabQBbjwmg6wufz9btRqOXQ5Y9z9sHeodFl33HAOVRs7kesv1NfK/ZQksIpDzI5ORk3/XLv6pN34
	ppGhsetil0iqQv9J4Hue37SQZ5iM3YQs1jt2zDCzmPhOGX1FhnRjK+2volIo1d0DxHeKd1fBc/Rwl
	qLDBu9FZNQYoLc/G3Ko+RNZPtwNA8bmIqCwDRMxU2CEOC3iavYnOs+ZJel8O4YFbcfFQyDLl/PFDs
	qfjt5AgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKvi-00000002gs3-1hsH;
	Thu, 19 Dec 2024 18:07:22 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKgc-00000002dF2-2y50
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 17:51:48 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOKgS-0003qo-Eb; Thu, 19 Dec 2024 18:51:36 +0100
Message-ID: <30dbe486-7e36-426d-8fa4-3ecd83193a10@pengutronix.de>
Date: Thu, 19 Dec 2024 18:51:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] arm64: dts: imx8mp-skov: increase I2C clock
 frequency for RTC
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Oleksij Rempel
 <o.rempel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241219-skov-dt-updates-v1-0-38bf80dc22df@pengutronix.de>
 <20241219-skov-dt-updates-v1-10-38bf80dc22df@pengutronix.de>
 <Z2RcJCaYC2FW3Ks6@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <Z2RcJCaYC2FW3Ks6@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_095146_755814_363FD263 
X-CRM114-Status: GOOD (  19.22  )
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

On 19.12.24 18:47, Frank Li wrote:
> On Thu, Dec 19, 2024 at 08:25:34AM +0100, Ahmad Fatoum wrote:
>> From: Oleksij Rempel <o.rempel@pengutronix.de>
>>
>> The NXP PCF85063TP RTC we use is capable of up to 400 kHz of SCL clock
>> frequency, so let's make use of this instead of the 100 kHz bus frequency
>> we are currently using.
> 
> Increase I2C frequency to 400khz from 100kHz because NXP PCF85063TP RTC
> support it.

Unlike your other suggestions, these is no information lost by rewriting
the commit message as you suggest. I don't mind, but must admit it feels
like bikeshedding. What is your concrete objection to my commit message?

Thanks,
Ahmad


> 
> Frank
> 
>>
>> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
>> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
>> ---
>>  arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
>> index a683f46fcbab..ec7857db7bf0 100644
>> --- a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
>> @@ -333,7 +333,7 @@ reg_nvcc_sd2: LDO5 {
>>  };
>>
>>  &i2c3 {
>> -	clock-frequency = <100000>;
>> +	clock-frequency = <400000>;
>>  	pinctrl-names = "default";
>>  	pinctrl-0 = <&pinctrl_i2c3>;
>>  	status = "okay";
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

