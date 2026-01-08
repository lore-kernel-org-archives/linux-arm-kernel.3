Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932F0CF6A89
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 09:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r9gkDatKrEuejlwaty5oSemKfkQdJiS/Uu/XyP3hCgQ=; b=1UanYnSnPhVt80ZdjA0+pXRgmU
	NOBiIceUioB+CNVDmxG8JRr9ww9tZhWe9cfAGtGdILQGPtKIkWN5IE69scFt6Y5Pn2MgWSrM4Ywy8
	DrFPFbMhUscrWTAEfp8JCKxR9GsX1+kQmkMgAbQndIIkRBQW8cnQqWVqWUmm8XH1IKTgEMQRpgH9B
	B5bjvXFVVf+fRW79a/l9eu5YeGSCBGe/QGZ5zyISedqMVzXcR5ZFdzuAuXdRf9A9iPpV7d0R3TFyT
	iEyEAbNX+Ux4wfbuPpRGWEoeC4yKyVZ96pY+DjEhJ9PJ/ZWICJC4iGJsIh3ZBF1NXsl5CxLCAUw8H
	scgBoXOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdlv6-0000000GNmn-360r;
	Thu, 08 Jan 2026 09:03:04 +0000
Received: from mail-m32118.qiye.163.com ([220.197.32.118])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdlv2-0000000GNli-1fWP;
	Thu, 08 Jan 2026 09:03:02 +0000
Received: from [172.16.12.51] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2ff0431a8;
	Thu, 8 Jan 2026 17:02:53 +0800 (GMT+08:00)
Message-ID: <779a407c-0464-4d46-b73d-ad61834f1fcf@rock-chips.com>
Date: Thu, 8 Jan 2026 17:02:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add rk3576 evb2 board
To: Alexey Charkov <alchark@gmail.com>
Cc: Chaoyi Chen <kernel@airkyi.com>, Andrew Lunn <andrew@lunn.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
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
 <6f55c325-6b2a-4fe9-a487-5f1ae7969d9d@rock-chips.com>
 <CABjd4YyMj=1pQBwqo9suu0W_HD=MG=zb5wo9dheguMBxi+oNqA@mail.gmail.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <CABjd4YyMj=1pQBwqo9suu0W_HD=MG=zb5wo9dheguMBxi+oNqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b9cd833e703abkunm6fe3af1412039f
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU9JS1ZOSRhNThpMShlMQkxWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=G/XnIAF76d1bw5CoUd2oG1QvUlQwWFNygiwzBL4t0jnXb3tNQBjvGWCmQNLK43XD5qrYVVrJnVI45zF4Jiiy9jr1/wCTkXORwg5arW/V9XYyxsqBxgD2QmfNAO/h+yFfp/eN9TNe9gmv/3FV08FC3vvhBhENBEu4ef3QhEtJq2Y=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=r9gkDatKrEuejlwaty5oSemKfkQdJiS/Uu/XyP3hCgQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_010301_036082_F8ECCC37 
X-CRM114-Status: GOOD (  20.60  )
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

