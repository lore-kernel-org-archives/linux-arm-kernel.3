Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630FEC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 10:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ayOQBPJP38Is6vE11/duZwA3mrGAIUY0/EIe7FHOUQ=; b=pQ/lp1/L4vUfgpaENCa5hUwpFH
	H4cBJ2yb61jdQ5c1iFscR+TTM9tugYGopnvwkT4OPKCpD4xDT0TlarKwnrpoh4zbyXxIj97i0By9E
	D5WZmUUZnRjABL1DJg8cZRtPa4r+hdPefE9pv8lFURflfssBp9XR04wh0HAnzr/diMTYHDD142tWi
	6ZFSMoqeHRjc8DXKvhPHVpu4rMKIMAJzqi1QGFOR0M5GaWPDxtzelHf2Nrz4GApqUdCiHgjGpn7QP
	Hxw6Ep4ybIGpyc/0pKD9IgrAkC42K6M4J9BEt74CsqsVJa+fR2ejPCwJdKAGCJ0iML/7/5yYiptmC
	sTuVQtXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3soO-00000008jiB-1ko5;
	Tue, 08 Sep 2026 10:12:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3soN-00000008ji1-0mUx
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 10:12:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/ayOQBPJP38Is6vE11/duZwA3mrGAIUY0/EIe7FHOUQ=; b=nu8VM9rlUB7HVHDk8i/RMCuoJa
	KAz/zmWyLUlazhCRVlJ53OvBYC/YW167YC1CAJL8rdSpjXcYXYQTSe0TMzRmIP1X2B/NDRwzUt/1L
	ohUsa29gwAljmH9hRgoa5GfbxpyjSAwuEWioAhARUI6FoGK+8tSzYURfbO0Jcsm7VZe2JEzrmHF8M
	/OSUryW1yz1RtITozurH90LxzYJuNjRuBC782Q4ECK7k5kgc2MR2voEK0lSaoA27kz+oyspptp+n5
	crQSaX7MN82qxLJwV0PxQEq7rG3KOMyXGJcN0aQO8stj6vtCwQw3/jG/SOP/IORnFzu/dLxDnYhsg
	JHaQKrJQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3soJ-0000000HG3m-1AFZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 10:12:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37FA41476;
	Tue,  8 Sep 2026 03:12:09 -0700 (PDT)
Received: from [10.57.7.202] (unknown [10.57.7.202])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 34DD83F528;
	Tue,  8 Sep 2026 03:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788862332; bh=xlZC3OEZMV0/coWQyGMwBENJjfaFGyqN0Zg0ccer2wI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bq3wzFSnLt2zEXdSnnz8U9DC9OXdPlrslLiXfJfZ/k46iOwSa29UVewNF2oShj0Vu
	 /1YVazJsXb5vhqKLpsEUmyltbNMJhQZLlZtXH0OjNqzlNMIy0OoZofVpqolFOC9O0z
	 RpncI49u7gtPHlIbJmwbnR1eaq8VLcUU9Xix7Sik=
Message-ID: <00e97c75-eef1-4587-b299-ab07591a07bc@arm.com>
Date: Tue, 8 Sep 2026 12:11:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v9 12/25] mm: kpkeys: Protect regular page tables
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-hardening@vger.kernel.org, Andrew Morton
 <akpm@linux-foundation.org>, Andy Lutomirski <luto@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David Hildenbrand (Arm)" <david@kernel.org>, Jann Horn <jannh@google.com>,
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>,
 Kees Cook <kees@kernel.org>, Linu Cherian <linu.cherian@arm.com>,
 Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Mark Brown <broonie@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Maxwell Bland <mbland@motorola.com>, Peter Zijlstra <peterz@infradead.org>,
 Pierre Langlois <pierre.langlois@arm.com>,
 =?UTF-8?Q?Pierre-Cl=C3=A9ment_Tosi?= <ptosi@google.com>,
 Quentin Perret <qperret@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Vlastimil Babka <vbabka@kernel.org>,
 Will Deacon <will@kernel.org>, Yang Shi <yang@os.amperecomputing.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org, x86@kernel.org, Ira Weiny <iweiny@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Thomas Gleixner <tglx@kernel.org>
References: <20260818-kpkeys-v9-0-743ad31b2c8f@arm.com>
 <20260818-kpkeys-v9-12-743ad31b2c8f@arm.com>
 <178877845406.3691569.12554855722197968629.b4-review@b4>
 <bdba5b54-8733-4d47-952d-e1bd958a1ead@arm.com> <ap-6PZqGZHhPD6u1@kernel.org>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <ap-6PZqGZHhPD6u1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_111215_667893_D299989C 
X-CRM114-Status: GOOD (  17.71  )
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

On 08/09/2026 09:33, Mike Rapoport wrote:
> On Mon, Sep 07, 2026 at 05:52:32PM +0200, Kevin Brodsky wrote:
>> On 07/09/2026 12:54, Mike Rapoport wrote:
>>>> [...]
>>>>
>>>>  static inline struct ptdesc *pagetable_alloc_noprof(gfp_t gfp, unsigned int order)
>>>>  {
>>>> -	struct page *page = alloc_pages_noprof(gfp | __GFP_COMP, order);
>>>> +	struct page *page;
>>>> +
>>>> +	if (kpkeys_hardened_pgtables_enabled())
>>>> +		page = kpkeys_pgtable_alloc(gfp | __GFP_COMP, order);
>>>> +	else
>>>> +		page = alloc_pages_noprof(gfp | __GFP_COMP, order);
>>> Can we make it a sequence rahter than a branch?
>>>
>>> kpkeys_pgtable_alloc() does alloc_pages and then sets their pkeys, so I
>>> think something like this should work:
>>>
>>> 	page = alloc_pages_noprof(gfp | __GFP_COMP, order);
>>> 	if (!page)
>>> 		return NULL;
>>> 	err = kpkeys_pgtable_alloc(page);
>>> 	if (err) {
>>> 		__free_pages(page, order);
>>> 		return NULL;
>>>
>>> with if (kpkeys_hardened_pgtables_enabled()) folded into
>>> kpkeys_pgtable_alloc().
>> I agree this would be less ugly. In fact this is pretty much what this
>> series did up to RFC v5 (albeit in the ctor/dtor instead of alloc/free).
>> We could go back to this API, *but* the big issue is that it makes it
>> impossible to use a smarter allocation strategy for protected pages.
>> Patch 14 in RFC v6 [1] will give you an idea of what such an allocator
>> (with support for large blocks and splitting) would look like.
>>
>> As discussed with David H we're first trying to land this feature
>> without large block support (fully PTE-mapped direct map), but we do
>> want to support large blocks eventually [2] and I would prefer the core
>> API to be already compatible with that objective. Very happy to hear
>> about suggestions as to how to avoid the explicit condition in
>> pagetable_alloc() though!
> We could unconditionally replace alloc_pages_noprof() with
> kpkeys_pgtable_alloc() and make the latter choose the right allocator, but
> that's not very nice either :/

Yep I also thought of that but the naming would be really misleading...

Maybe, maybe, introduce __pagetable_alloc() that is a simple static
inline calling alloc_pages_noprof() if !CONFIG_KPKEYS_HARDENED_PGTABLES,
and otherwise checks kpkeys_hardened_pgtables_enabled()? Less ugliness
in pagetable_alloc() but even more further down, not sure this helps.

- Kevin

