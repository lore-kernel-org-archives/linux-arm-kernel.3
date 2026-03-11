Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF3971125825
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 14:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hhCy0ytu2ON0MOLjFmsC+8EribvDYXOLcQTdJEzjNgQ=; b=WlhJh9ZOlMcL2xpl/SQFGLEauH
	FR/J9LHnKyIB4woUqU4fAIpux5bb/CbuETSxAsHTm5jGn7wkxMq+np4Zg4l6/Miv3S7wK2rYe9rkJ
	iSclqrAgTXNL2DwV7xWumK2XOtzuJcglIyDHR9LihORe34aNUR5RyEul869mwlzivsX3RmZaeUAWt
	quzFqUhntpUbdbRJrD54LWxqOXXL5jZRg7f1qkkZOqkZFC+VpHLDCUfaUOxMiuwigtIpm9sqXVIBx
	C/5fmPJMIsxjyNKO6GQqtjbUCQAV9enTgV31pXCTKoZmMuvKx+Hs3fdVfw46I7ngJClPpy102NKn7
	bJo9TLHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0KBE-0000000Bg6D-2lHE;
	Wed, 11 Mar 2026 14:04:56 +0000
Received: from mail-m49229.qiye.163.com ([45.254.49.229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0KBB-0000000Bg55-08zQ;
	Wed, 11 Mar 2026 14:04:55 +0000
Received: from [172.16.12.17] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 369352f1f;
	Wed, 11 Mar 2026 22:04:48 +0800 (GMT+08:00)
Cc: shawn.lin@rock-chips.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 FUKAUMI Naoki <naoki@radxa.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] arm64: dts: rockchip: Enable PCIe CLKREQ# for RK3588
 on Rock 5b-5bp-5t series
To: Anand Moon <linux.amoon@gmail.com>
References: <20260311115502.7353-1-linux.amoon@gmail.com>
 <cc922ebf-9221-00f8-e951-903c97d24f20@rock-chips.com>
 <CANAwSgT_Qb+Xoqg4ezZaYDBu81--=yhdvQ+cskumoMMh=J2ing@mail.gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <77f0d3c2-649f-770d-1636-6fd52f3b5f5e@rock-chips.com>
Date: Wed, 11 Mar 2026 22:04:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CANAwSgT_Qb+Xoqg4ezZaYDBu81--=yhdvQ+cskumoMMh=J2ing@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9cdd36e6eb09cckunm65969256164ad
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU8eSFZOQ0seTUJJH09CH0pWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=H8OjOTTmoRdwD7CxxdJv61r9AX5gJp2uHHnIVhNJjEI5yVikIexDygld6ueBXjhn0/Uo/rJqI6SwWCg6s7dPB5PYnVeOaWQpQdK3f48C4qkpOC2QiRyb+b6tKrbTJHB2Hmixl7r4YGDUWU0VeS32F+IitlR72zC24JBu96Eofak=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=hhCy0ytu2ON0MOLjFmsC+8EribvDYXOLcQTdJEzjNgQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_070453_716448_F495F214 
X-CRM114-Status: GOOD (  31.43  )
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

在 2026/03/11 星期三 21:43, Anand Moon 写道:
> Hi Shawn,
> 
> Thanks for your review comments.
> 
> On Wed, 11 Mar 2026 at 17:57, Shawn Lin <shawn.lin@rock-chips.com> wrote:
>>
>> 在 2026/03/11 星期三 19:54, Anand Moon 写道:
>>> Add supports-clkreq and the corresponding pinmux configurations for PCIe
>>> ASPM L1 substates on the Rock 5B, 5B+, and 5T.
>>> The supports-clkreq flag informs the PCIe controller that the hardware
>>> routing for the CLKREQ# sideband signal is present. This enables support
>>> for PCIe ASPM (Active State Power Management) L1 substates, allowing for
>>> better power efficiency.
>>>
>>> Cc: Shawn Lin <shawn.lin@rock-chips.com>
>>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
>>> ---
> I verified the change by comparing the lspci -vvv output from before
> and after the modification.
>>
>> It would be better if you could put the link to the schematic here(under
>> "---") for folks easy to review. I paste it here for reference：
>>
>> https://dl.radxa.com/rock5/5b+/docs/hw/radxa_rock5bp_v1.2_schematic.pdf
> Ok, I will follow this advice next time,
>>
>>>    arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi | 9 ++++++---
>>>    1 file changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
>>> index b3e76ad2d869..668b19c05f7e 100644
>>> --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
>>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
>>> @@ -468,7 +468,8 @@ map1 {
>>>
>>>    &pcie2x1l0 {
>>>        pinctrl-names = "default";
>>> -     pinctrl-0 = <&pcie2_0_rst>;
>>> +     pinctrl-0 = <&pcie2_0_rst>, <&pcie30x1m1_0_clkreqn>;
>>> +     supports-clkreq;
>>>        reset-gpios = <&gpio4 RK_PA5 GPIO_ACTIVE_HIGH>;
>>>        vpcie3v3-supply = <&vcc3v3_pcie2x1l0>;
>>>        status = "okay";
>>> @@ -476,7 +477,8 @@ &pcie2x1l0 {
>>>
>>>    &pcie2x1l2 {
>>>        pinctrl-names = "default";
>>> -     pinctrl-0 = <&pcie2_2_rst>;
>>> +     pinctrl-0 = <&pcie2_2_rst>, <&pcie20x1m0_clkreqn>;
>>
>> Isn't it m1(PCIE20_1_2_CLKREQn_M1_L in the schematic)?
> 
> I just used the pinctrl label GPIO3_C7_u as a reference to select this
> one. see below.
> 
> [1] https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/rockchip/rk3588-base-pinctrl.dtsi#L1613-L1662
> 
> The RK3588 Technical Reference Manual (TRM) Part 2 provides the
> following details regarding the clkreq# signal
> pcie_clkreq_in/out_n    M0 PCIE20X1_2_CLKREQN_M0 GPIO3_C7_u
> pcie_clkreq_in/out_n    M1 PCIE20X1_2_CLKREQN_M1 GPIO4_B7_u

Okay, I checked it again, you are right. Apprently the schematic label
is insane which marks it as PCIE20_1_2_CLKREQn_M1_L....

> 
>>
>>> +     supports-clkreq;
>>>        reset-gpios = <&gpio3 RK_PB0 GPIO_ACTIVE_HIGH>;
>>>        vpcie3v3-supply = <&vcc3v3_pcie2x1l2>;
>>>        status = "okay";
>>> @@ -488,7 +490,8 @@ &pcie30phy {
>>>
>>>    &pcie3x4 {
>>>        pinctrl-names = "default";
>>> -     pinctrl-0 = <&pcie3_rst>;
>>> +     pinctrl-0 = <&pcie3_rst>, <&pcie30x4m1_clkreqn>;
>>
>> The pin is correct but I don't think it would support
>> L1 substates because the refclk is out of control. For
>> any refclk coming from external clock generator, clkreq#
>> should connect to the enable pin of the clock generator.
>>
> I did not find the external clkreq# signal for this #clkreq signal in
> the schematics.
> 
> PCIE30X4_CLKREQn_M1_L  (GPIO4_B4_u) .

What I meant is PCIE30X4_CLKREQn_M1_L is connected between root port
and M.2 slot which is not the right hardware design to support L1 
substates with PCIe3.0 PHY. We could do that for combophy as the refclk
is auto controlled by controller when entering and exiting L1 substates.
But for PCIe3.0 PHY the refclk is always there coming from
Au5426_device, so the this port tries to enter L1 substates, no
component could turn off the refclk to meet the timing of entering L1
substate, except you connect clkreq# to the Au5426, because in that case
PHY could gate the incoming refclk via clkreq#, thanks to the natural
behaviour of how clkreq# is controlled.

To clarify, PCIE30X4_CLKREQn_M1_L is connected between the Root Port and
the M.2 slot. This hardware configuration is not suitable for supporting
L1 Substates with the PCIe 3.0 PHY. While this setup works for the Combo
PHY—where the controller automatically manages the reference clock
during L1 Substate entry and exit—it fails with the dedicated PCIe 3.0
PHY. In the latter case, the reference clock from the Au5426_device is
always active. Consequently, when this port attempts to enter L1
Substates, no component can gate the reference clock to meet the
required timing specifications.

The only way to satisfy the timing requirements is to connect CLKREQ# 
directly to the Au5426. This allows the PHY to gate the incoming 
reference clock via the CLKREQ# signal, leveraging its standard control 
behavior.

Otherwise you could only see it in L1 instead of L1 substates. By the
way, how do you verfy it could enter L1 substate? Do you use debugfs
like below ?
   cat /sys/kernel/debug/dwc_pcie_a40000000.pcie/ltssm_status

> 
>>> +     supports-clkreq;
>>>        reset-gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_HIGH>;
>>>        vpcie3v3-supply = <&vcc3v3_pcie30>;
>>>        status = "okay";
>>>
>>> base-commit: b29fb8829bff243512bb8c8908fd39406f9fd4c3
>>>
> 
> Thanks
> -Anand
> 

