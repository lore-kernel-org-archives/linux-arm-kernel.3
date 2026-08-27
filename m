Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A412C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 10:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=udWKXYGkGlyA3LbkWsnXV2l/ZPIGc55gBu+6VB0Ds3w=; b=AzS4AGDyK5ZA1YWSWg/E32ogfO
	ADxVMw4WNdIe/txNy4Whhv65qpafSNbCgkB65Nt14h802hlP/8vmhWENd0OdhkSLQDulzbdCFYXgk
	9wfieNV30ozpxFgJJiEPvsCdq4azcfWICmbRTDX5FrI5Q63K8i7KGrLJXXVi5mRMmgfjxUPfMgWNA
	Jcf9TFCBknRJVS4NwX5gGOsTit0JbmyOxU4WpSfzZG6sfZxjTlJwBzDN6NKipHXcYsg16eIbVrb+0
	ZAt8TEZFYgo1RytZbZbke1eZo9SUph5LRzG++5s057fi7IcgkgY5WJm6Z3Wr1DDVfJNP8HFOfPlTg
	bgArWbjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzXA0-00000003oPZ-0fE9;
	Thu, 27 Aug 2026 10:16:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzX9x-00000003oPK-3nYc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 10:16:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BD3B2600D3;
	Thu, 27 Aug 2026 10:16:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 673901F00A3E;
	Thu, 27 Aug 2026 10:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787825796;
	bh=udWKXYGkGlyA3LbkWsnXV2l/ZPIGc55gBu+6VB0Ds3w=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=DXnM+6aJbwydmiybafhZ7E8w2ScGJRNoqu5rISbsyQVu84OEt+ZNBQoAadMx7UgoR
	 tf6KeY89NXwAKEDZfCwOtmfJTgShTbTI1R8He6FT0pYI1Q7TOCqJGBB7figC1Er0OZ
	 avwOmKpaHYLED8adXFRFF0qunXVL0UWLujjpjStmSfI0df+TrRXJ+rQ5SyAv6q32+r
	 pnDdqj7rQEC1dScgab3bx8YvN4wIgbCf/cNgwyN8ALfAa0Da4HiZTrgAwJejgn1KYs
	 8cig9mLDG7ZLsW5F5Z0xj48KePqJ7FAQzTRIIIFyNKY0CZEKZGKjnYuQZb7Egsce5c
	 zaLfTzczhCjTQ==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id E92651980060;
	Thu, 27 Aug 2026 06:16:33 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Thu, 27 Aug 2026 06:16:33 -0400
X-ME-Sender: <xms:fw6QantdaGiKjOQe5Al70ntAARqObVeeD3kOouVj7zhwEHiUPKKujQ>
    <xme:fw6QajQjX-vM0BcKuf-ZrbIWsCjDRKbX7Oig9LkEeNrQ46pF1aDEtjaHHh3d5MDqE
    9JA0sGp72Umvac-xREj-vW7U4aLSgydVV7nOxz32ZscegK-21q5S30>
X-ME-Proxy-Cause: dmFkZTGL+wWDKiOXYVYIlHoUQvswE46HhbvyJf2XfqonV5fT5rhe2HgnNAT0pfiReQw9KS
    hQzpG+AquzLviXvGpnVFjsqfx10GuakxZvgbg7pBvjj1194QJsHbeMw9nY47ujjTlwa79a
    jhKFNZITfpqryXvndol4vbeLs61op5IZIS0fLTbT6TqVYlhqNrHiAfUIEmeZwr61lXV4/l
    zRPksoz6s8Ca13BedEMmZvMVpbGCImiasSZcc0HAgJxX4fNp9DlaybEuy3GlnFcuT7Ian2
    yxE8Qc1dWLaVS/9wP/V173ufqogdxDZ2EoSu6raazD9Ybcg6HqbVXSOFLkk8gRbYKlMsKm
    Kc7dYIIpnM5ijzr6g+ddbnPCmfVG+WfqTMruwt18G6Kbyyj1Aza7ChxhgDbWvy131aF1fD
    VcPEshTsCmpH1rl0BgkIv/OnkJCWJ8K5M80iqCiiygjgaCvNH8yX6jO1Xaa89YN7bUpvVq
    8x0eVc7g47Q4tYCTGzRlMhdoxuXK/XEZOE/19KY2gMEf3Mc09GALNs0S7+MTiJvOAHb+yx
    np3wjiXNDZ8SW2js6AmaFK4kHQqpyMlkFqoRkhk3hzp/7Il3fuqf9gHf+/IAGk/UmeY2J5
    aqmo1xGpSqTdEefFNo9SBYQB5flsk2TYRDb6sJ7YewLjwt8NRoiEeLseJ/aA
