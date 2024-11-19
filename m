Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 786E3D62073
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 10:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eKz7Pi7tt0xlI21xg+G1yfwJoRWjqxPsmcSKxkyqDnk=; b=Nq4dHBlDlocs9K
	8Pd0Og1/VzLg20yjxvLEsu5W946/yBEd7Ev/IfiK8x2yEhmdjMvIr1Yzavs1ch2LqlKGQDq6HIXwW
	SupzqIpHnKnpi7mP61Y4cC+YJbTvMk00scJ77gyOyjtcfvTG/bJP6e+aiB7hQH7lDeuRXqt9x2S9N
	9G3D6Xi7nze1a2RXrc4uCrmFPWVrbDsGsn+H1aeDpYZzes7OyWToEtBzvNs1Q7KbzfYfJQdhV10Xn
	DOSz2kCqO+dS/prdLitjjSi/+sj8Pr+b+ggBIMKTk9CihvhZa3mBjE8OW9yMPCE1wBzp8I6FZ4kfC
	rc1Zx2se8bDZx9Ej2Azg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDLl7-0000000C6JT-0PVp;
	Tue, 19 Nov 2024 10:47:01 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDLkA-0000000C6B8-2Ofr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 10:46:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 239CCA4284D;
	Tue, 19 Nov 2024 10:44:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FEBFC4CED2;
	Tue, 19 Nov 2024 10:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732013161;
	bh=4B1LNKMlsARSp5V/Ytp7QhTMCTxv0fGn9IFzi11TIn0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hWBSn3QNmJ2KAgx+nuxUwK/vwLb0Rs9wZ9orYQWEEbTkLs4RQkp241zZ5+p3AEZXF
	 FqgWU8KbPV65JpctYAP1DvU7hOW/BginO4DWGdlJrNn8KYUyre8IInrCv+0p6clwl2
	 xyYQZm/C+5cNKl3skvYB5J6Zn7cT/CNuFb7sdHTuxvTILJ2ahBcbJmOCHl8RaWibug
	 KSZWEUzSAAmj02kQhrM2g3FMXF2Ug3sMJd0Yz6sZUtnX6t39/XfOtGnYIWtsCfFS+L
	 IK/5cHhx0Uk900WiQs8lLm6RySXHSQ7NM2YuHGdH0+GeLAEypaVfXDDHxcFFpr0loD
	 X136rVxobYsjA==
Message-ID: <e633232e-f0ad-43f7-9897-39836e6b98b4@kernel.org>
Date: Tue, 19 Nov 2024 12:45:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: soc: ti: pruss: Add clocks for ICSSG
To: Vignesh Raghavendra <vigneshr@ti.com>,
 MD Danish Anwar <danishanwar@ti.com>, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, ssantosh@kernel.org, nm@ti.com
References: <20241113110955.3876045-1-danishanwar@ti.com>
 <20241113110955.3876045-2-danishanwar@ti.com>
 <adcc5aa5-0f51-4c69-b684-a1e0844c5e3f@kernel.org>
 <6e11c85a-5883-4a28-b5bd-98da28f20425@kernel.org>
 <d738bb00-e295-4d74-8ba2-efd82b6df2ea@ti.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <d738bb00-e295-4d74-8ba2-efd82b6df2ea@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_024602_740431_C438746E 
X-CRM114-Status: GOOD (  14.41  )
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



On 19/11/2024 08:12, Vignesh Raghavendra wrote:
> 
> 
> On 18/11/24 19:22, Roger Quadros wrote:
>>
>>
>> On 18/11/2024 15:33, Roger Quadros wrote:
>>> Hi,
>>>
>>> On 13/11/2024 13:09, MD Danish Anwar wrote:
>>>> The ICSSG module has 7 clocks for each instance.
>>>>
>>>> These clocks are ICSSG0_CORE_CLK, ICSSG0_IEP_CLK, ICSSG0_ICLK,
>>>> ICSSG0_UART_CLK, RGMII_MHZ_250_CLK, RGMII_MHZ_50_CLK and RGMII_MHZ_5_CLK
>>>> These clocks are described in AM64x TRM Section 6.4.3 Table 6-398.
>>>>
>>>> Add these clocks to the dt binding of ICSSG.
>>>>
>>>> Link: https://www.ti.com/lit/pdf/spruim2 (AM64x TRM)
>>>> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
>>>> ---
>>>>  Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml | 10 ++++++++++
>>>>  1 file changed, 10 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
>>>> index 3cb1471cc6b6..927b3200e29e 100644
>>>> --- a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
>>>> +++ b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
>>>> @@ -92,6 +92,16 @@ properties:
>>>>      description: |
>>>>        This property is as per sci-pm-domain.txt.
>>>>  
>>>> +  clocks:
>>>> +    items:
>>>> +      - description: ICSSG_CORE Clock
>>>> +      - description: ICSSG_IEP Clock
>>>> +      - description: ICSSG_RGMII_MHZ_250 Clock
>>>> +      - description: ICSSG_RGMII_MHZ_50 Clock
>>>> +      - description: ICSSG_RGMII_MHZ_5 Clock
>>>> +      - description: ICSSG_UART Clock
>>>> +      - description: ICSSG_ICLK Clock
>>>> +
>>>
>>> There are actually many more clocks [1]
>>> What is the purpose of adding all these clocks in the DT if driver doesn't
>>> use them?
>>>
> 
> DT should completely describe the HW and not based on what Linux driver
> needs. So its valid to describe all clock inputs to a module
> irrespective of what driver does with it.

Fair point. But there are a total 11 clocks instead of 7 in [1]

> 
>>> Only CORE and IEP clocks parent can be configured via clock muxes.
>>> Those are already defined in the icssg?_cfg nodes.
>>
>> Actually those clock muxes are internal to ICSSG.
>> We still need to be able to set clock parents of CORE and IEP clock.
>>
>> So pruss block needs at most 2 clocks like you had in v2 of this patch?
>>
>>>
>>> [1] - https://software-dl.ti.com/tisci/esd/22_01_02/5_soc_doc/am64x/clocks.html
>>>
>>>>  patternProperties:
>>>>  
>>>>    memories@[a-f0-9]+$:
>>>
>>
> 

-- 
cheers,
-roger


