Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CACFD2ECFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 01:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T/TCsCdIrbCboZ9CYWIOrqCgweLTDpJXdZAWcI4FJpY=; b=ofqwwp5VEfZkzAh/LtMHdnp9iC
	wXMjhQEuGHDi9gd42bxXdKDsGGfnoFdOBFKHUdv4TNHKe5L07kEJuGobiaAHs7jTxf2x/5H3k83kO
	vXa7qOG8ewjhJ2JLc/sMFDwycIL7Mx+QS+oRdOeFEp26v86sUxvOSVFTn6PWdMHbnFwyo1JxckCF2
	EcjFV2uOQRwlo/NJpF9iqMotLQX88kSwYRdJg4vXqPkEIVY6yyX3ubyq9cJvInO5sVCjDqshv/L7Y
	BD67V6rxF4bCJUPi8/5ijX0IvNUE0q2lKnzNffk+2gBjTb4T70vXJs4wUpt0lTawb+5U/10CrJu6Q
	eH8BZnxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0F5-0000000311l-2LdT;
	Tue, 20 Jan 2026 01:09:11 +0000
Received: from mail-m82213681.xmail.ntesmail.com ([8.221.36.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0F0-0000000311J-1heO;
	Tue, 20 Jan 2026 01:09:09 +0000
Received: from [172.16.12.14] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 31385ed12;
	Tue, 20 Jan 2026 09:08:56 +0800 (GMT+08:00)
Message-ID: <314c7852-a79a-4cdc-9767-187ae5a89a48@rock-chips.com>
Date: Tue, 20 Jan 2026 09:08:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, robh@kernel.org, conor+dt@kernel.org,
 krzk+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, heiko@sntech.de
Subject: Re: [PATCH v1] ARM: dts: rockchip: rk3036: remove mshc aliases
To: Johan Jonker <jbx6244@gmail.com>
References: <c6feab79-5b73-413b-a94f-9d1b2fa6df43@gmail.com>
 <c4c17773-1146-4db9-bf2f-a7500a8bd734@rock-chips.com>
 <e4ebdde6-4073-4dd6-aef2-abf2c293a48d@gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <e4ebdde6-4073-4dd6-aef2-abf2c293a48d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9bd8f29b0809cckunm185652679dde8c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQx5MTlZPTU5CSUtOTB9MHk1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Fh0Deu1C5ejpCy0CJY9ogr4aBj5Sv9+tlwEhVKIqaWOeoCcUsCdNQeNSfSS7e5Ekw0mC/36iRje7iIbnTbO1RxRZ4OlBUM8jzXtoiDaNSN6WvrmyCaA0uSpM+FX9gOVEWAbc07oU5SaPiptmzPhtP1SvAqrKRcacZ/Ez3/RSiCM=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=T/TCsCdIrbCboZ9CYWIOrqCgweLTDpJXdZAWcI4FJpY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_170907_779477_4285FF1E 
X-CRM114-Status: GOOD (  19.70  )
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

在 2026/01/20 星期二 2:10, Johan Jonker 写道:
> 
> 
> On 1/19/26 08:08, Shawn Lin wrote:
>> Hi Johan,
>>
>> 在 2026/01/17 星期六 5:05, Johan Jonker 写道:
>>> The use of mshc aliases is deprecated for some while,
>>> so remove them from the rk3036.dtsi file.
>>>
>>
> 
>> I noticed that the alias property is still listed in the
>> documentation[1]. Could you please share where it has been formally
>> marked as deprecated? I may have missed the update.
>>
>> [1] Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> 
> Mshc aliases driver support was introduced 2018 in dw_mmc.c only and before that a undocumented copy paste entered somehow into dtsi files.
> The mmc-controller.yaml file change in 2020 mentions a fixed index mmcN format.
> A generic alias name "mmc" is now preferred instead of a "mshc" driver specific.
> 
> As suggested by Arnd Bergmann and others, the newly added mmc aliases
> should be board specific
> 

Thanks for these details. Then I'm fine with this patch.

> Discussions about Rockchip aliases started around 2021
> https://lore.kernel.org/linux-rockchip/CAK8P3a3_uO23Y0tyfdh26tmCVcyp6XM+ur0WUd4khGUoBb32Hw@mail.gmail.com/#t
> 
> https://lore.kernel.org/all/CAPDyKFp1zMBUfK7LteW0yEfTpqtU+P+EybLsJBFx_r54HwFdMg@mail.gmail.com/
> 
> [PATCH 0/4] mmc: dw_mmc: start deprecating mshcN aliases
> https://lore.kernel.org/linux-rockchip/20211124184603.3897245-1-john@metanate.com/
> ====
> 
> Nov 24, 2015
> ARM: dts: rockchip: add core rk3036 dtsi
> https://github.com/torvalds/linux/commit/faea098e1808729e4785cdba3a3fc52fae49f1ab
> 
> Dec 19, 2015
> ARM: dts: rockchip: add the sdio/sdmmc node for rk3036
> https://github.com/torvalds/linux/commit/187d7967a5ee630ae062fb543655e59d2f0f91fb
> 
> ====
> 
> Feb 27, 2018
> mmc: dw_mmc: Factor out dw_mci_init_slot_caps
> https://github.com/torvalds/linux/commit/a4faa4929ed3be15e2d500d2405f992f6dedc8eb
> 
> ====
> 
> Sep 7, 2020
> dt-bindings: mmc: document alias support
> https://github.com/torvalds/linux/commit/1796164fac7e348f74a0f1f1cae995b22d002315
> 
> Sep 7, 2020
> mmc: core: Allow setting slot index via device tree alias
> https://github.com/torvalds/linux/commit/fa2d0aa96941e8dc347e49a04c75468e3002ee20
> 
>>
>>> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
>>> ---
>>>    arch/arm/boot/dts/rockchip/rk3036.dtsi | 3 ---
>>>    1 file changed, 3 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/rockchip/rk3036.dtsi b/arch/arm/boot/dts/rockchip/rk3036.dtsi
>>> index fca21ebb224b..78afae42f8b2 100644
>>> --- a/arch/arm/boot/dts/rockchip/rk3036.dtsi
>>> +++ b/arch/arm/boot/dts/rockchip/rk3036.dtsi
>>> @@ -23,9 +23,6 @@ aliases {
>>>            i2c0 = &i2c0;
>>>            i2c1 = &i2c1;
>>>            i2c2 = &i2c2;
>>> -        mshc0 = &emmc;
>>> -        mshc1 = &sdmmc;
>>> -        mshc2 = &sdio;
>>>            serial0 = &uart0;
>>>            serial1 = &uart1;
>>>            serial2 = &uart2;
>>> -- 
>>> 2.39.5
>>>
>>>
>>> _______________________________________________
>>> Linux-rockchip mailing list
>>> Linux-rockchip@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-rockchip
>>>
>>
> 
> 


