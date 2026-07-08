Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17EADC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 08:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yHM3sU3ciDm6rtFswtK7R9pJm75RWz1CorhEtjeujD4=; b=oyNS/U15Qp5mD1yrgQoJqTH3zl
	S8vl0xsViwqhWaOS4Tx4+n6HYqK4sY+raZglhuo5HeNV+eq/jGzT8BuRBODsfJeM9ys0dGbolIzbW
	Lup1cRPbG0uPQH58Ng3dWybAc4Oq6ABg+rIC/SkT8wQwxhVVmwSBjeZdrXtj/xUm+2HDi5bDcVv9C
	/tT7ikIz610aFF0P1MqwsCVBOO14CJFSyqrmkbz3j3IgVlrdRVYlok8m+FHsemYPDB8MfPfqUuo46
	0qpPYFsmA/FgtLdikxwe0Q97BER1XjTVUUQas1eJ+SD4zmLYcv+9pLcdapG8UQ0z8eMD4kn+xSoCk
	E3kHkv7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNEV-0000000GZgs-1JuU;
	Wed, 08 Jul 2026 08:02:15 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNER-0000000GZfC-1LN9;
	Wed, 08 Jul 2026 08:02:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783497728;
	bh=6SacSufpVpDq43snOtzdOhTZJyjAGxTn7OtrG/N9JA4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fvSf4EceAV1JX2ABzXTKVhzWJnVOHW6Z2/8An0qkkMYTIKQDuKOV21NYvL9t7KLxf
	 ftr9hff/dPR+EDnQWjXlrafW1c4BrychuLULkN6CaxTBhQaq+ajPiKXrsApVFQ43jQ
	 TF9rfCjG8rlkQQLFUCr8g4CYNZxMIbO45Pjlum+jl79IJzQ2KCTFk2BGd6yqOpMRnA
	 7VjJnJPDDj1BGC3rrRslRWLb6WkNqotXfyfoo/Br40uov9pTSICNSjcbtGD/Us1iWV
	 ZVOCfVFlNPPG4sfr2Ik1HhSC0jLljbWzJ4fBfMMkF4jpjzYm5jjfLOHWyYFqaD6THE
	 S8oZuS7Fhx/vA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A4F8417E05D3;
	Wed, 08 Jul 2026 10:02:07 +0200 (CEST)
Message-ID: <2834aca4-916f-4d3e-afb4-cd2425b035ef@collabora.com>
Date: Wed, 8 Jul 2026 10:02:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8188-geralt: Add MT6319 PMIC
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260707104427.3409290-1-wenst@chromium.org>
 <176dd24c-c3cf-4ab9-8497-594ed65d10ec@collabora.com>
 <CAGXv+5F86JU9+LPSy8PtuCPrdhBnvcA=PX1d++Yh3u7mK_Jxmw@mail.gmail.com>
 <94c10212-9c27-4875-8a88-78bfb67fb382@collabora.com>
 <CAGXv+5EsWVbLtUP6b75fvkDVSqUDoAOA1t3hPO4cA9sAA02=WA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5EsWVbLtUP6b75fvkDVSqUDoAOA1t3hPO4cA9sAA02=WA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_010211_606055_E0AAB5D7 
X-CRM114-Status: GOOD (  31.71  )
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

