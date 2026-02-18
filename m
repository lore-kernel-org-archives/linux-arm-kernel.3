Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 411CFE9A03B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 08:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vM3ozt8OxRWtrPAYPLp6jamOQc40+eyuP/vA4YpAN9M=; b=xb9JyCInPLAA8r/AitAsMl3Et6
	XytGj7JZkggQ8g0ExoFQ10x1EUtrwOGD22DVTKn0/kJ2fClcz7yu2QZCeG177iR3I/50VqSmGlxyn
	xTj4HP+RLBMMmmBhF9qupufmqbRZKoZ5qDYlb+/OXboO9JRm0j5XkvGdBgdes/upWkLz6s2mIr2+P
	YrrW7TqjRAAYFM/gw3tmJxmbnrraUCO4HX/d7HZicTKEUCgJHHQhJryLPElFWQtpBEh2UvqJoe0SH
	wDbw4FYIc/3zuMqM0wylx2Q80YrXd7TO7aHU3k/Clj6NQjjvr2hKSopqe2IafqDNhbGkxEOh9KTe7
	/SGL6gtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsd5s-00000009U4T-2qp1;
	Wed, 18 Feb 2026 08:39:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsd5q-00000009U3y-1ZUC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 08:39:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 910BB1477;
	Wed, 18 Feb 2026 00:39:25 -0800 (PST)
Received: from [10.164.19.71] (unknown [10.164.19.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A8A353F62B;
	Wed, 18 Feb 2026 00:39:26 -0800 (PST)
Message-ID: <bc47b56f-46be-442e-bbe8-11f489bca1fd@arm.com>
Date: Wed, 18 Feb 2026 14:09:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [LSF/MM/BPF TOPIC] Per-process page size
To: Matthew Wilcox <willy@infradead.org>
Cc: lsf-pc@lists.linux-foundation.org, ryan.roberts@arm.com,
 catalin.marinas@arm.com, will@kernel.org, ardb@kernel.org, hughd@google.com,
 baolin.wang@linux.alibaba.com, akpm@linux-foundation.org, david@kernel.org,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260217145026.3880286-1-dev.jain@arm.com>
 <aZSHvt9Trlq7k7aH@casper.infradead.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <aZSHvt9Trlq7k7aH@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_003934_537663_E3B2557E 
X-CRM114-Status: GOOD (  30.19  )
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


On 17/02/26 8:52 pm, Matthew Wilcox wrote:
> On Tue, Feb 17, 2026 at 08:20:26PM +0530, Dev Jain wrote:
>> 2. Generic Linux MM enlightenment
>> ---------------------------------
>> We enlighten the Linux MM code to always hand out memory in the granularity
> Please don't use the term "enlighten".  Tht's used to describe something
> something or other with hypervisors.  Come up with a new term or use one
> that already exists.

Sure.

>
>> File memory
>> -----------
>> For a growing list of compliant file systems, large folios can already be
>> stored in the page cache. There is even a mechanism, introduced to support
>> filesystems with block sizes larger than the system page size, to set a
>> hard-minimum size for folios on a per-address-space basis. This mechanism
>> will be reused and extended to service the per-process page size requirements.
>>
>> One key reason that the 64K kernel currently consumes considerably more memory
>> than the 4K kernel is that Linux systems often have lots of small
>> configuration files which each require a page in the page cache. But these
>> small files are (likely) only used by certain processes. So, we prefer to
>> continue to cache those using a 4K page.
>> Therefore, if a process with a larger page size maps a file whose pagecache
>> contains smaller folios, we drop them and re-read the range with a folio
>> order at least that of the process order.
> That's going to be messy.  I don't have a good idea for solving this
> problem, but the page cache really isn't set up to change minimum folio
> order while the inode is in use.

Holding mapping->invalidate_lock, bumping mapping->min_folio_order and
dropping-rereading the range suffers from a race - filemap_fault operating
on some other partially populated 64K range will observe in filemap_get_folio
that nothing is in the pagecache. Then, it will read the updated min_order
in __filemap_get_folio, then use filemap_add_folio to add a 64K folio, but since
the 64K range is partially populated, we get stuck in an infinite loop due to -EEXIST.

So I figured that deleting the entire pagecache is simpler. We will also bail
out early in __filemap_add_folio if the folio order asked by the caller to
create is less than mapping_min_folio_order. Eventually the caller is going
to read the correct min order. This algorithm avoids the race above, however...

my assumption here was that we are synchronized on mapping->invalidate_lock.
The kerneldoc above read_cache_folio() and some other comments convinced me
of that, but I just checked with a VM_WARN_ON(!is_rwsem_locked()) in
__filemap_add_folio and this doesn't seem to be the case for all code paths...
If the algorithm sounds reasonable, I wonder what is the correct synchronization
mechanism here.

>
>>  - Are there other arches which could benefit from this?
> Some architectures walk the page tables entirely in software, but on the
> other hand, those tend to be, er, "legacy" architectures these days and
> it's doubtful that anybody would invest in adding support.
>
> Sounds like a good question for Arnd ;-)
>
>>  - What level of compatibility we can achieve - is it even possible to
>>    contain userspace within the emulated ABI?
>>  - Rough edges of compatibility layer - pfnmaps, ksm, procfs, etc. For
>>    example, what happens when a 64K process opens a procfs file of
>>    a 4K process?
>>  - native pgtable implementation - perhaps inspiration can be taken
>>    from other arches with an involved pgtable logic (ppc, s390)?
> I question who decides what page size a particular process will use.
> The programmer?  The sysadmin?  It seems too disruptive for the kernel
> to monitor and decide for the app what page size it will use.

It's the sysadmin. The latter method you mention is similar to the problem
of the kernel choosing the correct mTHP order, which we don't have an
elegant idea for solving yet.


