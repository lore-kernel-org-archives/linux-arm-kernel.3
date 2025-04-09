Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49326C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 17:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rCJqBTtApQp0a/WR/olWHy2S6RHwhtdebllXn8ohFLE=; b=bXN8Qyvow45D0CNI0zdOqN67jh
	PtEgbMdumT18loOacH6qoXyXbguRbuV3fKawd+AMTftqFdibsYoeJoBov02b1nZ/pfjzwHtLI7Hsp
	k2dIQWnqqLvO9n/U71c38nKraOVnY+fC3PDtICE+sMPMjArfRSQiBgvMLks4sNOkXwYSS6t8nEvO8
	5pgkaAC2il7vPP3kI67RX+j//sSWBl79jDhQ7cyT3ue4u66L5QV4iC8N+5sV06WBW3Ms1lRrcKntn
	LNni4UYocOjlw1KsOHgvq8vkO3FmiuLrQJO8eu3iEXNjY5PQVloX9Dtvc4Px+QJIno3Dk7yQq+6/R
	SsRX4vBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ZQF-000000084NU-2qJS;
	Wed, 09 Apr 2025 17:41:11 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ZOT-00000008471-0Gxr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 17:39:22 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 539HdDcd894353
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Apr 2025 12:39:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744220353;
	bh=rCJqBTtApQp0a/WR/olWHy2S6RHwhtdebllXn8ohFLE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=nXMyLimohCVJ1eIKLAs1Wdz1um/G1fJLytg5VwJpXgqTfV2Rf6NfK4xxu+eEc3/Ik
	 hXpslgkCYWQ4pzSnGdZDxI1qnl4Xn/tuDas4Qko76JMIHpQ18Ssq5UUzUlNe1aPMuy
	 0vjrUsL1CyzY6QhJ0XxMRnzrkeMGkRH+EOaz0OD0=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 539HdDaP015557
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 9 Apr 2025 12:39:13 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 9
 Apr 2025 12:39:12 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 9 Apr 2025 12:39:12 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 539HdCpr021525;
	Wed, 9 Apr 2025 12:39:12 -0500
Message-ID: <b7f6570f-3b80-4fc1-8201-d44f5692867f@ti.com>
Date: Wed, 9 Apr 2025 12:39:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: mfd: syscon: Add ti,am62-ddr-pmctrl
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Markus
 Schneider-Pargmann <msp@baylibre.com>
CC: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Siddharth
 Vadapalli <s-vadapalli@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20250122-topic-am62-dt-syscon-v6-13-v1-0-515d56edc35e@baylibre.com>
 <20250122-topic-am62-dt-syscon-v6-13-v1-2-515d56edc35e@baylibre.com>
 <20250124-heavy-jaybird-of-vitality-4cbe24@krzk-bin>
 <20250124-able-beagle-of-prowess-f5eb7a@krzk-bin>
 <mocfnpebc67xegcis6tx3ekhsjcsqnvhwtipufycrtq2be4nbh@pmxhir5gmkos>
 <639b4e3a-3f68-4fba-aa33-c46dcb6fc88f@linaro.org>
 <d6252b73-0bcc-4724-8144-d6a98c8980f8@ti.com>
 <74ee6d9b-fd78-4d8a-a94f-b2c4dc794b60@linaro.org>
 <ebsbaaxyatrcikoem75t2blkhhceuidq3wnj3r2hbezfcmtc3u@ptffexrigbff>
 <f9a2247e-e0eb-4e22-8626-80e87afa9386@linaro.org>
 <qjwlppsq4eorzepvjsgjjyyaddouo5w2rjguu5c2mqesd6luwp@f426xeghy2ht>
 <2130b439-74d0-475d-8429-1a1b4d9738aa@linaro.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <2130b439-74d0-475d-8429-1a1b4d9738aa@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_103921_206169_4F9C1A69 
X-CRM114-Status: GOOD (  43.41  )
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

