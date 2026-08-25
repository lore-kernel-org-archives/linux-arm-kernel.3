Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6203BC5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 08:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mwVZhterOpptAwqvObdfa9a7izjhFqk0pd6wVZKcv7E=; b=pPLT6J2g/HWXlj2FF4PcmA7bAY
	+y1v6+jW+Sp9NXKOrcW0H3Cj39v47VN8ypUUqD4zHodaVB673K1+KP3Nz2F6m3xgTTKBMEbR6lc3f
	etTr0iaMPBxMomcqYVn5qvfInWPZ59zMzFCvCgpMWhVQOxjAMEAo2feQq2H38mUocKyAHFO1i7+7i
	KYpTJrDYhEC4zVa6A3cIYYG5VUJFjpvsV3WqdhIXjiON64R9iTAXATO4wVRGVaHfwkQEjGRd2BnXV
	jpgixD18a4aziMtceK8+g367bzJpKwCHQMa2R8/CiCsBOUGGaPFoTtG9vyUvfMoXV3VoPzrcD10ti
	Zwn++82A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymvD-00000000QvR-41F3;
	Tue, 25 Aug 2026 08:54:19 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymvA-00000000QuJ-0hxS;
	Tue, 25 Aug 2026 08:54:18 +0000
Message-ID: <5c8babac-0434-46fa-8919-a527d4179f7c@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1787648046;
	bh=yv9J4eod4PNS/8Gv7FhKjlVxSzN7lHV8GdRt1ijTsWU=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=vVPubD8nyqNc7oUU0vWetMjbcSFl9mOPnbRwC/YefQxaCpVq5s+9OAbnX72HUVoGi
	 ZR5dWFhuGCvOe+kb5y2CraBEXQEW8quIdd12vneNA/4zbCl0D3OU/DPIIZT5bj3HyQ
	 Eb8ZUJAIfvtkwd0UFCWYohIKr/2rwGtjz6V09A/w=
Date: Tue, 25 Aug 2026 10:54:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH 1/2] arm64: dts: amlogic: t7: use the real UART pclk
To: Lucas Tanure <tanure@linux.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20260818191159.11523-1-tanure@linux.com>
 <20260818191159.11523-2-tanure@linux.com>
 <c428305a-265c-4cc5-be01-be5b21dc22ca@amlogic.com>
 <6673edea-6822-4368-9374-29f92195fcf5@aliel.fr>
 <0969d872-faff-4b0f-81ad-972b7aa9bb7f@linux.com>
 <78721fe3-d9d0-4f85-a1ec-a01ebbf4f9a3@aliel.fr>
 <7c7f447d-8796-4f6e-b607-5251d9129665@linux.com>
Content-Language: en-US
In-Reply-To: <7c7f447d-8796-4f6e-b607-5251d9129665@linux.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_015416_838548_369ECE1F 
X-CRM114-Status: GOOD (  23.63  )
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

