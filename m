Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4869CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 17:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J7Yrac2PmNufTz+iqk5f3Mxi+CfukBzkGS3LmPSCGKo=; b=5C5LPQ/lQreMquEpg4WcEF4lcN
	+kkIZkBYdhxZfQ7JcrNWgArXPtS4wV0sk+OiGRMjcA3im0FgSfmHcD/k5RXv+6YoITQo9nnzje1Es
	A1Cfi5qdG3nQrVRM1JG3+7HotQ893sMUMXeFoj+nfCh3Op1L0izw0weG6TRG17xfdsf0oj1y/Ddfa
	yEjmuDA1+H4wmbMqqNqPXi3tX2tXM5H/1RXUUvTIA9NicZe+dMR+nszKdu5ZJnhkxPT8qXGwXhRWh
	c5Oqfm9cpAWLDji0RcZxMt/ON5Eu0SB/30MPrjSicnk6wNewOWOkX2uTx/HwiUTSMelF+GL7mjRM/
	6oqS3dKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyZdN-00000008eMY-1XKF;
	Tue, 16 Sep 2025 17:38:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyZdL-00000008eLX-0Gen
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 17:38:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758044306; x=1789580306;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=qsVdbGbYrw2ppGmD7AyATaEWzKfxfbFDoOHdJUVDbvY=;
  b=InZSmbULk2n9n6hTXaBawJWWOr0uQTiExv1OqDfXp+0ZnCs1bWxvmtu5
   v1ASmn7TZpWn1JTV2megw5oFgBXpEctF6hyfYZusu927BOsyKkDtN5klP
   ZY23Bch5+V+MlSyMOxGLbXYN7bpfcFjHvCbId0o8srsOOUWpyozLuVwD6
   Xltqcam3Jwgy7K70HWQIMHadRFsUVK1C+uNExyQAx/2A8hluqwH1bTplq
   Q/eFpHymCo7mchYDKtoW0CJEPFa/AzoKVi0tLXEXQGiv8dQB2TkyxXYX0
   VYMXktWNGaHkPDUnvuW/Ck0sumKtFfRkmu3I3m8W8G15bpgAHumrGE8Go
   Q==;
X-CSE-ConnectionGUID: JwgJaeFzQrm7UxwC39IelA==
X-CSE-MsgGUID: gmVKfSQqTDuKOqe8EMcG/w==
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="52418754"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Sep 2025 10:38:26 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 16 Sep 2025 10:38:08 -0700
Received: from [10.10.179.162] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 16 Sep 2025 10:38:08 -0700
Message-ID: <71d11cdb-345f-43c7-b764-5aa43cdf1e1c@microchip.com>
Date: Tue, 16 Sep 2025 10:38:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: microchip: sama7d65: Add GPIO buttons and LEDs
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-leds@vger.kernel.org>
References: <20250909160842.392075-1-Ryan.Wanner@microchip.com>
 <20250910-retake-attic-ac1fe3429a1e@thorsis.com>
 <20250910-alkalize-overtime-930a59a7d169@thorsis.com>
 <fa5d44ca-d1ea-4c72-a998-b10f098b25f8@microchip.com>
 <20250911-breeder-hardness-d3ffa4bfbb6d@thorsis.com>
From: Ryan Wanner <ryan.wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <20250911-breeder-hardness-d3ffa4bfbb6d@thorsis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_103827_116714_D421C88E 
X-CRM114-Status: GOOD (  24.35  )
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

