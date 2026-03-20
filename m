Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA52E1098797
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 15:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ysbNj8lFw8IfnnCT5+m33HcLxVUrxAw+EMUT91iRs7Q=; b=JlSQgV2iCTEr8cE3wDC/Gc2gWF
	MgqXxUW8Ho7jSx7UN+oAVLT0h6UwMCNSh5H5k3kjoCI3hxeR6vkzKnbPDb3MiJlM45x+uxgJ2rvYQ
	NUz+525rJoR2/+/54Ok2X9uThpnem8VtUc3KI9W1cxAOIHKxVchkcj2rkunOSJQBq11eQnL0QW6Ta
	l6Bc5l7HlSEEpLsEmZgWxDp3lD2GAtzGFfW2n0lq2jz620k5BZG0k2ypaCzKGaybvEQnuOB+WmUOg
	wK4WkpbfLdHzEHImDiPTtqXgDZh1EgpNBYD0vMCayjSBnQeiOWepNPcnTse6Qq/6g3+iSEc9oHuny
	Lvz1/ywg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bQQ-0000000D08C-3rIi;
	Fri, 20 Mar 2026 15:06:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bQO-0000000D07x-4BIU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 15:06:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2017D61862;
	Fri, 20 Mar 2026 15:06:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7044C4CEF7;
	Fri, 20 Mar 2026 15:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774019167;
	bh=a5V6KVj/p5ln89F2tRrdVmVw8oemreTmSe3BZkx0iwI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mvpIdq/9d72DivkgvVtymQHXH7jVuQuYKi3+LQHQ0f58tkUJ728fEqgRkKtSJZoaN
	 pbFtnOrAxJ13dAXGYHacB7GiWq/px7693hwN8squYYUeIxksnEMb2cQRWnyaBSSDAs
	 N3nR1vFYOOw53CMX9KGCjVkVS7tmkdKy/w1SjtNibjIDdexgi4vYDL8QvZT+6WWD7Y
	 nPIxAOAO/qfHwUNAe16FCr7yOJHR4cgua67djnjnxCltxrKPlawhJIrcceYIc6/NMK
	 69I+FE4vf7u/FEX4iR3I6J/6gTnnfOkzzEw1+ndDtVN8galvJvxQkL4Z3vdTlfZV3X
	 g8h9ZDpMBnBAw==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id AC0A5F4008E;
	Fri, 20 Mar 2026 11:06:05 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 20 Mar 2026 11:06:05 -0400
X-ME-Sender: <xms:XWK9aTGlply8P2WXI5gm8LsWpf-879owa-bTH6wLNhi64OO78QpseQ>
    <xme:XWK9aRNwzVEYWSPIrFLkSRWV1eYcxOPkaFglgErNL5Hq1VEWEFSkArU0LVf868x5l
    v5oz_JiyfRBHk1IPGxcrKeOWlHNSYuB1Dwxt0xsL8LWC_0vOhkpqMQ>
X-ME-Received: <xmr:XWK9aZV1NiWo7gWZ2mD2LbYCd5FQZmE6XFW1_gLdhU1H1QTOkpiSmTitptlNNw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefuddtvdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhepueeijeeiffekheeffffftdekleefleehhfefhfduheejhedvffeluedvudefgfek
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
    hilhhlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheeh
    qddvkeeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrd
    hnrghmvgdpnhgspghrtghpthhtohepjedtpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehushgrmhgrrdgrrhhifheslhhinhhugidruggvvhdprhgtphhtthhopegrkhhpmh
    eslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepuggrvhhiuges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihilhhlhiesihhnfhhrrgguvggrugdroh
    hrghdprhgtphhtthhopehrhigrnhdrrhhosggvrhhtshesrghrmhdrtghomhdprhgtphht
    thhopehlihhnuhigqdhmmheskhhvrggtkhdrohhrghdprhgtphhtthhopehrsehhvghvrd
    gttgdprhgtphhtthhopehjrggtkhesshhushgvrdgtiidprhgtphhtthhopegrjhgusehl
    ihhnuhigrdhisghmrdgtohhm
