Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CBFFEF5864
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 05:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X5YJ+qY8Jzs48tNoZxM/VEeyS05XWrV6C42ssmVdJ2I=; b=ke96jTYUybzty8xX7AGP6nqA8J
	KCOsc5m7JesQfZYvXI1gtS8RWGpZfnLEomO1yu1/XheJp56ui9+g8RKjvpBUA5XwshW5LULdxGo5w
	vJFOhS47Gdjoo8YbyfE6RFRs2poZ9uNVwdfDmo+p5VxdyhPTFPjoa+F2zB5kI1eYgQSt6/TrGPOyj
	Wq0yrhaHRYuutHX0Ug27m845qS/19a6vbbyRQGmP5eTo8whRegK508fHFOudsbSI/Awbb9z3LVhc6
	yhen15Ov15V782D8SGYIDY2ILltztBNuJosoGxxE06xWbprrqPrxmPA5gqEdM4oMZLZK7/t0ycXWb
	Wjp6Tusg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuOB0-0000000HExx-2aRH;
	Mon, 23 Feb 2026 05:08:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuOAw-0000000HExZ-3J3Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 05:08:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8DD44339;
	Sun, 22 Feb 2026 21:07:57 -0800 (PST)
Received: from [10.164.19.28] (unknown [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 659CF3F7BD;
	Sun, 22 Feb 2026 21:07:58 -0800 (PST)
Message-ID: <a778d249-afea-4488-b045-beff3492a48a@arm.com>
Date: Mon, 23 Feb 2026 10:37:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [LSF/MM/BPF TOPIC] Per-process page size
To: Pedro Falcato <pfalcato@suse.de>
Cc: lsf-pc@lists.linux-foundation.org, ryan.roberts@arm.com,
 catalin.marinas@arm.com, will@kernel.org, ardb@kernel.org,
 willy@infradead.org, hughd@google.com, baolin.wang@linux.alibaba.com,
 akpm@linux-foundation.org, david@kernel.org, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260217145026.3880286-1-dev.jain@arm.com>
 <yfe2xbb6qwthg3cf4yr7zszpw5o3mx2v4bv32iwnm7yzxqjsvl@et22s2nuwzzk>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <yfe2xbb6qwthg3cf4yr7zszpw5o3mx2v4bv32iwnm7yzxqjsvl@et22s2nuwzzk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_210806_966838_53C9193F 
X-CRM114-Status: GOOD (  16.72  )
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

>>
>> 3. Translation from Linux pagetable to native pagetable
>> -------------------------------------------------------
>> Assume the case of a kernel pagesize of 4K and app pagesize of 64K.
>> Now that enlightenment is done, it is guaranteed that every single mapping
>> in the 4K pagetable (which we call the Linux pagetable) is of granularity
>> at least 64K. In the arm64 MM code, we maintain a "native" pagetable per
>> mm_struct, which is based off a 64K geometry. Because of the guarantee
>> aforementioned, any pagetable operation on the Linux pagetable
>> (set_ptes, clear_flush_ptes, modify_prot_start_ptes, etc) is going to happen
>> at a granularity of at least 16 PTEs - therefore we can translate this
>> operation to modify a single PTE entry in the native pagetable.
>> Given that enlightenment may miss corner cases, we insert a warning in the
>> architecture code - on being presented with an operation not translatable
>> into a native operation, we fallback to the Linux pagetable, thus losing
>> the benefits borne out of the pagetable geometry but keeping
>> the emulation intact.
> I don't understand. What exactly are you trying to do here? Maintain 2
> different paging structures, one for core mm and the other for the arch? As
> done in architectures with no radix tree paging structures?

The mm->pgd will be the software pagetable. So suppose that do_anonymous_page is
doing set_ptes on the PTE table belonging to the software pagetable. We will
hook a "native_set_ptes" into set_ptes, which will set the ptes on a different
pagetable maintained by arm64 code (probably mm_context_t->native_pgd).

>
> If so, that's wildly inefficient, unless you're willing to go into reclaimable
> page tables on the arm64 side. And that brings extra problems and extra fun :)

I didn't understand the reclaimable reference, but yes we need to make this efficient.
So for the above example I gave, native_set_ptes knows the virtual address to set -
walking the native hierarchy from native_pgd->native_pmd->native_pte (in case of 64K native
geometry) is inefficient. So we need to maintain a lookup mechanism from a linux pgtable
pointer to the native pgtable pointer.
The idea we have currently is to store such lookup in the struct ptdesc of the pagetable page.
For 4K Linux pagetable and 64K native pagetable, 512M/2M = 256 Linux PTE tables correspond
to different sections of the native PTE table. We will maintain the pointer to the relevant
section in the native PTE table, in the struct ptdesc of the pagetable page of the Linux
PTE table.
The other case is that a single Linux pgtable leaf entry corresponds to multiple native
leaf entries - take the case of a Linux PMD table which maps 1G of memory, this corresponds
to 2 native PTE tables (2 x 512M). We will have to store a list of pointers here.

>

