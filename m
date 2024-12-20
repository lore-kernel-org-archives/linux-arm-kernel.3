Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 580EFE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 20:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bk/n0PrMSMFTyNUYROD4w4qws+zPUxdUiNJc5kBQ81g=; b=c6bS5qnc6VoUt6i7IwuzmBmjzK
	+96POa87yu9Gt81oZhSTdEHwjDsFiQGlMwXytj5zRKlTGtMvMjx1Akz0609WWmP8ELOwZdKT/UsBm
	JUMosKEItof+kDc7DHL9++CBIAau844Kf0+uZN64BFxnFcpl8F5a43DGuQTxSKwSC1Z/rvfrTc3gK
	BzU8dSyvJ/KWn8lSnoxfE0mDUp/WOj5vWymBGzCr5ZjjngzvTQarEfQEzmYIxrer3WrraLVpg7EpJ
	FerCzjeBjrYtgrO13Fm9nPJv7Nh53/VS/twGaNdX47/vHNliDhKsRYvcW202xWL9vdFRckqTwN37z
	7ThX5y/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOjrB-0000000633a-1F6K;
	Fri, 20 Dec 2024 20:44:21 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOjq1-000000062ye-1day
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 20:43:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1734727385;
 bh=bk/n0PrMSMFTyNUYROD4w4qws+zPUxdUiNJc5kBQ81g=;
 b=N5FBiTaJOMqIPmXFvk6+sJR3NzEZ2ULFuEyujyZb7VLLNHtO6S1GMfH9SoII6AvQeUfjSvy5P
 KGiPTiFvrDg1KA34agn5oM4DIa4lIv+Pg5XnPRoqEQcd1i8nnGq40k/YtdELm4TwJsCGFShKrDu
 ZEHzmBTlu8gQm5mmIUNO8NTvAhTsT5r0bAK53CwURNdjbhSbSF/J4I1DNm5WYUhJ0k8VVJketsB
 HOlScKNrB/a3vqJD0nZGIHWRUKYno1XgCUc6kkZiY0phDkg1BVdJhihbwUBK2O3PYJ3pUdMVSNL
 88EF3lL41OF7Tzf2PuIn4XjlyynQp2ZLVffpLl1DdYqg==
Message-ID: <09c15a40-a956-46ef-bb54-ac999758a492@kwiboo.se>
Date: Fri, 20 Dec 2024 21:42:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: ROCK3B: Correct clock rates for
 Ethernet PHYs
To: Peter Geis <pgwipeout@gmail.com>,
 Alicja Michalska <alicja.michalska@9elements.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241220163227.1501912-1-alicja.michalska@9elements.com>
 <17251add-40b7-4d18-8626-2d74b29532fc@kwiboo.se>
 <9a210e3d-90eb-42d4-83fd-7bbad7b00e86@9elements.com>
 <CAMdYzYoraXsZK3Uwe3QBVjt0cHn_GyOvR=57+qD-UrrwRE2TzA@mail.gmail.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <CAMdYzYoraXsZK3Uwe3QBVjt0cHn_GyOvR=57+qD-UrrwRE2TzA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 6765d6d74b4e7f90b8526c72
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_124309_496528_571C769C 
X-CRM114-Status: GOOD (  44.40  )
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

Hi,