X-ME-Proxy: <xmx:XWK9aT5phdrM6ht8yfHkhZBNhAzK9KUFu6FOhax-DnoPBFUcjC6aww>
    <xmx:XWK9adn8Y_lXfNumOHQpTIL9_rLsQujlxGnsQghmxrGCBuJ9VIGMhw>
    <xmx:XWK9aXS6uRaLVti6KPA7cuKQ0pbnBlVtwgXLXnkyeRO89ddfZs_IBA>
    <xmx:XWK9aRAPA0NVurwyZxYFvL52QXGXbxBnomFHt93naPmm37U8CWTLlg>
    <xmx:XWK9aQxPNsDm5BWvL-57J_trms6Vcwlrv9Y7bSLdb8vohBx3nERv2mlo>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Mar 2026 11:06:04 -0400 (EDT)
Date: Fri, 20 Mar 2026 15:06:03 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@kernel.org, 
	willy@infradead.org, ryan.roberts@arm.com, linux-mm@kvack.org, r@hev.cc, jack@suse.cz, 
	ajd@linux.ibm.com, apopple@nvidia.com, baohua@kernel.org, 
	baolin.wang@linux.alibaba.com, brauner@kernel.org, catalin.marinas@arm.com, dev.jain@arm.com, 
	kees@kernel.org, kevin.brodsky@arm.com, lance.yang@linux.dev, 
	Liam.Howlett@oracle.com, linux-arm-kernel@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, lorenzo.stoakes@oracle.com, 
	mhocko@suse.com, npache@redhat.com, pasha.tatashin@soleen.com, 
	rmclure@linux.ibm.com, rppt@kernel.org, surenb@google.com, vbabka@kernel.org, 
	Al Viro <viro@zeniv.linux.org.uk>, ziy@nvidia.com, hannes@cmpxchg.org, shakeel.butt@linux.dev, 
	kernel-team@meta.com
Subject: Re: [PATCH v2 4/4] mm: align file-backed mmap to max folio order in
 thp_get_unmapped_area
Message-ID: <ab1gW5tR6LhX0fQ0@thinkstation>
References: <20260320140315.979307-1-usama.arif@linux.dev>
 <20260320140315.979307-5-usama.arif@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320140315.979307-5-usama.arif@linux.dev>
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

On Fri, Mar 20, 2026 at 06:58:54AM -0700, Usama Arif wrote:
> thp_get_unmapped_area() is the get_unmapped_area callback for
> filesystems like ext4, xfs, and btrfs. It attempts to align the virtual
> address for PMD_SIZE THP mappings, but on arm64 with 64K base pages
> PMD_SIZE is 512M, which is too large for typical shared library mappings,
> so the alignment always fails and falls back to PAGE_SIZE.
> 
> This means shared libraries loaded by ld.so via mmap() get 64K-aligned
> virtual addresses, preventing contpte mapping even when 2M folios are
> allocated with properly aligned file offsets and physical addresses.
> 
> Add a fallback in thp_get_unmapped_area_vmflags() that uses the
> filesystem's mapping_max_folio_size() to determine alignment, capped to
> the mapping length via rounddown_pow_of_two(len). This aligns mappings
> to the largest folio the page cache will actually allocate, without
> over-aligning small mappings.
> 
> The fallback is naturally a no-op for filesystems that don't support
> large folios and skips the retry when the alignment would equal PMD_SIZE
> (already attempted above).
> 
> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> ---
>  mm/huge_memory.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 8e2746ea74adf..4005084c9c65b 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -1242,6 +1242,20 @@ unsigned long thp_get_unmapped_area_vmflags(struct file *filp, unsigned long add
>  	if (ret)
>  		return ret;
>  
> +	if (filp && filp->f_mapping) {
> +		unsigned long max_folio_size =
> +			mapping_max_folio_size(filp->f_mapping);
> +		unsigned long size = rounddown_pow_of_two(len);
> +
> +		size = min(size, max_folio_size);
> +		if (size > PAGE_SIZE && size != PMD_SIZE) {
> +			ret = __thp_get_unmapped_area(filp, addr, len, off,
> +						      flags, size, vm_flags);

Have you considered to integrate inside __thp_get_unmapped_area?

Like, start with PMD_SIZE alignment, then lower to
mapping_max_folio_size if needed and then lower further based on mapping
size.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

