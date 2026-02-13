Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5BCAEDF17D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 16:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQCtykSlfRzqEm/DJfyTijSzAL8gm65mvzEpV44+OgM=; b=UlnMk7Ud5d7gIeD+BPcKD/nXSp
	H0jojjdZAXugbBr5ei/Ze0BkWVxRFevVv25OnWQsr2OMiRx+6T0x/lsT067eBpUlQ6JpknZL5RCEd
	pIe+uMPtxAaSj8aCYyz8hX3gVPBCJSS4R4g8pvEtAvKjsCSlBJnx1QHqtOtH3+YzW3+GDSBBi44uX
	r7ChoOY4XvOQAFqw+hZz2/cYXPxyZLKH2IJcFRgD4eZU5t365sEOu7ofUdjDvPQvGgfMwljLAtMD4
	4vns9kTzwlEIeENm9o6CD4NbJA/LEz4laQGcjp66pfHn9dhkWCxaWX9Gj/V3wDyaatgFa0v8y83q8
	6xdANbbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqvkk-00000003emz-0KuK;
	Fri, 13 Feb 2026 16:10:46 +0000
Received: from mail-m1973181.qiye.163.com ([220.197.31.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqvkf-00000003elu-3rXA;
	Fri, 13 Feb 2026 16:10:44 +0000
Received: from [172.16.12.14] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 341affb18;
	Sat, 14 Feb 2026 00:10:26 +0800 (GMT+08:00)
Cc: shawn.lin@rock-chips.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, heiko@sntech.de, jonas@kwiboo.se,
 Claude <noreply@anthropic.com>
Subject: Re: [PATCH] arm64: dts: rockchip: rock-3b: Add phy-supply to
 pcie30phy
To: MidG971 <midgy971@gmail.com>, linux-rockchip@lists.infradead.org
References: <20260213151452.535527-1-midgy971@gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <fe4c9352-7bf9-70cb-97ed-322fc739f409@rock-chips.com>
Date: Sat, 14 Feb 2026 00:10:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20260213151452.535527-1-midgy971@gmail.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c57c491fb09cckunm917520542f2628
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ09PS1ZOT0lLGUsYHRoeQkNWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=gqR+K2yI1W/oIHIOEw+qH8se7uS+4+70umwQ6eF5WLknBtiKlVGVHdAoCyK0SdV1iSUyCy6YpyryQBbT/G8nuq+up1qxS7bSgKBac7RJbCLZ4K1AlfUXQd2oQLNEPEvYRVeOlxSNAqctiz/JlvMllF/h+eEU1IjNAEdvO9/77JA=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=lQCtykSlfRzqEm/DJfyTijSzAL8gm65mvzEpV44+OgM=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_081042_525184_B7A166B6 
X-CRM114-Status: GOOD (  20.65  )
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

Hi

在 2026/02/13 星期五 23:14, MidG971 写道:
> The PCIe 3.0 PHY requires its power supply regulator to be enabled
> before initialization. Without the phy-supply property, the PHY
> driver does not ensure the regulator is enabled, causing SRAM
> initialization to timeout with "lock failed" errors:
> 
>    phy phy-fe8c0000.phy.1: phy poweron failed --> -110
>    rockchip-snps-pcie3-phy fe8c0000.phy: PCIe3PHY lock failed 0x6890000
>    rockchip-pcie fe280000.pcie: phy init failed: -110
> 
> This results in NVMe devices in the M.2 slot not being detected.
> 
> Add phy-supply referencing vcc3v3_pi6c_03 regulator (which controls
> the PI6C PCIe clock generator power via GPIO0_D4) to ensure proper
> power sequencing during PHY initialization.
> 
> Fixes: 846ef7748fa9 ("arm64: dts: rockchip: Add Radxa ROCK 3B")
> Signed-off-by: MidG971 <midgy971@gmail.com>
> Co-developed-by: Claude <noreply@anthropic.com>
> Signed-off-by: Claude <noreply@anthropic.com>

Should put your SOB at last.

> ---
>   arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> index c5f67dd6dfd9..a1b2c3d4e5f6 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> @@ -404,6 +404,7 @@ &pcie2x1 {
>   };
> 
>   &pcie30phy {
> +	phy-supply = <&vcc3v3_pi6c_03>;

As a fix which need to be backported, it looks fine for just one-line
change.

However, the whole commit message is misleading. power supply for
pcie30phy is powred up with all other phys' when booting, for instance,
USB, otherwise all IP using PHY should not work, not just PCIe. So 
actually it's not the power but the input refclk, and apprently pi6c
is a 100MHz clock generator which was designed to be a regulator by
mistake in the first place.

If you would like to clean it up later, you could use a 
gated-fixed-clock like:

https://lore.kernel.org/linux-rockchip/35e97a41-b88b-f526-351f-d4c5f70ee4e9@rock-chips.com/T/#u


>   	status = "okay";
>   };
> 
> --
> 2.39.5
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
> 

