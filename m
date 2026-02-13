Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13EC9EEA860
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 17:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WLNCPhcI2W5xrHq/Yf54FeNp8YmonAJeCVTYOXhtjrs=; b=M4l1YCkBxjKC6lB9ch2vQA+kM6
	pUwMlB2LTuljz6cuNuJ8rhNt9+sjv0zAC2XgJfTd6E5wgYpPFgp5tCPfhy+36mF/c9/vmoO/EHWSy
	Oedzy8xur70KLcm5gsUVMwtjbqt+Urj+hKxA9jD18VWDCjguL/7mr8cfMNNKADImpNrRJJJEd5lN4
	0xU+Z0D+4XfEV2DbY2LYdb9j+CPzaTes21iubfDROUzgB9wtUGJmLkbgpqm7xhCLdee1DOLRgx7L5
	wTdc5caTHmcwOwU4ZGHZb+6mGGL5S7PGJAWu45XDUOBJODkvcHmQbcej72Sf9qaaM/wsgzkyJZSix
	DdD2PzbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqwp5-00000003jRO-1HCN;
	Fri, 13 Feb 2026 17:19:19 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqwp0-00000003jQc-3cAg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 17:19:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1771003152;
 bh=WLNCPhcI2W5xrHq/Yf54FeNp8YmonAJeCVTYOXhtjrs=;
 b=BoYLbTqIYXUPvfORAy3FfySxSC2kdAOWDt3KrT98gEuiLhuHGmgrwsNZDTZTfTb2DYgykorUk
 1njok7hsXQHaDlWQUy4eLnGDi8qbY1ZMw+CYCrTeCcGYKj+JduYNhUW4v/j7958FIBQhSHwWDQy
 92Lr+5ydHuuo9EkcVP+g6ilrnqBnCw2lkYw6ME6hrSZa+y+enR0QNtrgwEcfumXiqsgyoDKXqKQ
 0MWphzGkzVH96OjfwrKqqO2U5yguwylz+ApmYvJgLWZEGOiLD86r9B5byTD0lnt/jrW1Wzmt6QG
 iFSLmSHZNPuqTvKlM2M4SslSUc73v62wpoQav94rqzKA==
X-Forward-Email-ID: 698f5d0c11dfcf99c4b0aeb1
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.6.4
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <9083266d-2b18-4b7a-bc72-1d873edb7cdf@kwiboo.se>
Date: Fri, 13 Feb 2026 18:19:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: rock-3b: Add phy-supply to
 pcie30phy
To: MidG971 <midgy971@gmail.com>, Shawn Lin <shawn.lin@rock-chips.com>
Cc: "linux-rockchip@lists.infradead.org"
 <linux-rockchip@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "heiko@sntech.de" <heiko@sntech.de>, Claude <noreply@anthropic.com>
References: <20260213151452.535527-1-midgy971@gmail.com>
 <fe4c9352-7bf9-70cb-97ed-322fc739f409@rock-chips.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <fe4c9352-7bf9-70cb-97ed-322fc739f409@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_091914_918910_DD50E228 
X-CRM114-Status: GOOD (  24.10  )
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

On 2/13/2026 5:10 PM, Shawn Lin wrote:
> Hi
> 
> 在 2026/02/13 星期五 23:14, MidG971 写道:
>> The PCIe 3.0 PHY requires its power supply regulator to be enabled
>> before initialization. Without the phy-supply property, the PHY
>> driver does not ensure the regulator is enabled, causing SRAM
>> initialization to timeout with "lock failed" errors:

This is incorrect, as already mentioned the ref clock is modeled as a
regulator, and this regulator is both boot-on and always-on and should
not be referenced as the phy-supply, and the reason why I did not do it
in the initial board device tree submission.

>>
>>    phy phy-fe8c0000.phy.1: phy poweron failed --> -110
>>    rockchip-snps-pcie3-phy fe8c0000.phy: PCIe3PHY lock failed 0x6890000
>>    rockchip-pcie fe280000.pcie: phy init failed: -110

How did you manage to get this? Did you use wrong/bad boot firmware?

Please try mainline U-Boot for the ROCK 3B target, that will ensure that
both the ref clock "regulator" and the two Ethernet phys are reset
before entering Linux (or other OS) using the mainline Linux device tree
for this board.

>>
>> This results in NVMe devices in the M.2 slot not being detected.
>>
>> Add phy-supply referencing vcc3v3_pi6c_03 regulator (which controls
>> the PI6C PCIe clock generator power via GPIO0_D4) to ensure proper
>> power sequencing during PHY initialization.

As already mentioned, this is not a phy regulator so adding it as a
phy-supply does not correctly reflect the hardware.

>> Fixes: 846ef7748fa9 ("arm64: dts: rockchip: Add Radxa ROCK 3B")
>> Signed-off-by: MidG971 <midgy971@gmail.com>
>> Co-developed-by: Claude <noreply@anthropic.com>
>> Signed-off-by: Claude <noreply@anthropic.com>
> 
> Should put your SOB at last.
> 
>> ---
>>   arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
>> index c5f67dd6dfd9..a1b2c3d4e5f6 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
>> +++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
>> @@ -404,6 +404,7 @@ &pcie2x1 {
>>   };
>>
>>   &pcie30phy {
>> +	phy-supply = <&vcc3v3_pi6c_03>;
> 
> As a fix which need to be backported, it looks fine for just one-line
> change.

I disagree, as you mention below, and as mentioned in a comment in the
device tree, the ref clk generator is modeled as a regulator that is
boot-on and always-on that is normally enabled by boot firmware.

> However, the whole commit message is misleading. power supply for
> pcie30phy is powred up with all other phys' when booting, for instance,
> USB, otherwise all IP using PHY should not work, not just PCIe. So 
> actually it's not the power but the input refclk, and apprently pi6c
> is a 100MHz clock generator which was designed to be a regulator by
> mistake in the first place.
> 
> If you would like to clean it up later, you could use a 
> gated-fixed-clock like:

Agree, if anything please re-model the ref clk regulator as a
gated-fixed-clock instead of adding an incorrect phy-supply.

And please try mainline U-Boot targeted for you board if you intend on
using mainline Linux for your board, should most likely fix your PCIe
issue.

Regards,
Jonas

> 
> https://lore.kernel.org/linux-rockchip/35e97a41-b88b-f526-351f-d4c5f70ee4e9@rock-chips.com/T/#u
> 
> 
>>   	status = "okay";
>>   };
>>
>> --
>> 2.39.5