On 2024-12-20 20:52, Peter Geis wrote:
> Good Afternoon,
> 
> On Fri, Dec 20, 2024 at 12:54 PM Alicja Michalska
> <alicja.michalska@9elements.com> wrote:
>>
>> Hello Jonas,
>>
>>
>> On 20/12/2024 18:09, Jonas Karlman wrote:
>>> Have you used mainline or vendor u-boot when testing?
>>>
>>> There is an existing issue with RTL8211F PHYs that they must be reset
>>> before Linux can identify them, see [1] for more details on the issue.
>>>
>>> Mainline U-Boot will reset the Ethernet PHYs on this board and that
>>> should allow for Linux to identify and use the Ethernet PHYs.
>>>
>>> [1] https://lore.kernel.org/r/47d55aca-bee6-810f-379f-9431649fefa6@kwiboo.se/
>>
>> Thank you for the link. I've tested with vendor-provided U-Boot build:
>>
>> U-Boot latest-2023.10-11-cc60ff40-gcc60ff40 (Aug 14 2024 - 03:56:35 +0000)
>>
>> I can test with upstream in upcoming days.
>>
>>> The snps,reset props is deprecated and reset- props should be used in
>>> the PHY node.
>>>
>>> This also changes to use 20/100 ms delay instead of current 20/50ms
>>> delay. If anything it could be changed to 20/80ms, I have only seen
>>> datasheets for rtl8211f mention minimum 10 ms and minimum 30-76 ms.
>>>
>>>> +
>>>> +    tx_delay = <0x36>;
>>>> +    rx_delay = <0x2d>;
>>> Are you having issue with use of rgmii-id on your board?
>>
>> Interesting insight, thank you!
>>
>> I have to admit that I haven't read the current documentation, just seen that other RK356X boards in the tree used it. My apologies.
>>
>> I've ran into issues with rgmii-id, but that's with vendor U-Boot (as mentioned above), will try with upstream next and see a follow-up if I will still experience issues.
> 
> rgmii-id sets the phy to handle the tx and rx delays. All of the
> various rgmii settings require the board to be built to specific
> tolerances for the data lines. Rockchip based boards seem to forgo
> this design phase, instead using rgmii (no built in delays) and set
> the delays in the Rockchip gmac driver instead, using the tx_delay and
> rx_delay values in the device tree. The tx_delay and rx_delay value
> must be tuned correctly for your hardware. If you wish to use them
> you'll need to set rgmii, then find the lowest and highest values that
> work for all variations of hardware supported by the device tree then
> take the middle value. If you wish to use rgmii-id, these values
> should be omitted or set to zero as they are additive to the existing
> delays.
> 
>>
>>>> +
>>>>      status = "okay";
>>>>  };
>>>>
>>>>  &gmac1 {
>>>>      assigned-clocks = <&cru SCLK_GMAC1_RX_TX>, <&cru SCLK_GMAC1>;
>>>>      assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>, <&cru CLK_MAC1_2TOP>;
>>>> -    clock_in_out = "input";
>>>> -    phy-handle = <&rgmii_phy1>;
>>>> -    phy-mode = "rgmii-id";
>>>> +    assigned-clock-rates = <0>, <125000000>;
>>>> +    clock_in_out = "output";
> 
> Instead, I suspect the clocks here are your issue. Looking at the
> schematic at [1] your board is designed to feed the phy clock into the
> SoC. This isn't the current clock configuration in your device tree,
> you had it set to input, but the clock parents are wrong and will
> default to using the internal SoC clock source for the mac. I suspect
> setting the assigned clock rate is what fixed your issue.

Correct, I should probably have used the gmacX_clkin instead of
clk_macX_2top in the initial ROCK 3B device tree. However, Ethernet was
tested using iperf3 on both interfaces and was working at that time
so did not pay too close attention ;-)

The change to use snps,reset- props is probably what made the PHY work.
As pointed out in the thread I linked, there is an chicken-and-egg
issue with the PHY not being probed unless it has been reset and a
proper phy_id can be read back over mdio bus:

  As I mentioned earlier there is a chicken-and-egg problem to be solved:
  - phy needs to be reset or phy_id read back as 0xffffffff on mdio bus
  - phy device is not created because a valid phy_id is not read back
  - phy device needs to be created before it can be reset

  A reset need to happen before/during this call chain:
  stmmac_mdio_register()
  -> of_mdiobus_register()
  -> of_mdiobus_register_phy()
  -> fwnode_mdiobus_register_phy()
  -> get_phy_device()
  -> get_phy_c22_id()
  -> mdiobus_read(bus, addr, MII_PHYSID1)

  Here mdiobus_read cannot read back the phy_id unless the PHY has been reset.

  This is why the deprecated props work, the reset is issued before/during
  stmmac_mdio_register(). Or at the mdiobus level, the reset is issued
  before/during of_mdiobus_register(). With reset at phy level the reset
  happens after device is created, after phy_id has been read, hence a
  chicken-and-egg problem.

Currently I know of these workarounds:
a) reset PHY before OS, i.e. use mainline U-Boot
b) use a ethernet-phy-id001c.c916 compatible for the onboard RTL8211F
   PHY instead of the generic ethernet-phy-ieee802.3-c22 compatible
c) use deprecated snps,reset- props
d) use reset props on mdiobus level

> 
> I wrote the rk3566-quartz64-a.dts to be an example for how the new soc
> behaves. I recommend looking at it for an example for how the clocks
> are supposed to be set up for proper input [2].

