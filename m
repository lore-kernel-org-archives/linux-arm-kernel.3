Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52884C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 20:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4U+mcZEzIP2ITFV/NhCq+SDVBQUz67IM7MGDWjmhx2c=; b=VJklGIoTgBPPAVnIgcTXg0Q49N
	mcydWUQW9QjfnBL5kMDAAvj4eXSMCbv66e52QlfDwW/yCbpfMemautQ0ez+fGviZHnCP6pH72bfIS
	LGfPkUzFVzDrVwdG+IECDbX0UdJNsDM8n3oU/HOjn1Pi2FFk4kAgwyGQY2nTv09cIXqCTULaBNQzd
	STwXLkTs4vDcOFEUl3iLs1eg0P20PUgeARAnwRNa/oORLa4u9Ndb/pw8svnPjWiCV4S2fk5JDKS/P
	MWY4tXY2od5iv46uTQ/w4NN6v+xxP7eHx7jQoz2IJdnq0EzUeVtlHv1mOySd+GQu+ncWnhtHvCZu5
	ob6L9ffA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub3Hb-00000000bNl-2vk6;
	Sun, 13 Jul 2025 20:26:47 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub3F7-00000000bFb-44Dl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 20:24:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1752438251;
 bh=4U+mcZEzIP2ITFV/NhCq+SDVBQUz67IM7MGDWjmhx2c=;
 b=sU5PHW41mnu0S8HmTZfswWu5vvwJ+tQfWdcNvzdFg7n0rUvvrnJIEeVWuMFMCMFYCaNq19tEM
 i6R1ton+ZNVjo1thn+wQJIRVJj3ffvVA+UZ7K+I8UBY31+FNBidVi44r3QBzOceImnn+GBmQ6cr
 83xOmW0AtM6qSceo5OvmeDlsDGnUxhnA3Gix7CXD6U9xxh0Zac5l/ctKVMMT2Xkd7vXtwNJLZfY
 2UJjUkCHbNBkHB36llx4BfIV5mZxhGgI7UZsrV7Ymej1IBO5aMufojkfJ8qBHq5x7U9PG49Cr7u
 AJZqCXtal2XJSmmYTHqX75kYBNowcZeH4zQuX6oyh/xA==
X-Forward-Email-ID: 6874138a1bd28f931143727b
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.1.6
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <9aae8b30-23ae-4866-9ce8-02bbc8b44a82@kwiboo.se>
Date: Sun, 13 Jul 2025 22:13:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] arm64: dts: rockchip: Add ROCK 2A/2F, Sige1 and
 NanoPi Zero2
To: Alex Bee <knaerzche@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>,
 Chukun Pan <amadeus@jmu.edu.cn>, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250712173805.584586-1-jonas@kwiboo.se>
 <702dc4bb-7b3c-4647-b84f-8516989b0836@gmail.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <702dc4bb-7b3c-4647-b84f-8516989b0836@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_132414_105893_9B292CC7 
X-CRM114-Status: GOOD (  27.32  )
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

Hi Alex,

On 7/13/2025 9:13 PM, Alex Bee wrote:
> Hi list, Hi Jonas,
> 
>> This series adds dt-bindings and initial device tree for the following
>> Rockchip RK3528A boards:
>> - Radxa ROCK 2A/2F
>> - ArmSoM Sige1
>> - FriendlyElec NanoPi Zero2
> 
> 
> this only sub-related to this series: Is there any particular reason, why
> we call the compatible "rockchip,rk3528" and not "rockchip,rk3528a"? From
> what I can see all boards currently supported (and those in this series)
> are having the RK3528A version of the SoC. I didn't follow the development
> here, but there are differences - I did a quick compare of the datasheets
> of those two SoC versions - it looks like RK3528 version has USB3-DRD
> controller, while RK3528A has USB3 host-only controller. Also it seems to
> have different video codec IPs and the DRAM controller additionally
> supports LPDDR4X.

What datasheet versions did you check? I can only find:
- RK3528 Rev 1.0 (2023-05-22)
- RK3528A Rev 1.2 (2024-04-10)

And both list LPDDR4X support and the A-variant seem to list USB3-DRD
support, did you mix them up above?

I think these SoCs are similar to rk3228/rk3229, rk3228h/rk3328 and now
rk3528/rk3528a, in that only the second variant support VP9 decoding.

Use of rockchip,rk3528a compatible could be something to change,
could also be something that bootloader set at runtime, similar to
what it does for rk3288w.

> I guess it would be good to discuss this before this series is merged,
> because re-naming *.dts files after they have been in a release is somewhat
> impossible.

I think renaming the device tree files is unnecessary, as there seem to
be very little difference. All boards I have come across are currently
RK3528A variants. How would we treat the Radxa E20C?, it is not named
rk3528-radxa-e20c.dtb, yet uses the A-variant.

For mainline U-Boot I have included printing out the SoC-variant,
however the compatible is not adjusted:

  Model: Radxa E20C
  SoC:   RK3528A
  DRAM:  2 GiB

Regards,
Jonas

> 
> Regards,
> Alex
>>
>> The bt/wifi_reg_on pins are described in the device tree using
>> rfkill-gpio nodes.
>>
>> Changes in v3:
>> - Rename led nodes to led-0/led-1
>> - Remove pinctrl* props from sdio0
>> - Collect a-b tags
>>
>> Changes in v2:
>> - Limit sdmmc max-frequency to 100 MHz on ROCK 2A/2F
>> - Drop clock-output-names prop from rtc node on Sige1 and NanoPi Zero2
>> - Drop regulator-boot-on from usb 2.0 host regulators on Sige1
>> - Add bluetooth and wifi nodes on Sige1
>> - Collect t-b tag for NanoPi Zero2
>>
>> These boards can be booted from emmc or sd-card using the U-Boot 2025.07
>> generic-rk3528 target or work-in-progress patches for these boards [1].
>>
>> For working bluetooth on ArmSoM Sige1 the patch "arm64: dts: rockchip:
>> Fix UART DMA support for RK3528" [2] is required.
>>
>> [1] https://source.denx.de/u-boot/contributors/kwiboo/u-boot/-/commits/rk3528
>> [2] https://lore.kernel.org/r/20250709210831.3170458-1-jonas@kwiboo.se
>>
>> Jonas Karlman (6):
>>    dt-bindings: arm: rockchip: Add Radxa ROCK 2A/2F
>>    arm64: dts: rockchip: Add Radxa ROCK 2A/2F
>>    dt-bindings: arm: rockchip: Add ArmSoM Sige1
>>    arm64: dts: rockchip: Add ArmSoM Sige1
>>    dt-bindings: arm: rockchip: Add FriendlyElec NanoPi Zero2
>>    arm64: dts: rockchip: Add FriendlyElec NanoPi Zero2
>>
>>   .../devicetree/bindings/arm/rockchip.yaml     |  17 +
>>   arch/arm64/boot/dts/rockchip/Makefile         |   4 +
>>   .../boot/dts/rockchip/rk3528-armsom-sige1.dts | 465 ++++++++++++++++++
>>   .../boot/dts/rockchip/rk3528-nanopi-zero2.dts | 340 +++++++++++++
>>   .../boot/dts/rockchip/rk3528-rock-2.dtsi      | 293 +++++++++++
>>   .../boot/dts/rockchip/rk3528-rock-2a.dts      |  82 +++
>>   .../boot/dts/rockchip/rk3528-rock-2f.dts      |  10 +
>>   7 files changed, 1211 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dts
>>   create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
>>   create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi
>>   create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dts
>>   create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dts
>>
> 


