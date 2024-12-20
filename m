Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F13E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 09:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4y0oA6OzK6x/TsPEG0NBhvEyUJ8Y++w2Rui5kZRnx5c=; b=Vfyu3F8Y8fTvjE3XXgDrKFocka
	36DdLtlo4lQ0cNvcv5B9tbh39TGMaEnYBhh67ac1P2GHx+AKl8aXCrGoblPLLRz03OzZyikW+7Oqs
	boglhy3+38zfG2uGdClQl5DW9cVynYnztArDZrUcoKiv/yFKLNoHFYQ3oN2yitS/GmpOZDSYsUx3z
	GXxFySwSyYeXeUQl/mDw1FWRqcgriRXhCU9sE+L4jwFHihhlgC92jUj7DmEOdhJWJUscywWyEpxv7
	rkR4KOnxNLgxoODFD0zN9ocJfuNw68HfLR69wBymq7bdEx9saw3gha+crNBSa5EmWT4X8QApfuZPk
	Txxh/5jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOZ5W-00000004OB7-2HUq;
	Fri, 20 Dec 2024 09:14:26 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOZ4D-00000004NgB-3I1p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 09:13:07 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOZ41-00023l-Cx; Fri, 20 Dec 2024 10:12:53 +0100
Message-ID: <2ae085fa-6f13-4eb7-88c1-e625309fc35e@pengutronix.de>
Date: Fri, 20 Dec 2024 10:12:49 +0100
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
 <30dbe486-7e36-426d-8fa4-3ecd83193a10@pengutronix.de>
 <Z2Rw8qnn9hULyh8l@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <Z2Rw8qnn9hULyh8l@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_011305_824637_3BF6DF24 
X-CRM114-Status: GOOD (  26.17  )
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

On 19.12.24 20:16, Frank Li wrote:
> On Thu, Dec 19, 2024 at 06:51:35PM +0100, Ahmad Fatoum wrote:
>> On 19.12.24 18:47, Frank Li wrote:
>>> On Thu, Dec 19, 2024 at 08:25:34AM +0100, Ahmad Fatoum wrote:
>>>> From: Oleksij Rempel <o.rempel@pengutronix.de>
>>>>
>>>> The NXP PCF85063TP RTC we use is capable of up to 400 kHz of SCL clock
>>>> frequency, so let's make use of this instead of the 100 kHz bus frequency
>>>> we are currently using.
>>>
>>> Increase I2C frequency to 400khz from 100kHz because NXP PCF85063TP RTC
>>> support it.
>>
>> Unlike your other suggestions, these is no information lost by rewriting
>> the commit message as you suggest. I don't mind, but must admit it feels
>> like bikeshedding. What is your concrete objection to my commit message?
> 
> According to
> https://docs.kernel.org/process/submitting-patches.html
> 
> Describe your changes in imperative mood, e.g. “make xyzzy do frotz”
> instead of “[This patch] makes xyzzy do frotz” or
> “[I] changed xyzzy to do frotz”, as if you are giving orders to the
> codebase to change its behaviour.

I have to disagree with your interpretation. The imperative mood is primarily
expected for commit message titles, but if you take a look at normal commit
message _bodies_ that make it into the kernel, you'll find that a whole lot
of them start off like I do: Describe the situation and then what's done about
it.

I personally find that this is often easier to follow than just having two
imperatives back-to-back.

I have just Cc'd you on an RFC patch to amend the documentation you linked
to reflect this. I am happy to continue the discussion over there:

https://lore.kernel.org/workflows/20241220-submitting-patches-imperative-v1-0-ee874c1859b3@pengutronix.de/T/#t

Thanks,
Ahmad

> 
> Generally, avoid use
> 
> "this patch ..."
> "let's ...."
> "we do ... for ... "
> 
> Just simple said
> 
> Do ... to ...
> Do ... because ...
> 
> Frank
> 
>>
>> Thanks,
>> Ahmad
>>
>>
>>>
>>> Frank
>>>
>>>>
>>>> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
>>>> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
>>>> ---
>>>>  arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
>>>> index a683f46fcbab..ec7857db7bf0 100644
>>>> --- a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
>>>> +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
>>>> @@ -333,7 +333,7 @@ reg_nvcc_sd2: LDO5 {
>>>>  };
>>>>
>>>>  &i2c3 {
>>>> -	clock-frequency = <100000>;
>>>> +	clock-frequency = <400000>;
>>>>  	pinctrl-names = "default";
>>>>  	pinctrl-0 = <&pinctrl_i2c3>;
>>>>  	status = "okay";
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

