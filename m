Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FCBC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 18:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E13Z4tIU2QebiQ+fHYjb3GAytcpWMD9ZkrlSMteHVzY=; b=WcCVc07hrDP+/9GyuqZ089UXpG
	kTgY6lGwg7KZ9AG+iE+r1d4E3g7Q82nHny0OQ93NLZA3kE5vMdOcMONY1oJdOgBAVnM+q4fBC8g9J
	+rAm6yGVbYQlAbgvnWkz+RNAlbFWHvzOEx7oo0Q0Yv/gvHvMzRBbftL5WUltIoD0Pm7m53G9hJOiV
	ubfgk1/hDAHKs1j6CdbUkAs78FZRJZ30f4BR3clSEqdjbkrx3U+0LXuprYXjFIE0L1k/FZAkIyS9/
	Xn4aVlqQaxD4xs2/d5ZfaXYeIhIsTvRYhZCR82CF08r/e6sWrpT7JyTD4RwbdOtm0zPz+8uiN/Ywb
	A7bqamKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trhYa-00000003ZQ4-0hDH;
	Mon, 10 Mar 2025 18:08:52 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trhWw-00000003ZDB-1Imf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 18:07:11 +0000
Received: from [10.137.184.60] (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id AEB1B2038F50;
	Mon, 10 Mar 2025 11:07:08 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com AEB1B2038F50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1741630029;
	bh=E13Z4tIU2QebiQ+fHYjb3GAytcpWMD9ZkrlSMteHVzY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lkfc7WqTTy9o/NtCmsNne2YvNu14qrm7uDsjvvXkQk5sfBSt0aW2JUGCLGbi53VQm
	 x7EtA7dAZvpUOAdKpa+WyJR+DDJq7wyFqIlErDY/ZzM4lWwuea+zOldXaRC8xhF7xm
	 s2kAl+3x2CXQIATrHNeR52YStsliYwkkKncXNNUo=
Message-ID: <ba6b906d-04a2-423d-a527-9ef7ab1dccf2@linux.microsoft.com>
Date: Mon, 10 Mar 2025 11:07:08 -0700
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
 <c7f9d861-f617-4064-8c98-2ace06e9c25e@linux.microsoft.com>
 <09d4966a-5804-40a4-9c5f-356a954a7704@kernel.org>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <09d4966a-5804-40a4-9c5f-356a954a7704@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_110710_400290_A68A1275 
X-CRM114-Status: GOOD (  29.62  )
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



On 3/10/2025 10:40 AM, Krzysztof Kozlowski wrote:
> On 10/03/2025 18:05, Roman Kisel wrote:
>>
>>
>> On 3/10/2025 2:28 AM, Krzysztof Kozlowski wrote:
>>> On Fri, Mar 07, 2025 at 02:02:59PM -0800, Roman Kisel wrote:
>>>> To boot on ARM64, VMBus requires configuring interrupts. Missing
>>>> DMA coherence property is sub-optimal as the VMBus transations are
>>>> cache-coherent.
>>>>
>>>> Add interrupts to be able to boot on ARM64. Add DMA coherence to
>>>> avoid doing extra work on maintaining caches on ARM64.
>>>
>>> How do you add it?
>>>
>>
>> I added properties to the node. Should I fix the description, or I am
>> misunderstanding the question?
> 
> I saw interrupts in the schema, but I did not see dma-coherence. I also
> did not see any DTS patches here, so I don't understand what node you
> are referring to.
> 

I will refer to talks, example-bindings, writing-schema you've suggested
to waste your time less. It appears there is some fundamental flaw in my
understanding of how these YAML files work so much so that I cannot even
write a commit description that can be understood, for the 5th time in
the row, sorry about that.

>>
>>>>
>>>> Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
>>>> ---
>>>>    .../devicetree/bindings/bus/microsoft,vmbus.yaml          | 8 +++++++-
>>>>    1 file changed, 7 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/bus/microsoft,vmbus.yaml b/Documentation/devicetree/bindings/bus/microsoft,vmbus.yaml
>>>> index a8d40c766dcd..3ab7d0116626 100644
>>>> --- a/Documentation/devicetree/bindings/bus/microsoft,vmbus.yaml
>>>> +++ b/Documentation/devicetree/bindings/bus/microsoft,vmbus.yaml
>>>> @@ -28,13 +28,16 @@ properties:
>>>>    required:
>>>>      - compatible
>>>>      - ranges
>>>> +  - interrupts
>>>>      - '#address-cells'
>>>>      - '#size-cells'
>>>>    
>>>> -additionalProperties: false
>>>> +additionalProperties: true
>>>
>>> This is neither explained in commit msg nor correct.
>>>
>>
>> Not explained, as there is no good explanation as described below.
>>
>>> Drop the change. You cannot have device bindings ending with 'true'
>>> here - see talks, example-bindings, writing-schema and whatever resource
>>> is there.
>>>
>>
>> Thanks, I'll put more effort into bringing this into a better form!
>> If you have time, could you comment on the below?
>>
>> The Documentation says
>>
>>     * additionalProperties: true
>>       Rare case, used for schemas implementing common set of properties.
>> Such schemas are supposed to be referenced by other schemas, which then
>> use 'unevaluatedProperties: false'.  Typically bus or common-part schemas.
>>
>> This is a bus so I added that line to the YAML, and I saw it in many
> 
> If this is a bus, then where is schema using it for
> bus-attached-devices? You cannot have bus without devices.
> 
> You *must* fulfill that part:
> "Such schemas are supposed to be referenced by other schemas, which then"
> 
> instead of calling it bus...
> 

It is modeled as a bus in the kernel:
https://www.kernel.org/doc/html/latest/virt/hyperv/vmbus.html

> Please upstream bindings for the bus devices and extend the example here
> with these devices.

The set of synthetic devices that reside on the bus isn't fixed, and
they don't require description neither in ACPI nor in DT as
the devices negotiate their MMIO regions through the hyperv driver.

Perhaps, it is not as much bus as expected by the YAML files.

> 
> Or this is not bus (calling something vmpony does not make it a pony).
> 
 > > Best regards,
> Krzysztof

-- 
Thank you,
Roman


