Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A037C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 00:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=09+tGkfgsm4KwscqPR7hMZNk1h0y9NoFhShrUUaWQ88=; b=XZlHfLN2fB2kMDJXQrheBFx+tz
	dPkvuVEqzfN9mdXTfB8abF7FOf5eXE8Wmcm1t3niBoGPsGqKfKxb6e42ZeQlaIO+NnW3vEgAtBp5Y
	RRgZQcjAUl+trmKT9F+bAfFqx9p6ftOYicluYcx0/6ryVoxj+oob4YfjCDr55HkPxrm6bQarsiKaE
	jspSYqkR0gCeBaa6hX2U8jBpOtLmkJ46zIbemzuOTL9XBK5W+cvNPRu08ypDCvXvHsBNug6JL3MhY
	xKj0XLfBrwpsDMT+qEO12tkf1UWUevxggVgPpEvW80pGlM52lDj8UVwhwFAGcBq2GfXJHIY0vX0kQ
	EJwJOncg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub6iV-00000000nYH-33Ta;
	Mon, 14 Jul 2025 00:06:48 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub6g5-00000000nC0-17vV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 00:04:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1752451455;
 bh=09+tGkfgsm4KwscqPR7hMZNk1h0y9NoFhShrUUaWQ88=;
 b=gmoC0NeFMlUcFBTtbq9r1DhmnTY50snPjwE8B0AZEQC6lX3PeXIl23XR9GxN5r1CDSPc5OVCA
 52ZrPymoumQEdMkA1LiumXogSo+y+pC87sqMRcEjoVBZbxaGaGfvNEKxcZ+3TOLOiJa5glm/J/A
 FPmK7H5OsB4BwbSuVxsNS0h2DdF65PEZGtZe7n6bHajkz/v6wIzRTeEhZ4LrBysko5X4iL4Y8md
 Tu78AZRPfQupv2YlmLnMZojno2E/TutzfXHkLodroTlAanl1qbSnKddWyZmGkJNhX1nbOk59ERr
 Z/NcABae4yaMDoWMFblGZ6OtXUTdMLvjExVtFGjVYdJA==
X-Forward-Email-ID: 687449765bca601a1a1d3609
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.1.6
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <16d99271-ba04-4ce1-a335-fab1917637c7@kwiboo.se>
Date: Mon, 14 Jul 2025 02:04:01 +0200
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
 <9aae8b30-23ae-4866-9ce8-02bbc8b44a82@kwiboo.se>
 <88c7b90d-4c29-453b-9a5c-9679b371a3a9@gmail.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <88c7b90d-4c29-453b-9a5c-9679b371a3a9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_170417_355954_C8080AA8 
X-CRM114-Status: GOOD (  37.12  )
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

On 7/13/2025 10:56 PM, Alex Bee wrote:
> Hi Jonas,
> 
>> Hi Alex,
>>
>> On 7/13/2025 9:13 PM, Alex Bee wrote:
>>> Hi list, Hi Jonas,
>>>
>>>> This series adds dt-bindings and initial device tree for the following
>>>> Rockchip RK3528A boards:
>>>> - Radxa ROCK 2A/2F
>>>> - ArmSoM Sige1
>>>> - FriendlyElec NanoPi Zero2
>>>
>>> this only sub-related to this series: Is there any particular reason, why
>>> we call the compatible "rockchip,rk3528" and not "rockchip,rk3528a"? From
>>> what I can see all boards currently supported (and those in this series)
>>> are having the RK3528A version of the SoC. I didn't follow the development
>>> here, but there are differences - I did a quick compare of the datasheets
>>> of those two SoC versions - it looks like RK3528 version has USB3-DRD
>>> controller, while RK3528A has USB3 host-only controller. Also it seems to
>>> have different video codec IPs and the DRAM controller additionally
>>> supports LPDDR4X.
>> What datasheet versions did you check? I can only find:
>> - RK3528 Rev 1.0 (2023-05-22)
>> - RK3528A Rev 1.2 (2024-04-10)
> I used
> 
> 2023-07-12 Revision V1.0
> 
> which didn't include these features - which is interesting: Why would a
> SoC vendor not try to sell all features in the first place :)
> 
> But I now double checked in
> 
> 2025-05-12 Revision 1.4
> 
> and you are right: It appears there also for RK3528A.
> 
> The only difference I could now make out by comparing v1.4 of both versions
> is the cipher engine: RK3528 additionally supports "SM2/SM3/SM4 cipher" -
> but still it exists and additionally the different video codec (if mpp
> userspace library is correct about that).
> 
> Anyway: My question was more about: Why didn't we choose the correct
> compatible from the beginning? And of course the dts files would have to be
> renamed if the compatible is changed, as they are named according to their
> SoC-compatible.