On 2/12/25 1:35 PM, Krzysztof Kozlowski wrote:
> On 10/02/2025 11:35, Markus Schneider-Pargmann wrote:
>> On Sun, Feb 09, 2025 at 01:21:27PM +0100, Krzysztof Kozlowski wrote:
>>> On 07/02/2025 15:40, Markus Schneider-Pargmann wrote:
>>>> Hi Krzysztof,
>>>>
>>>> On Mon, Jan 27, 2025 at 01:09:49PM +0100, Krzysztof Kozlowski wrote:
>>>>> On 24/01/2025 23:35, Andrew Davis wrote:
>>>>>> On 1/24/25 10:48 AM, Krzysztof Kozlowski wrote:
>>>>>>> On 24/01/2025 17:05, Markus Schneider-Pargmann wrote:
>>>>>>>> Hi Krzysztof,
>>>>>>>>
>>>>>>>> On Fri, Jan 24, 2025 at 09:22:54AM +0100, Krzysztof Kozlowski wrote:
>>>>>>>>> On Fri, Jan 24, 2025 at 09:19:49AM +0100, Krzysztof Kozlowski wrote:
>>>>>>>>>> On Wed, Jan 22, 2025 at 11:24:33AM +0100, Markus Schneider-Pargmann wrote:
>>>>>>>>>>> Add compatible for ti,am62-ddr-pmctrl to the list. There is a DDR pmctrl
>>>>>>>>>>> register in the wkup-conf register space of am62a and am62p. This
>>>>>>>>>>> register controls DDR power management.
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
>>>>>>>>>>> ---
>>>>>>>>>>>    Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>>>>>>>>>>>    1 file changed, 2 insertions(+)
>>>>>>>>>>
>>>>>>>>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>>>>>
>>>>>>>>> Un-acked, I missed the point that you really speak in commit msg about
>>>>>>>>> register and you really treat one register is a device. I assumed you
>>>>>>>>> only need that register from this device, but no. That obviously is not
>>>>>>>>> what this device is. Device is not a single register among 10000 others.
>>>>>>>>> IOW, You do not have 10000 devices there.
>>>>>>>>
>>>>>>>> Do I understand you correctly that the whole register range of the
>>>>>>>> wkup_conf node as seen in arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
>>>>>>>> should be considered a single syscon device?
>>>>>>>
>>>>>>> I don't have the datasheets (and not my task to actually check this),
>>>>>>> but you should probably follow datasheet. I assume it describes what is
>>>>>>> the device, more or less.
>>>>>>>
>>>>>>> I assume entire wkup_conf is considered a device.
>>>>>>>
>>>>>>>>
>>>>>>>> Unfortunately wkup_conf is modeled as a simple-bus with currently 5
>>>>>>>> subnodes defined of which 4 of them consist of a single register. Most
>>>>>>>> of them are syscon as well. So I think I can't change the simple-bus
>>>>>>>> back to syscon.
>>>>>>>
>>>>>>> Huh... Maybe TI folks will help us understand why such design was chosen.
>>>>>>>
>>>>>>
>>>>>> Many of the devices inside the wkup_conf are already modeled as such.
>>>>>> Clocks and muxes for instance already have drivers and bindings, this
>>>>>> is nothing new to TI.
>>>>>>
>>>>>> If we just use a blank "syscon" over the entire region we would end up
>>>>>> with drivers that use phandles to the top level wkup_conf node and
>>>>>> poke directly the registers they need from that space.
>>>>>>
>>>>>> Would you rather have
>>>>>>
>>>>>> some-device {
>>>>>> 	ti,epwm_tbclk = <&wkup_conf>;
>>>>>> }
>>>>>>
>>>>>> or
>>>>>>
>>>>>> some-device {
>>>>>> 	clocks = <&epwm_tbclk 0>;
>>>>>> }
>>>>>
>>>>> How is this comparable? These are clocks. You would have clocks property
>>>>> in both cases.
>>>>>
>>>>>
>>>>>>
>>>>>> with that epwm_tbclk being a proper clock node inside wkup_conf?
>>>>>> I would much prefer the second, even though the clock node
>>>>>> only uses a single register. And in the first case, we would need
>>>>>> to have the offset into the wkup_conf space hard-coded in the
>>>>>> driver for each new SoC. Eventually all that data would need to be
>>>>>> put in tables and we end up back to machine board files..
>>>>>>
>>>>>> I'm not saying every magic number in all drivers should
>>>>>> be offloaded into DT, but there is a line somewhere between
>>>>>> that and having the DT simply contain the SoC's name compatible
>>>>>
>>>>> That's not the question here.
>>>>>
>>>>>> and all other data going into the kernel. That line might be a
>>>>>> personal preference, so my question back is: what is wrong
>>>>>> if we do want "1000 new syscons per each register" for our
>>>>>> SoCs DT?
>>>>>
>>>>> Because it is false representation of hardware. You do not have 1000
>>>>> devices. You have only one device.
>>>>>
>>>>>
>>>>>>
>>>>>> (and the number is not 1000, scanning the kernel I can see
>>>>>> the largest wkup_conf region node we have today has a grand
>>>>>> total number sub-nodes of 6)
>>>>>
>>>>> But what is being added here is device per each register, not per feature.
>>>>
>>>> The register layout is like this:
>>>
>>> The register layout of what? How is the device called? Is datasheet
>>> available anywhere?
>>
>> Yes, it is available here: https://www.ti.com/de/lit/pdf/spruj16
>>
>> 14 Registers
>> 14.2 Device Configuration Registers
>> 14.2.1 CTRL_MMR Registers
>> 14.2.1.1 General Purpose Control Registers
>> 14.2.1.1.3 WKUP_CTRL_MMR0 Registers
>>
>> Each domain has their own set of general purpose control registers,
>> CTRL_MMR for the main domain, MCU_CTRL_MMR0 for the MCU domain,
>> WKUP_CTRL_MMR0 for the wakeup domain.
> 
> 
> So according to the doc you have only one device - CTRL_MMR. All other
> splits are superficial.
> 

