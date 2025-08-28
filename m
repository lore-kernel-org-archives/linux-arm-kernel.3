Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8433CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 18:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zcXQWGxBgys/9bCjZkggZ71XZareYPTP7nhInFsdrhI=; b=32fwpEd1j8KqVPl48ASA/gFscG
	6kqzFrtmqJhbCa3BE7t/yDXHI/4FHRADPZtMEPnUrnb534CAZ/WIW+MfifCRI+HO4x8NOjZRigknk
	sWTN+oXcPARFXUEbunEXMiiqZPehB9K7yxYLxDT0F/k+mZ0oj38s0HHgOHw3Z1isYP7ujgsZi8bkk
	BbOZwSUOXkaZz5vQ8jPp/HrUMAu3cJFSxIj4EUsVBJ/M9pz99UXvjpoKGbRxz5zKbzH9Nhftcf+0X
	NKATte6/Ni4SSSFOWptFnPZsVBbE4x7dAKVyDkH4o94f5zwJAunbZgQ86kXmNgfZKfxyrFto/s2sP
	c3lzjajA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urh3d-00000002dvm-1BbS;
	Thu, 28 Aug 2025 18:09:09 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ureaJ-000000026vC-3Cih
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 15:30:45 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SExhLc008165;
	Thu, 28 Aug 2025 17:30:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	zcXQWGxBgys/9bCjZkggZ71XZareYPTP7nhInFsdrhI=; b=5PBWCHvR6BAKt5q+
	lSmK889rAu3TIDu9s/WZRuzmFV+Gg4W9dRRNh+dFL48D7OL1yQ9uItfsuYCCJXry
	vrCcbsqiVzolyGi9uQi7s67eFaWbOOdKpJqkM7vgmUybN1UI7yDHhkhF8hBSqVw1
	ZgmYXjB5wAQvrOjAnMXARAz3Pk1TFOm5IrFB2zSdjWwaHG/15BXsiJwUtw4hLUbD
	67O0xdpCSrc5deU6c+j0cJRrSUYpmQH2/Z/EHQNN/ZYcDmVo9q3kUGx2ZMLZ+usy
	MFhMEbct9nuPWN4qe5QQ/dYEEtaJqj/LbB0qNKG+pNcbnPblkvAzwJq9lYwzk1er
	ZBozVw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48qrkmtyc8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 17:30:31 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D4EB940048;
	Thu, 28 Aug 2025 17:29:17 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0DB7976B31E;
	Thu, 28 Aug 2025 17:28:05 +0200 (CEST)
Received: from [10.252.2.182] (10.252.2.182) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Aug
 2025 17:28:03 +0200
Message-ID: <ee447d45-a7af-4af4-ba6c-5341b8428db3@foss.st.com>
Date: Thu, 28 Aug 2025 17:28:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/13] dt-bindings: arm: stm32: add required
 #clock-cells property
To: Christophe ROULLIER <christophe.roullier@foss.st.com>,
        Yannick Fertre
	<yannick.fertre@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250822-drm-misc-next-v5-0-9c825e28f733@foss.st.com>
 <20250822-drm-misc-next-v5-6-9c825e28f733@foss.st.com>
 <4201bb6b-3ad8-4b35-b152-0d725310245b@foss.st.com>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <4201bb6b-3ad8-4b35-b152-0d725310245b@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.252.2.182]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_083044_063794_BFE32D62 
X-CRM114-Status: GOOD (  11.39  )
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



On 8/28/25 17:18, Christophe ROULLIER wrote:
> On 8/22/25 16:34, Raphael Gallais-Pou wrote:
>> On STM32MP25 SoC, the syscfg peripheral provides a clock to the display
>> subsystem through a multiplexer.  Since it only provides a single clock,
>> the cell value is 0.
>>
>> Doing so allows the clock consumers to reach the peripheral and gate the
>> clock accordingly.
>>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> Reviewed-by: Yannick Fertre <yannick.fertre@foss.st.com>
>> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
>> ---
>>   .../bindings/arm/stm32/st,stm32-syscon.yaml        | 31 +++++++++++++++-------
>>   1 file changed, 21 insertions(+), 10 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
>> b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
>> index
>> ed97652c84922813e94b1818c07fe8714891c089..95d2319afe235fa86974d80f89c9deeae2275232
>> 100644
>> --- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
>> +++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
>> @@ -36,20 +36,31 @@ properties:
>>     clocks:
>>       maxItems: 1
>>   +  "#clock-cells":
>> +    const: 0
>> +
>>   required:
>>     - compatible
>>     - reg
>>   -if:
>> -  properties:
>> -    compatible:
>> -      contains:
>> -        enum:
>> -          - st,stm32mp157-syscfg
>> -          - st,stm32f4-gcan
>> -then:
>> -  required:
>> -    - clocks
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - st,stm32mp157-syscfg
>> +              - st,stm32f4-gcan
>> +    then:
>> +      required:
>> +        - clocks
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          const: st,stm32mp25-syscfg
>> +    then:
>> +      required:
>> +        - "#clock-cells"
>>     additionalProperties: false
>>  
> Acked-by: Christophe Roullier <christophe.roullier@foss.st.com>
>
> You can merge it on DRM MISC.

Thanks Christophe ! :)

Best regards,
Raphaël
>
> Best Regards,
>   Christophe
>


