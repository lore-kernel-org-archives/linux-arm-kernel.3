Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6484C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 22:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XY3BA1Vv02oLfVKMD+vhtMt4wqV14ktZSaEZlGUTwv8=; b=NaSdSN3N1sZMoSt3ahS141sgf0
	vJhss+rB2MXsredjwzTevzlaCnkrmTodJaQc+7/H3rVw3+ziqAKwOWCfY/ORiaJRAPVde0th7IVB4
	U75TtQlB8xOl7fZKoRiN0PgcBYymMmR9uZRIgdBR/iZTnAxk+NItoiAOaPyC67UsjS84mi8aLe6SL
	bNIoDYzodOok/89KYUQHwtz9pKvry98F9S8/zO3gyakCcUUAnW9cc9wG08Vw8ft7nIWG01EWj5973
	vw6E3Cg9nHR7JAzCM9BAA4ObrlUw5c0Qhe7gllgx83z1jN+vqpM+KLzKtGH9xQ9WufeqDMncdDjxB
	R+kXxxvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twTRv-00000001myp-0nJb;
	Sun, 23 Mar 2025 22:05:43 +0000
Received: from smtp.forwardemail.net ([121.127.44.59])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twTQD-00000001mmL-19h9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 22:03:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: References: Cc:
 To: From: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1742767433;
 bh=XY3BA1Vv02oLfVKMD+vhtMt4wqV14ktZSaEZlGUTwv8=;
 b=jbqF4OpMJbfYya2OvlaUKDGR2wW1oCtuVa+C6f2lraNb7zuCZrG+k5X02stoDhHaTUtx88EEa
 ldl3x2oJlqD9+Nzr684FEuFNzg6j2pFT9JAz8CDr6uJp7+6XFPYwcH1VgnOR+xv3zo7mZZreWIO
 gnKElRI4odGtfNF1Vs3EsJfhHsZMhg92WXNtJGa9E+r7yp4UuK55Xu2QxLEXdXgTRAK/ewUps3S
 p3CBjtxNUaIluZRXGbI6K35pk5JnRQfu28Qb3aRdrbXKSfSpY9ltSzE3kSIRnZH1/obFXVd5ieh
 Yq4G70nDn7aym2wxR8xkmMat+HKCvTSCZHnwtviVDWpQ==
X-Forward-Email-ID: 67e08547bd529871d5f812bb
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.59
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <364bed4f-4ae1-48d5-ae6e-369668456d8e@kwiboo.se>
Date: Sun, 23 Mar 2025 23:03:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: rockchip: Add pwm nodes for RK3528
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>, Chukun Pan <amadeus@jmu.edu.cn>
Cc: Yao Zi <ziyao@disroot.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250318120003.2340652-1-amadeus@jmu.edu.cn>
 <20250318120003.2340652-2-amadeus@jmu.edu.cn>
 <0d638134-0c0d-4918-af47-e23d2ead3bf3@kwiboo.se> <2499436.jE0xQCEvom@phil>
 <0f0a35ba-d85d-49eb-92dd-7bc17358aeaf@kwiboo.se>
Content-Language: en-US
In-Reply-To: <0f0a35ba-d85d-49eb-92dd-7bc17358aeaf@kwiboo.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_150357_500493_589B78CF 
X-CRM114-Status: GOOD (  27.11  )
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

