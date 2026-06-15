Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF54BCD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 13:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IEDSeKt6aBa3YjGZKrTBnH10OnTxt5lTag0LZBn0RGM=; b=Wor07GJfIPVJLSaCJElJ8A/FPc
	Ib7bemxiA2WMIqlasDjLlbvuiuHvsWN+kQAMgNhToMIsT3sYsgC3SU9IiDDGb52QZlhA+hHnLFi6P
	V5Mg/oDZNogIB9M1oO9jbZUZ0shb1qPPmvqxvVzmVOblngzxmojPvMGO9EuigzBmKCBPYcw0GP7+q
	44P9AIe6DtKZzEgfkGZ1JfquQV9ISKkTKCVqDgpjh66/QVlaGxNe2y4KDbDumMBrJ25BVcq8Kx2Aa
	P+lS/oa/dfNOUS/ohVMQAdxI+JKLMW66zeP5bZmTxCAZRas6TQmS8f6QVnD4TrGJtxk48cFgztIAs
	0sSK5jKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ7QK-0000000EJBI-2vtb;
	Mon, 15 Jun 2026 13:32:20 +0000
Received: from mail-m82248.xmail.ntesmail.com ([156.224.82.248])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ7QF-0000000EJ9u-1SEQ;
	Mon, 15 Jun 2026 13:32:17 +0000
Received: from [172.16.12.74] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4271bc926;
	Mon, 15 Jun 2026 21:32:08 +0800 (GMT+08:00)
Message-ID: <a007b499-fbb8-4fcd-b1f2-c1ab3d6a25cb@rock-chips.com>
Date: Mon, 15 Jun 2026 21:32:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 0/3] Add eDP support for RK3576
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: sebastian.reichel@collabora.com, nicolas.frattaroli@collabora.com,
 alchark@gmail.com, detlev.casanova@collabora.com,
 cristian.ciocaltea@collabora.com, michael.riesch@collabora.com,
 andy.yan@rock-chips.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260605022305.3058853-1-damon.ding@rock-chips.com>
 <cd1f968a-2e1b-434f-a331-a60cd8740032@rock-chips.com>
 <3213683.CbtlEUcBR6@diego>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <3213683.CbtlEUcBR6@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ecb7b7f2103a8kunm47dcead08c7d
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGhgaVkkfTENMHx8ZTUIZGVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQkxVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=kQLJJ9H+1CSZ65yj536jGKbv3YtDkqEYwaL8cLFzBsKAVvf5EgoKPQYIDwsH0Vluy6JvkCJCyy7vFNAbev/CCPktgYlpwkgMnRPkcB0axcRz+k/2cMGrdAq8AHfVO8QwvozLgKwDgb0CZah389/3CPr5uM2Jz8CfVXX4AwRg2Qw=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=IEDSeKt6aBa3YjGZKrTBnH10OnTxt5lTag0LZBn0RGM=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_063215_955273_CCDCA164 
X-CRM114-Status: GOOD (  14.12  )
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

On 6/15/2026 9:01 PM, Heiko Stübner wrote:
> Hi Damon,
> 
> Am Montag, 15. Juni 2026, 14:33:03 Mitteleuropäische Sommerzeit schrieb Damon Ding:
>> Gentle ping on this patch series.
> 
> Linux 7.1 was released yesterday, so we're in the merge-window now.
> (And the 5th of june was shortly before -rc7, so too late for 7.2)
> 
> So I'll pick those up after the merge window end in 2 weeks.
> 
> 

Thanks for the heads-up. Got it. ;-)

Best regards,
Damon

>>
>> On 6/5/2026 10:23 AM, Damon Ding wrote:
>>> Picked from:
>>> https://lore.kernel.org/all/20260601065100.1103873-1-damon.ding@rock-chips.com/
>>>
>>> Patch 1-2 are to add missing clock "hclk" for RK3588 eDP nodes.
>>> Patch 3 is to add the RK3576 eDP node.
>>>
>>> Damon Ding (3):
>>>     arm64: dts: rockchip: Add missing hclk for RK3588 eDP0
>>>     arm64: dts: rockchip: Add missing hclk for RK3588 eDP1
>>>     arm64: dts: rockchip: Add eDP node for RK3576
>>>
>>>    arch/arm64/boot/dts/rockchip/rk3576.dtsi      | 28 +++++++++++++++++++
>>>    arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  4 +--
>>>    .../arm64/boot/dts/rockchip/rk3588-extra.dtsi |  4 +--
>>>    3 files changed, 32 insertions(+), 4 deletions(-)
>>>
>>> ---
>>>
>>> Changes in v2:
>>> - Split out separate patches to add the "hclk" clock reference.
>>> - Split out separate patches to enable the "hclk" clock.
>>> - Add Reviewed-by tag.
>>>
>>> Changes in v3:
>>> - Add a patch to expand descriptions for clocks of the eDP node.
>>> - Add Reviewed-by tag.
>>>
>>> Changes in v4:
>>> - Modify commit msg.
>>>
>>> Changes in v5:
>>> - Enforce the correct third clock name on a per-compatible basis.
>>> - Modify the commit msg simultaneously.
>>> - Add Acked-by tag.
>>>
>>> Changes in v6:
>>> - Expand more detail commit msg about using hclk instead of grf clock.
>>>
>>> Changes in v7:
>>> - List all valid clock names at the top level, and constrain the clock
>>>     count for each platform with minItems/maxItems in allOf.
>>>
>>> Changes in v8:
>>> - Fix indentation to 10 for enum in clock-names property.
>>>
>>> Changes in v9:
>>> - Restore the explicit clock-names for RK3399 and RK3588 eDP dt-bindings.
>>>
>>> Changes in v10:
>>> - Use automatic cleanup to fix OF node reference leak reported by
>>>     Sashiko.
>>>
>>> Changes in v11:
>>> - Pick and rebase DT related patches.
>>>
>>
>>
> 
> 
> 
> 
> 
> 