On 7/8/26 06:25, Chen-Yu Tsai wrote:
> On Tue, Jul 7, 2026 at 7:24 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> On 7/7/26 13:08, Chen-Yu Tsai wrote:
>>> On Tue, Jul 7, 2026 at 7:05 PM AngeloGioacchino Del Regno
>>> <angelogioacchino.delregno@collabora.com> wrote:
>>>>
>>>> On 7/7/26 12:44, Chen-Yu Tsai wrote:
>>>>> The Geralt design uses a MT6319 PMIC to power the big cores and LPDDR4X
>>>>> DRAM.
>>>>>
>>>>> Add a device node for it and hook up all the supplies.
>>>>>
>>>>> This change requires a firmware fix for the SPMI bus to read back
>>>>> correctly. The required firmware version is 15842.175.0. This is
>>>>> included in ChromeOS releases R150-16700.22.0 (available in Beta
>>>>> channel as of writing or stable channel in mid-July) or
>>>>> R151-16721.0.0 and later.
>>>>>
>>>>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>>>>
>>>> This is a big problem then.
>>>>
>>>> I take it as if the firmware fix is not in place, probing the CPU power supplies
>>>> will fail, with all the consequences.
>>>
>>> That's right.
>>>
>>>> This means that with this, we're breaking all Geralt machines with older firmware,
>>>> which is not acceptable...
>>>>
>>>> ...so this needs a different solution, or strong reasons to make me understand that
>>>> I'm wrong, if I'm wrong.
>>>
>>> We can drop the CPU supplies (they don't matter since cpufreq is hardware
>>> driven) and just add the regulators. How does that sound? If the firmware
>>> isn't updated, the PMIC will fail to probe, but since nothing is using it,
>>> the system will continue to work (with some annoying error messages).
>>>
>>
>> That'd be wrong, but less wrong than not having anything described...
> 
> Yeah. As I said, it doesn't affect usability.
> 
>> ...I wonder if, at this point, you could set the SPMI node to status = "fail" and
>> have the *new* firmware override that to "ok".
>>
>> That's the only reasonable way to go forward, IMO.
> 
> I'm afraid it is unlikely to get a firmware release to fix a non-critical
> issue. We were fortunate that there was an actual critical issue being
> fixed that allowed me to merge the small fix for the SPMI controller.
> 

Yeah, I know how it is regarding firmware updates... but you know, I *must* try to
get OEMs/ODMs to do the right thing when hacky things get in front of me, and I am
fully aware that many of them largely underestimate such issues, and even close the
possibility to fix those, which is even worst.

On the other hand, I know you, and I know that you always try to do the same
whenever you can, so please, be aware that I'm not complaining about you.

> I think it would be great if everyone could update their OS and firmware,
> but I understand that some devices never get updates, such as those in
> board farms that never boot into ChromeOS.

Unfortunately, this is not just a ChromeOS problem but way larger...

Anyway, I'll stop here to prevent myself from going OT too much and being grumpier
than I already am :-P

I guess then just add the SPMI PMIC and add a big comment that clearly states
something like

/*
  * The mt6319_buck1 is the cpu-supply for CPU6 and CPU7.
  *
  * However, this device ships with a broken firmware which needs to be updated to
  * at version XXXXXXX or newer in order to workaround a bug that (describe bug).
  *
  * [blahblah text so that's why the cpu supply was not assigned to cpu6/7].
  */

...so that everyone reading the DT is fully aware of what's going on and can act
accordingly if they wish.

How does that sound?

Cheers,
Angelo

