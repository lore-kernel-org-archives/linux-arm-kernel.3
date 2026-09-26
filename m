Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C28C98318
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 08:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AImZn33N8xlyKL2p3b90Oxr51XFIQu7conwqFgIqVCs=; b=iS8GP3qArD+jMov7Zwrynd0wul
	5VqFTeZg5ssIJYdF/ndaL26Od5oCvz3fERpwwYldg2/0krfrPCV+pSfbRyewWhn4nWauZ5L3n+DKg
	r/VOJrfVbW6OfAwMBtpzKDrN4NMm+k8pL+WfEPD2cXeNkaC0fmCZBp2Xh8ri6Wk5EPYOegSkbtMLL
	WGDY81Qo+kg+ImB6B9072TDD3fy1fNHM8Pz391yJZP4/kHom2ActvG+qdKdX2bjIabK/VLVPz7kOs
	xH/MyZxUfY4KMYNz/Yq3wMYLkPpasVeoz9lBOWCavvCg7aD0ZMXUa9NBxACxipZMJRwawMrDVl6ch
	q1UzrlJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xANwB-0000000FAHs-0Sxw;
	Sat, 26 Sep 2026 08:39:15 +0000
Received: from mail-m10313119144.xmail.ntesmail.com ([103.131.191.44])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xANw4-0000000FAFl-1spL;
	Sat, 26 Sep 2026 08:39:13 +0000
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4f2fa0730;
	Sat, 26 Sep 2026 16:38:53 +0800 (GMT+08:00)
Message-ID: <24633d41-00d3-4a8b-90e4-ddc1e672c7f8@rock-chips.com>
Date: Sat, 26 Sep 2026 16:38:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/4] arm64: dts: rockchip: Remove cap-sd-highspeed on Rock
 Pi S eMMC
To: Jonas Karlman <jonas@kwiboo.se>, Heiko Stuebner <heiko@sntech.de>
References: <1790147498-47766-1-git-send-email-shawn.lin@rock-chips.com>
 <1790147498-47766-3-git-send-email-shawn.lin@rock-chips.com>
 <d3c0b1c9-a9fe-42c1-b865-dd1a8cc4e416@kwiboo.se>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <d3c0b1c9-a9fe-42c1-b865-dd1a8cc4e416@kwiboo.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0dcde061103a4kunm87f2fe97652717
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTEtCVh4ZSU5MSRpJH0sfS1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUJCSU
	5LVUpLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=VSCXCpU5/D/xkwJrMyVDi9DoaQOs69ywuO8KZyfsplSi7Ki8KJTvgViqq3uvWFMHcOFN1PW6TMYGPwN6ZLOz641AimPio1PQbPNEB10QfljpMiAPFQ4YYeJYWg0kGaETwjLSL+jm8o7NP10EN9A/mhmiBC8xs+EKHahi963482w=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=AImZn33N8xlyKL2p3b90Oxr51XFIQu7conwqFgIqVCs=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_013909_085819_460A43C5 
X-CRM114-Status: GOOD (  14.64  )
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

Hi Jonas

在 2026/09/25 星期五 0:02, Jonas Karlman 写道:
> Hi,
> 
> On 9/23/2026 9:11 AM, Shawn Lin wrote:
>> cap-sd-highspeed declares SD high-speed support and has no place on
>> the non-removable eMMC node. Drop it.
>>
>> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
>> ---
>>
>>   arch/arm64/boot/dts/rockchip/rk3308-rock-pi-s.dts | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3308-rock-pi-s.dts b/arch/arm64/boot/dts/rockchip/rk3308-rock-pi-s.dts
>> index c1e3098..677d129 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3308-rock-pi-s.dts
>> +++ b/arch/arm64/boot/dts/rockchip/rk3308-rock-pi-s.dts
>> @@ -133,7 +133,6 @@
>>   
>>   &emmc {
>>   	cap-mmc-highspeed;
>> -	cap-sd-highspeed;
> 
> The Rock Pi S board has two similar revisions that is supported by this
> DT, one has onboard SD NAND Flash and the other one has onboard eMMC
> supported by the emmc dw-mshc.
> 
> So this board should have both cap-mmc-highspeed and cap-sd-highspeed
> here to support best speed depending on board revision.

I didn't know about the board revision, so please ignore patch 2/4.

Thanks.

> 
> Regards,
> Jonas
> 
>>   	no-sdio;
>>   	non-removable;
>>   	pinctrl-names = "default";
> 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
> 


