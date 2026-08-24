Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FC0C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 09:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ouYAHvr+QWK67fDKgLOPoTHBo+k0uFdrIVGPQjT4SE4=; b=Kty6F6Dbs/qI6u86+xZar8IiSG
	gJfHctS0hb1DlwlDJcAsk6E33Ijxbdo3HbrWoyA61t3EPhnam/QUg8kxvTBsoFfXbO1Hc6v0mPT5g
	jbwDY9+BsESmwVDn8pmr4LU3AqnGt0/IFhO+1gndNJXy4aToyx4wIb/Bg2SxM/dMyoXGA8QYD0kk6
	hnOkxp/fL3p2AWDJPxp4UcsLp07t2B++bBesSl9REvQRORcv0kIe1a8BBV05RKle4/xyD/ewckguX
	iDykuujcaFSkbkrs2PPiIf1VS0EZSP/mw+0wVipC8JFltg0jQSE1J32dlcnQGb6ZGsfTo5jUSgkCN
	2EdeVhpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyQms-0000000GIHk-20FI;
	Mon, 24 Aug 2026 09:16:14 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyQmn-0000000GIGV-2Wfw;
	Mon, 24 Aug 2026 09:16:11 +0000
Message-ID: <78721fe3-d9d0-4f85-a1ec-a01ebbf4f9a3@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1787562959;
	bh=foOoXCqR/5BXqtyvFhHjleR3bZ+mj5eo+d1InjU/3Ro=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=enpFvvbI08UZGAHC08RrXefbOM4ISQ7ktbTjM4ine951/kCE37ESx5pa7cesPe2X9
	 kzN3odNAWYlufHgL8Fzf6BCgr5n3du428xv1xh3KZgcR+cdzKUIiGW4haBoC45Z51z
	 101mjQF5KkbUyDHNGrUzQEJpOKl2SVX5qEbzY9sc=
Date: Mon, 24 Aug 2026 11:15:58 +0200
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
Content-Language: en-US
In-Reply-To: <0969d872-faff-4b0f-81ad-972b7aa9bb7f@linux.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_021610_266541_BBC7B555 
X-CRM114-Status: GOOD (  16.32  )
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

On 8/23/26 1:39 PM, Lucas Tanure wrote:
> On 19/08/2026 08:25, Ronald Claveau wrote:
>> On 8/19/26 4:39 AM, Xianwei Zhao wrote:
>>> Hi Lucas,
>>>
>>> On 2026/8/19 03:11, Lucas Tanure wrote:
>>>> uart_a lists the 24MHz crystal for all three of its clocks, because
>>>> the T7 clock controller driver did not exist when these boards were
>>>> added.
>>>>
>>>> That leaves the real UART bus clock without a user, so the kernel
>>>> turns it off when it disables unused clocks at the end of boot, and
>>>> the board hangs.
>>>>
>>>> Point uart_a at the real clocks, the way meson-s4.dtsi does, and drop
>>>> the placeholders from the two board files.
>>>>
>>>> Fixes: 4fef056588f5 ("arm64: dts: amlogic-t7-a311d2-khadas-vim4: add
>>>> initial device-tree")
>>>> Fixes: 6f048cc7a635 ("arm64: dts: add board AN400")
>>>> Signed-off-by: Lucas Tanure<tanure@linux.com>
>>>> Assisted-by: Claude:claude-fable-5
>>>> ---
>>>>    arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts       | 2 --
>>>>    arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 2 --
>>>>    arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi                   | 4
>>>> ++++
>>>>    3 files changed, 4 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>>>> b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>>>> index cab2ee9ea0d3..dcbcd08a78b9 100644
>>>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>>>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>>>> @@ -33,7 +33,5 @@ xtal: xtal-clk {
>>>>    };
>>>>
>>>>    &uart_a {
>>>> -       clocks = <&xtal>, <&xtal>,
>>>> <&xtal>;
>>>> -       clock-names = "xtal", "pclk", "baud";
>>>>           status = "okay";
>>>>    };
>>>> diff --git
>>>> a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>>>> b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>>>> index c41525a34b72..677069e58f30 100644
>>>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>>>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>>>> @@ -266,6 +266,4 @@ &sd_emmc_c {
>>>>
>>>>    &uart_a {
>>>>           status = "okay";
>>>> -       clocks = <&xtal>, <&xtal>,
>>>> <&xtal>;
>>>> -       clock-names = "xtal", "pclk", "baud";
>>>>    };
>>>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>>> b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>>> index cc371fcd1896..7847582e77ed 100644
>>>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>>> @@ -587,6 +587,10 @@ uart_a: serial@78000 {
>>>>                                   compatible = "amlogic,t7-uart",
>>>> "amlogic,meson-s4-uart";
>>>>                                   reg = <0x0 0x78000 0x0 0x18>;
>>>>                                   interrupts = <GIC_SPI 168
>>>> IRQ_TYPE_EDGE_RISING>;
>>>> +                               clocks = <&xtal>,
>>>> +                                        <&clkc_periphs
>>>> CLKID_SYS_UART_A>,
>>>> +                                        <&xtal>;
>>>> +                               clock-names = "xtal", "pclk", "baud";
>>>>                                   status = "disabled";
>>>>                           };
>>>
>>> I agree with moving the UART clock configuration to the DTSI file.
>>> However, it seems a little odd to keep the XTAL clock definition in the
>>> DTS, as the alias may not be consistent across different boards, which
>>> could result in compilation errors. Could we move the XTAL clock
>>> definition to the DTSI as well, similar to other Amlogic SoCs?
>>
>> It seems similar to changes in this series :
>>
>> https://lore.kernel.org/all/20260420-add-bluetooth-t7-vim4-
>> v4-0-9505df0e7016@aliel.fr/
>>
>> What do you think ?
>>
> Thanks for pointing out that series, though I wasn't aware of it.
> And after reading I don't agree with it. The clocks are not redundant,
> they are there because we agreed sometime ago that xtal belongs to the
> board files.
> So I still vote for my change in v2, that I will send in a few minutes.

I don't get why it would be better to define the exact same clocks in
each DTS file.

The xtal recommended characteristics provided at the SOC level can be
defined in the DTSI and overridden, if really necessary, in the DTS.

-- 
Best regards,
Ronald

