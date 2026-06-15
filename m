Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7706CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 11:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MsOCF7GqC3TJWYvnKCqKwk7a8XeS+T+DCOUJtYriY9s=; b=oEwlbErF42ZwW61MyoOdvU659H
	mISVS+SnA+nOjvg+AcAWPSmQUBhZrDVM/LHn5vT/O3D3ahMPUVy8sOK2x2gPtDjyWq7s35yIVwELh
	p5WUDRZTl9uZedwIk4oHiF1GijKBgVHJzZrRaF9vEhz6RWE68UBiRULS5d0LFnYffTFKX1FXwT/Rs
	GzFLOvYqlP11rJgbwZrmuzk7HwdbHhGlLKDNdEYcYtB6tD1GCVhARllkkmVUJv8sUC9vHra9GdgF4
	TNNNHZ80R5scZANTihrFJrEkDfcfn1B77I2wiKPP9WLhj3ZS3iVsU4OFbYgQXQOCFfX8GNrIIHGPW
	jSMPshjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ5lA-0000000E7HL-3fz6;
	Mon, 15 Jun 2026 11:45:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ5l5-0000000E7GZ-3Yu3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 11:45:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1E30328D;
	Mon, 15 Jun 2026 04:45:30 -0700 (PDT)
Received: from [10.1.29.27] (e122027.cambridge.arm.com [10.1.29.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E2EF23F915;
	Mon, 15 Jun 2026 04:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781523935; bh=yl9rySnseoF1FeFXRn9TN4yr2P1Ptx7JPUgpPqcwm0g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MHnZ0RGnY5yquoeTXirjmrkWmRzjXO/gwWE70gcVFlGHngZWIkgOBZF3tbUpE5U7X
	 3IAA/JOKX6IPitz0r3JchFuqknr920GAb1G0BhNcbpfE7b5JWLusQrf5zqaFjrTE+d
	 7Ph+32XAuVOXxEAh0fSZABQvj9sk1oorA+yrbZeU=
Message-ID: <649692d0-fa5b-455f-b6d7-6f41eec87ff7@arm.com>
Date: Mon, 15 Jun 2026 12:45:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 10/44] arm64: RMI: Add support for SRO
To: "Dan Williams (nvidia)" <djbw@kernel.org>, Gavin Shan <gshan@redhat.com>,
 kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve
 <vannapurve@google.com>, WeiLin.Chang@arm.com, Lorenzo.Pieralisi2@arm.com
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-11-steven.price@arm.com>
 <872ce762-0a83-42a4-bbe8-b21ea6f4e1cf@redhat.com>
 <50d70588-2ebc-4c9b-98ec-68f3d04a9d21@arm.com>
 <6a2c91398fad5_a003b10027@djbw-dev.notmuch>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <6a2c91398fad5_a003b10027@djbw-dev.notmuch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_044539_987339_82CB0EFE 
X-CRM114-Status: GOOD (  31.09  )
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

Hi Dan,

On 13/06/2026 00:07, Dan Williams (nvidia) wrote:
> Steven Price wrote:
> [..]
>>> alloc_pages_exact() will fail if the requested size exceeds the maximal
>>> allowed
>>> size (1 << MAX_PAGE_ORDER). The maximal size is usually smaller than
>>> PUD_SIZE
>>> but PUD_SIZE is allowed by the RMM.
>>
>> This is an area where to be honest I'm really not sure what to do.
>> Technically the RMM is allowed to ask for a contiguous range of 512GB
>> pages (on a 4K system - larger with larger page sizes) - but clearly no
>> real OS is going to be able to provide anything like that.
>>
>> In practise we don't expect the RMM to do anything so crazy. It's not
>> really clear to be whether even 2MB (PMD_SIZE) is needed. But the spec
>> is written to be generic.
>>
>> So my current approach is to calculate the required size and pass it
>> into alloc_pages_exact(). For "stupidly large" values this will fail and
>> Linux just doesn't support an RMM which attempts this. If there is ever
>> a usecase which needs this then we'd need to find a different method of
>> providing the memory (most likely some form of carveout to avoid
>> fragmentation). But my view is we should wait for that usecase to be
>> identified first.
> 
> Just some comparison comments as I am also going through the TDX patches
> which enable "Extension SEAMCALLs". These new SEAMCALLs are similar to
> the SRO mechanism [1].

Looks like at least at the moment it's much more one-way than the SRO
mechanism - there's no reclaim mechanism (yet).

> TDX asks for an upfront delegation of memory at init time using
> alloc_contig_pages() that is never returned until entire module is
> shutdown. alloc_contig_pages() is not subject to the MAX_ORDER limit,
> but not sure that alloc_contig_pages() is suitable for small+dynamic
> runtime memory add / release that SRO potentially wants to do?

Yeah I'm not sure quite what is best. I expect the RMM to only request
contiguous memory for very small allocations to use as hardware page
tables. It's an issue I'm trying to work through that the specification
doesn't provide any guidance for what sort of allocations the host
should expect to provide.

> Does SRO always balance the size of RMI_OP_MEM_REQ_DONATE with
> RMI_OP_MEM_REQ_RECLAIM, or might some donate requests be a one way
> donation like TDX? Just poking to see if there is a path to preallocate
> a pool vs the fine grained per-operation alloc/free.

The spec is unfortunately not prescriptive on this point. For an
operation which eventually fails, the expectation is that the RMM will
return all the memory that was provided (and exactly that memory). But
the specification doesn't actually require that.

The problem is that there are situations where a racing operation on
another CPU could trigger this to not happen. For example, a new page
table needs to be allocated to complete a map operation, but then a
racing operation on another CPU makes use of this page table (e.g due to
a map at a different address), the memory for the page table cannot be
returned even if the operation doesn't complete because it's in use from
the racing operation.

I don't believe the current RMM design will actually do this - but it's
not something we actually want to prevent in the spec.

Equally the expectation is that all the donated memory for a guest will
be returned when the guest is destroyed. But we don't have anything in
the spec to enforce this.

I don't particularly expect a pool to be that useful for the expected
memory allocation patterns as I expect SRO donations to be long lived.
We don't (yet at least) have a concept of donating memory just for
"scratch" memory during an operation. Although the SRO mechanism doesn't
rule that out.

Thanks,
Steve


