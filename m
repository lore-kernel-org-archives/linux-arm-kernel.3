Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E28FCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 19:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rwqoGtXjB1J++h8Zyy8TQBXX6o5DAsVUE4Q8MuslRI0=; b=o8nY02YCihStz3VA38pCvPZSxm
	rVMnKugBKrv+WmJ3xamwAqGZ8ySscsJcM/DpJxHFUUw0au9B6td3+29T2X0Qw38PGHv/AJYLEZFDH
	tBPfSe8+v9TmW7TWnCy+KaEeoRI98KRCpIiuDUePpdOg1DqxLZQNZkeFo3nk03o7LJzBKL3wOY6f/
	QTgsjL8mJ2lPjgTqh33HW7GZJK9jQ+nLG27SJ/S4cruUrK0PWNgMkgWXuM6KwPeXD70mWoSHRROsi
	qB+hc9TfGrr3PGxbd1DDNYaqk7GyAvZo5FRJqb4a6JmiteFmjHlcb4vWD504IqQsml1dlzT2ivzUq
	lI22/3Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw498-00000009kOd-3qcU;
	Tue, 09 Sep 2025 19:36:54 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw495-00000009kNt-17bd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 19:36:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1757446609;
 bh=rwqoGtXjB1J++h8Zyy8TQBXX6o5DAsVUE4Q8MuslRI0=;
 b=OFfmGFf+DSTaRnQtHRgyhcVPO+nRMO7nfBbG+pII6Sw0EaIkfgIAKrI0FB01Wbx+LL+bn3C90
 7efzAcM30OwFoH2pRh8qzMeYmvdk8go9Qw7jCK2G4DS/NlAYpniiuv5TJRVnsQfo3BFsd3Ow6gN
 XxxJSm4tn60nbrExecYzl7KL7bdV0WNL7abTXCC3yvZd+x9enZxOY5L+lw4MqdgBfqGx5Vzg+pB
 YGsZ8KuRN+LHsiMI3fBoOq51WKOlTpBlZiRWuRuD1MG5VyWvJD9XnKaGR+OCuzixHWEQra94HwW
 h/1B6mMaouwM6ezXF80QN414zHsu7ARVJNJj5BrDWYfg==
X-Forward-Email-ID: 68c081cdd4f0dc47f6d79244
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.2.14
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <a443fca9-e660-4a7a-b637-ec840ac8ed1e@kwiboo.se>
Date: Tue, 9 Sep 2025 21:36:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add Radxa E24C
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 FUKAUMI Naoki <naoki@radxa.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>,
 Chukun Pan <amadeus@jmu.edu.cn>, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250727144409.327740-1-jonas@kwiboo.se>
 <B055BC95C67D129C+d7a2ff39-8367-48cf-8697-f12fd9f885a4@radxa.com>
 <7d3c3b29-f89f-4801-8fd7-d6d0645095af@kwiboo.se> <17232684.geO5KgaWL5@diego>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <17232684.geO5KgaWL5@diego>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_123651_707955_11A9B75B 
X-CRM114-Status: GOOD (  15.82  )
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