Not sure, possible due to lack of technical documentation for this SoC,
to my knowledge all upstream development has been done without any
access to a TRM for the SoC.

Based on vendor code (u-boot and linux) there does not seem to be
anything special about the A-variant, so my thinking has always been
that the A-variant may have just been an updated/fixed hw revision and
is the version that went into newer production devices.

The recently released U-Boot 2025.07 is referencing the filename
rk3528-radxa-e20c.dtb from the synced devicetree-rebasing tree. So a
possible rename will affect a future release of U-Boot, and possible
devices in the field depending on when a rename would land in linux.

For this series I tried to just follow what is currently used for the
Radxa E20C.

If I am correct there is now also a RK3518 tvbox variant of this SoC,
do not know how that would fit into all this :-S

Regards,
Jonas

> 
> Regards,
> Alex
>>
>> And both list LPDDR4X support and the A-variant seem to list USB3-DRD
>> support, did you mix them up above?
>>
>> I think these SoCs are similar to rk3228/rk3229, rk3228h/rk3328 and now
>> rk3528/rk3528a, in that only the second variant support VP9 decoding.
>>
>> Use of rockchip,rk3528a compatible could be something to change,
>> could also be something that bootloader set at runtime, similar to
>> what it does for rk3288w.
>>
>>> I guess it would be good to discuss this before this series is merged,
>>> because re-naming *.dts files after they have been in a release is somewhat
>>> impossible.
>> I think renaming the device tree files is unnecessary, as there seem to
>> be very little difference. All boards I have come across are currently
>> RK3528A variants. How would we treat the Radxa E20C?, it is not named
>> rk3528-radxa-e20c.dtb, yet uses the A-variant.
>>
>> For mainline U-Boot I have included printing out the SoC-variant,
>> however the compatible is not adjusted:
>>
>>    Model: Radxa E20C
>>    SoC:   RK3528A
>>    DRAM:  2 GiB
>>
>> Regards,
>> Jonas
>>
>>> Regards,
>>> Alex
>>>> The bt/wifi_reg_on pins are described in the device tree using
>>>> rfkill-gpio nodes.
>>>>
>>>> Changes in v3:
>>>> - Rename led nodes to led-0/led-1
>>>> - Remove pinctrl* props from sdio0
>>>> - Collect a-b tags
>>>>
>>>> Changes in v2:
>>>> - Limit sdmmc max-frequency to 100 MHz on ROCK 2A/2F
>>>> - Drop clock-output-names prop from rtc node on Sige1 and NanoPi Zero2
>>>> - Drop regulator-boot-on from usb 2.0 host regulators on Sige1
>>>> - Add bluetooth and wifi nodes on Sige1
>>>> - Collect t-b tag for NanoPi Zero2
>>>>
>>>> These boards can be booted from emmc or sd-card using the U-Boot 2025.07
>>>> generic-rk3528 target or work-in-progress patches for these boards [1].
>>>>
>>>> For working bluetooth on ArmSoM Sige1 the patch "arm64: dts: rockchip:
>>>> Fix UART DMA support for RK3528" [2] is required.
>>>>
>>>> [1] https://source.denx.de/u-boot/contributors/kwiboo/u-boot/-/commits/rk3528
>>>> [2] https://lore.kernel.org/r/20250709210831.3170458-1-jonas@kwiboo.se
>>>>
>>>> Jonas Karlman (6):
>>>>     dt-bindings: arm: rockchip: Add Radxa ROCK 2A/2F
>>>>     arm64: dts: rockchip: Add Radxa ROCK 2A/2F
>>>>     dt-bindings: arm: rockchip: Add ArmSoM Sige1
>>>>     arm64: dts: rockchip: Add ArmSoM Sige1
>>>>     dt-bindings: arm: rockchip: Add FriendlyElec NanoPi Zero2
>>>>     arm64: dts: rockchip: Add FriendlyElec NanoPi Zero2
>>>>
>>>>    .../devicetree/bindings/arm/rockchip.yaml     |  17 +
>>>>    arch/arm64/boot/dts/rockchip/Makefile         |   4 +
>>>>    .../boot/dts/rockchip/rk3528-armsom-sige1.dts | 465 ++++++++++++++++++
>>>>    .../boot/dts/rockchip/rk3528-nanopi-zero2.dts | 340 +++++++++++++
>>>>    .../boot/dts/rockchip/rk3528-rock-2.dtsi      | 293 +++++++++++
>>>>    .../boot/dts/rockchip/rk3528-rock-2a.dts      |  82 +++
>>>>    .../boot/dts/rockchip/rk3528-rock-2f.dts      |  10 +
>>>>    7 files changed, 1211 insertions(+)
>>>>    create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dts
>>>>    create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
>>>>    create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi
>>>>    create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dts
>>>>    create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dts
>>>>


