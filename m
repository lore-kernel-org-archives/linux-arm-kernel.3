Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F050C021A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 20:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S+N8QktHLziteDHKc6l89RJnsEypWQF7J2Pqb6k3fjQ=; b=w5woJgBERIpfMCX8GWBhkpp/Z0
	6Hhbzbk4m8nPgzgzIn3i8b1583P0QMi7WiKwuQwfdsYuCn3f6S+kHH/xPJul2kMiS0yZEpSDFwj/U
	h5C9kGAV/ntfH3uW4aUDP3njSXeSO9aUCbKrcbUU20YBTD8IPnfokbqsZkp6lDmhqlL4kngx+MyMd
	IPmxsPxcmBl5zI8gBEq96ZxbinZo8my5tgHtjbjtXY3GoNCgKaW56EhxcsPceHDHRk3B71LwLMO7q
	dFS8juZyM4ibuinYcfsO/Ou+jZrqAGrBso6W0NtkiXDEkdiiFo1dobLT0oF6H4An22Wit1RFp8vmo
	+N4ClB3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tifho-0000000CWlU-0Zim;
	Thu, 13 Feb 2025 20:21:04 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tifgM-0000000CWY2-0DqQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 20:19:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1739477972;
 bh=S+N8QktHLziteDHKc6l89RJnsEypWQF7J2Pqb6k3fjQ=;
 b=0GfTEYvOb/itK61zxR+/e5NsYEF2SIX1vCnrKon5I2ZJTUxxNOP2Bw34T7TwShi0sL2yBQ73x
 kE+Xj/71wv6GkydHNUNzj7eKtNAE84ptOOLF+kW1RiShvKeES3wXcgKy6CyujCXUsp6fwydF9+m
 1JRo0ln9+Dj4pm7P7mo4j322onCZHaijZiZsV67Nq6TiB/1R5MtSs6saF9QQG8gGU6c4vXkz5U6
 VI3jrDtxWCKJS5XqN46MVzXuEMp42zUqY5ZRA8Pnh2MQIID3OEGSU9Jm5tu2sjCzKChJkZZjbDy
 4JkcfNc3aqzsNGvZ6uaROts8PHOrsNW+lssEWpturpGw==
X-Forward-Email-ID: 67ae53c49555f68eb8805aed
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <3da8e680-1f36-473d-b51a-6c77a6ea8cc1@kwiboo.se>
Date: Thu, 13 Feb 2025 21:19:11 +0100
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
 <b5977d21-aa39-4e91-863b-cc7f9dc6938c@kwiboo.se>
 <5973630.DvuYhMxLoT@trenzalore>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <5973630.DvuYhMxLoT@trenzalore>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_121934_130505_FA4B2D16 
X-CRM114-Status: GOOD (  26.94  )
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

