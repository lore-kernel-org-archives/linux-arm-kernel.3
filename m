Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF916C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 11:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4aAL9kjHi8d7xZ8Th1ELQbazXnG5IgJFjgkhzp2InRQ=; b=xGDeLohCc5SWVVbh4ssZn0JdSR
	xA7j28xoHKymdhnqK39WQ70+QXo+KHM9evnSwSNfICfuZVRCIK1od4Qz64Dfv3QaoF/M/Othqf2sP
	8CBzDam1cvlu94G/U9h3n6NapfnF7pvrF5e8vhp9qGkdflHfeJuvz/M7x2lWC277IRnWEJBFdwYRY
	/WKL4iMpyWHavfSEYO8snWrfWbFgLUwnrb7C1cGS2hMEiGhf6I6HwSzb3XBrfVU2XQ3O8cclH7T8r
	i622OaX8GqrH4m4matoiX+aaJET9pG3fW7VmE/ATueND7CcPLwW2j6zrFBOMTVOZjfzKBMbGFrQOL
	qxmYwl7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tohJn-0000000Fu2l-409h;
	Sun, 02 Mar 2025 11:17:11 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tohHa-0000000FtoD-1UyQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Mar 2025 11:14:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1740914093;
 bh=4aAL9kjHi8d7xZ8Th1ELQbazXnG5IgJFjgkhzp2InRQ=;
 b=G2oeUQ0SRsoK5jDzK8rxqS06+Y/hg/uasvwkzyfD4Zw3YMe/T8WHvOGwWDfo4oTOla6FAohM3
 dv3pQh1bTBb5++h/gVO7AgQP9ZCxP7QJvqcWW2zucmUywcVBH+9SuQUrZ5IpOfMJpWrWuHXm0OE
 tQqH4NqVy/qGCslzQ9Psg+1M5unJYkL6OQlwAkHzvU/T2r28XhzE/I4tLU8f3ZUeHdf4iZxKvyP
 MKhj1e3APpTIiVOuSyt9lJPvmlBgk+e1UOwAEkfLoyYv8y88bJ0xdfVoXqGCDA93ZE98b2bbE6k
 38QhLCmusARlihg9Ie0AbNkR1u1XbF3HQ7va4rmbH2XA==
X-Forward-Email-ID: 67c43dac4a29b97c03d4dc5d
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <3f0cd767-1fd8-4c65-b8b4-e948288cd02a@kwiboo.se>
Date: Sun, 2 Mar 2025 12:14:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] arm64: dts: rockchip: Add pinctrl and gpio nodes for
 RK3528
To: Yao Zi <ziyao@disroot.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250228064024.3200000-1-jonas@kwiboo.se>
 <20250228064024.3200000-5-jonas@kwiboo.se> <Z8GT3rUEyXrTUgtJ@pie.lan>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <Z8GT3rUEyXrTUgtJ@pie.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_031454_521165_B9B6894C 
X-CRM114-Status: GOOD (  18.77  )
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

Hi Yao Zi,

On 2025-02-28 11:46, Yao Zi wrote:
> On Fri, Feb 28, 2025 at 06:40:10AM +0000, Jonas Karlman wrote:
>> Add pinctrl and gpio nodes for RK3528 and import rk3528-pinctrl.dtsi
>> from vendor linux-6.1-stan-rkr5 kernel with the hdmi-pins-idle node
>> removed due to missing label reference to pcfg_output_low_pull_down.
>>
>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>> ---
>> This was mostly imported from vendor kernel, however the main commit [1]
>> list 28 signed-off-by tags, unclear who I should use as author and what
>> signed-off-by tags to include.
>>
>> [1] https://github.com/rockchip-linux/kernel/commit/c17d6325959f0ec1af901e8a17919163454190a2
>> ---
>>  .../boot/dts/rockchip/rk3528-pinctrl.dtsi     | 1397 +++++++++++++++++
>>  arch/arm64/boot/dts/rockchip/rk3528.dtsi      |   82 +
>>  2 files changed, 1479 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-pinctrl.dtsi
>>
> 
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
>> index 0fb90f5c291c..d3e2a64ff2d5 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
>> @@ -4,8 +4,10 @@
>>   * Copyright (c) 2024 Yao Zi <ziyao@disroot.org>
>>   */
>>  
>> +#include <dt-bindings/gpio/gpio.h>
>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>  #include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/pinctrl/rockchip.h>
>>  #include <dt-bindings/clock/rockchip,rk3528-cru.h>
>>  #include <dt-bindings/reset/rockchip,rk3528-cru.h>
>>  
>> @@ -17,6 +19,11 @@ / {
>>  	#size-cells = <2>;
>>  
>>  	aliases {
>> +		gpio0 = &gpio0;
>> +		gpio1 = &gpio1;
>> +		gpio2 = &gpio2;
>> +		gpio3 = &gpio3;
>> +		gpio4 = &gpio4;
>>  		serial0 = &uart0;
>>  		serial1 = &uart1;
>>  		serial2 = &uart2;
>> @@ -166,6 +173,11 @@ cru: clock-controller@ff4a0000 {
>>  			#reset-cells = <1>;
>>  		};
>>  
>> +		ioc_grf: syscon@ff540000 {
>> +			compatible = "rockchip,rk3528-ioc-grf", "syscon";
>> +			reg = <0x0 0xff540000 0x0 0x40000>;
>> +		};
>> +
>>  		uart0: serial@ff9f0000 {
>>  			compatible = "rockchip,rk3528-uart", "snps,dw-apb-uart";
>>  			reg = <0x0 0xff9f0000 0x0 0x100>;
>> @@ -264,5 +276,75 @@ saradc: adc@ffae0000 {
>>  			#io-channel-cells = <1>;
>>  			status = "disabled";
>>  		};
>> +
>> +		pinctrl: pinctrl {
>> +			compatible = "rockchip,rk3528-pinctrl";
>> +			rockchip,grf = <&ioc_grf>;
>> +			#address-cells = <2>;
>> +			#size-cells = <2>;
>> +			ranges;
> 
> I doubt whether the pincontroller should be placed under simple-bus:
> without a reg property, it doesn't look like a MMIO device.
> 
> Actually it is, although all the registers stay in the ioc grf. Maybe
> it should be considered as child of the grf.

This follows how pinctrl was added for RK3576 and what is proposed for
RK3562 [2]. I have too little knowledge to know if this needs to change
or if this should follow similar SoCs.

[2] https://lore.kernel.org/r/20250227111913.2344207-15-kever.yang@rock-chips.com

Regards,
Jonas

> 
> Best regards,
> Yao Zi


