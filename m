Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52837D5C0C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 12:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OuN++dLfzXhna1qxmErJ0FWUgMTzln4qtKp2RrTbq84=; b=F09nUvPSepNyv0
	WFqu8T3/CMOov+Hk6BrgzeVpw5TQ5/bSaqmqJc5hXnm91EYP7bY4Cn1ElnQdPwBXjbdpbq+LtjI7K
	jngXmPb/ocCpIeu2cRsj1nGXVP0/8zEJHjluLBTwi3Myd/mVn+OnUYIrYMz3PMRfgc99X/+oXO0+3
	F0mC255x4Vl6rGgtowTD79EDYR8jjqRXzkDBnLcUaSPZbq/Hq+WWU1N5w0CYHBqur8GOYz6yRYkwk
	zRNfBbatcNNjyAqr27YgKiAsc0BN85DH5k7R/atyHT6ErMtkKRqXQG+0d13pFX+7Pex3A2lPO7+Vm
	85gIua3biy1m2F1Zp5Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9OHY-0000000AYUG-3lLJ;
	Fri, 08 Nov 2024 12:40:08 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9OCG-0000000AXkj-3XP8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 12:35:20 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A8CYVfQ065687;
	Fri, 8 Nov 2024 06:34:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731069271;
	bh=OuN++dLfzXhna1qxmErJ0FWUgMTzln4qtKp2RrTbq84=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=u11yTsBC0oUA2BMalASCtqwi9eWE05qGsYJOwG2FCCXXXYroPC00MkmETnS9HQCPc
	 ym8mE3gk9GqX6/COt7mPb+gxnrElGJDCXXQ2YX0kchl9D/gtub3ZFA0AwMwqfK6dXL
	 NMbLbBUk9cgtlOzkdpqs1LQUmwcfjpZYpK3Xhu3g=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A8CYVxZ112419
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 8 Nov 2024 06:34:31 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 8
 Nov 2024 06:34:31 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 8 Nov 2024 06:34:31 -0600
Received: from [10.249.129.69] ([10.249.129.69])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A8CYPgW009281;
	Fri, 8 Nov 2024 06:34:26 -0600
Message-ID: <62f3902e-8ee4-4cdb-864c-cfe57c7e3839@ti.com>
Date: Fri, 8 Nov 2024 18:04:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: soc: ti: pruss: Add clocks for ICSSG
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20241107104557.1442800-1-danishanwar@ti.com>
 <20241107104557.1442800-2-danishanwar@ti.com>
 <7f0a73c3-9977-4d07-b996-683ed18e4724@kernel.org>
 <8156fd61-c476-4b58-b3b2-e8bc4f93035e@ti.com>
 <2c368f5a-4b58-45de-8140-21b2f7af4d12@kernel.org>
 <4ba0381b-d30a-4469-a7c4-327f6ac20c9c@ti.com>
 <2e7a1eb6-df8f-44d4-9342-1bc6d8b5ad11@ti.com>
 <1fa4323b-4cee-4dfe-9c68-55f4465999cf@kernel.org>
 <2a3c54e8-46fc-48f9-8c01-f3bb0c4907af@ti.com>
 <c7llcnzthr2ydp4zlyk7rhovwauy5cqeqllvmgmyluypxq3opv@c4suatmd7k3w>
