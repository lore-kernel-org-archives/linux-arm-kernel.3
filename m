Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACB4E9A03B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 08:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FW2jpvEaeZj8+mSBWzvRKn+BobGAmAvAZ+Tr44VJZFU=; b=dfVsEgGQdyECYGSwDctZUxbP65
	0kI7d4/AF9YHnIuhGlvg62CkEySMUwkCFhm9FVjgMrRbn+n6aXlLKKpN1PDAUqeSmlMvfIdjvukRL
	vxITQ+A+dxFPwJgyXZVghibKKol6Q5a9kWnofFHYaT0bstDY71eb9aAtR8xlOFIX699en6Ny9dmeV
	+svJ/6d/9i+x5acfqf17t1dwGEuu7B8xm0JAkp3mi2xfbNu3YpMyqgTzx5gyf9RsjZ+/Azp4HpGwH
	DsnjS5uzd0KXc1xoIM6XECuJmVjsu51fGaVJxUILAtXke4wvKUxLnleunxTh3kUaoH8VBppB3KGUE
	DYaHJtIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsdOL-00000009VK2-13kG;
	Wed, 18 Feb 2026 08:58:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsdOI-00000009VJh-3FKY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 08:58:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC31F1477;
	Wed, 18 Feb 2026 00:58:30 -0800 (PST)
Received: from [10.164.19.71] (unknown [10.164.19.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 10C9E3F62B;
	Wed, 18 Feb 2026 00:58:31 -0800 (PST)
Message-ID: <ea08cc51-5890-48cd-825b-82ae031e8bd8@arm.com>
Date: Wed, 18 Feb 2026 14:28:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [LSF/MM/BPF TOPIC] Per-process page size
From: Dev Jain <dev.jain@arm.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: lsf-pc@lists.linux-foundation.org, ryan.roberts@arm.com,
 catalin.marinas@arm.com, will@kernel.org, ardb@kernel.org, hughd@google.com,
 baolin.wang@linux.alibaba.com, akpm@linux-foundation.org, david@kernel.org,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260217145026.3880286-1-dev.jain@arm.com>
 <aZSHvt9Trlq7k7aH@casper.infradead.org>
 <bc47b56f-46be-442e-bbe8-11f489bca1fd@arm.com>
Content-Language: en-US
In-Reply-To: <bc47b56f-46be-442e-bbe8-11f489bca1fd@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_005838_917682_F711712F 
X-CRM114-Status: GOOD (  31.58  )
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


On 18/02/26 2:09 pm, Dev Jain wrote:
> On 17/02/26 8:52 pm, Matthew Wilcox wrote:
>> On Tue, Feb 17, 2026 at 08:20:26PM +0530, Dev Jain wrote:
>>> 2. Generic Linux MM enlightenment
>>> ---------------------------------
>>> We enlighten the Linux MM code to always hand out memory in the granularity
>> Please don't use the term "enlighten".  Tht's used to describe something
>> something or other with hypervisors.  Come up with a new term or use one
>> that already exists.
> Sure.
>
>>> File memory
>>> -----------
>>> For a growing list of compliant file systems, large folios can already be
>>> stored in the page cache. There is even a mechanism, introduced to support
>>> filesystems with block sizes larger than the system page size, to set a
>>> hard-minimum size for folios on a per-address-space basis. This mechanism
>>> will be reused and extended to service the per-process page size requirements.
>>>
>>> One key reason that the 64K kernel currently consumes considerably more memory
>>> than the 4K kernel is that Linux systems often have lots of small
>>> configuration files which each require a page in the page cache. But these
>>> small files are (likely) only used by certain processes. So, we prefer to
>>> continue to cache those using a 4K page.
>>> Therefore, if a process with a larger page size maps a file whose pagecache
>>> contains smaller folios, we drop them and re-read the range with a folio
>>> order at least that of the process order.
>> That's going to be messy.  I don't have a good idea for solving this
>> problem, but the page cache really isn't set up to change minimum folio
>> order while the inode is in use.
> Holding mapping->invalidate_lock, bumping mapping->min_folio_order and
> dropping-rereading the range suffers from a race - filemap_fault operating
> on some other partially populated 64K range will observe in filemap_get_folio
> that nothing is in the pagecache. Then, it will read the updated min_order
> in __filemap_get_folio, then use filemap_add_folio to add a 64K folio, but since
> the 64K range is partially populated, we get stuck in an infinite loop due to -EEXIST.
>
> So I figured that deleting the entire pagecache is simpler. We will also bail
> out early in __filemap_add_folio if the folio order asked by the caller to
> create is less than mapping_min_folio_order. Eventually the caller is going
> to read the correct min order. This algorithm avoids the race above, however...
>
> my assumption here was that we are synchronized on mapping->invalidate_lock.
> The kerneldoc above read_cache_folio() and some other comments convinced me
> of that, but I just checked with a VM_WARN_ON(!is_rwsem_locked()) in
> __filemap_add_folio and this doesn't seem to be the case for all code paths...
> If the algorithm sounds reasonable, I wonder what is the correct synchronization
> mechanism here.

I may have been vague here... to avoid the race I described above, we must
ensure that after all folios have been dropped from pagecache, and min order
is bumped up, no other code path remembers the old order and partially
populates a 64K range. For this we need synchronization.

>
>>>  - Are there other arches which could benefit from this?
>> Some architectures walk the page tables entirely in software, but on the
>> other hand, those tend to be, er, "legacy" architectures these days and
>> it's doubtful that anybody would invest in adding support.
>>
>> Sounds like a good question for Arnd ;-)
>>
>>>  - What level of compatibility we can achieve - is it even possible to
>>>    contain userspace within the emulated ABI?
>>>  - Rough edges of compatibility layer - pfnmaps, ksm, procfs, etc. For
>>>    example, what happens when a 64K process opens a procfs file of
>>>    a 4K process?
>>>  - native pgtable implementation - perhaps inspiration can be taken
>>>    from other arches with an involved pgtable logic (ppc, s390)?
>> I question who decides what page size a particular process will use.
>> The programmer?  The sysadmin?  It seems too disruptive for the kernel
>> to monitor and decide for the app what page size it will use.
> It's the sysadmin. The latter method you mention is similar to the problem
> of the kernel choosing the correct mTHP order, which we don't have an
> elegant idea for solving yet.
>
>

