Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C63C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 16:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OSqEFJEPXbKrFf4UCRw4Rj9UNsiFiIqusumOACEFv68=; b=r6qUIw/r2nDsddHvijsjwHdBIm
	kl9ensBANqPd41OlnQT0vWMcsD+2zhMYGsy8U+cAyYojhXBD5sWNuh+ZS5vnT8uMjJtJ+fsHooCfc
	flEPUM6dz42paNpsBXoC7zpDInb28AWqm257ZPG+Td5lMqVuBYB3bENKuc4r3HUXRPBN8viatVgKA
	EMmWHHjt7YQ3p/F9lHdzbKZKDS6Peorl8VLU5t/OjwI+d+y0BcVbss3GVbSpVhuYUX1UZ5OZXOJpz
	KRaDxHjneo0l/FrArpqqSEb0036L6Wit8NQzkDg/kb+nuh5yb4Cy1asSAzOSKzrK32ryTbLegD29Y
	j0lqix9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tibgD-0000000BfYJ-0B2X;
	Thu, 13 Feb 2025 16:03:09 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tibSE-0000000BcDc-43IF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 15:48:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1739461718;
 bh=OSqEFJEPXbKrFf4UCRw4Rj9UNsiFiIqusumOACEFv68=;
 b=q8znhY014Gq69gkwJw6VFzgQXnvAgbnLeTuH4WU+Nq/CS6I/ipN6oUH8wUO2WBYdSxkppx5WQ
 OiVLE1twdHsgUu0ZlqbZ/EQ5CkS88eFogP4lDw3uxGPIMKBHMJ4r8XUdv428o6ez4L352nyAbHa
 Ba852AZ1fPLNJRZodCARxmH4E3eUFeUHyaLyJYgl9Ov4+EhE/AicZc3MHjXtLeVeGvu/+UqiT5R
 58+c1rNtDVUMrlN613YIvtkEU4uPXT6xpVm1DrDzwrm37LttffQ8uTubFB1+sZxqJn3NS22Aj84
 WJUze4+eymE8iPIiCae5HRV992VkDNfBJATgKvk53UGw==
X-Forward-Email-ID: 67ae1441eeea92be259cebf3
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <b5977d21-aa39-4e91-863b-cc7f9dc6938c@kwiboo.se>
Date: Thu, 13 Feb 2025 16:48:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add Radxa ROCK 4D device
 tree
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Dragan Simic <dsimic@manjaro.org>, Chris Morgan <macromorgan@hotmail.com>,
 Kever Yang <kever.yang@rock-chips.com>, Tim Lunn <tim@feathertop.org>,
 FUKAUMI Naoki <naoki@radxa.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Weizhao Ouyang <weizhao.ouyang@arm.com>, Elon Zhang
 <zhangzj@rock-chips.com>, Alexey Charkov <alchark@gmail.com>,
 Stephen Chen <stephen@radxa.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com
References: <20250213145921.133412-1-detlev.casanova@collabora.com>
 <20250213145921.133412-3-detlev.casanova@collabora.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250213145921.133412-3-detlev.casanova@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_074843_040674_79A34F15 
X-CRM114-Status: GOOD (  19.80  )
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

Hi Detlev,

On 2025-02-13 15:57, Detlev Casanova wrote:
> From: Stephen Chen <stephen@radxa.com>
> 
> The Radxa ROCK 4D board is based on the Rockchip rk3576 SoC.
> 
> The device tree adds support for basic devices:
>  - UART
>  - SD Card
>  - Ethernet
>  - USB
>  - RTC
> 
> It has 4 USB ports but only 3 are usable as the top left one is used
> for maskrom.
> 
> It has a USB-C port that is only used for powering the board.
> 
> Signed-off-by: Stephen Chen <stephen@radxa.com>
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../boot/dts/rockchip/rk3576-rock-4d.dts      | 651 ++++++++++++++++++
>  2 files changed, 652 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
> 
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
> index def1222c1907e..a112aeb37948a 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -132,6 +132,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-display-vz.dtbo
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-io-expander.dtbo
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-armsom-sige5.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-evb1-v10.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-rock-4d.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3582-radxa-e52c.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-armsom-sige7.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-armsom-w3.dtb
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
> new file mode 100644
> index 0000000000000..f356742f9d643
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
> @@ -0,0 +1,651 @@

[snip]

> +&gmac0 {
> +	phy-mode = "rgmii-id";
> +	clock_in_out = "output";
> +
> +	snps,reset-gpio = <&gpio2 RK_PB5 GPIO_ACTIVE_LOW>;
> +	snps,reset-active-low;
> +	snps,reset-delays-us = <0 20000 100000>;

The snps,reset- props are deprecated and should be changed to reset-
props in the phy node.

> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&eth0m0_miim
> +		     &eth0m0_tx_bus2
> +		     &eth0m0_rx_bus2
> +		     &eth0m0_rgmii_clk
> +		     &eth0m0_rgmii_bus
> +		     &ethm0_clk0_25m_out>;
> +
> +	phy-handle = <&rgmii_phy0>;
> +	status = "okay";
> +};

[snip]

> +&mdio0 {
> +	rgmii_phy0: phy@1 {

Maybe ethernet-phy@1 ?

> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0x1>;
> +		clocks = <&cru REFCLKO25M_GMAC0_OUT>;

Please add reset- props here.

Changing to use reset- props may cause issue if a RTL8211F PHY is used
on the board. Use a ethernet-phy-id compatible or mainline U-Boot to
ensure the Ethernet PHY can be discovered during probe.

Regards,
Jonas

> +	};
> +};
> +

[snip]

