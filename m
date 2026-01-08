Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE366CF6A85
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 08:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lHhK7J9UwVHyDp7OnI2aJtOUELVCPGvnzkrrcOsH38Q=; b=ZafbotqXkHlAYzXsE+fwCVXymC
	RyalwZfpQ6osJUK7deXzDZVnzQfXwTNUuA9cGmxAv9pbJ1y76mI39FXMDIlDo4wxw1tb/uxVFN0j9
	Kh1OlGGd5RyomLJGfD9frUqce/vBqrYtUNSV801qtvvfGm/h9DAFS+00eqrKJYn0WCxr+sD99aDLl
	OKwh5Xt6xIgHzZNoSceUn+nM5rbjuIGzW0H3QVGwsPacC5YoqZW3z6GGH+KXCzEsVNgzRNmSNqNRO
	Wm+nnbOSCWl/IaCZAr563/UEFaXkXxtjfza1h5BXc1281wvSbyMl5nChZC6psABDpI4HPGODtdvEA
	jmsFPCQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdlX8-0000000GJKm-1ZcZ;
	Thu, 08 Jan 2026 08:38:18 +0000
Received: from mail-m3289.qiye.163.com ([220.197.32.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdlX3-0000000GJIO-25YG;
	Thu, 08 Jan 2026 08:38:16 +0000
Received: from [172.16.12.51] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2fef36141;
	Thu, 8 Jan 2026 16:38:07 +0800 (GMT+08:00)
Message-ID: <6f55c325-6b2a-4fe9-a487-5f1ae7969d9d@rock-chips.com>
Date: Thu, 8 Jan 2026 16:38:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add rk3576 evb2 board
To: Alexey Charkov <alchark@gmail.com>, Chaoyi Chen <kernel@airkyi.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Kever Yang <kever.yang@rock-chips.com>, Jonas Karlman <jonas@kwiboo.se>,
 John Clark <inindev@gmail.com>, FUKAUMI Naoki <naoki@radxa.com>,
 Jimmy Hon <honyuenkwun@gmail.com>, Dragan Simic <dsimic@manjaro.org>,
 Michael Riesch <michael.riesch@collabora.com>,
 Peter Robinson <pbrobinson@gmail.com>, Shawn Lin <shawn.lin@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260107070322.323-1-kernel@airkyi.com>
 <20260107070322.323-3-kernel@airkyi.com>
 <b5a3470c-aa03-42d0-a575-b705f709f8e6@lunn.ch>
 <CABjd4YzsjZXe16XWgrHRG5shNA_DQJF45i1roahvfAfV4xdU0Q@mail.gmail.com>
 <a545fec0-cb30-489a-b5e6-4ee87dcab41c@rock-chips.com>
 <5FFFBA7FAF5745A7+e0381969-800a-4bf6-9aac-81cffa3469a1@airkyi.com>
 <CABjd4YxwD_q_FrEuPw_GY+vG6700Vd_weWqdcFn2C3V0fqpO-Q@mail.gmail.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <CABjd4YxwD_q_FrEuPw_GY+vG6700Vd_weWqdcFn2C3V0fqpO-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b9cc1866103abkunm0e048bb5117cfb
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQxhJQlZKTElOQx1OQk0YS01WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUJNS0
	pVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=f79xQ8sZlvCVy2PFQxXZd70Z/gMMUfuu39/WzLEApaY/LtlnAlZLpyn8o0o7YdTMMF9rsFmxcNn+HU/BGHd8baUJbHmZ7Q7uLAgllFhWoZP56g9OZ17+f6gWldn6XDzL8XE03FG4Ba7H2AOQmequz04zyPDk5B86vAscguWQsL4=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=lHhK7J9UwVHyDp7OnI2aJtOUELVCPGvnzkrrcOsH38Q=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_003813_743821_3B55AF1C 
X-CRM114-Status: GOOD (  17.11  )
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

On 1/8/2026 4:11 PM, Alexey Charkov wrote:
> On Thu, Jan 8, 2026 at 12:02 PM Chaoyi Chen <kernel@airkyi.com> wrote:
>>
>> On 1/8/2026 3:42 PM, Chaoyi Chen wrote:
>>> Hello Alexey, Andrew,
>>>
>>> On 1/8/2026 2:53 PM, Alexey Charkov wrote:
>>>> On Wed, Jan 7, 2026 at 10:18 PM Andrew Lunn <andrew@lunn.ch> wrote:
>>>>>
>>>>>> +&gmac0 {
>>>>>> +     clock_in_out = "output";
>>>>>> +     phy-mode = "rgmii-rxid";
>>>>>
>>>>> rgmii-rxid is odd. Does the PCB really have an extra long TX clock
>>>>> line, but a short RX clock line?
>>>>>
>>>>> Try changing this to rgmii-id, and drop the tx_delay property.
>>>>
>>>> Actually it would be great if Rockchip could clarify the delay
>>>> duration introduced by a single delay element in GMAC-IOMUX delay
>>>> lines, which are controlled in the GMAC driver by the {tx,rx}_delay
>>>> properties. Maybe we could then switch to using
>>>> {tx,rx}_internal_delay_ps for fine-tuning the delays on the GMAC side
>>>> as envisaged in DT bindings [1], and use phy-mode = "rgmii-id"
>>>> throughout. Chaoyi, any chance you could ask around in your hardware
>>>> team?
>>>>
>>>> Currently though removing the delays at GMAC side altogether causes
>>>> unstable link operation - see [2] for example.
>>>>
>>>> [1] https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L342-L347
>>>> [2] https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/commit/372f3e9ae62cc62cdf2543391ea57be6bb548a0c
>>>
>>> Sorry, this problem has been discussed many times before. It's because
>>> the gmac on the Rockchip platform currently relies on setting the
>>> corresponding delay via phy-mode [3].
>>>
>>> [3] https://lore.kernel.org/all/mqoyjn7mnq6tmt6n6oev4wa3herjaxlupml2fmcampwiajvj4a@r5zs4d3jdm5p/
>>>
>>> The delay introduced by the delay line is not absolute. In reality,
>>> it depends on factors such as the chip's design and process technology.
>>>
>>> And for RK3576, you can assume that:
>>>
>>>       time(ns) = 0.0579 * delay_line_count + 0.105
>>>
>>> For example, tx_delay = <0x20> means:
>>>
>>>       time = 0.0579 * 0x20 + 0.105 ns = 1.9578 ns
>>>
>>> And I believe {tx,rx}_internal_delay_ps is indeed a good idea.
>>> I'll try to add them in v3. Thanks.
>>>
>>
>> I've also see some dt that use {tx,rx}_internal_delay_ps inside the PHY,
>> and compared to doing it in the MAC, which one is the better choice?
> 
> Your PHY defaults to 1950ps in rgmii-id [1], so adding anything on top
> of that on GMAC side would land you with a longer total TX delay than
> you currently get according to the coefficients you've just posted
> (1784.1ps). I would say go for "tx-internal-delay-ps = <1800>" on the
> PHY side for the closest match.
> 
> [1] https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/net/motorcomm%2Cyt8xxx.yaml#L36

Ah, I thought it was something like this:

&gmac0 {
	phy-mode = "rgmii";
	tx-internal-delay-ps = <1784>;
};

But what you actually said was this:

&mdio1 {
	rgmii_phy: ethernet-phy@1 {
		compatible = "ethernet-phy-ieee802.3-c22";
		reg = <0x1>;
		tx-internal-delay-ps = <1784>;
	};
};

These two `tx-internal-delay-ps` things shouldn't be the same, right?

-- 
Best, 
Chaoyi

