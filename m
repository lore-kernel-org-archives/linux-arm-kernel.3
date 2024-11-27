Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC16D6ACFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 18:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uKIYT7rKv6PknwEgYy9muwh9JDvpu1hdHDE/nY4ndaI=; b=zKhU5jtHScJ59M2JRSz0xE7CGJ
	tJAYz+rL1Uebzrfs/MYjPJAHD9NVi+59hQqULMWCDnIG0jd/Jl6jRqJpdDQAoVLbdRqlvrfHKL2dG
	DiW40aZCsLqcE3wwWASPr1F4WjYvhslJgMHQxM1okOai5RAcoQh/y+Ns7HJQNBB5Oehhr4MBgumA5
	vXtYTvmvDRi8YDo2PThwqCJ7HVeV8a+/i9zGGskgiqNDK+9N6NVG02cRRdcxD7N1hoDKqnxXA49cv
	DMWksXlHNig2VSOtLvfgFf+Kqw/04CEugkUysjEGgLvDNXDGoHEAsgdmHuhpNEA7uhBex4W4cXXcE
	UHpKhlHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGMZK-0000000DoDR-06pY;
	Wed, 27 Nov 2024 18:15:18 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGMYK-0000000Do8s-3tFA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 18:14:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 35656A439A1;
	Wed, 27 Nov 2024 18:12:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B0A7C4CECC;
	Wed, 27 Nov 2024 18:14:14 +0000 (UTC)
Date: Wed, 27 Nov 2024 18:14:11 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yang Shi <yang@os.amperecomputing.com>
Cc: Sasha Levin <sashal@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, David Hildenbrand <david@redhat.com>
Subject: Re: [GIT PULL] arm64 updates for 6.13-rc1
Message-ID: <Z0dhc-DtVsvufv-E@arm.com>
References: <20241118100623.2674026-1-catalin.marinas@arm.com>
 <Z0STR6VLt2MCalnY@sashalap>
 <Z0TLhc3uxa5RnK64@arm.com>
 <0c09425b-c8ba-4ed6-b429-0bce4e7d00e9@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c09425b-c8ba-4ed6-b429-0bce4e7d00e9@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_101417_090844_063810F0 
X-CRM114-Status: GOOD (  28.84  )
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

