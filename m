Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4CCD6ED28
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 13:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=70eoY6QhuWv1ObM/IcGz3aHG0uCgXLWWCCQMoyj7mIg=; b=xZmzEHCm6c/ZRP
	g567ev5a1rbq8G2252lvN0Um9uBrj+7fhRvDgn7Bzm/AzqOr/XA/kcMNEOp1+kLp+ZcOAkeuNrmht
	3e1SaIk6OFqEOSKYGBsS4RzNzD456gniXyQH8tFFMGg7uq5/s6oq5gHeaICLOIOiNtozs+2MlJVtF
	KZpwOyU+04q9sUI1eNzcs1rQrOvpZ6MbJbDS/OnXZtWBDy20SzXKxSdewBODmZMuZ4s20qhWMQh4e
	92ENrAZHRC8Au+DyXuhrqFGrygExS9xiv37E2LE2M6XQOU8vOdlB2o1nVJ3nAWk8ofE8eTA2QnLdV
	JrII/By9bLs0oFNfyQVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE6wY-000000004fG-2GrZ;
	Thu, 21 Nov 2024 13:09:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE6vc-000000004Wt-0DmS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 13:09:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F21695C583E;
	Thu, 21 Nov 2024 13:08:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D211C4CECD;
	Thu, 21 Nov 2024 13:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732194537;
	bh=TI71bCsHyJmW5bcuA/G5CsKR520eaTS3Cnh8kMl95EI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mHsc4yE66AWoqGwLyIYDx4pCZeLC6SXGuQbRNgI+rz7aPWcqtwhI7oecMFXcnlQ6J
	 +OZX5PJs285R1aaGbpxE6fQv0dgaHNMjk6aFoOXJSIT5RUI1MXAp87A4sMtndNOnkt
	 o6OJCkhyHXoGO7++jeIBiDkigElDCifTX30DaVaAMnbr9SJeYQAcRbrqy5vTRrmDZ3
	 qKV4FB3NWy3LcusQsgmS+TlfRtmwrk+4CPsyl9neqmYcrMEUupFte9ZFWL9qbQ7qOZ
	 FwfDfKNyRN2x+ZbRFJzTcjePL8Cdast4SGArGNNN9oPPACePpCce2Wes6OAySp2OX6
	 aBqMbwNEVbO2g==
Message-ID: <dbdfc894-2a63-460a-a10e-e290385ea2e6@kernel.org>
Date: Thu, 21 Nov 2024 15:08:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: soc: ti: pruss: Add clocks for ICSSG
To: "Anwar, Md Danish" <a0501179@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, MD Danish Anwar <danishanwar@ti.com>,
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 ssantosh@kernel.org, nm@ti.com
References: <20241113110955.3876045-1-danishanwar@ti.com>
 <20241113110955.3876045-2-danishanwar@ti.com>
 <adcc5aa5-0f51-4c69-b684-a1e0844c5e3f@kernel.org>
 <6e11c85a-5883-4a28-b5bd-98da28f20425@kernel.org>
 <d738bb00-e295-4d74-8ba2-efd82b6df2ea@ti.com>
 <e633232e-f0ad-43f7-9897-39836e6b98b4@kernel.org>
 <96ea0c11-e6e7-4801-9c06-2dc80b21b1ab@ti.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <96ea0c11-e6e7-4801-9c06-2dc80b21b1ab@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_050900_182011_2AA20093 
X-CRM114-Status: GOOD (  15.47  )
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



On 20/11/2024 15:23, Anwar, Md Danish wrote:
> Hi Roger,
> 
> On 11/19/2024 4:15 PM, Roger Quadros wrote:
>>
>>
>> On 19/11/2024 08:12, Vignesh Raghavendra wrote:
>>>
>>>
>>> On 18/11/24 19:22, Roger Quadros wrote:
>>>>
>>>>
>>>> On 18/11/2024 15:33, Roger Quadros wrote:
>>>>> Hi,
>>>>>
>>>>> On 13/11/2024 13:09, MD Danish Anwar wrote:
>>>>>> The ICSSG module has 7 clocks for each instance.
>>>>>>
>>>>>> These clocks are ICSSG0_CORE_CLK, ICSSG0_IEP_CLK, ICSSG0_ICLK,
>>>>>> ICSSG0_UART_CLK, RGMII_MHZ_250_CLK, RGMII_MHZ_50_CLK and RGMII_MHZ_5_CLK
>>>>>> These clocks are described in AM64x TRM Section 6.4.3 Table 6-398.
>>>>>>
>>>>>> Add these clocks to the dt binding of ICSSG.
>>>>>>
>>>>>> Link: https://www.ti.com/lit/pdf/spruim2 (AM64x TRM)
>>>>>> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
>>>>>> ---
>>>>>>  Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml | 10 ++++++++++
>>>>>>  1 file changed, 10 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
>>>>>> index 3cb1471cc6b6..927b3200e29e 100644
>>>>>> --- a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
>>>>>> @@ -92,6 +92,16 @@ properties:
>>>>>>      description: |
>>>>>>        This property is as per sci-pm-domain.txt.
>>>>>>  
>>>>>> +  clocks:
>>>>>> +    items:
>>>>>> +      - description: ICSSG_CORE Clock
>>>>>> +      - description: ICSSG_IEP Clock
>>>>>> +      - description: ICSSG_RGMII_MHZ_250 Clock
>>>>>> +      - description: ICSSG_RGMII_MHZ_50 Clock
>>>>>> +      - description: ICSSG_RGMII_MHZ_5 Clock
>>>>>> +      - description: ICSSG_UART Clock
>>>>>> +      - description: ICSSG_ICLK Clock
>>>>>> +
>>>>>
>>>>> There are actually many more clocks [1]
>>>>> What is the purpose of adding all these clocks in the DT if driver doesn't
>>>>> use them?
>>>>>
>>>
>>> DT should completely describe the HW and not based on what Linux driver
>>> needs. So its valid to describe all clock inputs to a module
>>> irrespective of what driver does with it.
>>
>> Fair point. But there are a total 11 clocks instead of 7 in [1]
>>
> 
> I took the list of clocks from AM64x TRM [1] Section 6.4.3 Table 6-398.
> In the TRM only 7 clocks are mentioned per ICSSG instance which I have
> mentioned in the binding.
> 
> [1] https://www.ti.com/lit/ug/spruim2h/spruim2h.pdf?ts=1732108738816

OK thanks for the clarification. It looks like the same in AM65 and J721e TRMs as well.
So it is fine.

> 
>>>
>>>>> Only CORE and IEP clocks parent can be configured via clock muxes.
>>>>> Those are already defined in the icssg?_cfg nodes.
>>>>
>>>> Actually those clock muxes are internal to ICSSG.
>>>> We still need to be able to set clock parents of CORE and IEP clock.
>>>>
>>>> So pruss block needs at most 2 clocks like you had in v2 of this patch?
>>>>
>>>>>
>>>>> [1] - https://software-dl.ti.com/tisci/esd/22_01_02/5_soc_doc/am64x/clocks.html
>>>>>
>>>>>>  patternProperties:
>>>>>>  
>>>>>>    memories@[a-f0-9]+$:
>>>>>
>>>>
>>>
>>
> 

-- 
cheers,
-roger


