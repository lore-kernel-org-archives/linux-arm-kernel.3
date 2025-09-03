Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C58DCA100C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 09:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7LsFiMwaXNtMD4UGW/F7YfEyj+RV6YjYj1NvvWGVzGU=; b=Ojh5wKKrvu9LNMeE+vQMJFrAWB
	AsEzQvZnlA5bfKGGGIn5ZweHek1Opog93HfEGsCtWne7uYi5sDIXJ9XhAxttxQHP3w9QKlvZHXROC
	ssCH1ovT3wF6M5kqTZlaUJ28WO2kWQqnZHavv05Q3EWp6YVz2l2h74EEYa+rSW/Coa5/wkOx1h+T0
	3HGn72pe4w+8i6S0mFVaO2BVh9bXu61XBRXiceR94JcBxbaeacH6/BbXiZJsKf5LXMzY6oz54IUyZ
	wKOarnFjaO+0hgC/ZIvnXrmBPKHFkPSJNixsSkxdHNJE/IJARcGYA1o0T0IWJjlIaWV+irJfNX4DG
	AHUCJ0MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utkCF-000000060Jf-3hsa;
	Wed, 03 Sep 2025 09:54:31 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utj62-00000005h17-3Rbw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 08:44:04 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1utj5n-00047A-Ka; Wed, 03 Sep 2025 10:43:47 +0200
Message-ID: <e3966efb-9f81-4c01-86f3-c89864a89173@pengutronix.de>
Date: Wed, 3 Sep 2025 10:43:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: imx6ul-tx6ul: Switch away from deprecated
 `phy-reset-gpios`
To: Buday Csaba <buday.csaba@prolan.hu>
Cc: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250815-b4-tx6ul-dt-phy-rst-v1-1-9b65e315d9d3@prolan.hu>
 <fa7e2cef-5242-4f3b-84ea-d77b959f6bdb@pengutronix.de>
 <c85a94ee-59e1-47d6-8200-813bb434caf2@prolan.hu>
 <1bf75411-4a51-4103-b314-a8a7253bafca@pengutronix.de>
 <aLf162kc8_VB163Z@debianbuilder>
Content-Language: en-US, de-DE, de-BE
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <aLf162kc8_VB163Z@debianbuilder>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_014402_860445_581F9C18 
X-CRM114-Status: GOOD (  38.31  )
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

On 9/3/25 10:01 AM, Buday Csaba wrote:
> On Wed, Sep 03, 2025 at 09:50:08AM +0200, Ahmad Fatoum wrote:
>>> [1] https://lore.kernel.org/lkml/20250709133222.48802-4-buday.csaba@prolan.hu/
>>
>> Is this mainline yet?
>>
> 
> No, it is not. It was never the most beautiful piece of code, so I understand
> that.
> 
> But if you could give us some guidance, that would help a lot.
> 
> Specifically:
> 
> 1)  If `phy-reset-gpios` is deprecated, than we should start treating it as
>     such, and not rely on it in future releases. Perhaps we should also add a
>     warning message, when it is found in the device tree.

Disagreed. Deprecated properties should be removed only about clarifying
the impact of the removal on users. Replacing a deprecated property with
an expectation that bootloader board code has deasserted reset is not
acceptable IMO.

> 2)  On the other hand, if it is here to stay for a long time, it should be
>     fixed. Now the gpio is claimed during fec_reset_phy(), and never released.
>     It can not be used by the driver later, like in fec_init(), because the
>     gpio reference is only stored in a local variable of fec_reset_phy().
>     Previous patches that would have stored the reference in the driver were
>     rejected on the grounds that it is deprecated. But if it is not, then we
>     can create a patch that would make it work properly.

Ye, this needs to be solved differently.

> 3)  Andrew pointed out, that resetting a PHY before probing it may cause
>     regressions. That is certainly a valid concern, but for most of the 
>     devices resetting it means starting from a known state, and should be the
>     default. But we could create a device tree property, that controls this
>     behaviour.

Marco had a more involved series to address this:
https://lore.kernel.org/all/20230405-net-next-topic-net-phy-reset-v1-0-7e5329f08002@pengutronix.de/

But it went no where. I don't recall the details.

I think the best you can do with existing bindings is to give your PHY a
compatible that spells out vendor/device ID, e.g. ethernet-phy-id0141.0dd4.

Then Linux can probe the device even while it's in reset.

The downside is that it hardcodes a specific PHY ID, but this may be
acceptable here.

Cheers,
Ahmad

> 
> Regards,
> Csaba
> 
>> Cheers,
>> Ahmad
>>
>>>
>>>>>
>>>>> Co-developed-by: Csaba Buday <buday.csaba@prolan.hu>
>>>>> Signed-off-by: Csaba Buday <buday.csaba@prolan.hu>lan8710 reset
>>>>> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
>>>>> ---
>>>>>   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi | 8 +++++++-
>>>>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
>>>>> index f053358bc9317f8447d65013a18670cb470106b2..0a5e90704ea481b0716d6ff6bc6d2110914d4f31 100644
>>>>> --- a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
>>>>> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
>>>>> @@ -246,7 +246,6 @@ &fec1 {
>>>>>       pinctrl-names = "default";
>>>>>       pinctrl-0 = <&pinctrl_enet1 &pinctrl_enet1_mdio &pinctrl_etnphy0_rst>;
>>>>>       phy-mode = "rmii";
>>>>> -    phy-reset-gpios = <&gpio5 6 GPIO_ACTIVE_LOW>;
>>>>>       phy-supply = <&reg_3v3_etn>;
>>>>>       phy-handle = <&etnphy0>;
>>>>>       status = "okay";
>>>>> @@ -262,6 +261,13 @@ etnphy0: ethernet-phy@0 {
>>>>>               pinctrl-0 = <&pinctrl_etnphy0_int>;
>>>>>               interrupt-parent = <&gpio5>;
>>>>>               interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
>>>>> +            /* Reset SHOULD be a PHY property */
>>>>
>>>> Comment belongs into commit message.
>>>
>>> Agreed.
>>>
>>>>> +            reset-names = "phy";
>>>>> +            reset-gpios = <&gpio5 6 GPIO_ACTIVE_LOW>;
>>>>> +            reset-assert-us = <100>;
>>>>> +            reset-deassert-us = <25000>;
>>>>> +            /* Energy detect sometimes causes link failures */
>>>>> +            smsc,disable-energy-detect;
>>>>
>>>> Unrelated change not described in the commit message.
>>>
>>> Oh, this has accidentally made it into here from our DT. Thanks for spotting it!
>>>
>>>> Cheers,
>>>> Ahmad
>>>>
>>>>>               status = "okay";
>>>>>           };
>>>>>  
>>>>> ---
>>>>> base-commit: 0cc53520e68bea7fb80fdc6bdf8d226d1b6a98d9
>>>>> change-id: 20250815-b4-tx6ul-dt-phy-rst-7afc190a6907
>>>>>
>>>>> Best regards,
>>>>
>>>>
>>>
>>> Bence
>>>
>>>
>>
>>
>> -- 
>> Pengutronix e.K.                           |                             |
>> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
>> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
>> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
>>
> 
> 

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


