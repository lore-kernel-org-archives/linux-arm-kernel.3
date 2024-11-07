Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D804DD43356
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 12:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:To:From:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pBZllDFIOmH/RzJOjKr84Vsut0PkmIArsmUEJHGaFVQ=; b=tS7VEPhOJJJv1o
	d+Hl1EbOUcjSuRpqueudMGRqsFgV0H1OjI7bS8XF3GSQ1VtmIVhnWqtgu8/cXkctyy0fkVjP6TgLy
	1kNeyScZPi9MeHX70afrjHgMpzbWTEVqFHNUJdgJ+E3croBSDYHpMb3YdfvHxufbPceNPC+k09p18
	WNWs+/W/W5epu5KZXlrJYnRUK61tmtm+vm2fyW7+oSbpwO3kc2/HjCcZ19sWLNfgng2EpWgeES0eM
	xNa4/OmiAX1ZRxJpX5wbDGGEpVVaJYQscyVy03SM+UnMs1EA/K4XrrUwFRkVP4Uoldtxe7ogdU/pP
	DiiUc7p6znvGLywrMh+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t91Ow-00000006tDC-3vBp;
	Thu, 07 Nov 2024 12:14:14 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t91AA-00000006qSG-0a7I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 11:58:59 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A7BwhGH029340;
	Thu, 7 Nov 2024 05:58:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730980723;
	bh=pBZllDFIOmH/RzJOjKr84Vsut0PkmIArsmUEJHGaFVQ=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=EOgOEvrrrpSlNSXlcbrmmNDYIymvXHmWHJnujzhBGWoLLK88N+Tu1k/69iwGNKcyQ
	 iTx9O3k5h4o24lNf5gX2sxIKc/w6FMb/fljqONtjreT6kCpCgZZ+M1ap/UpS0VVnqU
	 gFXlHht+Zqh1wF/lP/ukkYooIStQUqg4B4Zkwlp0=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A7BwhvC072030;
	Thu, 7 Nov 2024 05:58:43 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 7
 Nov 2024 05:58:43 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 7 Nov 2024 05:58:43 -0600
Received: from [10.24.69.25] (danish-tpc.dhcp.ti.com [10.24.69.25])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A7BwcNP112985;
	Thu, 7 Nov 2024 05:58:39 -0600
Message-ID: <2e7a1eb6-df8f-44d4-9342-1bc6d8b5ad11@ti.com>
Date: Thu, 7 Nov 2024 17:28:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: soc: ti: pruss: Add clocks for ICSSG
From: MD Danish Anwar <danishanwar@ti.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, <conor+dt@kernel.org>,
        <krzk+dt@kernel.org>, <robh@kernel.org>, <ssantosh@kernel.org>,
        <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
References: <20241107104557.1442800-1-danishanwar@ti.com>
 <20241107104557.1442800-2-danishanwar@ti.com>
 <7f0a73c3-9977-4d07-b996-683ed18e4724@kernel.org>
 <8156fd61-c476-4b58-b3b2-e8bc4f93035e@ti.com>
 <2c368f5a-4b58-45de-8140-21b2f7af4d12@kernel.org>
 <4ba0381b-d30a-4469-a7c4-327f6ac20c9c@ti.com>
Content-Language: en-US
In-Reply-To: <4ba0381b-d30a-4469-a7c4-327f6ac20c9c@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_035858_294956_A770B7AE 
X-CRM114-Status: GOOD (  20.38  )
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
Cc: srk@ti.com, devicetree@vger.kernel.org, kristo@kernel.org, linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 07/11/24 5:16 pm, MD Danish Anwar wrote:
> 
> 
> On 07/11/24 5:14 pm, Krzysztof Kozlowski wrote:
>> On 07/11/2024 12:36, MD Danish Anwar wrote:
>>>
>>>
>>> On 07/11/24 5:01 pm, Krzysztof Kozlowski wrote:
>>>> On 07/11/2024 11:45, MD Danish Anwar wrote:
>>>>> Add clocks, assigned-clocks and assigned-clock-parents for ICSSG
>>>>
>>>> Why? We see what you are doing from the diff, no point to repeat it. I
>>>> don't understand why you are doing it.
>>>>
>>>>>
>>>>> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
>>>>> ---
>>>>>  .../devicetree/bindings/soc/ti/ti,pruss.yaml          | 11 +++++++++++
>>>>>  1 file changed, 11 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
>>>>> index 3cb1471cc6b6..cf4c5884d8be 100644
>>>>> --- a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
>>>>> +++ b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
>>>>> @@ -92,6 +92,17 @@ properties:
>>>>>      description: |
>>>>>        This property is as per sci-pm-domain.txt.
>>>>>  
>>>>> +  clocks:
>>>>> +    items:
>>>>> +      - description: ICSSG_CORE Clock
>>>>> +      - description: ICSSG_ICLK Clock
>>>>> +
>>>>> +  assigned-clocks:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  assigned-clock-parents:
>>>>> +    maxItems: 1
>>>>
>>>> Why? This is really not needed, so you need to explain why you are doing
>>>> things differently than entire Linux kernel / DT bindings.
>>>>
>>>
>>> I need to add this to the device tree node
>>>
>>> +		clocks = <&k3_clks 81 0>,  /* icssg0_core_clk */
>>> +			 <&k3_clks 81 20>; /* icssg0_iclk */
>>> +		assigned-clocks = <&k3_clks 81 0>;
>>> +		assigned-clock-parents = <&k3_clks 81 2>;
>>>
>>> But without the above change in the binding I am getting below errors
>>> while running dtbs check.
>>>
>>> /workdir/arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtb: icssg@30000000:
>>> 'assigned-clock-parents', 'assigned-clocks' do not match any of the
>>> regexes: '^(pru|rtu|txpru)@[0-9a-f]+$', '^pa-stats@[a-f0-9]+$',
>>> 'cfg@[a-f0-9]+$', 'iep@[a-f0-9]+$', 'interrupt-controller@[a-f0-9]+$',
>>> 'mdio@[a-f0-9]+$', 'memories@[a-f0-9]+$', 'mii-g-rt@[a-f0-9]+$',
>>> 'mii-rt@[a-f0-9]+$', 'pinctrl-[0-9]+'
>>> +/workdir/arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtb: icssg@30080000:
>>> 'anyOf' conditional failed, one must be fixed:
>>>
>>> To fix this warning I added these in the binding and the warnings were
>>> fixed.
>>
>> nah, cannot reproduce. Just be sure you work on recent kernel (last time
>> you were sending it on some ancient stuff) and your packages are
>> updated, including dt schema and other kernel dependencies.
>>
> 
> I have posted this series on the latest kernel. Base commit
> 5b913f5d7d7fe0f567dea8605f21da6eaa1735fb
> 
> Let me check if the schema is up to date or not. I will re test and
> reply. Thanks for pointing it out.
> 

