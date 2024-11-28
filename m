Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD79D69113
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 14:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bnCyljJ7dhyaP5/cLtHjigUU9d04TSsN1IwEINfKu8w=; b=mSunLhhi42K5sXngqqEOlHt/jY
	AuQ3BlVAlyo5JDNawHAkLH5Il48OTRLrYOMvd8fo3exLTeB/TEaq6P9It8t+B3Wj6NsAzJkXw3QUu
	N7/+SIklXYj0DCEvDhw9MTtLUOsHk6RESFb3hQslxhuUy8DbeSLGQiL6o/VUC5dhFhDrMik2ka3Wd
	aGspUntAE9ZahEJy6khpia1Ep+zUL/f4lNtLHElOTibE/Mrais9w5WnoF9XDWdEorCW2Hy0fsKkQ0
	Xn7jxY1YVRYLv9AmIHu+k7hlMDi+FHfYyn97Jc5jtCUSzZp9q6GSeHIjSzqbMXXjxyFj+ULVbcFZP
	0aZ5BfLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGfIQ-0000000FjfW-47eq;
	Thu, 28 Nov 2024 14:15:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGfFn-0000000Fj8N-0gac
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 14:12:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5EA725C2753;
	Thu, 28 Nov 2024 14:11:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02414C4CECE;
	Thu, 28 Nov 2024 14:12:20 +0000 (UTC)
Date: Thu, 28 Nov 2024 14:12:18 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yang Shi <yang@os.amperecomputing.com>
Cc: Sasha Levin <sashal@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, David Hildenbrand <david@redhat.com>
Subject: Re: [GIT PULL] arm64 updates for 6.13-rc1
Message-ID: <Z0h6Qtleb-znhX3u@arm.com>
References: <20241118100623.2674026-1-catalin.marinas@arm.com>
 <Z0STR6VLt2MCalnY@sashalap>
 <Z0TLhc3uxa5RnK64@arm.com>
 <0c09425b-c8ba-4ed6-b429-0bce4e7d00e9@os.amperecomputing.com>
 <Z0dhc-DtVsvufv-E@arm.com>
 <dc5e8809-825f-4c38-b487-b16c7d516311@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc5e8809-825f-4c38-b487-b16c7d516311@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_061223_240817_5E5F2D02 
X-CRM114-Status: GOOD (  18.32  )
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

On Wed, Nov 27, 2024 at 05:21:37PM -0800, Yang Shi wrote:
> > > diff --git a/arch/arm64/mm/copypage.c b/arch/arm64/mm/copypage.c
> > > index 87b3f1a25535..ef303a2262c5 100644
> > > --- a/arch/arm64/mm/copypage.c
> > > +++ b/arch/arm64/mm/copypage.c
> > > @@ -30,9 +30,9 @@ void copy_highpage(struct page *to, struct page *from)
> > >    	if (!system_supports_mte())
> > >    		return;
> > > -	if (folio_test_hugetlb(src) &&
> > > -	    folio_test_hugetlb_mte_tagged(src)) {
> > > -		if (!folio_try_hugetlb_mte_tagging(dst))
> > > +	if (folio_test_hugetlb(src)) {
> > > +		if (!folio_test_hugetlb_mte_tagged(src) ||
> > > +		    !folio_try_hugetlb_mte_tagging(dst))
> > >    			return;
> > >    		/*
> > I wonder why we had a 'return' here originally rather than a
> > WARN_ON_ONCE() as we do further down for the page case. Do you seen any
> > issue with the hunk below? Destination should be a new folio and not
> > tagged yet:
> 
> Yes, I did see problem. Because we copy tags for all sub pages then set
> folio mte tagged when copying the data for the first subpage. The warning
> will be triggered when we copy the second subpage.

Ah, good point, copy_highpage() will be called multiple times for each
subpage but we only do the copying once for the folio.

Now, I wonder whether we should actually defer the tag copying until
copy_page() is called on the head page. This way we can keep the warning
for consistency with the non-compound page case:

diff --git a/arch/arm64/mm/copypage.c b/arch/arm64/mm/copypage.c
index 87b3f1a25535..a86c897017df 100644
--- a/arch/arm64/mm/copypage.c
+++ b/arch/arm64/mm/copypage.c
@@ -30,11 +30,13 @@ void copy_highpage(struct page *to, struct page *from)
 	if (!system_supports_mte())
 		return;
 
-	if (folio_test_hugetlb(src) &&
-	    folio_test_hugetlb_mte_tagged(src)) {
-		if (!folio_try_hugetlb_mte_tagging(dst))
+	if (folio_test_hugetlb(src)) {
+		if (!folio_test_hugetlb_mte_tagged(src) ||
+		    from != folio_page(src, 0))
 			return;
 
+		WARN_ON_ONCE(!folio_try_hugetlb_mte_tagging(dst));
+
 		/*
 		 * Populate tags for all subpages.
 		 *

-- 
Catalin