On 2025-03-20 08:02, Jonas Karlman wrote:
> On 2025-03-20 00:47, Heiko Stuebner wrote:
>> Am Donnerstag, 20. März 2025, 00:26:14 MEZ schrieb Jonas Karlman:
>>> Hi Chukun,
>>>
>>> On 2025-03-18 13:00, Chukun Pan wrote:
>>>> Add pwm nodes for RK3528. The PWM core on RK3528 is the same as
>>>> RK3328, but the driver does not support interrupts yet.
>>>
>>> The device tree should describe the hardware, not what the driver
>>> support, so interrupts should probably be included.
>>>
>>> However, looking closer at TRM for i.e. RK3328, RK3568 and RK3588 it
>>> look like the following description is not a true description of the
>>> hardware.
>>>
>>> Each PWM controller seem to support 4 channels, here (and for older RK
>>> SoCs) we instead describe each channel and not the controller.
>>
>> Yep, that is something that did go wrong in the very early days.
>> And all other Rockchip socs also have the same issue - even back
>> to the rk3066.
> 
> I see, look like the PWM has evolved something like following:
> 
> - The controller has always been 1 controller for 4 channels
> - Initial versions only had 2 regs for interrupt outside of the 4x
>   0x10 reg space, one for each channel
> - FIFO was introduced for channel 3
> - Interrupts for FIFO was introduced (in RK3399 or earlier)
> - Additional features/regs was introduced (in PX30 or earlier)
> - PWM_VERSION_ID = 0x02120b34 is used (in RK3308 and later)
> 
>>
>> So yes, at some point we should overhaul the thing.
>>
>> But I think this is more involved, as right now everything is aimed
>> at the current single-channel status quo.
> 
> I did a quick and dirty change in driver to use npwms = 4, and that was
> a rather trivial change, see top commit at [1]. Minimum required change
> in U-Boot also look to be very trivial.

I did a quick test on U-Boot and are preparing a series to add support
for multiple channels in U-Boot, see [2] for an early version that
should hit U-Boot ML in a day or two.

Found some other other issues when digging in the U-Boot pwm-regulator
code so ended up with a bigger series than anticipated, only the last
patch is related to preparation for multiple channels in rk-pwm driver.

[2] https://source.denx.de/u-boot/contributors/kwiboo/u-boot/-/commits/pwm-regulator

Regards,
Jonas

> 
>   cat /sys/kernel/debug/pwm
>   0: platform/ffa90000.pwm, 4 PWM devices
>    pwm-0   ((null)              ): period: 0 ns duty: 0 ns polarity: normal
>    pwm-1   (regulator-vdd-arm   ): requested enabled period: 5000 ns duty: 2250 ns polarity: inverse
>    pwm-2   (regulator-vdd-logic ): requested enabled period: 5000 ns duty: 2800 ns polarity: inverse
>    pwm-3   ((null)              ): period: 0 ns duty: 0 ns polarity: normal
> 
> Not really seeing any reason not to describe these PWM controllers more
> correctly, we need to start somewhere.
> 
> However, I have no idea on how to deal with historic and wrong bindings.
> Driver could possible check if resource space is above 0x10 size and state
> of PWM_VERSION_ID.
> 
>   PWM_VERSION_ID  0x005c  W  0x02120b34  PWM Version ID Register  
> 
> [1] https://github.com/Kwiboo/linux-rockchip/commits/next-20250319-rk3528/
> 
> Regards,
> Jonas
> 
>>
>>
>> Heiko
>>
>>
>>> Maybe something like following would better represent the hardware:
>>>
>>> 	pwm0: pwm@ffa90000 {
>>> 		compatible = "rockchip,rk3528-pwm";
>>> 		reg = <0x0 0xffa90000 0x0 0x10000>;
>>> 		clocks = <&cru CLK_PWM0>, <&cru PCLK_PWM0>;
>>> 		clock-names = "pwm", "pclk";
>>> 		interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
>>> 			     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
>>> 	};
>>>
>>> 	pwm1: pwm@ffa98000 {
>>> 		compatible = "rockchip,rk3528-pwm";
>>> 		reg = <0x0 0xffa98000 0x0 0x10000>;
>>> 		clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
>>> 		clock-names = "pwm", "pclk";
>>> 		interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
>>> 			     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
>>> 	};
>>>
>>> Regards,
>>> Jonas
>>>
>>>>
>>>> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
>>>> ---
>>>>  arch/arm64/boot/dts/rockchip/rk3528.dtsi | 80 ++++++++++++++++++++++++
>>>>  1 file changed, 80 insertions(+)
>>>>

[snip]