On Tue, Nov 26, 2024 at 09:41:39AM -0800, Yang Shi wrote:
> On 11/25/24 11:09 AM, Catalin Marinas wrote:
> > On Mon, Nov 25, 2024 at 10:09:59AM -0500, Sasha Levin wrote:
> > > On Mon, Nov 18, 2024 at 10:06:23AM +0000, Catalin Marinas wrote:
> > > >   - MTE: hugetlbfs support and the corresponding kselftests
> > > 
> > > It looks like with the new feature above, LTP manages to trigger the
> > > following warning on linus-next:
> > > 
> > > [  100.133691] hugefork01 (362): drop_caches: 3
> > > tst_hugepage.c:84: TINFO: 2 hugepage(s) reserved
> > > tst_tmpdir.c:316: TINFO: Using /scratch/ltp-CckaqgMrC1/LTP_hug5PSMw8 as tmpdir (ext2/ext3/ext4 filesystem)
> > > tst_test.c:1085: TINFO: Mounting none to /scratch/ltp-CckaqgMrC1/LTP_hug5PSMw8/hugetlbfs fstyp=hugetlbfs flags=0
> > > tst_test.c:1860: TINFO: LTP version: 20240930
> > > tst_test.c:1864: TINFO: Tested kernel: 6.12.0 #1 SMP PREEMPT @1732504538 aarch64
> > > tst_test.c:1703: TINFO: Timeout per run is 0h 02m 30s
> > > <4>[  100.355230] ------------[ cut here ]------------
> > > <4>[  100.356888] WARNING: CPU: 0 PID: 363 at arch/arm64/include/asm/mte.h:58 copy_highpage+0x1d4/0x2d8
> > > <4>[  100.359160] Modules linked in: crct10dif_ce sm3_ce sm3 sha3_ce sha512_ce sha512_arm64 fuse drm backlight ip_tables x_tables
> > > <4>[  100.363578] CPU: 0 UID: 0 PID: 363 Comm: hugefork01 Not tainted 6.12.0 #1
> > > <4>[  100.365113] Hardware name: linux,dummy-virt (DT)
> > > <4>[  100.365966] pstate: 63402009 (nZCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
> > > <4>[  100.366468] pc : copy_highpage+0x1d4/0x2d8
> > > <4>[  100.366780] lr : copy_highpage+0x78/0x2d8
> > > <4>[  100.367090] sp : ffff80008066bb30
> > > <4>[  100.368094] x29: ffff80008066bb30 x28: ffffc1ffc3118000 x27: 0000000000000000
> > > <4>[  100.369341] x26: 0000000000000000 x25: 0000ffff9ce00000 x24: ffffc1ffc3118000
> > > <4>[  100.370223] x23: fff00000c47ff000 x22: fff00000c4fff000 x21: ffffc1ffc3138000
> > > <4>[  100.370739] x20: ffffc1ffc3138000 x19: ffffc1ffc311ffc0 x18: ffffffffffffffff
> > > <4>[  100.371285] x17: 0000000000000000 x16: ffffa302fd05bcb0 x15: 0000ffff9d2fdfff
> > > <4>[  100.372778] x14: 0000000000000000 x13: 1ffe00001859f161 x12: fff00000c2cf8b0c
> > > <4>[  100.374124] x11: ffff80008066bd70 x10: ffffa302fe2a20d0 x9 : ffffa302fb438578
> > > <4>[  100.374877] x8 : ffff80008066ba48 x7 : 0000000000000000 x6 : ffffa302fdbdf000
> > > <4>[  100.376152] x5 : 0000000000000000 x4 : fff00000c2f239c0 x3 : fff00000c33e43f0
> > > <4>[  100.376962] x2 : ffffc1ffc3138000 x1 : 00000000000000f4 x0 : 0000000000000000
> > > <4>[  100.377964] Call trace:
> > > <4>[  100.378736]  copy_highpage+0x1d4/0x2d8 (P)
> > > <4>[  100.379422]  copy_highpage+0x78/0x2d8 (L)
> > > <4>[  100.380272]  copy_user_highpage+0x20/0x48
> > > <4>[  100.380805]  copy_user_large_folio+0x1bc/0x268
> > > <4>[  100.381601]  hugetlb_wp+0x190/0x860
> > > <4>[  100.382031]  hugetlb_fault+0xa28/0xc10
> > > <4>[  100.382911]  handle_mm_fault+0x2a0/0x2c0
> > > <4>[  100.383511]  do_page_fault+0x12c/0x578
> > > <4>[  100.384913]  do_mem_abort+0x4c/0xa8
> > > <4>[  100.385397]  el0_da+0x44/0xb0
> > > <4>[  100.385775]  el0t_64_sync_handler+0xc4/0x138
> > > <4>[  100.386243]  el0t_64_sync+0x198/0x1a0
> > > <4>[  100.388759] ---[ end trace 0000000000000000 ]---
> > 
> > It looks like this can trigger even if the system does not use MTE. The
> > warning was introduced in commit 25c17c4b55de ("hugetlb: arm64: add mte
> > support") and it's supposed to check whether page_mte_tagged() is called
> > on a large folio inadvertently. But in copy_highpage(), if the source is
> > a huge page and untagged, it takes the else path with the
> > page_mte_tagged() check. I think something like below would do but I
> > haven't tried it yet:
> 
> Thanks for investigating this. Yes, it is. The fix looks correct to me.
> 
> > 
> > diff --git a/arch/arm64/mm/copypage.c b/arch/arm64/mm/copypage.c
> > index 87b3f1a25535..ef303a2262c5 100644
> > --- a/arch/arm64/mm/copypage.c
> > +++ b/arch/arm64/mm/copypage.c
> > @@ -30,9 +30,9 @@ void copy_highpage(struct page *to, struct page *from)
> >   	if (!system_supports_mte())
> >   		return;
> > -	if (folio_test_hugetlb(src) &&
> > -	    folio_test_hugetlb_mte_tagged(src)) {
> > -		if (!folio_try_hugetlb_mte_tagging(dst))
> > +	if (folio_test_hugetlb(src)) {
> > +		if (!folio_test_hugetlb_mte_tagged(src) ||
> > +		    !folio_try_hugetlb_mte_tagging(dst))
> >   			return;
> >   		/*

I wonder why we had a 'return' here originally rather than a
WARN_ON_ONCE() as we do further down for the page case. Do you seen any
issue with the hunk below? Destination should be a new folio and not
tagged yet:

diff --git a/arch/arm64/mm/copypage.c b/arch/arm64/mm/copypage.c
index 87b3f1a25535..cc7dfbea1304 100644
--- a/arch/arm64/mm/copypage.c
+++ b/arch/arm64/mm/copypage.c
@@ -30,11 +30,12 @@ void copy_highpage(struct page *to, struct page *from)
 	if (!system_supports_mte())
 		return;

-	if (folio_test_hugetlb(src) &&
-	    folio_test_hugetlb_mte_tagged(src)) {
-		if (!folio_try_hugetlb_mte_tagging(dst))
+	if (folio_test_hugetlb(src)) {
+		if (!folio_test_hugetlb_mte_tagged(src))
 			return;

+		WARN_ON_ONCE(!folio_try_hugetlb_mte_tagging(dst));
+
 		/*
 		 * Populate tags for all subpages.
 		 *

-- 
Catalin

