Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A05606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 13:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=woMshQMy;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MdBGF8Iy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9m/I1RoZLvF6ehI7aCwLnUGlQK9U6ng9p3EUpENngvw=; b=woMshQMytv0liCXGlZ8PGdcudL
	SiicPCVJaCu0PkdWkc937kmROVB+o1UkzW0s+qM8FSydCJaUnwjjBrDkTFk7uP3U4cq1oV+3iyV1P
	ANjC2WEJeXBrenbQOXf3cP0E5ebGObEOKKNl36N+D5uUejnXE5p5vxsJ0DK0V2Om98HmpTaEGRsn8
	MlqWmfHGcbC/XTdPwqz/gay2LCy29oAKWFtl2t40KglRe/wzCJSlHWvxiLbB7eCr5mrgCBsiXN03J
	r35fD7poHHn9LO5N8fj3hzS28/Guefnsrh09VCvkKY9IaRWlrwlnL8DkbAhgFXVW2+qE6epGvMzDp
	5FHsZPMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9bu-00000009kJS-16oP;
	Tue, 20 Oct 2026 13:10:34 +0000
Received: from out-84.mta1.migadu.com ([2001:41d0:203:375::54] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9bp-00000009kI1-3t9a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 13:10:31 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=yKLSf2H2uB/fvU8iF2pBxn3hRQc14Pjhc5mRWAVCgkA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792501825; v=1; x=1793106625;
 b=MdBGF8IyZH3vWs07hT9uc08LO/5YfqMomc4G1nWhFghFXWpd0ZK+OYfQWeaI2jL0ZbMxwBtV
 qDgkLaLjTOy6n8KC8CFjH8Mg/2d0FzXc7MQBHnsTXj3GN1ouz+sc9S+N/U1hQOM5A7sd+B/UcXN
 EW5Bdlzr0kATCcxY4qDmFDlI=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 8359e973e38b60fa;
	Tue, 20 Oct 2026 13:10:24 +0000
X-Mizu-Trace-ID: 8359e973e38b60fa
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5be58ad9600so8501e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 06:10:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx2afnjx/OKH2stWBuOLi6PQ1KVihnvzyV57BngLvFmfADVnxPUFwBEQvKOBpoatX/va2mgTSAcaCLuRg2/+nHI@lists.infradead.org
X-Gm-Message-State: AFq9FYJpv9yygA13XxTBjgPXkJD6slrimULUIBY1CXPCIHPyU4wCdqzQ
	u1bfQi6Px0h4Tx4QC6M3cYJO+FRoTH2dGB1d7yFmhkMsb2Sq5ZucxqLpsEMqcoMKlUhZXntiWaR
	dV8pNFC1s6zn8QLyf4CvOR+86OxkdvaVR4J7c3Sek
X-Received: by 2002:a05:6512:32d5:b0:5bf:6c49:434c with SMTP id
 2adb3069b0e04-5bf6c4946d8mr42473e87.10.1792501822812; Tue, 20 Oct 2026
 06:10:22 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019132103.3836646-1-fuad.tabba@linux.dev>
 <20261019132103.3836646-2-fuad.tabba@linux.dev> <atdUzfOA1Obd7Mir@gremlin>
In-Reply-To: <atdUzfOA1Obd7Mir@gremlin>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 20 Oct 2026 14:09:45 +0100
X-Gmail-Original-Message-ID: <CA+EHjTykGoHmDt82Cz=eEeBoqpjDRnhKEVGnOhTprn4dLxLZKQ@mail.gmail.com>
X-Gm-Features: AclHuK8UhwO50ViPhbRl1kWyZ66tD2KPFO0KN-W-K2Tt6gXRY6TnmJPvFFaY-jU
Message-ID: <CA+EHjTykGoHmDt82Cz=eEeBoqpjDRnhKEVGnOhTprn4dLxLZKQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] KVM: arm64: Clear the whole hugetlb folio when
 sanitising MTE tags
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Steven Price <steven.price@arm.com>, Yang Shi <yang@os.amperecomputing.com>, 
	David Hildenbrand <david@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_061030_256400_6F0C2C6A 
X-CRM114-Status: GOOD (  26.02  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Lorenzo,

On Tue, 20 Oct 2026 12:52:54 +0100, Lorenzo Stoakes (ARM)
<ljs@kernel.org> wrote:
[...]
> On Mon, Oct 19, 2026 at 02:21:01PM +0100, Fuad Tabba wrote:
> > sanitise_mte_tags() clears the tags of the pages about to be mapped at
> > stage-2 before marking them tagged. For a hugetlb folio the flag covers
> > every page in the folio, but the loop only covers the mapping being
> > installed. Stage-2 maps a folio in pieces for the contiguous hugetlb
> > sizes, and for any size under dirty logging. The first fault then marks
> > the whole folio after clearing only its own piece, and the rest keeps
> > its previous owner's tags for the guest to read.
>
> I'm guessing the folio size is always >= size here?

Yes, the stage-2 mapping of a hugetlb VMA is never larger than its
hugetlb page size, so it always sits within one folio.

[...]
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
[...]
> > @@ -1514,7 +1514,8 @@ static void sanitise_mte_tags(struct kvm *kvm, kvm_pfn_t pfn,
> >          if (folio_test_hugetlb(folio)) {
> >                  /* Hugetlb has MTE flags set on head page only */
>
> Is this comment redundant now?

I'd keep it: it's why the whole folio has to be cleared, as the flags
on the head page cover every page in it.

> >                  if (folio_try_hugetlb_mte_tagging(folio)) {
> > -                        for (i = 0; i < nr_pages; i++, page++)
> > +                        page = folio_page(folio, 0);
> > +                        for (i = 0; i < folio_nr_pages(folio); i++, page++)
>
> I know it's a stable fix, but the fact that this pattern exists in multiple
> places really argues for a mte_clear_folio_tags(), which would make this
> trivially:
>
>         mte_clear_folio_tags(folio);
>
> And avoid the re-use of page etc.
>
> It's not a huge change and makes the next patch in the series simpler too so
> arguably could be part of the series?

I think you're right about the helper, but I'd rather keep the fixes
as small as possible for the backports. I'll send
mte_clear_folio_tags() as a separate patch on top of these, using it
in mte_sync_tags() too. In v2 the loop uses folio_page(folio, i)
rather than reusing page.

Thanks,
/fuad

