Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17FAC87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 15:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7RsgK39bZGGSX6h47xkhxWwFZ1ITqr8yrpYQjfJ5U7g=; b=iiWNSjnkNKFCNo91bJXSDwS8Ck
	prua2Dpldmit10ELS+cCy0y4F4rUmyBv611Pp1jlhJK1w0fbbwtePN20jEQ4tLRaS1xwafKHWPJM6
	ejGFRRxzhNpCvnId3Gua8mmxi8WnPH1okPWzB3UVVQbt6FgQ+GBrodIXXQgRrafBlYomOFElienLZ
	MAWbXidFQEPLw+qRLj6vDFmqzmoMa39nTY3qHbPIhoIRqPTKqYFgeI6x4F6wZtNq0yugFimpevSnW
	eEPYMdwZOsUoOu8tLR7cl9CvZMYWAo0/QQLPwTdqv0pdw48823aCgaAjEX8zx0Fmy+D8FbaBwurlI
	o5Y524RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujgFT-0000000FdQ8-3u2i;
	Wed, 06 Aug 2025 15:40:15 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujg0I-0000000Fb8s-1XWd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 15:24:36 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 576FORiO603713;
	Wed, 6 Aug 2025 10:24:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754493867;
	bh=7RsgK39bZGGSX6h47xkhxWwFZ1ITqr8yrpYQjfJ5U7g=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=hzsO1BXe0Wzvoo9dSBV6u7zuoy/ZcmqIENibhejADzSxWaFki3CNbIurssoKE8dD4
	 Ia5BMXZdr87A0hKdGXlE82F8wmtPzv+nShj5MkTPS76O2m22G0hikaTcLgN1w82z81
	 YLuGVEo/iKGes8G1thXOAJTRimOpXrbKPf+J7cI0=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 576FOQe7122291
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 6 Aug 2025 10:24:26 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 6
 Aug 2025 10:24:26 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 6 Aug 2025 10:24:26 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 576FOQI53740880;
	Wed, 6 Aug 2025 10:24:26 -0500
Message-ID: <e9394117-996c-4134-b9f2-50accf633601@ti.com>
Date: Wed, 6 Aug 2025 10:24:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: hwinfo: Add second register range for
 GP_SW
To: Krzysztof Kozlowski <krzk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian
 Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        Santosh Shilimkar
	<ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mmc@vger.kernel.org>
References: <20250805234950.3781367-1-jm@ti.com>
 <20250805234950.3781367-2-jm@ti.com>
 <0f1cbec6-6032-48f6-8887-e526484c0d20@kernel.org>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <0f1cbec6-6032-48f6-8887-e526484c0d20@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_082434_548254_764BA817 
X-CRM114-Status: GOOD (  20.65  )
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

Hi Krystoff,

On 8/6/25 1:40 AM, Krzysztof Kozlowski wrote:
> On 06/08/2025 01:49, Judith Mendez wrote:
>> This adds a second register range in ti,k3-socinfo. This register
> 
> Please do not use "This commit/patch/change", but imperative mood. See
> longer explanation here:
> https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

I can reword this.

> 
> 
>> range can also be used to detect silicon revisions.
>>
>> AM62px SR1.0, SR1.1, and SR1.2 can only be distinguished with GP_SW
>> registers, so increase maximum items to 2 for reg property and update
>> the example.
>>
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> ---
>>   .../devicetree/bindings/hwinfo/ti,k3-socinfo.yaml        | 9 ++++++---
>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/hwinfo/ti,k3-socinfo.yaml b/Documentation/devicetree/bindings/hwinfo/ti,k3-socinfo.yaml
>> index dada28b47ea0..3b656fc0cb5a 100644
>> --- a/Documentation/devicetree/bindings/hwinfo/ti,k3-socinfo.yaml
>> +++ b/Documentation/devicetree/bindings/hwinfo/ti,k3-socinfo.yaml
>> @@ -24,7 +24,8 @@ properties:
>>         - const: ti,am654-chipid
>>   
>>     reg:
>> -    maxItems: 1
>> +    maxItems: 2
>> +    minItems: 1
> 
> They always come with reversed order... but anyway, you instead must
> list the items with minItems.
> 
> another problem is that this is not supposed to be per register. I
> already complained more than once about some of TI bindings: stop
> creating device nodes or address spaces per register.
> 
> That's one address space.

That does not really make sense. Registers jtag vs gp_sw have a
different back-end, one from silicon and another from efuse. Not even
sure if the memory map will always be the same across processors.

> 
>>   
>>   required:
>>     - compatible
>> @@ -34,7 +35,9 @@ additionalProperties: false
>>   
>>   examples:
>>     - |
>> -    chipid@43000014 {
>> +    chipid@14 {
> 
> And this was never even checked :/ You have clear warnings here.

I will double check this.


~ Judith