On 9/11/25 00:00, Alexander Dahl wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hello Ryan,
> 
> Am Wed, Sep 10, 2025 at 10:16:03AM -0700 schrieb Ryan Wanner:
>> On 9/9/25 23:25, Alexander Dahl wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> Hello Ryan,
>>>
>>> Am Wed, Sep 10, 2025 at 08:20:28AM +0200 schrieb Alexander Dahl:
>>>> Hello Ryan,
>>>>
>>>> Am Tue, Sep 09, 2025 at 09:08:38AM -0700 schrieb Ryan.Wanner@microchip.com:
>>>>> From: Ryan Wanner <Ryan.Wanner@microchip.com>
>>>>>
>>>>> Add the USER button as a GPIO input as well as add the LEDs and enable
>>>>> the blue LED as a heartbeat.
>>>>>
>>>>> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
>>>>> ---
>>>>>  .../dts/microchip/at91-sama7d65_curiosity.dts | 49 +++++++++++++++++++
>>>>>  1 file changed, 49 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
>>>>> index f091cc40a9f0..2fe34c59d942 100644
>>>>> --- a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
>>>>> +++ b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
>>>>> @@ -11,6 +11,7 @@
>>>>>  #include "sama7d65-pinfunc.h"
>>>>>  #include "sama7d65.dtsi"
>>>>>  #include <dt-bindings/mfd/atmel-flexcom.h>
>>>>> +#include <dt-bindings/input/input.h>
>>>>>  #include <dt-bindings/pinctrl/at91.h>
>>>>>
>>>>>  / {
>>>>> @@ -26,6 +27,42 @@ chosen {
>>>>>             stdout-path = "serial0:115200n8";
>>>>>     };
>>>>>
>>>>> +   gpio-keys {
>>>>> +           compatible = "gpio-keys";
>>>>> +
>>>>> +           pinctrl-names = "default";
>>>>> +           pinctrl-0 = <&pinctrl_key_gpio_default>;
>>>>> +
>>>>> +           button {
>>>>> +                   label = "PB_USER";
>>>>> +                   gpios = <&pioa PIN_PC10 GPIO_ACTIVE_LOW>;
>>>>> +                   linux,code = <KEY_PROG1>;
>>>>> +                   wakeup-source;
>>>>> +           };
>>>>> +   };
>>>>> +
>>>>> +   leds {
>>>>> +           compatible = "gpio-leds";
>>>>> +           pinctrl-names = "default";
>>>>> +           pinctrl-0 = <&pinctrl_led_gpio_default>;
>>>>> +
>>>>> +           led-red {
>>>>> +                   label = "red";
>>>>> +                   gpios = <&pioa PIN_PB17 GPIO_ACTIVE_HIGH>; /* Conflict with pwm. */
>>>>> +           };
>>>>> +
>>>>> +           led-green {
>>>>> +                   label = "green";
>>>>> +                   gpios = <&pioa PIN_PB15 GPIO_ACTIVE_HIGH>; /* Conflict with pwm. */
>>>>> +           };
>>>>> +
>>>>> +           led-blue {
>>>>> +                   label = "blue";
>>>>> +                   gpios = <&pioa PIN_PA21 GPIO_ACTIVE_HIGH>;
>>>>> +                   linux,default-trigger = "heartbeat";
>>>>> +           };
>>>>> +   };
>>>>
>>>> The label property is deprecated.  Please use the properties "color"
>>>> and "function" for new boards.  See devicetree binding documentation
>>>> for LEDs.
>>>
>>> From a quick glance, this seems to be an RGB-LED, so I would suggest
>>> to not model it as three distinct LEDs, but make use of the
>>> "leds-group-multicolor" feature, example:
>>>
>>>  59         multi-led {
>>>  60                 compatible = "leds-group-multicolor";
>>>  61                 color = <LED_COLOR_ID_RGB>;
>>>  62                 function = LED_FUNCTION_INDICATOR;
>>>  63                 leds = <&led_red>, <&led_green>, <&led_blue>;
>>>  64         };
>>
>> I see, I was not aware of this feature. This would combine all of the
>> LED pins into one RGB light correct, it seems from sysfs that this is
>> the case.
> 
> The group-multicolor feature was merged for kernel v6.6 so it's still
> quite new.  I tried this some time ago, so this is from memory only.
> The three single color gpio leds are still visible in sysfs, but you
> can not control them independently anymore, only through the sysfs
> interface of that one multicolor led.
> 
>> Would having the default-trigger="heartbeat" still be allowed for the
>> led-blue node or should that be moved into the multi-led node? From the
>> bindings it seems that the default trigger is still in the gpio-led nodes.
> 
> Sorry, not sure here.  I put linux-leds in Cc, maybe someone over
> there can answer.  If this does not fit how Microchip wants to handle
> that LED on their boards I think that's fine, too.  Just wanted to
> make people aware of the possibility.

It does not fit very well how we want to handle the LEDs on this board
as of right now. I am assuming it is fine for now to have these as
individual LEDs?

Best,
Ryan>
> Greets
> Alex
> 
>>
>> Best,
>> Ryan
>>>
>>> Greets
>>> Alex
>>>
>>>>
>>>> Thanks and greetings
>>>> Alex
>>>>
>>>>> +
>>>>>     memory@60000000 {
>>>>>             device_type = "memory";
>>>>>             reg = <0x60000000 0x40000000>;
>>>>> @@ -352,6 +389,18 @@ pinctrl_i2c10_default: i2c10-default {
>>>>>             bias-pull-up;
>>>>>     };
>>>>>
>>>>> +   pinctrl_key_gpio_default: key-gpio-default {
>>>>> +           pinmux = <PIN_PC10__GPIO>;
>>>>> +           bias-pull-up;
>>>>> +   };
>>>>> +
>>>>> +   pinctrl_led_gpio_default: led-gpio-default {
>>>>> +           pinmux = <PIN_PB15__GPIO>,
>>>>> +                    <PIN_PB17__GPIO>,
>>>>> +                    <PIN_PA21__GPIO>;
>>>>> +           bias-pull-up;
>>>>> +   };
>>>>> +
>>>>>     pinctrl_sdmmc1_default: sdmmc1-default {
>>>>>             cmd-data {
>>>>>                     pinmux = <PIN_PB22__SDMMC1_CMD>,
>>>>> --
>>>>> 2.43.0
>>>>>
>>>>>
>>>>
>>
>>


