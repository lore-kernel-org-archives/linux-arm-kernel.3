Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0462BC36000
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 19:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/DJYerEjex4VAx4DU0UPjSk1VlLD43SiDBD148GJaQ=; b=AoRGsGX0kruPZzXVc8RjDVGDQD
	tEybuaLyJ4SeONLGdbEtMCIPNUzIMXNrQWVqdXAqY3Bf858C5dGzYaKqGQ4G9WqCrOqiXaY9Ayua3
	K1UV4g0VNgtrbIhxZBwN3IOvtbWFk9kMS1ZwvpESX4FCKv7d9tjYrItMquFa66NWGXoi/RDOkihou
	Cca98U4VtY57Aa58ujhzch3WmE0Y+C56CtYc5M9EfFeRwG0TUinklS8PCycoD7K414zS/aob9Iead
	syjaTpiFUvTNSKsf/NY+wqkA45zJZdCpgOZE5ABhKVET9SB7O8Lp30ijBzjT87gpzJfm4jR0P26wH
	G+LUZhaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuzA1-00000009zPf-3N5d;
	Wed, 19 Mar 2025 19:33:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuz8L-00000009yzo-04nd;
	Wed, 19 Mar 2025 19:31:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 125A568306;
	Wed, 19 Mar 2025 19:31:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE7C2C4CEE4;
	Wed, 19 Mar 2025 19:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742412680;
	bh=CpfCtBcbiwBJ0pvVDr2LOLoj2GpLAXY2Jc7T3aqYATE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tLHA5bCEYAzsmdCwwKaCf6fUHZHdQpJrc4VNB9NQAPsckqR+KBod/BYx3UfCzJp5m
	 cyIzLKyONGdzVgL355P6tEPJVDhG7wq2ja6eX66of4xmEolBgDiLzQ5pS6r3NAzjBw
	 Dnj86XvJ2VqkY0wWFCjF/FfbjQgbPtaoPowbK/zYaRC0LAAiy0UWbAzrWqTMV+Gb3e
	 Kiic1porYOBgID5Hw14r2Xm/kuGR/BkrylPKfwviCAIClMwC/UkJhWuBOAqUwgq0uv
	 lHAO8kSc3ImQa6QoUb3dVQSgFQH9wE16XLtk/vu8o0DJiwaWxBgEgDQuPHshX+BhJK
	 d5OetRRdl4yCg==
Message-ID: <37f65ad0-69fa-4031-86da-8b07828aff34@kernel.org>
Date: Wed, 19 Mar 2025 20:31:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] arm64: dts: amlogic: Add Amlogic S4 Audio
To: Jiebing Chen <jiebing.chen@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com
References: <20250319-audio_drvier-v4-0-686867fad719@amlogic.com>
 <20250319-audio_drvier-v4-6-686867fad719@amlogic.com>
 <20250319-quizzical-coyote-of-assurance-d4c91d@krzk-bin>
 <9397d6d5-518d-4bd0-a34a-7a5f5e1201f1@amlogic.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <9397d6d5-518d-4bd0-a34a-7a5f5e1201f1@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 19/03/2025 11:38, Jiebing Chen wrote:
>>>   };
>>>
>>>   &pwm_ef {
>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>>> index 957577d986c0675a503115e1ccbc4387c2051620..83edafc2646438e3e6b1945fa1c4b327254a4131 100644
>>> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>>> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>>> @@ -11,7 +11,11 @@
>>>   #include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
>>>   #include <dt-bindings/power/meson-s4-power.h>
>>>   #include <dt-bindings/reset/amlogic,meson-s4-reset.h>
>>> -
>> Why?
> 
> The following files are included that the audio driver depends on

Do you understand how emails work and patch review? I commented under
your change, not unrelated code being there already.

> 
> it is same as sm1 chip
> 
>>> +#include <dt-bindings/clock/axg-audio-clkc.h>
>>> +#include <dt-bindings/reset/amlogic,meson-axg-audio-arb.h>
>>> +#include <dt-bindings/reset/amlogic,meson-g12a-audio-reset.h>
>>> +#include <dt-bindings/sound/meson-g12a-toacodec.h>
>>> +#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
>> Old style was correct.
> 
> I didn't understand where you were referring to, I'm guessing that's 
> what it was about

Read your patch.


> 
> the following changes to tdmif_a
> 
> old:
> 
> clock-names = "mclk", "sclk", "lrclk";
> 
> new:
> clock-names = "sclk", "lrclk","mclk";
> it fix warning

How is this related to the patch hunk?

Do you understand how patch format works?


...

>>>        timer {
>>>                compatible = "arm,armv8-timer";
>>>                interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
>>> @@ -101,7 +135,6 @@ apb4: bus@fe000000 {
>>>                        #address-cells = <2>;
>>>                        #size-cells = <2>;
>>>                        ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
>>> -
>> Why? What is happening in this patch - why are you changing so many
>> other pieces?

You did not respond here, so I assume you will fix this and do intensive
review before posting next version.

>>
>>>                        clkc_periphs: clock-controller@0 {
>>>                                compatible = "amlogic,s4-peripherals-clkc";
>>>                                reg = <0x0 0x0 0x0 0x49c>;
>>> @@ -134,6 +167,17 @@ clkc_pll: clock-controller@8000 {
>>>                                #clock-cells = <1>;
>>>                        };
>>>
>>> +                     acodec: audio-controller@1a000 {
>>> +                             compatible = "amlogic,t9015";
>>> +                             reg = <0x0 0x1A000 0x0 0x14>;
>>> +                             #sound-dai-cells = <0>;
>>> +                             sound-name-prefix = "ACODEC";
>>> +                             clocks = <&clkc_periphs CLKID_ACODEC>;
>>> +                             clock-names = "pclk";
>>> +                             resets = <&reset RESET_ACODEC>;
>>> +                             AVDD-supply = <&vddio_ao1v8>;
>>> +                     };
>>> +
>>>                        watchdog@2100 {
>>>                                compatible = "amlogic,s4-wdt", "amlogic,t7-wdt";
>>>                                reg = <0x0 0x2100 0x0 0x10>;
>>> @@ -850,3 +894,327 @@ emmc: mmc@fe08c000 {
>>>                };
>>>        };
>>>   };
>>> +
>>> +&apb4 {
>>> +     audio: bus@330000 {
>>> +             compatible = "simple-bus";
>>> +             reg = <0x0 0x330000 0x0 0x1000>;
>> That's not a simple bus in such case.
> 
> these code base on old dts like sm1/g12a, we didn't easily change any of 
> the relevant properties
> 
> To be consistent with the previous one

Still NAK.

You cannot add bugs just to be consistent.


Best regards,
Krzysztof

