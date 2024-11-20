Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954A7D63939
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 13:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/cDWTmckm/CkJEDcZQJhRIWR2v+kP8CPV8gAmteQrw0=; b=OkDO0pk7vyjpSU
	qN2CDZ7BBmfggi/i4jdSMiPs4hlKLAOgLfrBBrFfvxJYqfMhO0f4yuDjWJ3vrqj+kLJi9fmXur6iq
	9/qF6GElQCAojJ0RQmch7/q2BfAnn20N4tmcCaOgj9GEMTcC0UOke0X+AM6/vZqJVHzbYXnnNjoOV
	rDarwsMCKtIPaLm1BjJ0frVhAvxaDiFRKbMlUdtwu4aJk3BGV2E9TzdbwULL5JqrDFzymoHD8hpZG
	g+jUCfruHgT9ZgOBNMQeN2CSYQRzma5moDjHdKfjFrpZWqbNa6kfQF7Q3eudZDXOYgOOXEc1TRBEt
	xHECSqagl+zJaLp3w6sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDkhU-0000000FP18-2WtO;
	Wed, 20 Nov 2024 13:24:56 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDkgX-0000000FOwP-2jLh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 13:23:59 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4AKDNh4v008580;
	Wed, 20 Nov 2024 07:23:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1732109023;
	bh=/cDWTmckm/CkJEDcZQJhRIWR2v+kP8CPV8gAmteQrw0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=r80D51hqBVfb5pyy4I1RpK2mhH2ceTvZfyTyznRgnoj/c+dGtyGQXPbNmM3HWnXZC
	 2fSY6YMFSlwsl0QsoFBlsrQ1zhwyNTrJ5PsyxxJinr6moPtaojUlrduPZ931RStIJi
	 ObVaIP8TLlVf4XHwdaLmDYqGrX/8xouACgR7fCn4=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4AKDNhwC037109
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 20 Nov 2024 07:23:43 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 20
 Nov 2024 07:23:42 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 20 Nov 2024 07:23:42 -0600
Received: from [10.249.129.69] ([10.249.129.69])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AKDNcal039209;
	Wed, 20 Nov 2024 07:23:38 -0600
Message-ID: <96ea0c11-e6e7-4801-9c06-2dc80b21b1ab@ti.com>
Date: Wed, 20 Nov 2024 18:53:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: soc: ti: pruss: Add clocks for ICSSG
To: Roger Quadros <rogerq@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
        MD Danish Anwar <danishanwar@ti.com>, <conor+dt@kernel.org>,
        <krzk+dt@kernel.org>, <robh@kernel.org>, <ssantosh@kernel.org>,
        <nm@ti.com>
References: <20241113110955.3876045-1-danishanwar@ti.com>
 <20241113110955.3876045-2-danishanwar@ti.com>
 <adcc5aa5-0f51-4c69-b684-a1e0844c5e3f@kernel.org>
 <6e11c85a-5883-4a28-b5bd-98da28f20425@kernel.org>
 <d738bb00-e295-4d74-8ba2-efd82b6df2ea@ti.com>
 <e633232e-f0ad-43f7-9897-39836e6b98b4@kernel.org>
Content-Language: en-US
From: "Anwar, Md Danish" <a0501179@ti.com>
In-Reply-To: <e633232e-f0ad-43f7-9897-39836e6b98b4@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_052357_854452_1F93A0CC 
X-CRM114-Status: GOOD (  14.62  )
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
Cc: srk@ti.com, devicetree@vger.kernel.org, kristo@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Roger,

On 11/19/2024 4:15 PM, Roger Quadros wrote:
> 
> 
> On 19/11/2024 08:12, Vignesh Raghavendra wrote:
>>
>>
>> On 18/11/24 19:22, Roger Quadros wrote:
>>>
>>>
>>> On 18/11/2024 15:33, Roger Quadros wrote:
>>>> Hi,
>>>>
>>>> On 13/11/2024 13:09, MD Danish Anwar wrote:
>>>>> The ICSSG module has 7 clocks for each instance.
>>>>>
>>>>> These clocks are ICSSG0_CORE_CLK, ICSSG0_IEP_CLK, ICSSG0_ICLK,
>>>>> ICSSG0_UART_CLK, RGMII_MHZ_250_CLK, RGMII_MHZ_50_CLK and RGMII_MHZ_5_CLK
>>>>> These clocks are described in AM64x TRM Section 6.4.3 Table 6-398.
>>>>>
>>>>> Add these clocks to the dt binding of ICSSG.
>>>>>
>>>>> Link: https://www.ti.com/lit/pdf/spruim2 (AM64x TRM)
>>>>> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
>>>>> ---
>>>>>  Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml | 10 ++++++++++
>>>>>  1 file changed, 10 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
>>>>> index 3cb1471cc6b6..927b3200e29e 100644
>>>>> --- a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
>>>>> +++ b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
>>>>> @@ -92,6 +92,16 @@ properties:
>>>>>      description: |
>>>>>        This property is as per sci-pm-domain.txt.
>>>>>  
>>>>> +  clocks:
>>>>> +    items:
>>>>> +      - description: ICSSG_CORE Clock
>>>>> +      - description: ICSSG_IEP Clock
>>>>> +      - description: ICSSG_RGMII_MHZ_250 Clock
>>>>> +      - description: ICSSG_RGMII_MHZ_50 Clock
>>>>> +      - description: ICSSG_RGMII_MHZ_5 Clock
>>>>> +      - description: ICSSG_UART Clock
>>>>> +      - description: ICSSG_ICLK Clock
>>>>> +
>>>>
>>>> There are actually many more clocks [1]
>>>> What is the purpose of adding all these clocks in the DT if driver doesn't
>>>> use them?
>>>>
>>
>> DT should completely describe the HW and not based on what Linux driver
>> needs. So its valid to describe all clock inputs to a module
>> irrespective of what driver does with it.
> 
> Fair point. But there are a total 11 clocks instead of 7 in [1]
> 

I took the list of clocks from AM64x TRM [1] Section 6.4.3 Table 6-398.
In the TRM only 7 clocks are mentioned per ICSSG instance which I have
mentioned in the binding.

[1] https://www.ti.com/lit/ug/spruim2h/spruim2h.pdf?ts=1732108738816

>>
>>>> Only CORE and IEP clocks parent can be configured via clock muxes.
>>>> Those are already defined in the icssg?_cfg nodes.
>>>
>>> Actually those clock muxes are internal to ICSSG.
>>> We still need to be able to set clock parents of CORE and IEP clock.
>>>
>>> So pruss block needs at most 2 clocks like you had in v2 of this patch?
>>>
>>>>
>>>> [1] - https://software-dl.ti.com/tisci/esd/22_01_02/5_soc_doc/am64x/clocks.html
>>>>
>>>>>  patternProperties:
>>>>>  
>>>>>    memories@[a-f0-9]+$:
>>>>
>>>
>>
> 

-- 
Thanks and Regards,
Md Danish Anwar

