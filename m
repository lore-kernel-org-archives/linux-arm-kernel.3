Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEA4E9A038
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 20:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bbXh8OD21zCRfl2ZvX0t1+1Nd683jrs4Uo7qSlm2ctM=; b=TIW65y1wuMOuTPVd8G/17z7369
	3BBdznOGnW/XzC2v6NgdWIQGbZ3mZqW9dWuj0jeQ96xnj/HYZ3v5BMFSjsV8ehkWUau8vX0RrRFrx
	aNF8Hfw0PfKKnu7/PorZEvMmwpLJd1tkht1h1axh2xQERtVhUhkngW4bv5oeOibiWgchwY7jEB8yU
	00cO+MWYHVumHawMInj39ehqvmCbEylMdSP3VdP0L0fXex5Wm6lQ1n4blbPND5nhz/mUEmRVNBOkp
	K7Qwdfv80ktOZxOpiaGb8uZzZ34QDfxxe6Qvx9dAkmbSk2qADyyBV6+JQMBVllb6l7MmN8C/axCIN
	ZRbj2//A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsRKl-00000008poi-3VV1;
	Tue, 17 Feb 2026 20:06:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsRKg-00000008poK-2Auh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 20:06:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 51BB2404FB;
	Tue, 17 Feb 2026 20:06:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEC70C19425;
	Tue, 17 Feb 2026 20:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771358764;
	bh=pB8XSOQnXS9spkcF/dY7JICgWxaL/46DvpLGgS0hD64=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dzdzmtJXntv6tZ3xrZ5/5KDFCpCaBwCJWdFrb1Gf1xl4GzW/CTwauy2hAF96iXdMt
	 i0n5nvdbl296y7+sk9fmCAdIEIp/B2q31R6sz0B7BZ0RfsOmRurQk0ko9xZSA7Lmk1
	 PKmfgL66joDhQNzsadZvTYNPseLmcLyi3aw3I2ltNx2Gjqx7pF5YIplrzgDvMSewt7
	 uXSp4O6mltdcHOorb8+irJInXtOGvGGUnPEd1NlAsbyF/CSMFU/Kv+71nUE/hocMTY
	 B5pQU357Jc3Q7ljfy/adc26KdCkkol4HtfbeVY2NxVUIPr0pHqZ+e6FTXPAjZ/dXm2
	 4krqz4VMaRI0w==
Message-ID: <fd73947a-289a-43f9-9506-573fee935d12@kernel.org>
Date: Tue, 17 Feb 2026 21:06:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: soc: st: document the RISAB firewall
 peripheral
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260209-stm32_risab-v1-0-ef0b2b6a7e0a@foss.st.com>
 <20260209-stm32_risab-v1-1-ef0b2b6a7e0a@foss.st.com>
 <ee9759a6-1779-4891-8716-24c36134198a@kernel.org>
 <516036b6-b825-4a29-a48a-5d3af3234968@foss.st.com>
 <ac793499-bebb-477b-b27e-089529f3ee4b@kernel.org>
 <66ecf6a5-cc1f-4872-971d-6bc32894dbac@foss.st.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <66ecf6a5-cc1f-4872-971d-6bc32894dbac@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_120606_623573_173C6908 
X-CRM114-Status: GOOD (  22.31  )
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

On 17/02/2026 14:12, Gatien CHEVALLIER wrote:
> 
> 
> On 2/13/26 16:06, Krzysztof Kozlowski wrote:
>> On 10/02/2026 10:55, Gatien CHEVALLIER wrote:
>>>>> +  memory-region:
>>>>> +    minItems: 1
>>>>> +    maxItems: 32
>>>>> +    description:
>>>>> +      Phandle to nodes describing memory regions to be configured in the RISAB
>>>>> +      by the trusted domain of at least a RISAB page size.
>>>>> +      These regions cannot overlap. A zone must be within st,mem-map range and
>>>>> +      can be represented by one or more pages.
>>>>> +
>>>>> +  st,mem-map:
>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>>>> +    description: Memory address range covered by the RISAB.
>>>>> +    items:
>>>>> +      - description: Memory range base address
>>>>> +      - description: Memory range size
>>>>
>>>> Why do you need this property if you have memory-region already? This
>>>> also should be part of <reg>, although this mixing with memory-region is
>>>> anyway confusing.
>>>>
>>>
>>> The RISAB is a memory firewall peripheral covering internal RAMs. It is
>>> possible to configure multiple memory regions within these RAMs (done by
>>> the Trusted Domain) with security, privilege and compartment isolation.
>>> This peripheral allow 4kBytes page granularity. Each page can hold
>>> different access rights, with 32 pages at most (hence the maxItems: 32).
>>> That is some information that can be added to the documentation.
>>>
>>> Moreover, when a region is delegated to a non-secure privileged
>>> component, this component can configure the privilege level necessary to
>>> access the region.
>>>
>>> This property gives me the opportunity to get the memory range covered
>>> by the RISAB. "reg" here is used to access the actual RISAB registers
>>> holding the configuration.
>>
>> Looks awfully like memory regions still :/
>>
> 
> IIUC the memory-region property references memory regions within
> a reserved memory. Which is not really what I want to describe
> here as I want to get the boundaries of the whole range. The
> memory-region property would be used by the Trusted Domain / kernel
> to get each regions (or only one that represents the whole range) of the
> internal RAM to apply desired access rights to them / use them.
> 
> Describing the memory range using a reserved memory would make the
> kernel exclude this memory range from the normal usage, no?

In general yes, but also depends on the use case/drivers/purpose. I do
not understand why would you mark some memory for generic use by kernel
(so not reserved for specific purpose) and still configure it somehow
for trusted firmware to allow secure read/write access.

If you mark some part of memory as a meaning for TF for secure access,
you already claim it is not a generic memory. Otherwise TF just writes
all over malloced() pages?

> 
> I think declaring a "boundaries" memory region with no usage for the
> kernel wouldn't make sense. The kernel may not be able to access the
> whole memory range.

I don't understand that. reserved-memory is for cases with "no usage for
the kernel", so it would perfectly make sense.

Look what your description said:

"used to protect internal RAMs by applying access"

and

" a trusted domain, or the domain to whom the page configuration has
been delegated,"

so how it is not a dedicated, special memory delegated to specific
devices and/or TF?

Best regards,
Krzysztof

