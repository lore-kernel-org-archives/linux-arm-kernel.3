Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 628F7E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 15:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fftRTfTxHeYafQTyZecclpBMJ843Wy2eQxCYtRD556k=; b=KDLUuMFenQavlVA/IQSO+wwTnC
	QFrx33ByoTvkn2DvqneAjS95JTDUQspsA0fkLR1B2306Qv3vdfmD3d/1iUpVmjK5qmrKUAUNmovYs
	PiVDVpK7EJ4DDoOrNI5rCcxmqlYGuq1BZb7vu5a4HXo/ZLkM7gR4F+44xkAHrf6orr1poE5OjXi1A
	a6BTUo2l/2MZVVKrSiiZCGPElcY2cITXYQp4+hvjHD94Iwn3itGbDeg2sEeH9c3KMjfgjF6RxWxKy
	8asxDhrCdRVf4iU1ddX3EKIKm03XlgMEkQiGWHKFha43RIwRTEqEKd11t5Ju7U8V1mHbleXbqL067
	RfKrnqKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrf2-0000000D3Up-2teG;
	Wed, 04 Dec 2024 15:51:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrds-0000000D3K9-2DuK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 15:50:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F08545C6E51;
	Wed,  4 Dec 2024 15:49:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CA2CC4CECD;
	Wed,  4 Dec 2024 15:50:18 +0000 (UTC)
Date: Wed, 4 Dec 2024 15:50:16 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: David Hildenbrand <david@redhat.com>
Cc: Yang Shi <yang@os.amperecomputing.com>, Sasha Levin <sashal@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] arm64 updates for 6.13-rc1
Message-ID: <Z1B6OMqEZitgBVEx@arm.com>
References: <20241118100623.2674026-1-catalin.marinas@arm.com>
 <Z0STR6VLt2MCalnY@sashalap>
 <Z0TLhc3uxa5RnK64@arm.com>
 <0c09425b-c8ba-4ed6-b429-0bce4e7d00e9@os.amperecomputing.com>
 <Z0dhc-DtVsvufv-E@arm.com>
 <dc5e8809-825f-4c38-b487-b16c7d516311@os.amperecomputing.com>
 <e6b3e6c7-193d-43c4-a8c6-6023458723dd@redhat.com>
 <6aec1d44-4a89-4acf-a16b-4493626b93bb@os.amperecomputing.com>
 <Z1B1VS8PayXsXDzl@arm.com>
 <4919faec-3e35-459f-a7d3-b5b3f188bd9c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4919faec-3e35-459f-a7d3-b5b3f188bd9c@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_075020_657584_7E3B4140 
X-CRM114-Status: GOOD (  39.64  )
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

On Wed, Dec 04, 2024 at 04:32:11PM +0100, David Hildenbrand wrote:
> On 04.12.24 16:29, Catalin Marinas wrote:
> > On Mon, Dec 02, 2024 at 08:22:57AM -0800, Yang Shi wrote:
> > > On 11/28/24 1:56 AM, David Hildenbrand wrote:
> > > > On 28.11.24 02:21, Yang Shi wrote:
> > > > > > > diff --git a/arch/arm64/mm/copypage.c b/arch/arm64/mm/copypage.c
> > > > > > > index 87b3f1a25535..ef303a2262c5 100644
> > > > > > > --- a/arch/arm64/mm/copypage.c
> > > > > > > +++ b/arch/arm64/mm/copypage.c
> > > > > > > @@ -30,9 +30,9 @@ void copy_highpage(struct page *to, struct
> > > > > > > page *from)
> > > > > > >          if (!system_supports_mte())
> > > > > > >              return;
> > > > > > > -    if (folio_test_hugetlb(src) &&
> > > > > > > -        folio_test_hugetlb_mte_tagged(src)) {
> > > > > > > -        if (!folio_try_hugetlb_mte_tagging(dst))
> > > > > > > +    if (folio_test_hugetlb(src)) {
> > > > > > > +        if (!folio_test_hugetlb_mte_tagged(src) ||
> > > > > > > +            !folio_try_hugetlb_mte_tagging(dst))
> > > > > > >                  return;
> > > > > > >              /*
> > > > > > I wonder why we had a 'return' here originally rather than a
> > > > > > WARN_ON_ONCE() as we do further down for the page case. Do you seen any
> > > > > > issue with the hunk below? Destination should be a new folio and not
> > > > > > tagged yet:
> > > > > 
> > > > > Yes, I did see problem. Because we copy tags for all sub pages then set
> > > > > folio mte tagged when copying the data for the first subpage. The
> > > > > warning will be triggered when we copy the second subpage.
> > > > 
> > > > It's rather weird, though. We're instructed to copy a single page, yet
> > > > copy tags for all pages.
> > > > 
> > > > This really only makes sense when called from folio_copy(), where we are
> > > > guaranteed to copy all pages.
> > > > 
> > > > I'm starting to wonder if we should be able to hook into / overload
> > > > folio_copy() instead, to just handle the complete hugetlb copy ourselves
> > > > in one shot, and assume that copy_highpage() will never be called for
> > > > hugetlb pages (WARN and don't copy tags).
> > > 
> > > Actually folio_copy() is just called by migration. Copy huge page in CoW is
> > > more complicated and uses copy_user_highpage()->copy_highpage() instead of
> > > folio_copy(). It may start the page copy from any subpage. For example, if
> > > the CoW is triggered by accessing to the address in the middle of 2M. Kernel
> > > may copy the second half first then the first half to guarantee the accessed
> > > data in cache.
> > 
> > Still trying to understand the possible call paths here. If we get a
> > write fault on a large folio, does the core code allocate a folio of the
> > same size for CoW or it starts with smaller ones? wp_page_copy()
> > allocates order 0 AFAICT, though if it was a pmd fault, it takes a
> > different path in handle_mm_fault(). But we also have huge pages using
> > contiguous ptes.
> > 
> > Unless the source and destinations folios are exactly the same size, it
> > will break many assumptions in the code above. Going the other way
> > around is also wrong, dst larger than src, we are not initialising the
> > whole dst folio.
> > 
> > Maybe going back to per-page PG_mte_tagged flag rather than per-folio
> > would keep things simple, less risk of wrong assumptions.
> 
> I think the magic bit here is that for hugetlb, we only get hugetlb folios
> of the same size, and no mixtures.

Ah, ok, we do check for this and only do the advance copy for hugetlb
folios. I'd add a check for folio size just in case, something like
below (I'll add some description and post it properly):

diff --git a/arch/arm64/mm/copypage.c b/arch/arm64/mm/copypage.c
index 87b3f1a25535..c3a83db46ec6 100644
--- a/arch/arm64/mm/copypage.c
+++ b/arch/arm64/mm/copypage.c
@@ -30,11 +30,14 @@ void copy_highpage(struct page *to, struct page *from)
 	if (!system_supports_mte())
 		return;
 
-	if (folio_test_hugetlb(src) &&
-	    folio_test_hugetlb_mte_tagged(src)) {
-		if (!folio_try_hugetlb_mte_tagging(dst))
+	if (folio_test_hugetlb(src)) {
+		if (!folio_test_hugetlb_mte_tagged(src) ||
+		    from != folio_page(src, 0) ||
+		    WARN_ON_ONCE(folio_nr_pages(src) != folio_nr_pages(dst)))
 			return;
 
+		WARN_ON_ONCE(!folio_try_hugetlb_mte_tagging(dst));
+
 		/*
 		 * Populate tags for all subpages.
 		 *

-- 
Catalin

