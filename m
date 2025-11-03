Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0239CCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 13:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3l1oHecGlpNpSZOR6dOjzbo00UCNKjOaXvRkPwiEvSo=; b=ES132fRl2pPG3hIWPX75XdzQ8+
	kxiWezPGobGGZxMQeTDHw38LgOWtvF6pKw68NFEV7D4arTW661EMGH50e8zlzy+EHZyYe3VzBNhNa
	/VR+ibK0mP2WZcwmlffjS7cjxShMvF9erqbL2nQXmJf6W5QaJPjqQFZWg6MgMGK0oTX1ZnxgvRzIH
	DoAQoh7C3QLlk8BlssWmIzkXs4cg2O3RntiXeKJuxYBOujXwxniV8dr7bfhf9jC/EBVy6k9mS27Tx
	xAWlhJyoxEwS5gpbZWnRlJBaMwVzheEIaCXtlm2a0/larr7YqgbW6XnjxUIrSBnJdXXi8UKB2pFUN
	8J/PzhSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFufx-00000009tdR-3kOn;
	Mon, 03 Nov 2025 13:32:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFufu-00000009td2-42lD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 13:32:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ADB90417B0;
	Mon,  3 Nov 2025 13:32:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B2BBC113D0;
	Mon,  3 Nov 2025 13:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762176765;
	bh=rv5IOYmAi9gffnN3PWIBCsFc9IzI9PzRnuUE+GpwrQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Icl6eF75jY80ayW75IoZ0+LaPiPi2EcEgn13Ycd69S2hVI2xar7gCviAMLxOeSJXf
	 GM6OXzXYvbzUIkLAxOFnoRp0A34f7TykgQJyW9q63ZZbrinhKCvq31c/jwUYw4H7kL
	 O736gPg0odgIdTIHBw1WTAJnptmFtT5qer3mfGeZgE8KlOLxH6u0/ehNdXJUNUPN01
	 kSrXRcKNOimokj5fhuwid3rYkYiteka7WzdG+2pVwmBHrUu8iy8QjjoVxzoynZLTVO
	 d7k1b1LcQKs7sEf2/ddXpwpyF27u83//ZaJkf7s9iFyYf8GyfYxIx9/RwH8UgJcPse
	 0dvcB+RZyVmZw==
Date: Mon, 3 Nov 2025 13:32:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Will Deacon <will@kernel.org>, Aishwarya.TCV@arm.com
Subject: Re: [PATCH] mm/huge_memory: Initialise the tags of the huge zero
 folio
Message-ID: <aQiu-hU3x5V5drHF@finisterre.sirena.org.uk>
References: <20251031170133.280742-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="W9aQpuovxYTKD7ef"
Content-Disposition: inline
In-Reply-To: <20251031170133.280742-1-catalin.marinas@arm.com>
X-Cookie: news: gotcha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_053247_051459_3CC0D882 
X-CRM114-Status: GOOD (  15.15  )
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


--W9aQpuovxYTKD7ef
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 31, 2025 at 04:57:50PM +0000, Catalin Marinas wrote:

> On arm64 with MTE enabled, a page mapped as Normal Tagged (PROT_MTE) in
> user space will need to have its allocation tags initialised. This is
> normally done in the arm64 set_pte_at() after checking the memory
> attributes. Such page is also marked with the PG_mte_tagged flag to
> avoid subsequent clearing. Since this relies on having a struct page,
> pte_special() mappings are ignored.

We are seeing breakage in userspace on a range of arm64 platforms which
bisects to this commit in -next.  We see traces like:

[   59.746701] Internal error: Oops - Undefined instruction: 0000000002000000 [#1]  SMP

...

[   59.819007] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   59.826055] pc : mte_zero_clear_page_tags+0x1c/0x40
[   59.830980] lr : tag_clear_highpage+0x68/0x118

...

[   59.911874] Call trace:
[   59.914333]  mte_zero_clear_page_tags+0x1c/0x40 (P)
[   59.919278]  get_page_from_freelist+0x1a60/0x1c80
[   59.924042]  __alloc_frozen_pages_noprof+0x178/0xd20
[   59.929068]  alloc_pages_mpol+0xb4/0x1a4
[   59.933022]  alloc_frozen_pages_noprof+0x48/0xc0
[   59.937683]  folio_alloc_noprof+0x14/0x68
[   59.941718]  mm_get_huge_zero_folio+0xf4/0x30c
[   59.946200]  do_huge_pmd_anonymous_page+0x278/0x6a0
[   59.951119]  __handle_mm_fault+0x700/0x1834
[   59.955332]  handle_mm_fault+0x8c/0x2a0
[   59.959190]  do_page_fault+0x108/0x75c
[   59.962964]  do_translation_fault+0x5c/0x6c
[   59.967181]  do_mem_abort+0x40/0x90

Looking at the codes:

> -       zero_folio = folio_alloc((GFP_TRANSHUGE | __GFP_ZERO) & ~__GFP_MOVABLE,
> +       zero_folio = folio_alloc((GFP_TRANSHUGE | __GFP_ZERO | __GFP_ZEROTAGS) &
> +                                ~__GFP_MOVABLE,
>                         HPAGE_PMD_ORDER);

This adds an unonditional __GFP_ZEROTAGS - from a quick scan it looks
like this was previously only enabled by vma_alloc_zeroed_movable_folio()
when the VMA has VM_MTE, I think we need a similar test here.

Full log:

   https://lava.sirena.org.uk/scheduler/job/2036941#L1423

Sample bisect log (with links to further runtime logs:

# bad: [3575af345aa2424636e69ac101a568bda249abe6] Merge branch 'i2c/i2c-host-fixes' of https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git
# good: [6146a0f1dfae5d37442a9ddcba012add260bceb0] Linux 6.18-rc4
git bisect start '3575af345aa2424636e69ac101a568bda249abe6' '6146a0f1dfae5d37442a9ddcba012add260bceb0'
# test job: [3575af345aa2424636e69ac101a568bda249abe6] https://lava.sirena.org.uk/scheduler/job/2036941
# bad: [3575af345aa2424636e69ac101a568bda249abe6] Merge branch 'i2c/i2c-host-fixes' of https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git
git bisect bad 3575af345aa2424636e69ac101a568bda249abe6
# test job: [81f07f151b0759666fee3184651aab90ef1c5ed5] https://lava.sirena.org.uk/scheduler/job/2037418
# bad: [81f07f151b0759666fee3184651aab90ef1c5ed5] Merge branch 'usb-linus' of https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git
git bisect bad 81f07f151b0759666fee3184651aab90ef1c5ed5
# test job: [661821dc41b20c505d5adad10bb71fe5746c57fb] https://lava.sirena.org.uk/scheduler/job/2037588
# bad: [661821dc41b20c505d5adad10bb71fe5746c57fb] Merge branch 'fixes' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git
git bisect bad 661821dc41b20c505d5adad10bb71fe5746c57fb
# test job: [972cbfc499182c200bd3d2fb8fe4173df0d4d3e7] https://lava.sirena.org.uk/scheduler/job/2037773
# bad: [972cbfc499182c200bd3d2fb8fe4173df0d4d3e7] mm/huge_memory: initialise the tags of the huge zero folio
git bisect bad 972cbfc499182c200bd3d2fb8fe4173df0d4d3e7
# test job: [6923ff319e1b0d3541cd240b6ed494e1cb6287d1] https://lava.sirena.org.uk/scheduler/job/2037885
# good: [6923ff319e1b0d3541cd240b6ed494e1cb6287d1] fs/proc: fix uaf in proc_readdir_de()
git bisect good 6923ff319e1b0d3541cd240b6ed494e1cb6287d1
# test job: [e356021a7589f6dd1c946b86c933462dca0bc1ec] https://lava.sirena.org.uk/scheduler/job/2037973
# good: [e356021a7589f6dd1c946b86c933462dca0bc1ec] codetag: debug: handle existing CODETAG_EMPTY in mark_objexts_empty for slabobj_ext
git bisect good e356021a7589f6dd1c946b86c933462dca0bc1ec
# test job: [decb83d6239894a14b07c8f5ebf9feb5c87ec651] https://lava.sirena.org.uk/scheduler/job/2038008
# good: [decb83d6239894a14b07c8f5ebf9feb5c87ec651] mm/damon/sysfs: change next_update_jiffies to a global variable
git bisect good decb83d6239894a14b07c8f5ebf9feb5c87ec651
# test job: [53cf2716958490997b8ce11cc4665256905b23dd] https://lava.sirena.org.uk/scheduler/job/2038076
# good: [53cf2716958490997b8ce11cc4665256905b23dd] nilfs2: avoid having an active sc_timer before freeing sci
git bisect good 53cf2716958490997b8ce11cc4665256905b23dd
# first bad commit: [972cbfc499182c200bd3d2fb8fe4173df0d4d3e7] mm/huge_memory: initialise the tags of the huge zero folio

--W9aQpuovxYTKD7ef
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkIrvkACgkQJNaLcl1U
h9DhLQf7BoAYx4bPh8mue63qcZgpM2Id1rQlCGH5fqtgH8QCKKanNo/GxHUXLrK2
ENTCk8/ysVGuUjeRRAvgO+3q0MCOu89oKZXTq+N0mmsODdcj2AkfsYgeKVv9dQpi
Re1/brRZ7sUTOLBfKzfzOcCaOqyE+w7aO7pUGnrop8Zx1g7cNXcfSBPLjtytd5F9
M/3Gr40H+YEUmq0r6wDp5xn3X8tzA+GkRkfNL51Kv/sM8/XJTbxzQ9c0G5nW0cC0
B4yUxKJVKT3wRF/svVwxZwgbRMXXbbjhkq2LvAw9p1k3xFonFxViUNWTn16UsoeX
RfH4WuDp6M/sDmsAQ+BTDVx8Bl1feA==
=qRZL
-----END PGP SIGNATURE-----

--W9aQpuovxYTKD7ef--