rk3566-quartz64-a.dts use the deprecated snps,reset- props and is not
affected by same Ethernet PHY reset/probe issue.

> 
>>>>      phy-supply = <&vcc_3v3>;
>>>> +    phy-mode = "rgmii";
>>>> +    phy-handle = <&rgmii_phy1>;
>>>>      pinctrl-names = "default";
>>>>      pinctrl-0 = <&gmac1m1_miim
>>>>                   &gmac1m1_tx_bus2
>>>>                   &gmac1m1_rx_bus2
>>>>                   &gmac1m1_rgmii_clk
>>>> -                 &gmac1m1_rgmii_bus
>>>> -                 &gmac1m1_clkinout>;
>>>> +                 &gmac1m1_rgmii_bus>;
>>>> +    snps,reset-gpio = <&gpio3 RK_PB0 GPIO_ACTIVE_LOW>;
>>>> +    snps,reset-active-low;
>>>> +    snps,reset-delays-us = <0 50000 150000>;
>>> Same here, but now this is 50/150 ms?
>> I wasn't sure about those delays, as I've taken them from vendor's sources. They did seem awfully high, though.
>>>> +
>>>> +    tx_delay = <0x47>;
>>>> +    rx_delay = <0x28>;
>>> Same here, is use of rgmii-id causing issues on your boards?
>> Answer above :)
>>>> +
>>>>      status = "okay";
>>>>  };
>>>>
>>>> +&mdio0 {
>>>> +    rgmii_phy0: ethernet-phy@0 {
>>>> +            compatible = "ethernet-phy-ieee802.3-c22";
>>>> +            reg = <0>;
>>> The phy addr used for these boards is 0x1.
>>>
>>>> +    };
>>>> +};
>>>> +
>>>> +&mdio1 {
>>>> +    rgmii_phy1: ethernet-phy@0 {
>>>> +            compatible = "ethernet-phy-ieee802.3-c22";
>>>> +            reg = <0>;
>>> Same here.
>> Makes sense, other boards in the tree had it configured the same way.
>>>> +    };
>>>> +};
>>> There should be no need to move these nodes, they should already be in
>>> alphabetical order?
>> There's no reason to, just thought moving them closer to PHYs would look cleaner and make a bit more sense. It's just a nitpick though.
>>>> +
>>>>  &gpu {
>>>>      mali-supply = <&vdd_gpu>;
>>>>      status = "okay";
>>>> @@ -512,26 +540,6 @@ &i2s1m0_sdi0
>>>>      status = "okay";
>>>>  };
>>>>
>>>> -&mdio0 {
>>>> -    rgmii_phy0: ethernet-phy@1 {
>>>> -            compatible = "ethernet-phy-ieee802.3-c22";
>>> If you want to use vendor u-boot you can probably change this to
>>> "ethernet-phy-id001c.c916".
>>>
>>>> -            reg = <1>;
>>>> -            reset-assert-us = <20000>;
>>>> -            reset-deassert-us = <50000>;
>>>> -            reset-gpios = <&gpio3 RK_PB7 GPIO_ACTIVE_LOW>;
>>>> -    };
>>>> -};
>>>> -
>>>> -&mdio1 {
>>>> -    rgmii_phy1: ethernet-phy@1 {
>>>> -            compatible = "ethernet-phy-ieee802.3-c22";
>>> Same here.
>>
>> True, but in this case it likely wouldn't be accepted in upstream, right?

Should be fine, as it correctly define the Ethernet PHYs used.

Regards,
Jonas

>>
>> I really would prefer devicetrees to be passed to the OS by bootloader, just like ACPI does on x86 and some (i.e Ampere) platforms.
>>
>> This way we wouldn't need to maintain per-board DTs in the tree, and would keep functionality between kernel versions/BSDs... but one can dream, huh? :)
> 
> The device-tree is supposed to describe hardware without regards to a
> specific operating system. If written correctly, it will work no
> matter what software is running on top of it. While there are some
> specific tweaks to make the operating systems behave correctly around
> broken hardware, a lot of the deviations from this standard are due to
> legacy trees and are being cleaned up over time.
> 
>>
>> Thank you,
>>
>> Alicja
> 
> Very Respectfully,
> Peter Geis
> 
> [1] https://dl.radxa.com/rock3/docs/hw/3b/Radxa_ROCK_3B_V1.51_SCH.pdf
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts?h=v6.13-rc3#n267
> 

