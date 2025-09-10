Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3997CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 02:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=moOq+terQ4l0yEpmnJY/HpANtwnJvr130w/LUsC8Xuo=; b=vKvzOFHmWYvC+WyC1bZP+O5RCD
	QyyDf4AV1Blpby7hJvnPtyWYgVMMdENqqDBjy06Xx7WxmkUa5gx9lLxOF2gcEk91OH8Axybu/Byoh
	JhWLdDXBjvf5ix63heSodBl2ckdO5vt+mwKPMKCfjEntztlTDR08T4gLjSryBrzrQ8a9WqSFj/4ts
	jwQg3apanJF8NUiQpNOmk3tuDFJLwM3piolftbEq3pyJrfiWctZ0kcUEVR3j+cwScZZr32OZdexvO
	JzfTgX2Ijftpv9Y+4cjzLvznodLkyz1hLnMEUTB0dyUMUPeUV7zVQRV6WQZkpzyQnELl9C1PumZ8u
	b5uwSG9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwApC-0000000Biir-2k0Z;
	Wed, 10 Sep 2025 02:44:46 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAp9-0000000BiJ8-2X9f;
	Wed, 10 Sep 2025 02:44:45 +0000
X-QQ-mid: zesmtpip2t1757472216t68456359
X-QQ-Originating-IP: 17bfSa2F654IBMiotK29/iMQ0Y0VqjXIV2xOVHSsz2c=
Received: from [IPV6:240f:10b:7440:1:e5ed:636d ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 10 Sep 2025 10:43:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1856156394840416114
Message-ID: <AF1546E3BE23C6D5+08234a44-4321-45da-9c74-5690f3437e03@radxa.com>
Date: Wed, 10 Sep 2025 11:43:30 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add Radxa E24C
To: Jonas Karlman <jonas@kwiboo.se>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>,
 Chukun Pan <amadeus@jmu.edu.cn>, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250727144409.327740-1-jonas@kwiboo.se>
 <B055BC95C67D129C+d7a2ff39-8367-48cf-8697-f12fd9f885a4@radxa.com>
 <7d3c3b29-f89f-4801-8fd7-d6d0645095af@kwiboo.se> <17232684.geO5KgaWL5@diego>
 <a443fca9-e660-4a7a-b637-ec840ac8ed1e@kwiboo.se>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
In-Reply-To: <a443fca9-e660-4a7a-b637-ec840ac8ed1e@kwiboo.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NDtUtlvFer7vF80qLC4s/JK3islawpqQwIo1XTtrY7c+MywMujiMYhNh
	/5vTvNeKr3IptPQTnhzXcbxrMkLyNiiWb82VcyIUyaeEPDxX7YbIJPN+9gSDUaQfUkBaxcD
	EJXpigyyzk7US7RwWXQoJwvKqJoYgYidl5VI+qY9/vEdvVwq33cLKn2CNiBIJyFLm1GCF1C
	/5dQmdnQZeJYWFP3IkEBjZph1ZfISnvA/f7h3sBfVGs3Csb8NE336SkndWkZR8nXDQQk3tk
	gjumFae8smy+rETr+2L25FdzVX3tTXEtVXjRTPbUkP/ViuYGutLh1N2CmrBaMWg3zpWpvNj
	YG+5LkfOn8y23bvfvBJ002uGcRVp2h2KbmQgFrqgllkwKbefTVxsPT/SxpCZByn4DQaaF1T
	VegZyJoOuGXd8j3TjAAuYJRpGiEuuPIJH037TKdozH2REIynME6SXg08dztLnPkSRI7TGKk
	AuW5t/ehbsj83nzyaMXVqbZzZYvcrabURHmGTpAz13YRC09XiVg/k5feWSIcwuOzkkJIJn6
	YjuFAjd3jK49BgYeVJXalp0vJmWWwRz81Z36EVxDd5IHYcWThn/JG0ejVMZmwXmTY2Gtd0P
	fELJ/SSuEjuYJfg/PMfRLRmrmoma1MOm5wK8q5rZKQMd+gWBohHvog5K3You1JnrgW0fL9T
	bMbRbtYoh16GsRHkZwVdL4a3rJzar2KrCzl1xC1dcAmHGAwF3FQmQ1cevDmJ2OaBjPksfki
	A4W2YPnpzylrJXQ/mML+2sEx3ZTR4h+cdSUrU5b3WNmw7cgOgn1MsPVe4gzdVYfveNsxDed
	8xL2lLnq73YT01B373CZmZXF5zWkw/Rv+wAhNX07wx6WSsmComnrWHju9RoTiuBOxCx8G34
	S5bXweQJxujbGyAa+kGMQbZOv94kLMs4CvXVi7LfdAqWaTg1NSR+04AGdwbyjq5dXU0Ae0Q
	CxIgiaarNTR86Db1+kstUTXuuV9Sg49FY+vJ9EQj/evJP1UtsroQVWj+A
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_194443_994827_6EE1D5B7 
X-CRM114-Status: GOOD (  18.33  )
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

Hi Jonas, Heiko,

On 9/10/25 04:36, Jonas Karlman wrote:
> On 9/9/2025 5:39 PM, Heiko Stübner wrote:
>> Am Dienstag, 9. September 2025, 16:48:25 Mitteleuropäische Sommerzeit schrieb Jonas Karlman:
>>> On 9/9/2025 2:28 PM, FUKAUMI Naoki wrote:
>>>> Hi Jonas,
>>>>
>>>> On 7/27/25 23:44, Jonas Karlman wrote:
>>>>> The Radxa E24C is a compact, high-performance network computer
>>>>> developed by Radxa, based on the Rockchip RK3528A SoC.
>>>>>
>>>>> Add initial device tree for the Radxa E24C.
>>>>>
>>>>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>>>>> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>>>>> ---
>>>>> Schematics: https://dl.radxa.com/e/e24c/docs/radxa_e24c_v1200_schematic.pdf
>>>>> ---
>>>>>    arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>>>>>    .../boot/dts/rockchip/rk3528-radxa-e24c.dts   | 519 ++++++++++++++++++
>>>>>    2 files changed, 520 insertions(+)
>>>>>    create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-radxa-e24c.dts
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
>>>>> index 0662fcf00628..dc62fd5305be 100644
>>>>> --- a/arch/arm64/boot/dts/rockchip/Makefile
>>>>> +++ b/arch/arm64/boot/dts/rockchip/Makefile
>>>>> @@ -92,6 +92,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399pro-rock-pi-n10.dtb
>>>>>    dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-armsom-sige1.dtb
>>>>>    dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-nanopi-zero2.dtb
>>>>>    dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-radxa-e20c.dtb
>>>>> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-radxa-e24c.dtb
>>>>>    dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-rock-2a.dtb
>>>>>    dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-rock-2f.dtb
>>>>>    dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3562-evb2-v10.dtb
>>>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e24c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e24c.dts
>>>>> new file mode 100644
>>>>> index 000000000000..225f2b0c5339
>>>>> --- /dev/null
>>>>> +++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e24c.dts
>>>>> @@ -0,0 +1,519 @@
>>>>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>>>>> +
>>>>> +/dts-v1/;
>>>>> +
>>>>> +#include <dt-bindings/input/input.h>
>>>>> +#include <dt-bindings/leds/common.h>
>>>>> +#include "rk3528.dtsi"
>>>>> +
>>>>> +/ {
>>>>> +	model = "Radxa E24C";
>>>>> +	compatible = "radxa,e24c", "rockchip,rk3528";
>>>>> +
>>>>> +	aliases {
>>>>> +		ethernet0 = &gmac1;
>>>>> +		i2c0 = &i2c0;
>>>>> +		i2c1 = &i2c1;
>>>>> +		i2c5 = &i2c5;
>>>>> +		mmc0 = &sdhci;
>>>>> +		mmc1 = &sdmmc;
>>>>> +		rtc0 = &hym8563;
>>>>> +		rtc1 = &rk805;
>>>>> +		serial0 = &uart0;
>>>>> +	};
>>>>> +
>>>>> +	chosen {
>>>>> +		stdout-path = "serial0:1500000n8";
>>>>> +	};
>>>>> +
>>>>> +	adc-keys {
>>>>> +		compatible = "adc-keys";
>>>>> +		io-channels = <&saradc 0>;
>>>>> +		io-channel-names = "buttons";
>>>>> +		keyup-threshold-microvolt = <1800000>;
>>>>> +		poll-interval = <100>;
>>>>> +
>>>>> +		button-maskrom {
>>>>> +			label = "MASKROM";
>>>>> +			linux,code = <KEY_SETUP>;
>>>>> +			press-threshold-microvolt = <0>;
>>>>> +		};
>>>>> +	};
>>>>> +
>>>>> +	gpio-keys {
>>>>> +		compatible = "gpio-keys";
>>>>> +		pinctrl-names = "default";
>>>>> +		pinctrl-0 = <&gpio0_a0_user>;
>>>>> +
>>>>> +		button-user {
>>>>> +			gpios = <&gpio0 RK_PA0 GPIO_ACTIVE_LOW>;
>>>>> +			label = "USER";
>>>>> +			linux,code = <BTN_1>;
>>>>
>>>> I prefer to assign BTN_0 to the 1st button :)
>>>
>>> The E20C (and other RK boards) already use BTN_1 for user button, it
>>> only seem to be the recently added E54C that is using BTN_0.
>>>
>>> For consistency I suggest we keep using BTN_1 for this user button and
>>> possible fixup E54C, if you want to use same button for all variants.
>>
>> Yep, that would also keep the amount of userspace-facing changes
>> minimal.
> 
> I mixed up e54c and e52c so my statement was not fully correct above,
> however there is a mixed use of BTN_1 and BTN_0 for user button:
> 
> - rk3588s-nanopi-r6c/r6s uses BTN_1, added in v6.9-rc1
> - rk3588-friendlyelec-cm3588-nas uses BTN_1, added in v6.11-rc1
> - rk3582-radxa-e52c uses BTN_0, added in v6.14-rc1
> - rk3528-radxa-e20c uses BTN_1, added in v6.15-rc1
> - rk3576-nanopi-m5 uses BTN_1, added in v6.17-rc1
> 
> Majority seem to be using BTN_1 for a user button.

If we can unify to BTN_1 even if it breaks backward compatibility, I 
wouldn't be opposed to it.

(I remember a "sync with others" patch being rejected in the past, but I 
might be remembering it wrong.)

Best regards,

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

> Regards,
> Jonas
> 
>>
>> Heiko
>>
>>
>>
> 
> 