On 2025-02-13 20:56, Detlev Casanova wrote:
> Hi Jonas,
> 
> On Thursday, 13 February 2025 10:48:10 EST Jonas Karlman wrote:
>> Hi Detlev,
>>
>> On 2025-02-13 15:57, Detlev Casanova wrote:
>>> From: Stephen Chen <stephen@radxa.com>
>>>
>>> The Radxa ROCK 4D board is based on the Rockchip rk3576 SoC.
>>>
>>> The device tree adds support for basic devices:
>>>  - UART
>>>  - SD Card
>>>  - Ethernet
>>>  - USB
>>>  - RTC
>>>
>>> It has 4 USB ports but only 3 are usable as the top left one is used
>>> for maskrom.
>>>
>>> It has a USB-C port that is only used for powering the board.
>>>
>>> Signed-off-by: Stephen Chen <stephen@radxa.com>
>>> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
>>> ---
>>>
>>>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>>>  .../boot/dts/rockchip/rk3576-rock-4d.dts      | 651 ++++++++++++++++++
>>>  2 files changed, 652 insertions(+)
>>>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
>>>
>>> diff --git a/arch/arm64/boot/dts/rockchip/Makefile
>>> b/arch/arm64/boot/dts/rockchip/Makefile index
>>> def1222c1907e..a112aeb37948a 100644
>>> --- a/arch/arm64/boot/dts/rockchip/Makefile
>>> +++ b/arch/arm64/boot/dts/rockchip/Makefile
>>> @@ -132,6 +132,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) +=
>>> rk3568-wolfvision-pf5-display-vz.dtbo> 
>>>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-io-expander.dtbo
>>>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-armsom-sige5.dtb
>>>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-evb1-v10.dtb
>>>
>>> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-rock-4d.dtb
>>>
>>>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3582-radxa-e52c.dtb
>>>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-armsom-sige7.dtb
>>>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-armsom-w3.dtb
>>>
>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
>>> b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts new file mode 100644
>>> index 0000000000000..f356742f9d643
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
>>> @@ -0,0 +1,651 @@
>>
>> [snip]
>>
>>> +&gmac0 {
>>> +	phy-mode = "rgmii-id";
>>> +	clock_in_out = "output";
>>> +
>>> +	snps,reset-gpio = <&gpio2 RK_PB5 GPIO_ACTIVE_LOW>;
>>> +	snps,reset-active-low;
>>> +	snps,reset-delays-us = <0 20000 100000>;
>>
>> The snps,reset- props are deprecated and should be changed to reset-
>> props in the phy node.
> 
> Arg, second time I use deprectated props on new things. Are there plans or 
> ways to make dtbs_check warn about those ?

Agree, would be nice if dtbs_check could be a little bit more verbose
about use of deprecated props :-)

> 
>>> +
>>> +	pinctrl-names = "default";
>>> +	pinctrl-0 = <&eth0m0_miim
>>> +		     &eth0m0_tx_bus2
>>> +		     &eth0m0_rx_bus2
>>> +		     &eth0m0_rgmii_clk
>>> +		     &eth0m0_rgmii_bus
>>> +		     &ethm0_clk0_25m_out>;
>>> +
>>> +	phy-handle = <&rgmii_phy0>;
>>> +	status = "okay";
>>> +};
>>
>> [snip]
>>
>>> +&mdio0 {
>>> +	rgmii_phy0: phy@1 {
>>
>> Maybe ethernet-phy@1 ?
> 
> Indeed.
> 
>>> +		compatible = "ethernet-phy-ieee802.3-c22";
>>> +		reg = <0x1>;
>>> +		clocks = <&cru REFCLKO25M_GMAC0_OUT>;
>>
>> Please add reset- props here.
>>
>> Changing to use reset- props may cause issue if a RTL8211F PHY is used
>> on the board. Use a ethernet-phy-id compatible or mainline U-Boot to
>> ensure the Ethernet PHY can be discovered during probe.
> 
> Using downstream u-boot, with the RTL8211F PHY, linux can still detect the PHY 
> and use it correctly, even with reset-* props at the PHY level.
> 
> I guess I can keep those there then, unless the issues you mention are more 
> subtle than that ?
> 

Ohh, typically there has been issues for Linux to find the Ethernet PHY unless
it has first been reset by boot firmware. Something like:

  rk_gmac-dwmac fe010000.ethernet eth0: no phy at addr -1
  rk_gmac-dwmac fe010000.ethernet eth0: stmmac_open: Cannot attach to PHY (error: -19)

There was a chicken-and-egg issue related to detecting ethernet phy:
- phy needs to be reset or phy_id read back as 0xffffffff on mdio bus
- phy device is not created because a valid phy_id is not read back
- phy device needs to be created before it can be reset

See [1] for more details on the ethernet phy issue that typically have
affected multiple Rockchip boards with RTL8211F PHYs. Maybe it has been
fixed in v6.13+.

[1] https://lore.kernel.org/all/47d55aca-bee6-810f-379f-9431649fefa6@kwiboo.se/

Regards,
Jonas

> 
> Detlev.
> 
> 
> 


