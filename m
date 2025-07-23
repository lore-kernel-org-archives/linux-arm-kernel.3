Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886AFC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 15:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FhP6rOtQvB4VYIXnnNpu3xwHjjjJTBlHfuZIWCxLQIE=; b=IKtXVyJ6WxOIP0TAMSVtZQfzvs
	Ko31z9GgTmg3NWfGR8l5pC/qSCgt8MIxwY7ekcmww2X+djQG+ZFCDC4VjchoatltvH/xnqn4Uf1IK
	CtuMwK9mm25GOPvKBLlCqBj2lUeIhNPgMdCAx0voPD1yFin5ztQBrYnCTQGIUR24wTMd3riIeC3vw
	6q6PqePtKqbwDKnKLpUr/TJl5VS5AzhmL8zVAyg6rSajx9mazS8WJhyvgHy6PoENJZ+z5kpkNOC2M
	Bu29Z3zjr5fUbzNTHK3z2Q8VHAOn6O36+bXmbGG4qm1P2v40uqf/ANx4NeoS5qZMelcrYtoRm35N/
	Ai/5++0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uebiz-00000005QTY-3d9M;
	Wed, 23 Jul 2025 15:49:45 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uebQe-00000005O5v-1KIc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 15:30:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1753284647;
 bh=FhP6rOtQvB4VYIXnnNpu3xwHjjjJTBlHfuZIWCxLQIE=;
 b=yQ+sQpsVWFym/IY/+l4Yygit1JpbaBJXr7tmTBfx8cEv2Jw98S08DHzQfTYTWt8Tb/ACYtMFh
 kM3IODCU+Pt+7vai8zeVrWEDQt4d1m1Zj/r0GcqEoQHpX8NkeGDjo09wFyZ2lw8z+liWC9ay3qc
 t0wmcGOOEaqLMGbTf1VGEkxraZXZM1t12+lA9++UD7kCPR2tWsJbHhAHLBZRFu5G2TTqRhbXZHi
 DFlAtbw50g9tUIthRnRoEACqIvOmh6jLB3Mzj6wj+TNG5r5X5UPM4I1gGplW5/1IPVj0cz5qwLR
 ueGeHug1gaYA06B1iHhajsymKatSbOUozRu5zmMwYGhw==
X-Forward-Email-ID: 68810025cb0ee86f9731e6c0
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.1.6
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <94357eb2-d8aa-4928-8816-9f6529530170@kwiboo.se>
Date: Wed, 23 Jul 2025 17:30:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] arm64: dts: rockchip: Add USB nodes for RK3528
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, heiko@sntech.de,
 kishon@kernel.org, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-rockchip@lists.infradead.org, robh@kernel.org, vkoul@kernel.org,
 ziyao@disroot.org
References: <20250723122323.2344916-8-jonas@kwiboo.se>
 <20250723143006.1083489-1-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250723143006.1083489-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_083048_428638_D8DACFF2 
X-CRM114-Status: GOOD (  21.29  )
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

Hi Chukun,

On 7/23/2025 4:30 PM, Chukun Pan wrote:
> Hi,
> 
>> The DWC3 node does not contain any default phys because out of current
>> and pending supported boards only one board, ROCK 2A, can use USB3.
>> Remaining boards use the Naneng Combo PHY for PCIe instead of USB3.
> 
> I have other RK3528 boards with USB3 and can test this in a few days.
> Or do you think that usb3-phy should be added in the dts of the device?

That is what I did for ROCK 2A testing I added the usb3-phy to the board
dts. Mostly for two reasons, first because I did not want to make this
series fully depend on the naneng-combphy series. And secondly because
the ROCK 2A also have some sort of GPIO controlled mux for USB3 and PCIe
signals that may affect how usb3 support is described in the device tree.

I am open to ideas on how or what default phys to include in soc dtsi.

For the ROCK 2A usb3-phy example, please see the commit "arm64: dts:
rockchip: Enable USB 3.0 port on ROCK 2A" at [1].

[1] https://github.com/Kwiboo/linux-rockchip/commits/next-20250722-rk3528/

> 
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
>> index 85bc3f5aa2c7..3e51a3f51e05 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
>> @@ -243,6 +243,29 @@ soc {
>>  		#address-cells = <2>;
>>  		#size-cells = <2>;
>>
>> +		usb_host0_xhci: usb@fe500000 {
>> +			compatible = "rockchip,rk3528-dwc3", "snps,dwc3";
>> +			reg = <0x0 0xfe500000 0x0 0x400000>;
>> +			clocks = <&cru CLK_REF_USB3OTG>,
>> +				 <&cru CLK_SUSPEND_USB3OTG>,
>> +				 <&cru ACLK_USB3OTG>;
>> +			clock-names = "ref_clk", "suspend_clk", "bus_clk";
>> +			interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
>> +			power-domains = <&power RK3528_PD_VPU>;
>> +			resets = <&cru SRST_A_USB3OTG>;
>> +			dr_mode = "otg";
>> +			phy_type = "utmi_wide";
>> +			snps,dis_enblslpm_quirk;
>> +			snps,dis-del-phy-power-chg-quirk;
>> +			snps,dis-tx-ipgap-linecheck-quirk;
>> +			snps,dis-u1-entry-quirk;
>> +			snps,dis-u2-entry-quirk;
>> +			snps,dis-u2-freeclk-exists-quirk;
>> +			snps,parkmode-disable-hs-quirk;
>> +			snps,parkmode-disable-ss-quirk;
> 
> Maybe "snps,dis_u2_susphy_quirk" is needed?

Maybe, it did not seem to be needed when I tested USB2.0 only or USB3.0,
will run some more tests on my boards.

Any issues you know that snps,dis_u2_susphy_quirk would help fix?

For my latest USB testing I have included a few USB related changes in
U-Boot, e.g. early disable of U3 port. Will push and updated rk3528
branch [2] once source.denx.de is fully back online again.

[2] https://source.denx.de/u-boot/contributors/kwiboo/u-boot/-/commits/rk3528

> Downstream kernels add this on USB2.0 only devices:
> https://github.com/rockchip-linux/kernel/blob/develop-5.10/arch/arm64/boot/dts/rockchip/rk3528-demo.dtsi#L474
> 
>> +		u2phy: usb2phy@ffdf0000 {
>> +			u2phy_otg: otg-port {
>> +			u2phy_host: host-port {
> 
> I think it would be better to call it usb2phy, usb2phy0_otg and usb2phy0_host?
> In this way, we can put these USB nodes close together in the device's dts.

From what I could see these nodes are named u2phy for 8 other Rockchip
SoCs and only named usb2phy for 3. So I went with what the majority seem
to be calling them.

I fully understand wanting to sort them closer, however we also have the
forthcoming combphy for USB3 that also will be sorted away from the usb
controller nodes. Hopefully someone more can chime in on node naming
suggestions :-)

Regards,
Jonas

> 
> --
> 2.25.1
> 
> 