X-ME-Proxy: <xmx:gQ6QavgXqzgOM9J1hWaSGEMKA1HN50_r_hRS-aJ2mmgiFvh_NIiZRw>
    <xmx:gQ6QaotQrA44dg6E2XjYqw1MVN0mZQb3iJs-6VWzVA9uB1LXfeB9DQ>
    <xmx:gQ6Qai8QzVOpkMu3Skz6vz4KYaA--hoy7qyxsce6fv3vEwHNEGxArA>
    <xmx:gQ6QamYR9DX-tRUoqQbTE7DMEwYIz59UUnBhawxD63CTIb7EzQN1HA>
    <xmx:gQ6QagpaDIZz___5-_2e0bGKLEf9u6O5CBOnElNL04gbkbK-Ka01bj16>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 4D4D6F8007A; Thu, 27 Aug 2026 06:16:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 12:16:11 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Kevin Brodsky" <kevin.brodsky@arm.com>,
 "Ard Biesheuvel" <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org
Cc: "Will Deacon" <will@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Mark Rutland" <mark.rutland@arm.com>, "Ryan Roberts" <ryan.roberts@arm.com>,
 "Anshuman Khandual" <anshuman.khandual@arm.com>,
 "Liz Prucka" <lizprucka@google.com>, "Seth Jenkins" <sethjenkins@google.com>,
 "Kees Cook" <kees@kernel.org>, "Jann Horn" <jannh@google.com>,
 linux-hardening@vger.kernel.org
Message-Id: <00b4326d-af1c-429d-9495-c65ed5ce184f@app.fastmail.com>
In-Reply-To: <aacacc48-4e20-423f-b1cd-d8593485bf9d@arm.com>
References: <20260805104042.1107678-2-ardb+git@google.com>
 <5a3b89a6-bc42-42c3-82e8-25d6f1a2c5d2@arm.com>
 <a277a83a-cc01-443d-be42-775ce0bc96dd@app.fastmail.com>
 <c33d081b-7886-4db2-b1d9-61dc195844e5@arm.com>
 <1c0299ab-9f5f-4c7b-826e-a0547f7863dd@app.fastmail.com>
 <aacacc48-4e20-423f-b1cd-d8593485bf9d@arm.com>
Subject: Re: [RFC PATCH] arm64: mm: Map fixmap PTE tables r/o in the linear map
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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