Content-Language: en-US
From: "Anwar, Md Danish" <a0501179@ti.com>
In-Reply-To: <c7llcnzthr2ydp4zlyk7rhovwauy5cqeqllvmgmyluypxq3opv@c4suatmd7k3w>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_043441_038523_788AA293 
X-CRM114-Status: GOOD (  23.72  )
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
Cc: nm@ti.com, robh@kernel.org, conor+dt@kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, kristo@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, MD Danish Anwar <danishanwar@ti.com>, Roger Quadros <rogerq@kernel.org>, ssantosh@kernel.org, srk@ti.com, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 11/8/2024 6:00 PM, Krzysztof Kozlowski wrote:
> On Fri, Nov 08, 2024 at 05:49:54PM +0530, Anwar, Md Danish wrote:
>> Hi Krzysztof,
>>
>> On 11/7/2024 5:51 PM, Krzysztof Kozlowski wrote:
>>> On 07/11/2024 12:58, MD Danish Anwar wrote:
>>>>
>>>>
>>>> On 07/11/24 5:16 pm, MD Danish Anwar wrote:
>>>>>
>>>>>
>>>>> On 07/11/24 5:14 pm, Krzysztof Kozlowski wrote:
>>>>>> On 07/11/2024 12:36, MD Danish Anwar wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 07/11/24 5:01 pm, Krzysztof Kozlowski wrote:
>>>>>>>> On 07/11/2024 11:45, MD Danish Anwar wrote:
>>>>>>>>> Add clocks, assigned-clocks and assigned-clock-parents for ICSSG
>>>>>>>>
>>>>>>>> Why? We see what you are doing from the diff, no point to repeat it. I
>>>>>>>> don't understand why you are doing it.
>>>>>>>>
>>>>>>>>>
>>>>>>>>> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
>>>>>>>>> ---
>>>>>>>>>  .../devicetree/bindings/soc/ti/ti,pruss.yaml          | 11 +++++++++++
>>>>>>>>>  1 file changed, 11 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
>>>>>>>>> index 3cb1471cc6b6..cf4c5884d8be 100644
>>>>>>>>> --- a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
>>>>>>>>> +++ b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
>>>>>>>>> @@ -92,6 +92,17 @@ properties:
>>>>>>>>>      description: |
>>>>>>>>>        This property is as per sci-pm-domain.txt.
>>>>>>>>>  
>>>>>>>>> +  clocks:
>>>>>>>>> +    items:
>>>>>>>>> +      - description: ICSSG_CORE Clock
>>>>>>>>> +      - description: ICSSG_ICLK Clock
>>>>>>>>> +
>>>>>>>>> +  assigned-clocks:
>>>>>>>>> +    maxItems: 1
>>>>>>>>> +
>>>>>>>>> +  assigned-clock-parents:
>>>>>>>>> +    maxItems: 1
>>>>>>>>
>>>>>>>> Why? This is really not needed, so you need to explain why you are doing
>>>>>>>> things differently than entire Linux kernel / DT bindings.
>>>>>>>>
>>>>>>>
>>>>>>> I need to add this to the device tree node
>>>>>>>
>>>>>>> +		clocks = <&k3_clks 81 0>,  /* icssg0_core_clk */
>>>>>>> +			 <&k3_clks 81 20>; /* icssg0_iclk */
>>>>>>> +		assigned-clocks = <&k3_clks 81 0>;
>>>>>>> +		assigned-clock-parents = <&k3_clks 81 2>;
>>>>>>>
>>>>>>> But without the above change in the binding I am getting below errors
>>>>>>> while running dtbs check.
>>>>>>>
>>>>>>> /workdir/arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtb: icssg@30000000:
>>>>>>> 'assigned-clock-parents', 'assigned-clocks' do not match any of the
>>>>>>> regexes: '^(pru|rtu|txpru)@[0-9a-f]+$', '^pa-stats@[a-f0-9]+$',
>>>>>>> 'cfg@[a-f0-9]+$', 'iep@[a-f0-9]+$', 'interrupt-controller@[a-f0-9]+$',
>>>>>>> 'mdio@[a-f0-9]+$', 'memories@[a-f0-9]+$', 'mii-g-rt@[a-f0-9]+$',
>>>>>>> 'mii-rt@[a-f0-9]+$', 'pinctrl-[0-9]+'
>>>>>>> +/workdir/arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtb: icssg@30080000:
>>>>>>> 'anyOf' conditional failed, one must be fixed:
>>>>>>>
>>>>>>> To fix this warning I added these in the binding and the warnings were
>>>>>>> fixed.
>>>>>>
>>>>>> nah, cannot reproduce. Just be sure you work on recent kernel (last time
>>>>>> you were sending it on some ancient stuff) and your packages are
>>>>>> updated, including dt schema and other kernel dependencies.
>>>>>>
>>
>> The purpose of this series is to add 'assigned-clock-parents',
>> 'assigned-clocks' to the DT node. Initially I was only trying to add
>> these two nodes to DT and at that time I got the above error. I also got
>>  the below error as well
> 
> So you pasted different error, not related to topic we discussed.
> assigned-clock* depend on clocks. You must have clocks to assign them,
> obviously. Device should no assign rates to clocks which are not its
> inputs. :/
> 
> 
>>
>> /home/danish/workspace/linux-next/arch/arm64/boot/dts/ti/k3-am642-evm.dtb:
>> icssg@30000000: 'anyOf' conditional failed, one must be fixed:
>>         'clocks' is a required property
>>         '#clock-cells' is a required property
>>         from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
>>
>>
>> To fix this I added 'assigned-clock-parents', 'assigned-clocks' to the
>> binding and at this time I got only the below error,
> 
> To fix this you must add clocks. The error tells you this.
> 
> So again: drop assigned properties. No error msg asked you to add them.
> 

Yes, I will drop assigned properties from binding and post a v2.

> Best regards,
> Krzysztof
> 

-- 
Thanks and Regards,
Md Danish Anwar