Krzysztof, I re-checked.
I am on the latest kernel (commit
5b913f5d7d7fe0f567dea8605f21da6eaa1735fb (tag: next-20241106,
origin/master, origin/HEAD)) and I am using the lastest dtschema v2024.9

❯ python3 -m pip list|grep 'dtschema'
dtschema                      2024.9

Still I am getting the below dtbs check errors while running `make
CHECK_DTBS=y ti/k3-am642-evm.dtb` without the binding change.

Let me know if I am missing something else.

/home/danish/workspace/linux-next/arch/arm64/boot/dts/ti/k3-am642-evm.dtb:
icssg@30000000: 'assigned-clock-parents', 'assigned-clocks', 'clocks' do
not match any of the regexes: '^(pru|rtu|txpru)@[0-9a-f]+$',
'^pa-stats@[a-f0-9]+$', 'cfg@[a-f0-9]+$', 'iep@[a-f0-9]+$',
'interrupt-controller@[a-f0-9]+$', 'mdio@[a-f0-9]+$',
'memories@[a-f0-9]+$', 'mii-g-rt@[a-f0-9]+$', 'mii-rt@[a-f0-9]+$',
'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/ti/ti,pruss.yaml#
/home/danish/workspace/linux-next/arch/arm64/boot/dts/ti/k3-am642-evm.dtb:
icssg@30000000: 'assigned-clock-parents', 'assigned-clocks', 'clocks' do
not match any of the regexes: '^(pru|rtu|txpru)@[0-9a-f]+$',
'^pa-stats@[a-f0-9]+$', 'cfg@[a-f0-9]+$', 'iep@[a-f0-9]+$',
'interrupt-controller@[a-f0-9]+$', 'mdio@[a-f0-9]+$',
'memories@[a-f0-9]+$', 'mii-g-rt@[a-f0-9]+$', 'mii-rt@[a-f0-9]+$',
'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/ti/ti,pruss.yaml#
/home/danish/workspace/linux-next/arch/arm64/boot/dts/ti/k3-am642-evm.dtb:
icssg@30080000: 'assigned-clock-parents', 'assigned-clocks', 'clocks' do
not match any of the regexes: '^(pru|rtu|txpru)@[0-9a-f]+$',
'^pa-stats@[a-f0-9]+$', 'cfg@[a-f0-9]+$', 'iep@[a-f0-9]+$',
'interrupt-controller@[a-f0-9]+$', 'mdio@[a-f0-9]+$',
'memories@[a-f0-9]+$', 'mii-g-rt@[a-f0-9]+$', 'mii-rt@[a-f0-9]+$',
'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/ti/ti,pruss.yaml#
/home/danish/workspace/linux-next/arch/arm64/boot/dts/ti/k3-am642-evm.dtb:
icssg@30080000: 'assigned-clock-parents', 'assigned-clocks', 'clocks' do
not match any of the regexes: '^(pru|rtu|txpru)@[0-9a-f]+$',
'^pa-stats@[a-f0-9]+$', 'cfg@[a-f0-9]+$', 'iep@[a-f0-9]+$',
'interrupt-controller@[a-f0-9]+$', 'mdio@[a-f0-9]+$',
'memories@[a-f0-9]+$', 'mii-g-rt@[a-f0-9]+$', 'mii-rt@[a-f0-9]+$',
'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/ti/ti,pruss.yaml#

> 
> 
>> Best regards,
>> Krzysztof
>>
> 

-- 
Thanks and Regards,
Danish