On 8/24/26 11:32 AM, Lucas Tanure wrote:
> On 24/08/2026 10:15, Ronald Claveau wrote:
>> On 8/23/26 1:39 PM, Lucas Tanure wrote:
>>> On 19/08/2026 08:25, Ronald Claveau wrote:
>>>> On 8/19/26 4:39 AM, Xianwei Zhao wrote:
>>>>> Hi Lucas,
>>>>>
>>>>> On 2026/8/19 03:11, Lucas Tanure wrote:
>>>>>> uart_a lists the 24MHz crystal for all three of its clocks, because
>>>>>> the T7 clock controller driver did not exist when these boards were
>>>>>> added.
>>>>>>
>>>>>> That leaves the real UART bus clock without a user, so the kernel
>>>>>> turns it off when it disables unused clocks at the end of boot, and
>>>>>> the board hangs.
>>>>>>
>>>>>> Point uart_a at the real clocks, the way meson-s4.dtsi does, and drop
>>>>>> the placeholders from the two board files.
>>>>>>
>>>>>> Fixes: 4fef056588f5 ("arm64: dts: amlogic-t7-a311d2-khadas-vim4: add
>>>>>> initial device-tree")
>>>>>> Fixes: 6f048cc7a635 ("arm64: dts: add board AN400")
>>>>>> Signed-off-by: Lucas Tanure<tanure@linux.com>
>>>>>> Assisted-by: Claude:claude-fable-5
>>>>>> ---
>>>>>>     arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts      
>>>>>> | 2 --
>>>>>>     arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>>>>>> | 2 --
>>>>>>     arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi                   | 4
>>>>>> ++++
>>>>>>     3 files changed, 4 insertions(+), 4 deletions(-)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>>>>>> b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>>>>>> index cab2ee9ea0d3..dcbcd08a78b9 100644
>>>>>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>>>>>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>>>>>> @@ -33,7 +33,5 @@ xtal: xtal-clk {
>>>>>>     };
>>>>>>
>>>>>>     &uart_a {
>>>>>> -       clocks = <&xtal>, <&xtal>,
>>>>>> <&xtal>;
>>>>>> -       clock-names = "xtal", "pclk", "baud";
>>>>>>            status = "okay";
>>>>>>     };
>>>>>> diff --git
>>>>>> a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>>>>>> b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>>>>>> index c41525a34b72..677069e58f30 100644
>>>>>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>>>>>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>>>>>> @@ -266,6 +266,4 @@ &sd_emmc_c {
>>>>>>
>>>>>>     &uart_a {
>>>>>>            status = "okay";
>>>>>> -       clocks = <&xtal>, <&xtal>,
>>>>>> <&xtal>;
>>>>>> -       clock-names = "xtal", "pclk", "baud";
>>>>>>     };
>>>>>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>>>>> b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>>>>> index cc371fcd1896..7847582e77ed 100644
>>>>>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>>>>> @@ -587,6 +587,10 @@ uart_a: serial@78000 {
>>>>>>                                    compatible = "amlogic,t7-uart",
>>>>>> "amlogic,meson-s4-uart";
>>>>>>                                    reg = <0x0 0x78000 0x0 0x18>;
>>>>>>                                    interrupts = <GIC_SPI 168
>>>>>> IRQ_TYPE_EDGE_RISING>;
>>>>>> +                               clocks = <&xtal>,
>>>>>> +                                        <&clkc_periphs
>>>>>> CLKID_SYS_UART_A>,
>>>>>> +                                        <&xtal>;
>>>>>> +                               clock-names = "xtal", "pclk", "baud";
>>>>>>                                    status = "disabled";
>>>>>>                            };
>>>>>
>>>>> I agree with moving the UART clock configuration to the DTSI file.
>>>>> However, it seems a little odd to keep the XTAL clock definition in
>>>>> the
>>>>> DTS, as the alias may not be consistent across different boards, which
>>>>> could result in compilation errors. Could we move the XTAL clock
>>>>> definition to the DTSI as well, similar to other Amlogic SoCs?
>>>>
>>>> It seems similar to changes in this series :
>>>>
>>>> https://lore.kernel.org/all/20260420-add-bluetooth-t7-vim4-
>>>> v4-0-9505df0e7016@aliel.fr/
>>>>
>>>> What do you think ?
>>>>
>>> Thanks for pointing out that series, though I wasn't aware of it.
>>> And after reading I don't agree with it. The clocks are not redundant,
>>> they are there because we agreed sometime ago that xtal belongs to the
>>> board files.
>>> So I still vote for my change in v2, that I will send in a few minutes.
>>
>> I don't get why it would be better to define the exact same clocks in
>> each DTS file.
>>
>> The xtal recommended characteristics provided at the SOC level can be
>> defined in the DTSI and overridden, if really necessary, in the DTS.
>>
> Hi Ronald,
> 
> The preference for keeping xtal in board-specific .dts files rather than
> the SoC .dtsi comes down to DT hardware modeling principles and upstream
> maintainer guidelines:
> 
> Hardware Topology: The xtal is physically located on the board PCB, not
> inside the SoC silicon. The .dtsi file models the SoC silicon internal
> architecture (clock controllers, IPs, registers), whereas .dts files
> describe the physical board layout surrounding it.
> 
> Avoiding Implicit Assumptions: Defining a default 24MHz xtal in .dtsi
> assumes every T7 board will use the same oscillator configuration. If a
> custom board design uses a different crystal frequency or an external
> clock generator/TCXO, overriding a .dtsi-level node can lead to messy DT
> overrides or silent clock rate mismatches if forgotten.
> 
> Upstream DT Maintainer Policy: Kernel DT maintainers consistently push
> to keep board-level hardware explicitly declared in the board .dts files
> to reflect actual physical board components.
> 
> That said, I acknowledge the trade-off is minor boilerplate duplication
> across board DTS files. If the Amlogic SoC maintainers prefer setting a
> default 24MHz xtal in amlogic-t7.dtsi to match older SoC generations, I
> am open to updating it—provided the maintainers explicitly prefer that
> tradeoff over strict DT topology modeling.
> 

Hi Lucas,

Thank you for this detailed explanation.
I was referring to the last paragraph of the DTS coding style:

Hardware components that are present on the board shall be placed in the
board DTS, not in the SoC or SoM DTSI. A partial exception is a common
external reference SoC input clock, which could be coded as a
fixed-clock in the SoC DTSI with its frequency provided by each board DTS.

I understand going to strict topology is better, that means we must
apply the same rules to new Amlogic SOCs, right ?

Do we need to move other clocks and assigned-clocks properties which use
the xtal to the board DTS as well (such as clkc_periphs or sd_emmc)?

-- 
Best regards,
Ronald

