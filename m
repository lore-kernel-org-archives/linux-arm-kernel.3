Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC9DCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 09:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z7oziDeuwkmd8947bttnyThl+HlOX3Z2NisMKrMHgCQ=; b=ogbdmMvew3QLnC9J6lNMNq3gHL
	Xn9SnDolbanY0R38bOyFCDyMhM5BcbA+mckwCkKsKMmxLgTJjGtro3H8eqFsuxE+UDvvRufNtXeQ7
	0zsMODkxpcoAxZ/HkgUvbHs3EgmGSqHFTloGSAVUaAaNtsaZQ/fE0U6aMSdnH8IvAEChD+lYabuaV
	c2MifSQgXK664LpkfgjhlRYVGqEV1W7A/D2qxzlC1Wv2+3hFnqxgjo9nOwogP/XKHzJvl2YUiCALX
	Hc4o7ruB1y3OcV/WVuL9GTVZHd6+YPIJuVNEpHmEJ/F4wqi4BoMz89iiSAYL401C+OnHNfcXKrFj0
	Yg0r/Z6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHTz-0000000DLpM-0ShP;
	Wed, 10 Sep 2025 09:51:19 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHTw-0000000DLjX-34hd;
	Wed, 10 Sep 2025 09:51:18 +0000
X-QQ-mid: zesmtpip2t1757497820tb0cecf54
X-QQ-Originating-IP: Ahtj5ExDDHnKTkw5w5uex1NY/uHgHf+Fq+CUTE4cJ1g=
Received: from [IPV6:240f:10b:7440:1:e5ed:636d ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 10 Sep 2025 17:50:15 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3479308026066286794
Message-ID: <2DB98035A3401FCC+ed53497a-f817-422b-a1fc-16f72d166032@radxa.com>
Date: Wed, 10 Sep 2025 18:50:14 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add Radxa E24C
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Jonas Karlman <jonas@kwiboo.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>,
 Chukun Pan <amadeus@jmu.edu.cn>, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250727144409.327740-1-jonas@kwiboo.se>
 <a443fca9-e660-4a7a-b637-ec840ac8ed1e@kwiboo.se>
 <AF1546E3BE23C6D5+08234a44-4321-45da-9c74-5690f3437e03@radxa.com>
 <3331537.aV6nBDHxoP@diego>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
In-Reply-To: <3331537.aV6nBDHxoP@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: Nnd5cAEgLcFhFw/bNYysLmQwF1vVz16UWeJHPgs7QRj2en9xSG82Xwe4
	4G8byxhpPkYesWwYytyfSN0gaMo1k1s6cKsnIM8v6NOEk5zrXR+kSVR8JiVJ218/UYsWx87
	aPZ9bVfZ8rnyKnPM+ru3ismJkAUn6MJldKa3mTcN86QfP0lnRqXQnwzuJ7fYsPVW7b233A6
	1pqNm3vfcnU1GlI80Tl/2BsJvTioltvo8FhX7dgyOYgo7wQnuXoukMV2fXIboThJS4t3Nno
	WVpytz8p6vA+2iTADAWzprTA+YSURfSiQoXFYmgwRPvmTCvNUP+4fwTOAy9wfeGKWI1U2lw
	sdv3xIOZyZs/oAbhd0T4TyyHmLaTwOgezfe7R3xlfpMI2zfD4vYJFOuHoP35dOVcKQewMRx
	yYr1UPdfPnJXR7keexIXsmKHDkxE5F4QH2uRwIHWf3Tj1q1mPcwLYOBhrGiU4a8xdt+vjkr
	Uhf2owa/LqNgxcoAFab9qxYUJSVXTFxxIkCshd92tA8Ae6GGZX2qmih4/ZHQaZwGCJq6S2B
	o3h98zCTyLevDoByGYieqi1sV1xhUce3MYZJCIhe3FJ3Ub04liBtt88VBR+aL0Q4qXPuwc+
	y6AJrkY27THJTh34tzmYjq6iOPEGkJ+PDhI69FtyJ9FPJaSve6m7P/hrJjW8E4GO0VXRoRt
	gvry7D9P2K12GL33vlf5a2aFm8kV6GXwyldyBQmurAbZfFrLdDHjVKzdiMxqRyxg3S+LtDI
	ppeaiO1gxEpLpQXIKvN/zlO+b4MvVdl4P/0m6OgaZJN++leua2RXNvRgCI81UAJ754TlJ69
	xBBarUhn6w/ESQ2cptjnYwc3CxP63oclZkO9pcs218c+pe22R5+BJaflAw/77IO9KU3wH1u
	Def0vmkiwnGz9bVGVME7GV6I7p/oEz26Xanawswz3Emp2wLKiyZvP94hw6AVt7SLwa7c/Oo
	AaXVVkmHxJe6VkGZ7I6yMggWCPesRvp9RJ5RSaRxD0XQLqDTmyKgfbSHYLl8fGeYfl3E0Yf
	jHcORROg==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_025117_125493_58DD03B1 
X-CRM114-Status: GOOD (  25.44  )
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

Hi Heiko,

On 9/10/25 17:07, Heiko Stübner wrote:
> Am Mittwoch, 10. September 2025, 04:43:30 Mitteleuropäische Sommerzeit schrieb FUKAUMI Naoki:
>> Hi Jonas, Heiko,
>>
>> On 9/10/25 04:36, Jonas Karlman wrote:
>>> On 9/9/2025 5:39 PM, Heiko Stübner wrote:
>>>> Am Dienstag, 9. September 2025, 16:48:25 Mitteleuropäische Sommerzeit schrieb Jonas Karlman:
>>>>> On 9/9/2025 2:28 PM, FUKAUMI Naoki wrote:
>>>>>> Hi Jonas,
>>>>>>
>>>>>> On 7/27/25 23:44, Jonas Karlman wrote:
>>>>>>> The Radxa E24C is a compact, high-performance network computer
>>>>>>> developed by Radxa, based on the Rockchip RK3528A SoC.
>>>>>>>
>>>>>>> Add initial device tree for the Radxa E24C.
>>>>>>>
>>>>>>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>>>>>>> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>>>>>>> ---
>>>>>>> Schematics: https://dl.radxa.com/e/e24c/docs/radxa_e24c_v1200_schematic.pdf
>>>>>>> ---
>>>>>>>     arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>>>>>>>     .../boot/dts/rockchip/rk3528-radxa-e24c.dts   | 519 ++++++++++++++++++
>>>>>>>     2 files changed, 520 insertions(+)
>>>>>>>     create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-radxa-e24c.dts
>>>>>>>
>>>>>>> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
>>>>>>> index 0662fcf00628..dc62fd5305be 100644
>>>>>>> --- a/arch/arm64/boot/dts/rockchip/Makefile
>>>>>>> +++ b/arch/arm64/boot/dts/rockchip/Makefile
>>>>>>> @@ -92,6 +92,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399pro-rock-pi-n10.dtb
>>>>>>>     dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-armsom-sige1.dtb
>>>>>>>     dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-nanopi-zero2.dtb
>>>>>>>     dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-radxa-e20c.dtb
>>>>>>> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-radxa-e24c.dtb
>>>>>>>     dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-rock-2a.dtb
>>>>>>>     dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-rock-2f.dtb
>>>>>>>     dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3562-evb2-v10.dtb
>>>>>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e24c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e24c.dts
>>>>>>> new file mode 100644
>>>>>>> index 000000000000..225f2b0c5339
>>>>>>> --- /dev/null
>>>>>>> +++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e24c.dts
>>>>>>> @@ -0,0 +1,519 @@
>>>>>>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>>>>>>> +
>>>>>>> +/dts-v1/;
>>>>>>> +
>>>>>>> +#include <dt-bindings/input/input.h>
>>>>>>> +#include <dt-bindings/leds/common.h>
>>>>>>> +#include "rk3528.dtsi"
>>>>>>> +
>>>>>>> +/ {
>>>>>>> +	model = "Radxa E24C";
>>>>>>> +	compatible = "radxa,e24c", "rockchip,rk3528";
>>>>>>> +
>>>>>>> +	aliases {
>>>>>>> +		ethernet0 = &gmac1;
>>>>>>> +		i2c0 = &i2c0;
>>>>>>> +		i2c1 = &i2c1;
>>>>>>> +		i2c5 = &i2c5;
>>>>>>> +		mmc0 = &sdhci;
>>>>>>> +		mmc1 = &sdmmc;
>>>>>>> +		rtc0 = &hym8563;
>>>>>>> +		rtc1 = &rk805;
>>>>>>> +		serial0 = &uart0;
>>>>>>> +	};
>>>>>>> +
>>>>>>> +	chosen {
>>>>>>> +		stdout-path = "serial0:1500000n8";
>>>>>>> +	};
>>>>>>> +
>>>>>>> +	adc-keys {
>>>>>>> +		compatible = "adc-keys";
>>>>>>> +		io-channels = <&saradc 0>;
>>>>>>> +		io-channel-names = "buttons";
>>>>>>> +		keyup-threshold-microvolt = <1800000>;
>>>>>>> +		poll-interval = <100>;
>>>>>>> +
>>>>>>> +		button-maskrom {
>>>>>>> +			label = "MASKROM";
>>>>>>> +			linux,code = <KEY_SETUP>;
>>>>>>> +			press-threshold-microvolt = <0>;
>>>>>>> +		};
>>>>>>> +	};
>>>>>>> +
>>>>>>> +	gpio-keys {
>>>>>>> +		compatible = "gpio-keys";
>>>>>>> +		pinctrl-names = "default";
>>>>>>> +		pinctrl-0 = <&gpio0_a0_user>;
>>>>>>> +
>>>>>>> +		button-user {
>>>>>>> +			gpios = <&gpio0 RK_PA0 GPIO_ACTIVE_LOW>;
>>>>>>> +			label = "USER";
>>>>>>> +			linux,code = <BTN_1>;
>>>>>>
>>>>>> I prefer to assign BTN_0 to the 1st button :)
>>>>>
>>>>> The E20C (and other RK boards) already use BTN_1 for user button, it
>>>>> only seem to be the recently added E54C that is using BTN_0.
>>>>>
>>>>> For consistency I suggest we keep using BTN_1 for this user button and
>>>>> possible fixup E54C, if you want to use same button for all variants.
>>>>
>>>> Yep, that would also keep the amount of userspace-facing changes
>>>> minimal.
>>>
>>> I mixed up e54c and e52c so my statement was not fully correct above,
>>> however there is a mixed use of BTN_1 and BTN_0 for user button:
>>>
>>> - rk3588s-nanopi-r6c/r6s uses BTN_1, added in v6.9-rc1
>>> - rk3588-friendlyelec-cm3588-nas uses BTN_1, added in v6.11-rc1
>>> - rk3582-radxa-e52c uses BTN_0, added in v6.14-rc1
>>> - rk3528-radxa-e20c uses BTN_1, added in v6.15-rc1
>>> - rk3576-nanopi-m5 uses BTN_1, added in v6.17-rc1
>>>
>>> Majority seem to be using BTN_1 for a user button.
>>
>> If we can unify to BTN_1 even if it breaks backward compatibility, I
>> wouldn't be opposed to it.
>>
>> (I remember a "sync with others" patch being rejected in the past, but I
>> might be remembering it wrong.)
> 
> you remember correctly :-) .
> 
> Changing the reported key just for "syncing" is generally not desired.
> It'd be like your "a" key reporting "z" with a new kernel version, even
> if the label on the key states "z" since the beginning [0]
> 
> So any adaptation always is on a case-by-case basis.
> 
> My hunch right now is that we might be able to adapt the button
> on that rk3582 board, because I assume due to the lottery soc
> (disabled cores and/or disabled gpu/...) it might not be overly
> spread out in the wild?

Since the E52C is a "network computer," it may be in greater demand than 
other RK3582 boards with HDMI. (This is just my guess, and I don't know 
the exact number.)
However, I support changing the E52C's User button to BTN_1.

Similarly, I think it would be better to align the "Maskrom" button with 
KEY_SETUP instead of KEY_VENDOR. Only rk3582-radxa-e52c.dts and 
rk3588s-nanopi-r6.dtsi use KEY_VENDOR.
The latter may have a relatively large user base, but how many people 
actually use the Maskrom button in Linux userland?

Best regards,

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

> [0] https://xkcd.com/1172/ ;-)
> 
> 
> 
> 
> 



