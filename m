Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C733C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 10:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SGc4wLtrcKFcbhoINTj74T+3qOdK6ANKsLr4fj0Hk3A=; b=D03pmk3IrJrm5+4UPagWQd3/NR
	xZ3LYgoP6ho3DOo7ka9XjMWGWJqtdTb08+/mSRy/KQ6Wxzrr9L0yaQGUx0m30T86zrb9W7qxAvSvy
	Cswq221bgPt0EtvdU0IFAVDUwvel6COzxbu2RjOiATrTb4LcqdZnJsuhgwR+7R6se6Uf2VxDKfAFC
	1Qma4iHwkdzfxdKXK33eP3qUFHpA5WoOGlI8yw95AfcON8bD3Rl9IZ6A6J9bfcqzXCfylUkgcNGS1
	P+cve7jf7CtYrCq4O4YruRdfvDElswhzqhk+na2GEkhbqtAYmMGAY44+FJv3csL1NkZtcNCtlUy98
	hyWExARw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwyd-0000000ETRi-0IeX;
	Wed, 15 Jul 2026 10:36:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwyb-0000000ETRZ-45JJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 10:36:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4A83843D34;
	Wed, 15 Jul 2026 10:36:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B46D1F000E9;
	Wed, 15 Jul 2026 10:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784111789;
	bh=SGc4wLtrcKFcbhoINTj74T+3qOdK6ANKsLr4fj0Hk3A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ne67WCauJp+fQiewWjzyh6/0niE6s1/e8+W+KH+ij23kp21DgT+JyYj9szpQItpWz
	 EoxQDrPTyc+MAz2HnB9Oh3GOSAADRGF0swK6gOVyARTCtMbTnmsWQkBOc2paEjNzZD
	 PfM293ve8WxDnKc0Z4PYtgF/9XHIxXVmAoY3WwZ71f8QVnLwkdhPlencxY/W3wQcCK
	 /4HwH2WHq4cMS+iSf/z7/7XTlxzdSh3c7wkkKR9ckbafAoZZFEmmjqx6Ogd4hRaBgZ
	 5BbB61yYAK4sU/LvtVQUYooZlki1NxEuGUTlsdtZDSsoaT0j/hz9VmN44Jfa4+4T5H
	 e1sK+XHx+WxMg==
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id 66559F40066;
	Wed, 15 Jul 2026 06:36:27 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Wed, 15 Jul 2026 06:36:27 -0400
X-ME-Sender: <xms:q2JXasIcTK87tj0M0Ic5UFNoiOPAF3NQ_Dk0NQ4OKwV6DbMdgZB89g>
    <xme:q2JXapsfnLe82cce_X9YNZ32UrazxLJ7ljJyH0VqgC0vnzqBoF0dHsCxavnczcawL
    jFuMR93yj_XY2XQaeP326wrnJhbGuq3ok_pqQmiW88iRMuljNFRwm0>
X-ME-Received: <xmr:q2JXaluvJMyCEaUSGr9WrIdcYatWNe0w3oVo2l1GGmGg4Bv0sxlCqr6a50qEkg>
X-ME-Proxy-Cause: dmFkZTFoH2pQZa2MB7F8P1KNkzYrZ2FYupTRLNJuIuUdKMkzQz8rOl/YdOFBjeV64/eFiz
    grneVbhOZ/mzsgLWmb97Z2MXlENOxDXRl0cjegtXKlxj7YYlu4P2rypydA+jQG17m5ZjrR
    uLA1BH2IYxm64puaRDdrEUMLMhexkcckKs1sEKyml2zpBfIOSacHHPCSa4mrPwXtsA2S2d
    n0AJWgO4Aw1zfMMWmrVVxIux3bA1rGhvs7yymGF6naIGts5DplcBRYFDrF2cdeaP8bZG8h
    uqCwtISn/RjBCphxWoCiq60O2Gpp2nzA6uqQaHx3NgXSiS8IQjohJzFr1kWpEVdFieI5W+
    zSj+F2tRIKbdZ2G88GOn9AR08ypKHMcQnabYwnXiXOn5vdgj+TTtPEjU77Mr2BjBI6Urjw
    1vmC7n/u6OnMBgowj8zJPICTT4s5l+RuxGFGLXG0NLSHoz4timfc4hGSlksoUVvKCK3QUn
    RativehZ1FvH6M7cZDGxQzTgn3rOMiMnL7PWTwdxApBc83z7CgVqOahJ9cYkPoN2O0N7no
    Uk56UlfKVpn5B5rZ9K92JX11zIjWvcbS3QkUU2KCY1FkHuzb23XDwrGqdb2unwf6VuN9av
    S+AKROKDhvXXTxODKw/rsrmVUYvXwVOH78t1sU2BP4CBslU/925LAlXUL9+w