On Thu, 27 Aug 2026, at 12:00, Kevin Brodsky wrote:
> On 27/08/2026 11:04, Ard Biesheuvel wrote:
>> On Thu, 27 Aug 2026, at 10:55, Kevin Brodsky wrote:
>>> On 26/08/2026 11:07, Ard Biesheuvel wrote:
>>>>>> [...]
>>>>>>
>>>>>> +static int __init fixmap_remap_ro(void)
>>>>>> +{
>>>>>> +	return set_direct_map_ro((unsigned long)lm_alias(&bm_pte), NR_BM_PTE_TABLES);
>>>>> Should we not also remap bm_pmd and bm_pud?
>>>>>
>>>>> For that matter, do we need RW access via the linear map for any page
>>>>> annotated with __bss_pgtbl? I suppose that might be the case for
>>>>> kasan_early_shadow_* but I don't know enough about KASAN to tell for sure.
>>>>>
>>>> bm_pte[] is special because it is only ever written via the kernel mapping,
>>>> and never via the linear map. This is why it is being singled out in this
>>>> patch.
>>> Right I see __set_fixmap(). This is a very special case of calling
>>> __set_pte() on a pointer derived from a global (i.e. pointing to the
>>> kernel image and not the LM) so it makes sense to treat it differently.
>>>
>>> I do wonder whether there is that much value in protecting bm_pte while
>>> all page tables in init_pg_dir (also at a fixed offset in the LM) remain
>>> writeable though.
>>>
>> Yes, so those need to be taken care of as well.
>
> But init_pg_dir needs to remain writeable in the LM, right?
>
>>> Either way all this is interesting for my series protecting page tables
>>> with pkeys [1] - it seems that to protect the fixmap, the easiest option
>>> would be to change the pkey of .pgtlb in both the kernel image and LM
>>> (the former for bm_pte, and the latter for everything else).
>>>
>>> [1] https://lore.kernel.org/all/20260818-kpkeys-v9-0-743ad31b2c8f@arm.com/
>>>
>> Thanks, I've been meaning to go through those but they are a bit overwhelming :-)
>
> Yes there's a fair bit to go through, sorry for that... You'll probably
> be most interested in patch 12, 13 and 19-21 - that's where page tables
> are being mapped with a special pkey. The cover letter should give
> enough context for them to make sense on their own.
>

OK, that helps ... :-)

>>>> Whether or not bm_pmd[] can be treated as a special case depends on the page
>>>> size: with 4k pages, the whole array covers a virtual region of 1G, which is
>>>> currently guaranteed to be shared only with the PCI I/O space (but we could
>>>> move that out). With 16k pages, it covers 64G, and so it is shared with the
>>>> vmemmap and other virtual mappings in the vmalloc region, and so the current
>>>> kernel mapping code expects to be able to write those entries.
>>>>
>>>> What we might do is generalize the logic that uses the fixmap to modify
>>>> pgd level entries in swapper_pg_dir, and use it for all modifications
>>>> at PMD level or higher if those tables are in .rodata
>>>>
>>>> But this is a bit more complicated than this change, so I decided to
>>>> present this as a separate change.
>>> Definitely, this is orthogonal to this patch. I wonder what the
>>> performance impact would be if we used the fixmap for setting all kernel
>>> entries at PMD and above. It would be nice to keep that logic easily
>>> togglable, because with the kpkeys approach I mentioned above we have a
>>> (most likely) much cheaper way of protecting these page tables.
>>>
>> I'm currently experimenting with using __put_kernel_nofault() to update
>> the descriptors at all levels (including PTE) and handling the fault
>> using the fixmap approach. That way, all statically allocated page
>> tables could move to .rodata (except bm_pte[]) and there should be no
>> substantial performance impact.
>
> Doesn't that still mean modifying a fixmap PTE every time we update
> kernel page tables? That doesn't exactly sound cheap.
>

Only the ones that were allocated statically, which cover the region
around the kernel image, and the special cases (fixmap, kasan). Everything
else is allocated dynamically, using memblock_alloc() if very early
during the boot.


>>>>>> +}
>>>>>> +late_initcall(fixmap_remap_ro);
>>>>> Is mark_rodata_ro() definitely too early to remap these pages RO?
>>>>>
>>>> No, we might just call this from there, afaict.
>>> Sounds good, could we then use update_mapping_prot()? I suppose not as
>>> that would require mapping bm_pte separately in map_mem()?
>>>
>> Yeah, but perhaps we should do the latter anyway, so we can remap the
>> region even if !can_set_direct_map().
>
> Yep makes sense. Not having to add yet another set_direct_map_* function
> is definitely welcome ;)
>

Ack.

