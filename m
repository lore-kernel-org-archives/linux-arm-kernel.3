Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A79C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 09:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJloPN89elVAin5U0ydRdECi+cW4StvyY0mXdouFdaQ=; b=D/tEmMF8+K/hrTfDz1PsSbMf9t
	9jNk699BFR5cKIZ9ebLR4aPixmlhcX0eub97udzc45q8Ds4r23NiBfAmifQ+PYdiCMAqvIVshsFiK
	mz1ZMdTaELw62kJgjJsssucwDu/Pk5jtcRdzrdVxJSvOQS4SHpv+7KeoHOMMMPwcqMWi5igZYosqd
	oXv5wO9NUvZEJbrwe8nTzV3yosFRGmn3S6XrNRv9UBr4/WA3SvJ2vztcxH6VziqI2U40DBl38+N+C
	r3ArFyw259egJgrc7XCr8Uq7RYWfDFuU8FyMrzB9tC40NJblIPydU30b9rcAmf+bQ81hsdKUrDA0M
	QTLKrWAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyR2i-0000000GJhW-22tk;
	Mon, 24 Aug 2026 09:32:36 +0000
Received: from mail-wm1-f51.google.com ([209.85.128.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyR2f-0000000GJgl-00wl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 09:32:34 +0000
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso17546395e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 02:32:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787563951; x=1788168751;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gJloPN89elVAin5U0ydRdECi+cW4StvyY0mXdouFdaQ=;
        b=EODfWYgYAZ6CHDp98K9iHf6zRGWecyJ5cr/dRz+JcrcqfXXt2+3JUWYXFROrrqNZAB
         HDNXxKYb4DDKWSV8js2f3F+SpSP9XtM2sXtjJafNWLDBLqbyqx8dahkEHwcWNHgUXY5t
         mtPQXsK3LTODSU/PwIJRYT/soMDKxtL/RAPHWHS/eJQ74862oy3XGi+FF3+GqNBbIkbw
         RcNtIELvy3x2Y4ckluF331u5wnd30tuHlrVoxsQ2E37RCJm81+pE8SfFyYicl6+RQg9m
         YRDcuoZGacZS7kF34+wd+UA1bKWH/DYsNu5R7S3kbtUfjC2lC//+z9ubfGpdF04BckFC
         TjrQ==
X-Gm-Message-State: AFuF++kwzfDVAwb3udKuMjY9yl0QorRE04lHANu2iiIg2P8XwdPCHeRz
	16esZNBZCAjCKjXHisoSRC4kMXlMFT2fe04SYKafz+LD5cyB4uECustG
X-Gm-Gg: AR+sD12ds+f5Wm7gI6adKRAn62hY8n0l+pffvqvhJt5E0O0U4dU5XbYlv/GKC87b83d
	wOSlIrQMqNmWBWHPavvBWdDAnsuo0hWfODuOyzc03IIyYoLiCWQrHRGp/JynFUIJAatHSrHReV2
	oo7w4dVMP6ngLkLTZX3qa0ttttWHclZePjfX/6u/NxE71rWut1AedwTzaN/DgFmMKKCl3nNuMZG
	lsZEnBy9lgaaAM4SDkwZuj6Rb2hwj2reGhTUil9RljyPwGXYRGrygxhO8j82/sFsUq3P4FSmhFq
	AclVDo5U+jfoMMw/wN4Mx1dfSUZxbehDLG2jXcfe93Hgv6HOqwvS0Q34xQv5bq5J7ZSJkz5GD66
	djsZvjacwwX6vSfKGVzF9k9zMyy6a62ifWP0378G04sQG0/BuyeX4Fo4A4x3xs/p7GgZADpDyUp
	xcCbu4kb/AwmdTEBiZTGLKGPP/jqdpBoLF6odv0J9ZKUi7wPiD6KCgSsXgf831nF8GfUFUSq+30
	IHdoxJCK723lrhkqUBmMg==
X-Received: by 2002:a05:600c:1387:b0:499:7a4f:d13d with SMTP id 5b1f17b1804b1-499b8313ad3mr240196255e9.4.1787563950900;
        Mon, 24 Aug 2026 02:32:30 -0700 (PDT)
Received: from [192.168.1.135] ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b914bfcbsm117572285e9.9.2026.08.24.02.32.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 02:32:30 -0700 (PDT)
Message-ID: <7c7f447d-8796-4f6e-b607-5251d9129665@linux.com>
Date: Mon, 24 Aug 2026 10:32:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: amlogic: t7: use the real UART pclk
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <78721fe3-d9d0-4f85-a1ec-a01ebbf4f9a3@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_023233_072494_7DCA8AAC 
X-CRM114-Status: GOOD (  21.47  )
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

On 24/08/2026 10:15, Ronald Claveau wrote:
> On 8/23/26 1:39 PM, Lucas Tanure wrote:
>> On 19/08/2026 08:25, Ronald Claveau wrote:
>>> On 8/19/26 4:39 AM, Xianwei Zhao wrote:
>>>> Hi Lucas,
>>>>
>>>> On 2026/8/19 03:11, Lucas Tanure wrote:
>>>>> uart_a lists the 24MHz crystal for all three of its clocks, because
>>>>> the T7 clock controller driver did not exist when these boards were
>>>>> added.
>>>>>
>>>>> That leaves the real UART bus clock without a user, so the kernel
>>>>> turns it off when it disables unused clocks at the end of boot, and
>>>>> the board hangs.
>>>>>
>>>>> Point uart_a at the real clocks, the way meson-s4.dtsi does, and drop
>>>>> the placeholders from the two board files.
>>>>>
>>>>> Fixes: 4fef056588f5 ("arm64: dts: amlogic-t7-a311d2-khadas-vim4: add
>>>>> initial device-tree")
>>>>> Fixes: 6f048cc7a635 ("arm64: dts: add board AN400")
>>>>> Signed-off-by: Lucas Tanure<tanure@linux.com>
>>>>> Assisted-by: Claude:claude-fable-5
>>>>> ---
>>>>>     arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts       | 2 --
>>>>>     arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 2 --
>>>>>     arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi                   | 4
>>>>> ++++
>>>>>     3 files changed, 4 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>>>>> b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>>>>> index cab2ee9ea0d3..dcbcd08a78b9 100644
>>>>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>>>>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>>>>> @@ -33,7 +33,5 @@ xtal: xtal-clk {
>>>>>     };
>>>>>
>>>>>     &uart_a {
>>>>> -       clocks = <&xtal>, <&xtal>,
>>>>> <&xtal>;
>>>>> -       clock-names = "xtal", "pclk", "baud";
>>>>>            status = "okay";
>>>>>     };
>>>>> diff --git
>>>>> a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>>>>> b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>>>>> index c41525a34b72..677069e58f30 100644
>>>>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>>>>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>>>>> @@ -266,6 +266,4 @@ &sd_emmc_c {
>>>>>
>>>>>     &uart_a {
>>>>>            status = "okay";
>>>>> -       clocks = <&xtal>, <&xtal>,
>>>>> <&xtal>;
>>>>> -       clock-names = "xtal", "pclk", "baud";
>>>>>     };
>>>>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>>>> b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>>>> index cc371fcd1896..7847582e77ed 100644
>>>>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>>>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>>>> @@ -587,6 +587,10 @@ uart_a: serial@78000 {
>>>>>                                    compatible = "amlogic,t7-uart",
>>>>> "amlogic,meson-s4-uart";
>>>>>                                    reg = <0x0 0x78000 0x0 0x18>;
>>>>>                                    interrupts = <GIC_SPI 168
>>>>> IRQ_TYPE_EDGE_RISING>;
>>>>> +                               clocks = <&xtal>,
>>>>> +                                        <&clkc_periphs
>>>>> CLKID_SYS_UART_A>,
>>>>> +                                        <&xtal>;
>>>>> +                               clock-names = "xtal", "pclk", "baud";
>>>>>                                    status = "disabled";
>>>>>                            };
>>>>
>>>> I agree with moving the UART clock configuration to the DTSI file.
>>>> However, it seems a little odd to keep the XTAL clock definition in the
>>>> DTS, as the alias may not be consistent across different boards, which
>>>> could result in compilation errors. Could we move the XTAL clock
>>>> definition to the DTSI as well, similar to other Amlogic SoCs?
>>>
>>> It seems similar to changes in this series :
>>>
>>> https://lore.kernel.org/all/20260420-add-bluetooth-t7-vim4-
>>> v4-0-9505df0e7016@aliel.fr/
>>>
>>> What do you think ?
>>>
>> Thanks for pointing out that series, though I wasn't aware of it.
>> And after reading I don't agree with it. The clocks are not redundant,
>> they are there because we agreed sometime ago that xtal belongs to the
>> board files.
>> So I still vote for my change in v2, that I will send in a few minutes.
> 
> I don't get why it would be better to define the exact same clocks in
> each DTS file.
> 
> The xtal recommended characteristics provided at the SOC level can be
> defined in the DTSI and overridden, if really necessary, in the DTS.
> 
Hi Ronald,

The preference for keeping xtal in board-specific .dts files rather than 
the SoC .dtsi comes down to DT hardware modeling principles and upstream 
maintainer guidelines:

Hardware Topology: The xtal is physically located on the board PCB, not 
inside the SoC silicon. The .dtsi file models the SoC silicon internal 
architecture (clock controllers, IPs, registers), whereas .dts files 
describe the physical board layout surrounding it.

Avoiding Implicit Assumptions: Defining a default 24MHz xtal in .dtsi 
assumes every T7 board will use the same oscillator configuration. If a 
custom board design uses a different crystal frequency or an external 
clock generator/TCXO, overriding a .dtsi-level node can lead to messy DT 
overrides or silent clock rate mismatches if forgotten.

Upstream DT Maintainer Policy: Kernel DT maintainers consistently push 
to keep board-level hardware explicitly declared in the board .dts files 
to reflect actual physical board components.

That said, I acknowledge the trade-off is minor boilerplate duplication 
across board DTS files. If the Amlogic SoC maintainers prefer setting a 
default 24MHz xtal in amlogic-t7.dtsi to match older SoC generations, I 
am open to updating it—provided the maintainers explicitly prefer that 
tradeoff over strict DT topology modeling.

Best regards,

Lucas