> 
> 
> ChenYu
> 
>> Of course, avoid having the firmware adding the CPU supplies, because that would
>> be rather sketchy then. Just "if spmi status fail found, change to ok".
>>
>> Cheers,
>> Angelo
>>
>>>
>>> ChenYu
>>>
>>>> Cheers,
>>>> Angelo
>>>>
>>>>> ---
>>>>>     .../boot/dts/mediatek/mt8188-geralt.dtsi      | 66 +++++++++++++++++++
>>>>>     1 file changed, 66 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
>>>>> index f382f90c48f5..fea52c377d88 100644
>>>>> --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
>>>>> +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
>>>>> @@ -4,6 +4,8 @@
>>>>>      */
>>>>>     /dts-v1/;
>>>>>     #include <dt-bindings/gpio/gpio.h>
>>>>> +#include <dt-bindings/spmi/spmi.h>
>>>>> +
>>>>>     #include "mt8188.dtsi"
>>>>>     #include "mt6359.dtsi"
>>>>>
>>>>> @@ -241,6 +243,14 @@ &cpu5 {
>>>>>         cpu-supply = <&mt6359_vcore_buck_reg>;
>>>>>     };
>>>>>
>>>>> +&cpu6 {
>>>>> +     cpu-supply = <&mt6319_buck1>;
>>>>> +};
>>>>> +
>>>>> +&cpu7 {
>>>>> +     cpu-supply = <&mt6319_buck1>;
>>>>> +};
>>>>> +
>>>>>     /*
>>>>>      * Geralt is the reference design and doesn't have target TDP.
>>>>>      * Ciri is (currently) the only device following Geralt, and its
>>>>> @@ -1156,6 +1166,14 @@ pins-bus {
>>>>>                 };
>>>>>         };
>>>>>
>>>>> +     spmi_pins: spmi-pins {
>>>>> +             pins-bus {
>>>>> +                     pinmux = <PINMUX_GPIO175__FUNC_B0_SPMI_M_SCL>,
>>>>> +                              <PINMUX_GPIO176__FUNC_B0_SPMI_M_SDA>;
>>>>> +                     bias-disable;
>>>>> +             };
>>>>> +     };
>>>>> +
>>>>>         uart0_pins: uart0-pins {
>>>>>                 pins-bus {
>>>>>                         pinmux = <PINMUX_GPIO31__FUNC_O_UTXD0>,
>>>>> @@ -1267,6 +1285,54 @@ &spi2 {
>>>>>         status = "okay";
>>>>>     };
>>>>>
>>>>> +&spmi {
>>>>> +     pinctrl-names = "default";
>>>>> +     pinctrl-0 = <&spmi_pins>;
>>>>> +     #address-cells = <2>;
>>>>> +     #size-cells = <0>;
>>>>> +     status = "okay";
>>>>> +
>>>>> +     pmic@6 {
>>>>> +             compatible = "mediatek,mt6319-regulator", "mediatek,mt6315-regulator";
>>>>> +             reg = <0x6 SPMI_USID>;
>>>>> +             pvdd1-supply = <&pp4200_s5>;
>>>>> +             pvdd2-supply = <&pp4200_s5>;
>>>>> +             pvdd3-supply = <&pp4200_s5>;
>>>>> +             pvdd4-supply = <&pp4200_s5>;
>>>>> +
>>>>> +             regulators {
>>>>> +                     mt6319_buck1: vbuck1 {
>>>>> +                                     regulator-name = "ppvar_dvdd_proc_bc";
>>>>> +                                     regulator-min-microvolt = <520000>;
>>>>> +                                     regulator-max-microvolt = <1155000>;
>>>>> +                                     regulator-enable-ramp-delay = <256>;
>>>>> +                                     regulator-allowed-modes = <0 1 2>;
>>>>> +                                     regulator-always-on;
>>>>> +                     };
>>>>> +
>>>>> +                     /* vbuck2 is ganged with vbuck1 */
>>>>> +
>>>>> +                     mt6319_buck3: vbuck3 {
>>>>> +                                     regulator-name = "pp1125_emi_vdd2";
>>>>> +                                     regulator-min-microvolt = <1060000>;
>>>>> +                                     regulator-max-microvolt = <1170000>;
>>>>> +                                     regulator-enable-ramp-delay = <256>;
>>>>> +                                     regulator-allowed-modes = <0 1 2>;
>>>>> +                                     regulator-always-on;
>>>>> +                     };
>>>>> +
>>>>> +                     mt6319_buck4: vbuck4 {
>>>>> +                                     regulator-name = "pp0600_emi_vddq";
>>>>> +                                     regulator-min-microvolt = <570000>;
>>>>> +                                     regulator-max-microvolt = <650000>;
>>>>> +                                     regulator-enable-ramp-delay = <256>;
>>>>> +                                     regulator-allowed-modes = <0 1 2>;
>>>>> +                                     regulator-always-on;
>>>>> +                     };
>>>>> +             };
>>>>> +     };
>>>>> +};
>>>>> +
>>>>>     &uart0 {
>>>>>         pinctrl-names = "default";
>>>>>         pinctrl-0 = <&uart0_pins>;
>>>>


