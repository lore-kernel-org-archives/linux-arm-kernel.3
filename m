Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A322AC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 07:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FcUiRuGqGyMPPN+65IrRJVplwS0N0QGjGLObg7q3CWo=; b=rnLOv8mBBZAkAxsklJEmHtb/r2
	2PQwBcwacMnYCBz7/QGY/CarF/ar4JnSQrsP7LwclVh/GzKnoxGJNdc4zndrpbcxTdk0R9Jh7hmRO
	5oLo5CNP4JPdwA/a4zD1KyMYcm/VddOhAZG3QGPGhdxyq1QKVSeLj+GSKVfeT4iZT2CBSnIp41oCv
	VUgyBaVgDzJjn96ahg0Zz+Uas7WeINg8QTTMusi0wT2fuCt543+UwsRY0c1TtBUlZ8leJ6qmf8Qpo
	BNArMohnPinM0vtYQWRmZCb+wsKkvgZJqDrzZX+s9ldoAsZptTPhdyQoMr3TtfWKz+HlJ2pLmWYlu
	ieHJDmBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpMUo-00000003PgS-1rmB;
	Tue, 04 Mar 2025 07:15:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpMTD-00000003PDO-0sDm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 07:13:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 90A3C5C555C;
	Tue,  4 Mar 2025 07:11:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4BA9C4CEEA;
	Tue,  4 Mar 2025 07:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741072418;
	bh=+3RnUOIOjtWeMcQ1AJs2mmM7nGjmYwlkzz+vEspMr8I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T6Bv6oB/J6d6B5DMpVSiTAdssEbVQR3nb/WsHGyqS85cz5AzlwCW5BliA5xnpxaQN
	 +vqeUO21fPHHparRM4/1SddkkbpI9zSe09lFYiA8wHFfbxEbC9hI6ycqNdpLwayJhL
	 DYagNQP/YPPXzMtIH6P7dQSwhJY3Lsa6fXBxVOBwJss18RIMqxg2N5RxP69rR94OGw
	 AzLiObY9xuysAbx812HFRmLYerZN05HVZashFxoleQgpaF7nU6Mz1vscoZR1nmvK+w
	 Z1OH5UJCKUzxIWM2xkSWEwP26Cjg7kqSyfUAtOn2fyp4GJ2BgLwEP15CUIsDnnT9eu
	 FPeNLbid99Luw==
Message-ID: <87b9e9c3-87db-4ebe-96b0-4f04705ef6f8@kernel.org>
Date: Tue, 4 Mar 2025 08:13:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH v3 3/3] arm64: dts: marvell: cp11x: Add
 reset controller node
To: Wilson Ding <dingwei@marvell.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "robh@kernel.org" <robh@kernel.org>
Cc: "andrew@lunn.ch" <andrew@lunn.ch>,
 "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
 "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 Sanghoon Lee <salee@marvell.com>, Geethasowjanya Akula <gakula@marvell.com>
References: <20250227192536.2426490-1-dingwei@marvell.com>
 <20250227192536.2426490-4-dingwei@marvell.com>
 <d085c34a-fdbf-4950-a2e3-b3d25a1c0145@kernel.org>
 <BY3PR18MB46730C150D4CB9619B3B05FBA7CC2@BY3PR18MB4673.namprd18.prod.outlook.com>
 <050ae833-10b5-4d80-9856-8bc2f434a74f@kernel.org>
 <BY3PR18MB46739700B533630D65C60808A7C82@BY3PR18MB4673.namprd18.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <BY3PR18MB46739700B533630D65C60808A7C82@BY3PR18MB4673.namprd18.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_231339_350319_DE535873 
X-CRM114-Status: GOOD (  40.76  )
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

