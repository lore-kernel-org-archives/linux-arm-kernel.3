Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE0BCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 08:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8h2l1N5Cg8vyKobtn2Pe4zUGVCtgOR3YdwiahusUFj0=; b=xDYCzD9zIDJ3ScWzaOhvIeeLAp
	+7SBC5s07LNp4O02dZPuFQHvXSIkEtmALCRsc3pUhUxGUc87SdwWZW5+7/y7v9wqHVAgXYwaxEQ7+
	NMdFNeckyFlvs9liLWKidNW9/YUonxJPeeKv4jyt5r4iSpdIXZpMTetTe4bYWUOcShHdoq4q1C6pv
	PhbkYvxSnfjcWvYruzRxCuQxphu3+zdmvSPjL6qdgusM3T2UTuafQMMC/j3iEv0IjYdCp2oHUc1+t
	cVb8flBR6o6QgolCMVIJsnsD/mYiY5WzRKkmuGT/6NDKKebt7bHJZSW3BYm71dGM9bGsLYayU3G6m
	Tk6K+y3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAl8F-0000000CLHF-2cGT;
	Mon, 20 Oct 2025 08:20:43 +0000
Received: from mail-m158252.netease.com ([47.251.158.252])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAl8B-0000000CLEX-2qUn;
	Mon, 20 Oct 2025 08:20:41 +0000
Received: from [172.16.12.129] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 267e17090;
	Mon, 20 Oct 2025 16:20:32 +0800 (GMT+08:00)
Message-ID: <77be8aa2-f91b-4291-b3f3-73ae97a2c495@rock-chips.com>
Date: Mon, 20 Oct 2025 16:20:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Grzegorz Sterniczuk <grzegorz@sternicz.uk>,
 Dragan Simic <dsimic@manjaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH] arm64: dts: rockchip: fix eMMC corruption on NanoPC-T6
 with A3A444 chips
To: Tianling Shen <cnsztl@gmail.com>, Hugh Cole-Baker <sigmaris@gmail.com>
References: <20251017073954.130710-1-cnsztl@gmail.com>
 <d70c0eb5-9aa2-47b1-8205-81b724180319@rock-chips.com>
 <08911ae2-fef3-432d-a236-d820c9cb67ac@gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <08911ae2-fef3-432d-a236-d820c9cb67ac@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a00b4af9a09cckunma851ec124e48ea
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQx0dS1ZCH05CSk1NGktOGBpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=FYMRm0h1xoQknRUP34oGrB1pA/MPaKTWnA15xR/xfT/uxUzm/R3VAhuGIvU7aAoEqk+PnXghGlYL7e3oETmsIeuQBW+Gd35FhFLL1e6TMR6nodDCFy0foDq1PeNgNyHlhIKYanQcemlRddnjKuY/VgAkZxmNLsHxuRebDevp9p0=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=8h2l1N5Cg8vyKobtn2Pe4zUGVCtgOR3YdwiahusUFj0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_012040_228523_34477F0E 
X-CRM114-Status: GOOD (  17.01  )
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

+ Hugh Cole-Baker who seems also suffer from this issue

在 2025/10/20 星期一 12:44, Tianling Shen 写道:
> Hi Shawn,
> 
> On 2025/10/20 9:53, Shawn Lin wrote:
>> Hi Tianling
>>
>> On 2025/10/17 Friday 15:39, Tianling Shen wrote:
>>> From: Grzegorz Sterniczuk <grzegorz@sternicz.uk>
>>>
>>> Some NanoPC-T6 boards with A3A444 eMMC chips experience I/O errors and
>>> corruption when using HS400 mode. Downgrade to HS200 mode to ensure
>>> stable operation.
>>
>> May I ask you to test another patch I just posted to see if it fixes
>> your issue?
>>
>> https://patchwork.kernel.org/project/linux-mmc/ 
>> patch/1760924981-52339-1- git-send-email-shawn.lin@rock-chips.com/
> 
> Thank you for the patch! I will ask my friend to test it but he uses 
> this board as a home router, so it may take a few days or weeks to 
> report the result.
 > > Thanks,
> Tianling.
> 
>>
>>
>>>
>>> Signed-off-by: Grzegorz Sterniczuk <grzegorz@sternicz.uk>
>>> Signed-off-by: Tianling Shen <cnsztl@gmail.com>
>>> ---
>>>   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 3 +--
>>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/ 
>>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
>>> index fafeabe9adf9..5f63f38f7326 100644
>>> --- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
>>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
>>> @@ -717,8 +717,7 @@ &sdhci {
>>>       no-sd;
>>>       non-removable;
>>>       max-frequency = <200000000>;
>>> -    mmc-hs400-1_8v;
>>> -    mmc-hs400-enhanced-strobe;
>>> +    mmc-hs200-1_8v;
>>>       status = "okay";
>>>   };
>>
> 
> 


