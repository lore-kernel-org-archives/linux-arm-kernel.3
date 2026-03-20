Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BC6109878D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 14:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5VKdw+yKwau3ZpdTOpfP1S0YqtMPTBn1RCFHO+88xgM=; b=lH8VI7bv56HUIm340HhrZJnA+1
	XOqSLz/1i9PtDQqSjabOE+wxCZY0sKvJDXjY2E9V2GoO4ZHkq2xMEOTPHeIWTSvEhcWdWiSqJn1+V
	p68TN5tazrBjawPQeaAB+18RLG3CXzI70Sf1cdgVDkVzkYC/2Q4t0CBix8AxRM5Q4LCzUKMfxii3J
	ToCv7U6KT+RoiQNf86wntqRXFxumO2NHevPZShy90js7KKTPKMaRA5JXMV/iXJyWvPkBzcukpK6S0
	8MYfeyT2injOXSVGrL2xt3UdAXxiI+yU21k2LYL3J964b4AFxG88Ul3XvlCSOVKS3X+6ghM2h5Kph
	IPOR4N9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3b2m-0000000Cx9a-14vk;
	Fri, 20 Mar 2026 14:41:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3b2j-0000000Cx9D-3NVY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 14:41:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E54440655;
	Fri, 20 Mar 2026 14:41:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A0D4C4AF09;
	Fri, 20 Mar 2026 14:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774017699;
	bh=MleXr4rMQyGrNTxmnpL0OE9WPCRqySChIwPXxidm8Ck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gq6vlD79vHeXVLRrDSlXpFcIaooTe1gQEOS9G+vxKvB2xy/bu2aGuVdke+R9e8cct
	 gLy//h1i4t9ddNZMYOlmc1/4aXgQ8Z7FmHVwn2mdODtHHcYUjBUDbvhC5UARRGm6Xn
	 yMZfTO8i2GcnFL2GQJCnRV8gGdhTSXK9baASFvgiZ8aNpA3QM0TiPaHnDHTdYoyJmq
	 S6qXxWNTAIn1dhkOlXGJ7q/K581rghQ5yEGMnJA/hr4jFldOVfptbcSIX4US+jjLdN
	 OBHD9BbCCiwpMZ4QFY49wHolDjfohcQxZA5uC1Ot6bF5RFRc2esOwDAcl5aOANLhFb
	 yTM9ihfiAVljQ==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 58B0CF4006A;
	Fri, 20 Mar 2026 10:41:37 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 20 Mar 2026 10:41:37 -0400
X-ME-Sender: <xms:oVy9aVSEswKdaaR8aGXLwLX9Mrnm1MTZr6GqsIHJQZjvsPwvM2DHSQ>
    <xme:oVy9aRC1LkmFVQAmC4-0l8Aubu1iP6kXsJbODn6SSK7JpWTvPvq51uBxVY95aeKtt
    lYrDg-DyfGiq5DDzQ8FI1sffcI6lwvAPvFYwgrIKNBh54VbK2PZfw0>
X-ME-Received: <xmr:oVy9aYfWs9mAA8ehLGvEZl9-PdQX0bTxs20Hn9jARCmhuwrlwqffoRjCwII-dA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefuddtudejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhepueeijeeiffekheeffffftdekleefleehhfefhfduheejhedvffeluedvudefgfek
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
    hilhhlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheeh
    qddvkeeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrd
    hnrghmvgdpnhgspghrtghpthhtohepjedvpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehushgrmhgrrdgrrhhifheslhhinhhugidruggvvhdprhgtphhtthhopegrkhhpmh
    eslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepuggrvhhiuges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihilhhlhiesihhnfhhrrgguvggrugdroh
    hrghdprhgtphhtthhopehrhigrnhdrrhhosggvrhhtshesrghrmhdrtghomhdprhgtphht
    thhopehlihhnuhigqdhmmheskhhvrggtkhdrohhrghdprhgtphhtthhopehrsehhvghvrd
    gttgdprhgtphhtthhopehjrggtkhesshhushgvrdgtiidprhgtphhtthhopegrjhgusehl
    ihhnuhigrdhisghmrdgtohhm
X-ME-Proxy: <xmx:oVy9aZ4PfLz1Ly6pHlacfHEwjHAP5YtItZ7H2jIC6jrP07jYH_qfsA>
    <xmx:oVy9afdMIA-OHh05bUUKj1s-fmi2GZwD1EfHX8oIHJ9RTxOriHAjjA>
    <xmx:oVy9aYNrQtOYagLdKvAlD3DnuEvEOtvGa2jmiWvOANLHXkLOix9QzQ>
    <xmx:oVy9abHde3Ce_3zuX6me7rTAicDjXXRpGwtLXbtdiJUGMqLuD6hcQQ>
    <xmx:oVy9abbdy3hceuMozJKr_dvhhLy8WJo_jua5CnWxzHG0f4dc8nfLQK4A>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Mar 2026 10:41:34 -0400 (EDT)
Date: Fri, 20 Mar 2026 14:41:30 +0000
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
	Al Viro <viro@zeniv.linux.org.uk>, wilts@infradead.org, ziy@nvidia.com, hannes@cmpxchg.org, 
	shakeel.butt@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v2 2/4] mm: replace exec_folio_order() with generic
 preferred_exec_order()
Message-ID: <ab1ZopAY7JCUOYvr@thinkstation>
References: <20260320140315.979307-1-usama.arif@linux.dev>
 <20260320140315.979307-3-usama.arif@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320140315.979307-3-usama.arif@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_074141_883574_DCC7926D 
X-CRM114-Status: GOOD (  13.49  )
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

On Fri, Mar 20, 2026 at 06:58:52AM -0700, Usama Arif wrote:
> + *   allocations when memory is tight.
> + */
> +static unsigned int preferred_exec_order(struct vm_area_struct *vma)
> +{
> +	int order;
> +	unsigned long vma_len = vma_pages(vma);
> +	struct zone *zone;
> +	gfp_t gfp;
> +
> +	if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
> +		return 0;
> +
> +	/* Cap at min(PMD_ORDER, 2M) */
> +	order = min(HPAGE_PMD_ORDER, ilog2(SZ_2M >> PAGE_SHIFT));
> +
> +	/* Don't request folios larger than the VMA */
> +	order = min(order, ilog2(vma_len));
> +
> +	/* Step down under memory pressure */
> +	gfp = mapping_gfp_mask(vma->vm_file->f_mapping);
> +	zone = first_zones_zonelist(node_zonelist(numa_node_id(), gfp),
> +				    gfp_zone(gfp), NULL)->zone;
> +	if (zone) {
> +		while (order > 0 &&
> +		       !zone_watermark_ok(zone, order,
> +					  high_wmark_pages(zone), 0, 0))
> +			order--;
> +	}

Eww. That's overkill and layering violation.

If we need something like this, it has to be do within page allocator:
an allocation interface that takes a range (or mask) of acceptable
order.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