It is not one device, it is a collection of devices under one labeled
bus range. Some items here are full normal devices, already modeled by DT
as stand-alone devices, for instance our chipid, efuse, clock controller,
etc. even our pinmux is part of this bus range.

They are grouped as we have one set for each domain (MAIN, WKUP, MCU).

All other splits are not superficial, if we go down that path then
the whole SoC is one "device". We could simply have the whole address
bus be one node and have Linux hard-code offsets in the drivers, we
end up back at board files..

DT should break things into logically distinct and reusable units
so we don't have to store that in the kernel. That is what we do
here, even if some units end up being very small.

>>
>> So I understand this to just be a collection of general purpose control
>> registers. If you go by feature, then many of the registers can be
>> grouped into units with a specific purpose or controlling a specific
>> device which are also grouped by the offsets they represent. I assume
> 
> It could work if you have distinctive groups, but here:
> 1. You do not have this grouped, you just judge by yourself "oh, that's
> group A, that's B".
> 2. Group per one register is not that.
> 
> For me this is one big block and even CLKSEL is spread all over so
> cannot be really made distinctive.
> 
>> this is why the other nodes in this wkup_conf node were created. Also in
> 
> The other nodes represent some sort of fake or totally arbitrary
> grouping. That's abuse of the syscon.
> 

They are grouped by function.

>> my opinion this makes the relation between the original device and this
>> general purpose control registers better understandable.
>>
>> For this patch the ddr-pmctrl regsiter is just a single register, but it
>> has the purpose of controlling the DDR device power management.
> 
> Sure, but that is NOT syscon. One register of entire block is not system
> controller. The entire block is system controller.
> 

The whole block cannot be a system controller as there are regular
devices inside this range. If we made the whole region a syscon and
also left the device nodes inside, then we would have overlapping
register owners, one register would be controlled by two or more
drivers. How would we synchronize mappings, access, updates, etc.
Any one register should belong to exactly one device.

Is your issue the name "system controller", as yes I agree some of
these regions are not "system controllers".

Would it work better if we didn't call this "ti,am62-ddr-pmctrl"
node a "syscon"? That can be done, we just would add a normal
binding doc for it, instead of trying to reuse the generic
bindings/mfd/syscon.yaml file.

Andrew

> 
> 
> Best regards,
> Krzysztof