X-ME-Proxy: <xmx:q2JXakRIMffs8qDUs1mdoH-Go4g25NPKMZ_CN2_PaPuJC3KlAtmQqA>
    <xmx:q2JXat3vrR8eDZNO3tneFiN4zykuaM5Xu5mh8hrWNr55hWX2ztia6Q>
    <xmx:q2JXarO16LV0vMtw1_LPC551Fv11Wz-CIgkMvyOHqYsQFcK4IsisiQ>
    <xmx:q2JXagMG8AUv0D_wEPFu-w5uJ9gEPBmFmz4nKLWwwieLVmfSPPO5kA>
    <xmx:q2JXajnknuqqU4lS55abKbdlbfEbUvoPKP6YacJirxQNOwdPPCl1Zs4U>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jul 2026 06:36:26 -0400 (EDT)
Date: Wed, 15 Jul 2026 11:36:25 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Uladzislau Rezki <urezki@gmail.com>, Toshi Kani <toshi.kani@hpe.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Dev Jain <dev.jain@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	David Carlier <devnexen@gmail.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH mm-hotfixes v3 3/4] mm/ptdump: always stabilise against
 page table freeing using init_mm
Message-ID: <aldim43Nu5sREkDP@thinkstation>
References: <20260714-series-vmap-race-fix-v3-0-b812eccfa0f9@kernel.org>
 <20260714-series-vmap-race-fix-v3-3-b812eccfa0f9@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714-series-vmap-race-fix-v3-3-b812eccfa0f9@kernel.org>
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

On Tue, Jul 14, 2026 at 06:24:25PM +0100, Lorenzo Stoakes wrote:
> Previous commits have established the invariant that kernel page table
> freeing is performed while an mmap read lock on init_mm is held, which
> fixes races between ptdump and kernel page table freeing over init_mm.
> 
> However, x86 and arm64 can perform a ptdump over an mm other than init_mm
> via ptdump_walk_pgd() and since kernel memory ranges are shared across
> non-kernel mm's, this means that the race still exists for these cases.
> 
> Fix this by acquiring a nested mmap write lock for init_mm in
> ptdump_walk_pgd().
> 
> This is safe as we take this after mmap write locking the mm, and nothing
> acquires the init_mm lock first before locking an arbitrary mm, so no
> deadlock is possible.
> 
> Also update walk_page_range_debug() to assert that init_mm is write locked,
> add a comment explaining why and remove some redundant code, and eliminate
> the unnecessary and confusing invocation of walk_kernel_page_table_range().
> 
> We can safely remove the non-NULL check for walk.mm, as the mmap lock
> asserts would NULL pointer deref if it was (and of course no callers do
> this).
> 
> The first point at which ptdump can race kernel page table freeing is
> commit b6bdb7517c3d ("mm/vmalloc: add interfaces to free unmapped page
> table"), so we target this in the Fixes tag.
> 
> Fixes: b6bdb7517c3d ("mm/vmalloc: add interfaces to free unmapped page table")
> Cc: stable@vger.kernel.org
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>

Reviewed-by: Kiryl Shutsemau <kas@kernel.org>

Thanks!

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

