Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23147D2F03F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 14:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rDbf0S3N456zUzWsI6+cTJLVm2pCdKtPbV0rBpkVHoY=; b=juC23xge1go/HrYg1Y1KGk2uMU
	MeVHyBZGTohkae+gQ4eF0os4zZVV/66nW58G74Xlz3gN3Gb4jmuc6AsuhlMWk76CSYKRAqAY6AEy8
	h2hk0BxWOLxi8kFS0vYooYs1GqPS1I1VX/VlMVmKJz84nM2KnDoxxpxMTj+PYyr+8FL9Anmln5ZNK
	ixrtltWOUH/QCGR+GoGnMjSFJJvH3lpQCb/KFubIjS+wsyYj8ap/c9BDxCm3tdr7F5eMoZIQRYQcx
	FkffcZdOUt2mPAMccCZYEv9zr/J0nQagdOtK0kHVm1v8bjE+5PbX9dKKWu6wktVQicKLkGWBVg4S7
	1NxJZtGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkkLW-0000000ETLP-3uG0;
	Tue, 27 Jan 2026 14:47:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkkLV-0000000ETL2-0RyF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 14:47:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBF611595;
	Tue, 27 Jan 2026 06:47:01 -0800 (PST)
Received: from [10.1.37.210] (XHFQ2J9959.cambridge.arm.com [10.1.37.210])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7397B3F73F;
	Tue, 27 Jan 2026 06:47:06 -0800 (PST)
Message-ID: <a3cc1c57-51e1-41c7-acf4-b398ca9b989f@arm.com>
Date: Tue, 27 Jan 2026 14:47:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/13] arm64: mm: More flags for __flush_tlb_range()
Content-Language: en-GB
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>,
 Dev Jain <dev.jain@arm.com>, Linu Cherian <Linu.Cherian@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260119172202.1681510-1-ryan.roberts@arm.com>
 <20260119172202.1681510-12-ryan.roberts@arm.com>
 <20260127124533.0000302e@huawei.com>
 <e75963a8-d0bd-49b0-9a00-b3297b1d5686@arm.com>
 <20260127141137.00004dd4@huawei.com> <20260127141412.00005d7a@huawei.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20260127141412.00005d7a@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_064709_289691_E349E2B9 
X-CRM114-Status: GOOD (  20.10  )
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

On 27/01/2026 14:14, Jonathan Cameron wrote:
> On Tue, 27 Jan 2026 14:11:37 +0000
> Jonathan Cameron <jonathan.cameron@huawei.com> wrote:
> 
>> On Tue, 27 Jan 2026 13:50:06 +0000
>> Ryan Roberts <ryan.roberts@arm.com> wrote:
>>
>>> On 27/01/2026 12:45, Jonathan Cameron wrote:  
>>>> On Mon, 19 Jan 2026 17:21:58 +0000
>>>> Ryan Roberts <ryan.roberts@arm.com> wrote:
>>>>     
>>>>> Refactor function variants with "_nosync", "_local" and "_nonotify" into
>>>>> a single __always_inline implementation that takes flags and rely on
>>>>> constant folding to select the parts that are actually needed at any
>>>>> given callsite, based on the provided flags.
>>>>>
>>>>> Flags all live in the tlbf_t (TLB flags) type; TLBF_NONE (0) continues
>>>>> to provide the strongest semantics (i.e. evict from walk cache,
>>>>> broadcast, synchronise and notify). Each flag reduces the strength in
>>>>> some way; TLBF_NONOTIFY, TLBF_NOSYNC and TLBF_NOBROADCAST are added to
>>>>> complement the existing TLBF_NOWALKCACHE.    
>>>>
>>>> Unless I'm missing something the case of TLBF_NOBROADCAST but not
>>>> TLBF_NOWALKCACHE isn't currently used.    
>>>
>>> Currect but the next couple of patches start using TLBF_NOBROADCAST without
>>> TLBF_NOWALKCACHE. TLBF_NOWALKCACHE is used without TLBF_NOBROADCAST in this patch.
>>>   
>>>>   
>>>> I wonder if bringing that in with a user will make it easier to see what
>>>> is going on.    
>>>
>>> I'm not sure I understand the suggestion. This patch is using both flags so I
>>> can't really defer introducing one of them. It's just that (for this patch only)
>>> it never uses TLBF_NOBROADCAST without TLBF_NOWALKCACHE.  
>>
>> Would be a case of lobbing in a build_bug_on() or similar, but this was
>> mainly that I hadn't read the later patches at this point (or at least
>> not such that they were still in my memory).
>>
>> Perhaps a breadcrumb just to say that new combination is added, but
>> not used until later patches.
> 
> Now I'm going crazy. Is it used used in this series?  After you pointed out
> the addition of TLBF_NOWALKCACHE in the flush page stuff I'm failing to spot
> that. Or do you mean in a follow up series?

Yeah, you're right; sorry about that. ___flush_tlb_range() (3 underscores) never
sees TLBF_NOBROADCAST without TLBF_NOWALKCACHE. (I also failed to see the tweek
in __flush_tlb_page() when I first responded to this. There is no follow up series).

I'll replace the vae1 option with a BUILD_BUG() and remove the vae1()/rvae1()
helpers in the next version.

Thanks for the review!

Thanks,
Ryan