On 9/9/2025 5:39 PM, Heiko Stübner wrote:
> Am Dienstag, 9. September 2025, 16:48:25 Mitteleuropäische Sommerzeit schrieb Jonas Karlman:
>> On 9/9/2025 2:28 PM, FUKAUMI Naoki wrote:
>>> Hi Jonas,
>>>
>>> On 7/27/25 23:44, Jonas Karlman wrote:
>>>> The Radxa E24C is a compact, high-performance network computer
>>>> developed by Radxa, based on the Rockchip RK3528A SoC.
>>>>
>>>> Add initial device tree for the Radxa E24C.
>>>>
>>>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>>>> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>>>> ---
>>>> Schematics: https://dl.radxa.com/e/e24c/docs/radxa_e24c_v1200_schematic.pdf
>>>> ---
>>>>   arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>>>>   .../boot/dts/rockchip/rk3528-radxa-e24c.dts   | 519 ++++++++++++++++++
>>>>   2 files changed, 520 insertions(+)
>>>>   create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-radxa-e24c.dts
>>>>
>>>> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
>>>> index 0662fcf00628..dc62fd5305be 100644
>>>> --- a/arch/arm64/boot/dts/rockchip/Makefile
>>>> +++ b/arch/arm64/boot/dts/rockchip/Makefile
>>>> @@ -92,6 +92,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399pro-rock-pi-n10.dtb
>>>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-armsom-sige1.dtb
>>>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-nanopi-zero2.dtb
>>>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-radxa-e20c.dtb
>>>> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-radxa-e24c.dtb
>>>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-rock-2a.dtb
>>>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-rock-2f.dtb
>>>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3562-evb2-v10.dtb
>>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e24c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e24c.dts
>>>> new file mode 100644
>>>> index 000000000000..225f2b0c5339
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e24c.dts
>>>> @@ -0,0 +1,519 @@
>>>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>>>> +
>>>> +/dts-v1/;
>>>> +
>>>> +#include <dt-bindings/input/input.h>
>>>> +#include <dt-bindings/leds/common.h>
>>>> +#include "rk3528.dtsi"
>>>> +
>>>> +/ {
>>>> +	model = "Radxa E24C";
>>>> +	compatible = "radxa,e24c", "rockchip,rk3528";
>>>> +
>>>> +	aliases {
>>>> +		ethernet0 = &gmac1;
>>>> +		i2c0 = &i2c0;
>>>> +		i2c1 = &i2c1;
>>>> +		i2c5 = &i2c5;
>>>> +		mmc0 = &sdhci;
>>>> +		mmc1 = &sdmmc;
>>>> +		rtc0 = &hym8563;
>>>> +		rtc1 = &rk805;
>>>> +		serial0 = &uart0;
>>>> +	};
>>>> +
>>>> +	chosen {
>>>> +		stdout-path = "serial0:1500000n8";
>>>> +	};
>>>> +
>>>> +	adc-keys {
>>>> +		compatible = "adc-keys";
>>>> +		io-channels = <&saradc 0>;
>>>> +		io-channel-names = "buttons";
>>>> +		keyup-threshold-microvolt = <1800000>;
>>>> +		poll-interval = <100>;
>>>> +
>>>> +		button-maskrom {
>>>> +			label = "MASKROM";
>>>> +			linux,code = <KEY_SETUP>;
>>>> +			press-threshold-microvolt = <0>;
>>>> +		};
>>>> +	};
>>>> +
>>>> +	gpio-keys {
>>>> +		compatible = "gpio-keys";
>>>> +		pinctrl-names = "default";
>>>> +		pinctrl-0 = <&gpio0_a0_user>;
>>>> +
>>>> +		button-user {
>>>> +			gpios = <&gpio0 RK_PA0 GPIO_ACTIVE_LOW>;
>>>> +			label = "USER";
>>>> +			linux,code = <BTN_1>;
>>>
>>> I prefer to assign BTN_0 to the 1st button :)
>>
>> The E20C (and other RK boards) already use BTN_1 for user button, it
>> only seem to be the recently added E54C that is using BTN_0.
>>
>> For consistency I suggest we keep using BTN_1 for this user button and
>> possible fixup E54C, if you want to use same button for all variants.
> 
> Yep, that would also keep the amount of userspace-facing changes
> minimal.

I mixed up e54c and e52c so my statement was not fully correct above,
however there is a mixed use of BTN_1 and BTN_0 for user button:

- rk3588s-nanopi-r6c/r6s uses BTN_1, added in v6.9-rc1
- rk3588-friendlyelec-cm3588-nas uses BTN_1, added in v6.11-rc1
- rk3582-radxa-e52c uses BTN_0, added in v6.14-rc1
- rk3528-radxa-e20c uses BTN_1, added in v6.15-rc1
- rk3576-nanopi-m5 uses BTN_1, added in v6.17-rc1

Majority seem to be using BTN_1 for a user button.

Regards,
Jonas

> 
> Heiko
> 
> 
> 


