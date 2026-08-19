Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C26AC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 07:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GyP+BjT/b2lYpBkJypWs28s3CD47CYLAv7ie7DV3fF4=; b=ClvWb7Tjk+U7zG/IpzpUlbhMVn
	JaW/CSR0BsaZ2xRBgn+Sbev/MPBgXEnCfxRl8QbX6QGVJLTLNypciI1+GP4pq6ZviI54Kv6mjBmHW
	mlr/k7uu5G5llCfOk1KD48U7WBqvjZgU7svXEPXo/zbtC3bpCH+ZwGuq0xPdocKa/8wVBHwS7EGo4
	zsbRgWQvQjbJAXYiABTMhkNxjZ1pjsi47ecuwKHdYAo0+cUaHjDwyiIha1taVZIy/3xFmqicL+tv3
	2h9VhRHhfyKqmhdNyYSpmEQDTD4UklHENspdzocDHTDM7RuSaeQFhsUw5spJ4WxC6Y5mkBTfVBbqH
	lcrg82xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwagi-00000009Bow-3XzN;
	Wed, 19 Aug 2026 07:26:16 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwage-00000009BoC-2wcp;
	Wed, 19 Aug 2026 07:26:15 +0000
Message-ID: <6673edea-6822-4368-9374-29f92195fcf5@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1787124356;
	bh=zfApjPryrOyf0fxxl1ecWqnrsetooI24vtnZRIvXq7c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=seQBr+cK9g2XeyPGBo5qh2mBtmRJs+lE8qfi/e2B/RSSo+/WTX9KteAhoKY9Epncg
	 shEH21hDzyL8WVCIwtD7VsyjdtBxXjfWF6a/0GMnl9q9QDZWnl6PCt9Ei3epb1PzS7
	 U964U4PvEjM32a0oj8liqP3kZ83nT7b1KnTXSYTo=
Date: Wed, 19 Aug 2026 09:25:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 1/2] arm64: dts: amlogic: t7: use the real UART pclk
To: Xianwei Zhao <xianwei.zhao@amlogic.com>, Lucas Tanure <tanure@linux.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20260818191159.11523-1-tanure@linux.com>
 <20260818191159.11523-2-tanure@linux.com>
 <c428305a-265c-4cc5-be01-be5b21dc22ca@amlogic.com>
Content-Language: en-US
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
In-Reply-To: <c428305a-265c-4cc5-be01-be5b21dc22ca@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_002613_205942_4CFA45F5 
X-CRM114-Status: GOOD (  16.20  )
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

On 8/19/26 4:39 AM, Xianwei Zhao wrote:
> Hi Lucas,
> 
> On 2026/8/19 03:11, Lucas Tanure wrote:
>> uart_a lists the 24MHz crystal for all three of its clocks, because
>> the T7 clock controller driver did not exist when these boards were
>> added.
>>
>> That leaves the real UART bus clock without a user, so the kernel
>> turns it off when it disables unused clocks at the end of boot, and
>> the board hangs.
>>
>> Point uart_a at the real clocks, the way meson-s4.dtsi does, and drop
>> the placeholders from the two board files.
>>
>> Fixes: 4fef056588f5 ("arm64: dts: amlogic-t7-a311d2-khadas-vim4: add
>> initial device-tree")
>> Fixes: 6f048cc7a635 ("arm64: dts: add board AN400")
>> Signed-off-by: Lucas Tanure<tanure@linux.com>
>> Assisted-by: Claude:claude-fable-5
>> ---
>>   arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts       | 2 --
>>   arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 2 --
>>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi                   | 4 ++++
>>   3 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>> b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>> index cab2ee9ea0d3..dcbcd08a78b9 100644
>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>> @@ -33,7 +33,5 @@ xtal: xtal-clk {
>>   };
>>
>>   &uart_a {
>> -       clocks = <&xtal>, <&xtal>,
>> <&xtal>;
>> -       clock-names = "xtal", "pclk", "baud";
>>          status = "okay";
>>   };
>> diff --git
>> a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>> b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>> index c41525a34b72..677069e58f30 100644
>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>> @@ -266,6 +266,4 @@ &sd_emmc_c {
>>
>>   &uart_a {
>>          status = "okay";
>> -       clocks = <&xtal>, <&xtal>,
>> <&xtal>;
>> -       clock-names = "xtal", "pclk", "baud";
>>   };
>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>> b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>> index cc371fcd1896..7847582e77ed 100644
>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>> @@ -587,6 +587,10 @@ uart_a: serial@78000 {
>>                                  compatible = "amlogic,t7-uart",
>> "amlogic,meson-s4-uart";
>>                                  reg = <0x0 0x78000 0x0 0x18>;
>>                                  interrupts = <GIC_SPI 168
>> IRQ_TYPE_EDGE_RISING>;
>> +                               clocks = <&xtal>,
>> +                                        <&clkc_periphs
>> CLKID_SYS_UART_A>,
>> +                                        <&xtal>;
>> +                               clock-names = "xtal", "pclk", "baud";
>>                                  status = "disabled";
>>                          };
> 
> I agree with moving the UART clock configuration to the DTSI file.
> However, it seems a little odd to keep the XTAL clock definition in the
> DTS, as the alias may not be consistent across different boards, which
> could result in compilation errors. Could we move the XTAL clock
> definition to the DTSI as well, similar to other Amlogic SoCs?

It seems similar to changes in this series :

https://lore.kernel.org/all/20260420-add-bluetooth-t7-vim4-v4-0-9505df0e7016@aliel.fr/

What do you think ?

-- 
Best regards,
Ronald