On 1/8/2026 4:49 PM, Alexey Charkov wrote:
> On Thu, Jan 8, 2026 at 12:38 PM Chaoyi Chen <chaoyi.chen@rock-chips.com> wrote:
>>
>> On 1/8/2026 4:11 PM, Alexey Charkov wrote:
>>> On Thu, Jan 8, 2026 at 12:02 PM Chaoyi Chen <kernel@airkyi.com> wrote:
>>>>
>>>> On 1/8/2026 3:42 PM, Chaoyi Chen wrote:
>>>>> Hello Alexey, Andrew,
>>>>>
>>>>> On 1/8/2026 2:53 PM, Alexey Charkov wrote:
>>>>>> On Wed, Jan 7, 2026 at 10:18 PM Andrew Lunn <andrew@lunn.ch> wrote:
>>>>>>>
>>>>>>>> +&gmac0 {
>>>>>>>> +     clock_in_out = "output";
>>>>>>>> +     phy-mode = "rgmii-rxid";
>>>>>>>
>>>>>>> rgmii-rxid is odd. Does the PCB really have an extra long TX clock
>>>>>>> line, but a short RX clock line?
>>>>>>>
>>>>>>> Try changing this to rgmii-id, and drop the tx_delay property.
>>>>>>
>>>>>> Actually it would be great if Rockchip could clarify the delay
>>>>>> duration introduced by a single delay element in GMAC-IOMUX delay
>>>>>> lines, which are controlled in the GMAC driver by the {tx,rx}_delay
>>>>>> properties. Maybe we could then switch to using
>>>>>> {tx,rx}_internal_delay_ps for fine-tuning the delays on the GMAC side
>>>>>> as envisaged in DT bindings [1], and use phy-mode = "rgmii-id"
>>>>>> throughout. Chaoyi, any chance you could ask around in your hardware
>>>>>> team?
>>>>>>
>>>>>> Currently though removing the delays at GMAC side altogether causes
>>>>>> unstable link operation - see [2] for example.
>>>>>>
>>>>>> [1] https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L342-L347
>>>>>> [2] https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/commit/372f3e9ae62cc62cdf2543391ea57be6bb548a0c
>>>>>
>>>>> Sorry, this problem has been discussed many times before. It's because
>>>>> the gmac on the Rockchip platform currently relies on setting the
>>>>> corresponding delay via phy-mode [3].
>>>>>
>>>>> [3] https://lore.kernel.org/all/mqoyjn7mnq6tmt6n6oev4wa3herjaxlupml2fmcampwiajvj4a@r5zs4d3jdm5p/
>>>>>
>>>>> The delay introduced by the delay line is not absolute. In reality,
>>>>> it depends on factors such as the chip's design and process technology.
>>>>>
>>>>> And for RK3576, you can assume that:
>>>>>
>>>>>       time(ns) = 0.0579 * delay_line_count + 0.105
>>>>>
>>>>> For example, tx_delay = <0x20> means:
>>>>>
>>>>>       time = 0.0579 * 0x20 + 0.105 ns = 1.9578 ns
>>>>>
>>>>> And I believe {tx,rx}_internal_delay_ps is indeed a good idea.
>>>>> I'll try to add them in v3. Thanks.
>>>>>
>>>>
>>>> I've also see some dt that use {tx,rx}_internal_delay_ps inside the PHY,
>>>> and compared to doing it in the MAC, which one is the better choice?
>>>
>>> Your PHY defaults to 1950ps in rgmii-id [1], so adding anything on top
>>> of that on GMAC side would land you with a longer total TX delay than
>>> you currently get according to the coefficients you've just posted
>>> (1784.1ps). I would say go for "tx-internal-delay-ps = <1800>" on the
>>> PHY side for the closest match.
>>>
>>> [1] https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/net/motorcomm%2Cyt8xxx.yaml#L36
>>
>> Ah, I thought it was something like this:
>>
>> &gmac0 {
>>         phy-mode = "rgmii";
> 
> phy-mode = "rgmii-id";
> 
>>         tx-internal-delay-ps = <1784>;
> 
> Drop this, as recommended in the lengthy note at the bottom of the
> binding doc [1] (the GMAC shouldn't be adding a delay that is close to
> 2ns).
> 
> [1] https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L342-L354
> 
>> };
>>
>> But what you actually said was this:
>>
>> &mdio1 {
> 
> &mdio0 I guess (but same applies to gmac1+mdio1)
> 
>>         rgmii_phy: ethernet-phy@1 {
>>                 compatible = "ethernet-phy-ieee802.3-c22";
>>                 reg = <0x1>;
>>                 tx-internal-delay-ps = <1784>;
> 
> The PHY binding [2] says it can't accept arbitrary values here - only
> 150ps increments. So you'll need either 1650 or 1800 to get close to
> your calculated value above.
> 
> [2] https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/net/motorcomm%2Cyt8xxx.yaml#L36
> 
>>         };
>> };
>>
>> These two `tx-internal-delay-ps` things shouldn't be the same, right?
> 
> They add up, which you don't need in this case AFAICT.
> 

Ah, got it. Thank you for the clarification :)

-- 
Best, 
Chaoyi