On 04/03/2025 03:17, Wilson Ding wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>> Sent: Saturday, March 1, 2025 5:46 AM
>> To: Wilson Ding <dingwei@marvell.com>; linux-kernel@vger.kernel.org;
>> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org
>> Cc: andrew@lunn.ch; gregory.clement@bootlin.com;
>> sebastian.hesselbarth@gmail.com; robh@kernel.org; krzk+dt@kernel.org;
>> conor+dt@kernel.org; p.zabel@pengutronix.de; Sanghoon Lee
>> <salee@marvell.com>; Geethasowjanya Akula <gakula@marvell.com>
>> Subject: Re: [EXTERNAL] Re: [PATCH v3 3/3] arm64: dts: marvell: cp11x: Add
>> reset controller node
>>
>> On 28/02/2025 21:18, Wilson Ding wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Krzysztof Kozlowski <krzk@kernel.org>
>>>> Sent: Thursday, February 27, 2025 10:57 PM
>>>> To: Wilson Ding <dingwei@marvell.com>; linux-kernel@vger.kernel.org;
>>>> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org
>>>> Cc: andrew@lunn.ch; gregory.clement@bootlin.com;
>>>> sebastian.hesselbarth@gmail.com; robh@kernel.org; krzk+dt@kernel.org;
>>>> conor+dt@kernel.org; p.zabel@pengutronix.de; Sanghoon Lee
>>>> <salee@marvell.com>; Geethasowjanya Akula <gakula@marvell.com>
>>>> Subject: [EXTERNAL] Re: [PATCH v3 3/3] arm64: dts: marvell: cp11x: Add
>> reset
>>>> controller node
>>>>
>>>> On 27/02/2025 20: 25, Wilson Ding wrote: > Add the reset controller node
>> as
>>>> a sub-node to the system controller > node. > > Signed-off-by: Wilson Ding
>>>> <dingwei@ marvell. com> > --- > arch/arm64/boot/dts/marvell/armada-
>>>> cp11x. dtsi
>>>>
>>>> On 27/02/2025 20:25, Wilson Ding wrote:
>>>>> Add the reset controller node as a sub-node to the system controller
>>>>> node.
>>>>>
>>>>> Signed-off-by: Wilson Ding <dingwei@marvell.com>
>>>>> ---
>>>>>  arch/arm64/boot/dts/marvell/armada-cp11x.dtsi | 8 ++++++++
>>>>>  1 file changed, 8 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
>>>> b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
>>>>> index 161beec0b6b0..c27058d1534e 100644
>>>>> --- a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
>>>>> +++ b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
>>>>> @@ -226,6 +226,8 @@ CP11X_LABEL(rtc): rtc@284000 {
>>>>>  		CP11X_LABEL(syscon0): system-controller@440000 {
>>>>>  			compatible = "syscon", "simple-mfd";
>>>>>  			reg = <0x440000 0x2000>;
>>>>> +			#address-cells = <1>;
>>>>> +			#size-cells = <1>;
>>>>>
>>>>>  			CP11X_LABEL(clk): clock {
>>>>
>>>> Wait, no unit address here.
>>>
>>> This subnode came from the existing code. I didn't touch this subnode
>>> in my patch. As you can see, the system-controller has a wide address
>>> range, which includes clock, GPIO registers as well as the unit-softreset
>>> register.
>>>
>>>>
>>>>>  				compatible = "marvell,cp110-clock";
>>>>> @@ -273,6 +275,12 @@ CP11X_LABEL(gpio2): gpio@140 {
>>>>>  					 <&CP11X_LABEL(clk) 1 17>;
>>>>>  				status = "disabled";
>>>>>  			};
>>>>> +
>>>>> +			CP11X_LABEL(swrst): reset-controller@268 {
>>>>
>>>>
>>>> So why here it appeared? This is wrong and not even necessary. Entire
>>>> child should be folded into parent, so finally you will fix the
>>>> incomplete parent compatible.
>>>
>>> We do need the reset-controller as a subnode under system-controller node
>>> for the following reasons:
>>>
>>> - We need to have 'reg' property in this subnode so that we can get the
>> offset
>>>   to system-controller register base defined in parent node. This is suggested
>>>   by Rob in V2 comments.
>>>   And we need to know the register size to calculate the number of reset
>> lines.
>>>   This is suggested by Philipp in V1 comments.
>>
>> You do not need and you received that comment as well. It is implied by
>> compatible.
>>
>>>
>>> - We also need to define the 'reset-cells' in this subnode. And the consumer
>> of
>>>   the reset controller uses the label of this subnode for the phandle and reset
>>>   specifier pair.
>>
>> reset-cells will be in the parent once you fold it.
>>
>>>
>>> As I mentioned in my reply to the first comment, the reset-controller is not
>> the
>>> only device within the system-controller register spaces. Do you still think I
>>
>> You provided very little hardware description of the device. So based on
>> hardware description you provided: yes.
>>
>>> should fold it into the parent node. And what I proposed is exactly same as
>>> that the armada_thermal driver did (See below). I wonder why what was
>> accepted
>>> in the past become not accepted now.
>>
>> We did not discuss here drivers, but if you insist talking about
>> "marvell,armada-cp110-thermal" then point me to review or ack from DT
>> people. You claim it was accepted so how did we accept it?
>>
> 
> I didn't intend to extend discussion to the driver in this thread. The following
> Is the review thread of the dt-binding for the thermal device (in 2018).
> Indeed, there is no comments challenging why not fold the thermal sub-node
> Into the parent 'syscon' node.
> 
> https://lore.kernel.org/linux-arm-kernel/20180703211335.GA8858@rob-hp-laptop/

Indeed, this one got review. I was checking armada-thermal and it never
got any, when it was merged back in the 2013.

> 
> Digging further, I found some interesting history about the parent 'syscon' node
> of the reset-controller. I'd appreciate if you can take a look into the following
> patches/thread -
> 
> The syscon0 node was initially added along with Armada clock driver support.
> It was the very beginning of the upstream for Armada SoCs support (2016).
> And the clock driver is one of the earliest drivers to be mainlined. At that time,
> the clock controller is the only supported device within sycon register range.
> As you can see, the clock dt-binding was exactly aligned with what your suggested
> (no sub-node, compatible and clock-cells just in syscon). 
> 
> https://lore.kernel.org/all/1460648013-31320-5-git-send-email-thomas.petazzoni@free-electrons.com/
> 
> Besides the clock controller, the system controller also includes the GPIO controller,
> pinctl controller, reset controller and other miscellaneous configurations. Before
> adding the pinctl dt-binding, it's decided to use the sub-nodes to present the multiple
> function blocks of various devices.
> 
> https://lore.kernel.org/all/b27495e10fb4f4d8a7fd1a760d49402bbae83b58.1496328934.git-series.gregory.clement@free-electrons.com/

So this is the source here. I see.

Commit comes with a rationale that it will grow significantly.

> 
> In the following patch, it was clearly addressed why sub-nodes was chosen
> over one flat node.
> 
> https://lore.kernel.org/all/bb21ee9acc55efac884450ff710049b99b27f8bf.1496328934.git-series.gregory.clement@free-electrons.com/
> 
> "The initial intent when the binding of the cp110 system controller was to
> have one flat node. The idea being that what is currently a clock-only
> driver in drivers would become a MFD driver, exposing the clock, GPIO and
> pinctrl functionality. However, after taking a step back, this would lead
> to a messy binding. Indeed, a single node would be a GPIO controller,
> clock controller, pinmux controller, and more.
> 
> This patch adopts a more classical solution of a top-level syscon node
> with sub-nodes for the individual devices. The main benefit will be to
> have each functional block associated to its own sub-node where we can
> put its own properties."
> 
> Since then, the dt-binding of Armada's system controller became an
> exception. But I think it's sensible. If we do put all these controllers into
> one node, you can image the properties of different devices will be
> messed up, e.g., not just #reset-cells, #clock-cells and #gpio-cells will
> be gathered. There will be a long compatible list of all devices.
> 
> Going back to my current patch - if we fold the reset controller into the
> parent node, the syscon node will become a hybrid, which GPIO and 
> clock controller are still sub-nodes while reset controller is folded into
> the syscon node. Isn't it very confusing?

Yes, it will be. But more confusing is existing pattern of mixing MMIO
nodes with non-MMIO which you grow. So okay, keep them as separate
child, but drop offset in your patch or unify everything into 'reg'.


Best regards,
Krzysztof

