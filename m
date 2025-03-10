Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C916C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 19:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9k2ujwCkxT/pnQt2SpcTPLQF5W45ehk16LpQKOSM9kE=; b=NxJTdtMaoS+7E9H2ymeE48hb2u
	R4w+MkLpvUYfTs02aGRHQ2QuJZ3Gl93wMRJadm/miZHQVLmZ/HJG26QAwVPVZkGNm3YKna1E9i3jr
	1HpldVmX7YDSxu834JhfUDEiq3KTZbXf8XsPccYtu9W+evRhVboITvtAjshV/FuR0TTq1kYZQ22Yb
	vVT1eU3jdVTQsrGTV61IwJ+HmTZZmnwRWNzPf+DboxCVfttObJW/av9hJM3T5HBJlAx4v/EjcDDFA
	T03QZdiixqlPkycmE13kB+ts6/fO+fh2dYNo0X30ZSCNNpqrhbsoiIa2ytONk2OGQLpNtvv2L3Itv
	2drHhECw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trifw-00000003iyg-1gKJ;
	Mon, 10 Mar 2025 19:20:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trgZl-00000003Rbx-492X
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Mar 2025 17:06:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9k2ujwCkxT/pnQt2SpcTPLQF5W45ehk16LpQKOSM9kE=; b=IkksBEmtkATdcZX385li91w4ST
	n0HxT55DrmzuUhFW2MF+rnfVEpvCji+OtWCFF1P+3OMyTVLQYzUT7Gqcq1Vb0jWjXsoxH/6hC+A8n
	FES6d9D6aSK/98Ktr8lCEfweETdN0Bd+qpfXRsxcLmnbFD0764VZgJAPhJ724rLtEq/VcBP47rpd1
	u9BQMfYF+erXH3lx3PIr+pTHLRvflU4gZB/tLHdsdEqvzyW0LlOw6VqC5k9AEpJw2VJvpi+C3O4Tj
	k5kUbrM2Tb2NOqGcuEfBpxiEUTkIf9WES3E9a2j7HxEMpmqV4M3btfQuBOlnrB8Az8srGzlvWlQQa
	3UwEqkdg==;
Received: from linux.microsoft.com ([13.77.154.182])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trgZi-00000001xhJ-3eek
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 17:06:00 +0000
Received: from [10.137.184.60] (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id CA8B82038F32;
	Mon, 10 Mar 2025 10:05:56 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com CA8B82038F32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1741626357;
	bh=9k2ujwCkxT/pnQt2SpcTPLQF5W45ehk16LpQKOSM9kE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ASdtXEizJBNBlir7Guq6DH/+cVwx7N/FgUmEK+XbPU0pYIqCSwEx1mx/GflRf57tm
	 MnevelamszmPc2/kut2m5GTFfDoExBbWYXR6coPOMciOGK6Yb1hRgiEuFq0zuoi++a
	 4wrrUAgnXET7zmFf32p4ObaaELCgZyEhfx4WpkTk=
Message-ID: <c7f9d861-f617-4064-8c98-2ace06e9c25e@linux.microsoft.com>
Date: Mon, 10 Mar 2025 10:05:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH hyperv-next v5 07/11] dt-bindings: microsoft,vmbus: Add
 interrupts and DMA coherence
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: arnd@arndb.de, bhelgaas@google.com, bp@alien8.de,
 catalin.marinas@arm.com, conor+dt@kernel.org, dave.hansen@linux.intel.com,
 decui@microsoft.com, haiyangz@microsoft.com, hpa@zytor.com,
 joey.gouly@arm.com, krzk+dt@kernel.org, kw@linux.com, kys@microsoft.com,
 lenb@kernel.org, lpieralisi@kernel.org, manivannan.sadhasivam@linaro.org,
 mark.rutland@arm.com, maz@kernel.org, mingo@redhat.com,
 oliver.upton@linux.dev, rafael@kernel.org, robh@kernel.org,
 ssengar@linux.microsoft.com, sudeep.holla@arm.com, suzuki.poulose@arm.com,
 tglx@linutronix.de, wei.liu@kernel.org, will@kernel.org,
 yuzenghui@huawei.com, devicetree@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, x86@kernel.org,
 apais@microsoft.com, benhill@microsoft.com, bperkins@microsoft.com,
 sunilmut@microsoft.com
References: <20250307220304.247725-1-romank@linux.microsoft.com>
 <20250307220304.247725-8-romank@linux.microsoft.com>
 <20250310-demonic-ferret-of-judgment-5dbdbf@krzk-bin>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <20250310-demonic-ferret-of-judgment-5dbdbf@krzk-bin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_170559_313071_862A54F6 
X-CRM114-Status: GOOD (  22.95  )
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



On 3/10/2025 2:28 AM, Krzysztof Kozlowski wrote:
> On Fri, Mar 07, 2025 at 02:02:59PM -0800, Roman Kisel wrote:
>> To boot on ARM64, VMBus requires configuring interrupts. Missing
>> DMA coherence property is sub-optimal as the VMBus transations are
>> cache-coherent.
>>
>> Add interrupts to be able to boot on ARM64. Add DMA coherence to
>> avoid doing extra work on maintaining caches on ARM64.
> 
> How do you add it?
> 

I added properties to the node. Should I fix the description, or I am
misunderstanding the question?

>>
>> Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
>> ---
>>   .../devicetree/bindings/bus/microsoft,vmbus.yaml          | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/bus/microsoft,vmbus.yaml b/Documentation/devicetree/bindings/bus/microsoft,vmbus.yaml
>> index a8d40c766dcd..3ab7d0116626 100644
>> --- a/Documentation/devicetree/bindings/bus/microsoft,vmbus.yaml
>> +++ b/Documentation/devicetree/bindings/bus/microsoft,vmbus.yaml
>> @@ -28,13 +28,16 @@ properties:
>>   required:
>>     - compatible
>>     - ranges
>> +  - interrupts
>>     - '#address-cells'
>>     - '#size-cells'
>>   
>> -additionalProperties: false
>> +additionalProperties: true
> 
> This is neither explained in commit msg nor correct.
> 

Not explained, as there is no good explanation as described below.

> Drop the change. You cannot have device bindings ending with 'true'
> here - see talks, example-bindings, writing-schema and whatever resource
> is there.
> 

Thanks, I'll put more effort into bringing this into a better form!
If you have time, could you comment on the below?

The Documentation says

   * additionalProperties: true
     Rare case, used for schemas implementing common set of properties.
Such schemas are supposed to be referenced by other schemas, which then 
use 'unevaluatedProperties: false'.  Typically bus or common-part schemas.

This is a bus so I added that line to the YAML, and I saw it in many
other YAML files. Without that line, there was a warning from the local
DT validation described in the Documentation about not having pin
controls which was weird, and adding

"additionalProperties: true"

fixed the warnings (didn't debug much though). As a side note, there was
a similar warning coming from another YAML during running DT schema
validation as described in the Documentation so maybe warnings are fine.

> Best regards,
> Krzysztof
> 

-- 
Thank you,
Roman


