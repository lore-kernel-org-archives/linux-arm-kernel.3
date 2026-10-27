Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A5D606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 02:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vu7WfAdL;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=PRDm50U7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=veWNjOyx0q2aoHvEbX2sAz0cuq6dhXLamwz9eTavWpQ=; b=Vu7WfAdL17xygq
	SKSmJrCnhFXbHZYkHFr96BXVtOXUHcFC1JZ4WZ0Jrf1GZl49aaEG99CE1XWq4aslZunYPmrzhYtq1
	TYTBkan3ENvzkj6LUab7SPaE4OojReW3440ko/AkQIP2m8dDgRsiZ0RtQ6bNWW4xmubysCsO8jFwp
	S0j7EtMuqyujjYt0c+pEa7EgsYxvJIj2TWJXDObpLX/tumbCxH8MdIpMfrmqlZZBZRzpECh9U7ciV
	l/gvch3ryVNZfGMhDZ58MHLOpUwoOozuHYQRfnzWTGVjCB6khjqkuGIr2nxLoaORkdy3vK3H5xq1d
	7AfS3XpQWFRBAa5nuUSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLXNw-00000003fYJ-090n;
	Tue, 27 Oct 2026 02:58:00 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLXNs-00000003fXZ-3TSF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 02:57:58 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-535f598d126so86091cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 19:57:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793069875; cv=none;
        d=google.com; s=arc-20260327;
        b=QBJnHuA0uVWwKmhDYy716SchRyuDGe2/SKEfCuQeTSKCmIddZVVy475bj6pes6TLGv
         qdtH+bVJri7aO1fBn8e7Tb80uwgG9CCF9zpLSsv9tEAz5c/CdJ+DSjjcVE/x4XvCz3Dg
         GAYmRagI89gOe+o3F0vsqYAiHv2SeJ2PldV/5NRv8J53ac4WfM7wzXS0PFK7GMP1xnEX
         Dft4ssf6fqQW/gEYv85OV1BHv/BDeofcdFAzZ/coG6n+IEk4Mc4Ls04nArw3CE9yyrGF
         ypatpSgObjqfU8g9WEEiD/Rr/DPsU8eaThw4Nyimy7JPteWMHruspbpJ3cZJfNv8/zN1
         Vz5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=veWNjOyx0q2aoHvEbX2sAz0cuq6dhXLamwz9eTavWpQ=;
        fh=eGSnfGxXgdzZeS1XJT7nx/LXombnX2y2q8GGjemByWo=;
        b=WpX74x2qIa0N4BRdgutrAKuGiU4+OXvSmrM+zpBBxpU3zmHmtXlIPUbMKwXCxHXlTB
         N7dJ8Pxl+TMGXByxYESCVHbzZYkve7YXEotzBYPK6UxRGiH2hRAcMV9Wo/SJWntIM6OL
         Zic4pIwob55/XZBdOwHfxKUTsGX950SG517WcM8azYhBpG/msRk4VO3sbvENhZzc75Bg
         dDUXUsb3wzlwRANjnNfMEuGSp6UrQA1ZK4nPddpWt78kHgLaVx0socFKIdjVpr9h2fSA
         uB8HJdMzuLDPPmPjkVJGr59YT7sbBZ66O1cTK5CTrHh+AuXxUeQEXnyiW76f/aeVT5QB
         2hhw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793069875; x=1793674675; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=veWNjOyx0q2aoHvEbX2sAz0cuq6dhXLamwz9eTavWpQ=;
        b=PRDm50U7ynxwu31U4CUIQyjSWmyC7Rk3v5dBg1Pfv3BOmezOBT81Of9a2+Id9m+GBx
         H6Reyu8BPfXgCqXdLbm4a3jigo5AdnAMbFGw1aUlDnIRg2PNCCLbJh/cV0iscKeudA2f
         LtgEFoC8w5fa8JBM0ky+7Ni+Fdps/Yn+1U4C7CtYyQ8nQmB3a1cv5WFWAzPFWcpt2zW+
         DzHWWoNTV5D3Snv9HxTQ5gFTdhTqNHPc2TSNwR3UEGOtjPdOqaRKoAHx81hlyHNfjls7
         j5WOl+SuqWVpf6N9n0uXoFk+EZEwsCVHTrf1TY3YhBoGpF8F6ZaKfEXgQRx+kgWfnEoH
         VZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793069875; x=1793674675;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=veWNjOyx0q2aoHvEbX2sAz0cuq6dhXLamwz9eTavWpQ=;
        b=tfXI61SAUtZ4ZIUJ6F7UpAGUVDY+t9VwXkGuUnqNcDOqEDLh3MVxzzVV5JkB8S/LKl
         JWStPpuWwwsTpzQvBJGfZ64g7g1VY8PFF7NyCt7hYsaHGneA/uEzmVhF5Ph98whjCUam
         R8XBDvuXZrCUtYZAiHVdQB5FtegFUsQhdlf4NjrNFIRpXgOSxoopYFWL4P1E79QSv7Id
         g9IN09owgOUUxT5PTNROoLlCAZo6VP6b5YAqG3QaZTCOPOa5BXKun8A7wiovWEoRKB1v
         RD3RBAjqQ5Eu4YyUy5uaxNvODgx26/MJxgPJgL+cAwkG0R/GpXONlWJaSmLB0yhTmtAc
         Y5sA==
X-Forwarded-Encrypted: i=1; AKwUvBy+Tir7aRxRLoU3qfNj33r9r2bYUrPlrB9NmnWPcnCt/Zl94oCYJ3K2pEYwsJbZGNZxv8yOHbP04VhP3pTJXVjH@lists.infradead.org
X-Gm-Message-State: AFq9FYKBRY8yz35ADksdMdrp2WGq3ka8E7zu+AekU18kpSwyupuWHors
	l+Gq05TsyjInJiEOxdvxJeAexEoZRg7WGc+J+MVdVHz2lmr6u12IiJseGkJp19n/ZlEelWWCuq3
	zFgGue/gz+MOb0lX3kGLuWFAOFSrEZzHmrGujBxiL
X-Gm-Gg: AYBFou2lbTQQFDvAK6CAIxM8Kn9MihdKXxqbi1ups2R8z9vbM27Ly/OWcNqy2eRywEt
	qnk1APSRf0n/OMDUQ3cvNpD6/ZDMwAQGcEUQI3Q0Id58ZlucZQx3EnHGPUn9SlxkZC92lf7u8Y2
	aGWJ9M39dbVIZsNkh7m80FnuOnkPclAR7t2vefPkGeIrePRtimt9/PgwwRTHES7otgMlrKCMRKj
	b07+lmkCAFb1bNJtr4n4n++ZRO1OBHuAIXeuk+6HKqyruguJ0RkJxCgU9zLjColpRVwHeosM9nC
	l981bZJnuMpF49MRtvVOt7UQ218DuvBBhIr4hEu5zFodeNAUAuTwQiwUPasTOdVx6eJBCE3LiYw
	tzP6NUpUensH0PDQJzdkWzwuXB0g/4jZQgZ3f
X-Received: by 2002:ac8:5cd0:0:b0:534:b7b2:634f with SMTP id
 d75a77b69052e-53e74f18ea0mr8347351cf.8.1793069874720; Mon, 26 Oct 2026
 19:57:54 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260911025613.1220845-1-zhanghongru@xiaomi.com>
 <arFYRAa-i7CIwmHL@gremlin> <arF-E3Nsw9ZliH0t@casper.infradead.org>
 <arI_w2wTfA00Mgy9@gremlin> <armexcXDiG8ryZd6@casper.infradead.org>
 <CAGsJ_4xuFi7K+crAcFQ998SxXS0xPM6QeA34JV+6+Sy005rXLg@mail.gmail.com>
 <ar7MsOb6IJLt4eLo@casper.infradead.org> <ar-o1TrOMGrrcxLX@gremlin>
 <ataDTEZIKOYtwhUF@casper.infradead.org> <CAJuCfpH88HGXyLzBr6YGxzTrOq18HaPcRvhN9RwEBxG_ptv7KQ@mail.gmail.com>
In-Reply-To: <CAJuCfpH88HGXyLzBr6YGxzTrOq18HaPcRvhN9RwEBxG_ptv7KQ@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 26 Oct 2026 19:57:43 -0700
X-Gm-Features: AclHuK_KCyZzsUIRPigLpRqw3YeQAHnl6JHTenlWoPcunSyUcxCZShOICs2gDrI
Message-ID: <CAJuCfpH6o1NAN_4W6VY6o3unxr9V+YCNFiLS8oCg7giWRLz8_g@mail.gmail.com>
Subject: Re: [PATCH v6] mm: retry page faults once under the per-VMA lock
To: Matthew Wilcox <willy@infradead.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Barry Song <baohua@kernel.org>, 
	Hongru Zhang <zhanghongru06@gmail.com>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, david@kernel.org, liam@infradead.org, 
	mhocko@suse.com, rppt@kernel.org, shakeel.butt@linux.dev, vbabka@kernel.org, 
	zhaonanzhe@xiaomi.com, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, 
	chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, linuxppc-dev@lists.ozlabs.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, agordeev@linux.ibm.com, 
	gerald.schaefer@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com, 
	borntraeger@linux.ibm.com, svens@linux.ibm.com, linux-s390@vger.kernel.org, 
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org, 
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de, x86@kernel.org, 
	hpa@zytor.com, Hongru Zhang <zhanghongru@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_195756_976398_705D355A 
X-CRM114-Status: GOOD (  56.42  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 7:39=E2=80=AFPM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Mon, Oct 19, 2026 at 1:53=E2=80=AFPM Matthew Wilcox <willy@infradead.o=
rg> wrote:
> >
> > On Fri, Oct 02, 2026 at 02:12:35PM +0100, Lorenzo Stoakes (ARM) wrote:
> > > On Thu, Oct 01, 2026 at 10:12:16PM +0100, Matthew Wilcox wrote:
> > > > So what I didn't realise is that fork() waits for page faults to fi=
nish.
> > > > I don't think that's necessary, so we can just stop doing that (whi=
tespace
> > > > damaged):
> > > > I think this is safe.  I've booted a kernel with this change, and
> > >
> > > I'm afraid it's not safe :)
> > >
> > > We already actually did this (by mistake I think?) before. See commit
> > > fb49c455323f ("fork: lock VMAs of the parent process when forking") -=
 we shipped
> > > that in 6.4.0 -> 6.4.2 and it corrupted memory all over the place.
> > >
> > > Reports + a consistent reproducer:
> > >
> > > https://bugzilla.kernel.org/show_bug.cgi?id=3D217624
> > > https://lore.kernel.org/all/dbdef34c-3a07-5951-e1ae-e9c6e3cdf51b@kern=
el.org/
> > > https://lore.kernel.org/all/b198d649-f4bf-b971-31d0-e8433ec2a34c@appl=
ied-asynchrony.com/
> >
> > I wonder if we still need this.  The commit message says:
> >
> >     A concurrent page fault on a page newly marked read-only by the pag=
e
> >     copy might trigger wp_page_copy() and a anon_vma_prepare(vma) on th=
e
> >     source vma, defeating the anon_vma_clone() that wasn't done because=
 the
> >     parent vma originally didn't have an anon_vma, but we now might end=
 up
> >     copying a pte entry for a page that has one.
> >
> > But we're holding the mmap_lock for write here, and we need to hold the
> > mmap_lock for read in order to change a vma->anon_vma (asserted in
> > __anon_vma_prepare() with mmap_assert_locked()).
> >
> > At the time of this commit, lock_vma_under_rcu() contained:
> >
> >         /* find_mergeable_anon_vma uses adjacent vmas which are not loc=
ked */
> >         if (!vma->anon_vma && !vma_is_tcp(vma))
> >                 goto inval;
> >
> > so we really did have to wait for read holders to finish the fault.
> > But commit a373baed5a9d deferred the check for a NULL anon VMA until we
> > actually needed it, so I think commit fb49c455323f's logic was invalida=
ted
> > by a373baed5a9d.
> >
> > Maybe I'm wrong.  This is all a bit out of my normal area.
> >
> > > Also we have asserts for this lock in copy_page_range() and
> > > copy_hugetlb_page_range() which will now fail (and possibly more furt=
her down
> > > the stack?)
> >
> > Possibly we have to adjust some assertions to check that either we have
> > the VMA locked or we have the MM write locked.  That doesn't seem
> > unreasonable.
> >
> > > > My argument for why it's safe is that a thread which takes a page
> > > > fault during fork() might have taken the page fault either before o=
r
> > > > after fork().  The faults will definitely happen in the parent proc=
ess.
> > > > They may or may not have happened in the child process, which can't
> > > > possibly care whether or not they've happened.
> > >
> > > The problem isn't the child it's the parent - copy_page_range() _modi=
fies_ the
> > > _parent_'s page tables in-place, on assumption that nothing else can =
access
> > > them (for CoW).
> >
> > I was perhaps unclear.  What I mean is that the child may or may not
> > observe them as having happened.
> >
> > > And actually nowadays things are _even_ worse, you could also have co=
ncurrent
> > > page faults, MADV_DONTNEED, MADV_FREE, MADV_GUARD_INSTALL/REMOVE, UFF=
DIO_COPY +
> > > UFFDIO_MOVE (yikes) all of which might introduce new issues + would h=
ave to be
> > > audited too.
> >
> > Yup.
> >
> > > So - it turns out a lot of stuff implicitly assumes VMA write lock no=
w:
> > >
> > > 1. CoW - deferred TLB flush race
> > >
> > > (The issue above)
> > >
> > > https://lore.kernel.org/all/20230705171213.2843068-2-surenb@google.co=
m/
> > >
> > > This happens because __copy_present_ptes() does wrprotect_ptes() on t=
he parent
> > > without a TLB flush (that's deferred until the end of the fork).
> > >
> > > But unfortunately without a VMA write lock something can then replace=
 the page
> > > table entry in the meantime and you can end up with data loss as a re=
sult.
> >
> > Is it that fb49c455323f commit message is insufficient and we need to
> > prevent simultaneous fork/page fault for other reasons, then?
>
> Yes, I think so. It refers to one of the reasons VMA lock is needed
> during fork, but as Lorenzo points out, there are a number of other
> reasons that require fork to protect VMAs. Note that some of those
> reasons, like MADV_GUARD_INSTALL and UFFDIO_MOVE did not exist at the
> time fb49c455323f was written.

I also have to agree with Lorenzo that allowing fork to run
concurrently with page faults might only shift the mmap_lock
contention from fork to some other operation (mmap/mprotect/etc.), so
even if we fix all these cases we might end up with contention
somewhere else.

>
> Below is the list that AI pointed out, and I think Lorenzo covered
> most if not all of them:
>
> Without vma_start_write_killable(mpnt):
>       1. In-flight VMA readers that locked mpnt before
> mmap_write_lock_killable(oldmm) continue running concurrently with
> dup_mmap().
>       2. New VMA readers (page faults via lock_vma_under_rcu(),
> madvise under MADVISE_VMA_READ_LOCK, userfaultfd via uffd_lock_vma() /
> uffd_move_lock(), vma_start_read_unlocked(), etc.) continue to succeed
> on mpnt while dup_mmap() duplicates its VMA metadata and page tables.
>
>   (Note: When this lock was originally added in fb49c455323f, one
> prominent trigger was a concurrent fault calling anon_vma_prepare() on
> a VMA with mpnt->anon_vma =3D=3D NULL while anon_vma_fork() /
> vma_needs_copy() ran. Although __vmf_anon_prepare() now requires
> mmap_read_trylock()
>   when !vma->anon_vma, removing vma_start_write_killable(mpnt) today
> still breaks several critical invariants.)
>   =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
>   ### What would happen if we removed it
>
>   1. **Destruction of live 2MB THP mappings ("bad pmd" -> pmd_clear())
> in copy_pmd_range()**
>   As noted in the comment in copy_pte_range(), copy_pmd_range()
> assumes no concurrent THP transitions on src_pmd:
>     if (pmd_is_huge(*src_pmd)) { ... }
>     if (pmd_none_or_clear_bad(src_pmd))
>         continue;
>   On an anonymous VMA that already has mpnt->anon_vma !=3D NULL, a
> concurrent per-VMA-locked THP fault (do_huge_pmd_anonymous_page()) or
> UFFDIO_MOVE can install a transparent huge PMD into *src_pmd right
> after pmd_is_huge(*src_pmd) observed pmd_none.
> pmd_none_or_clear_bad(src_pmd)
>   then sees pmd_bad(*src_pmd) =3D=3D true (a THP leaf PMD satisfies
> pmd_bad()), prints "bad pmd ...", and calls pmd_clear_bad(src_pmd) =E2=80=
=94
> wiping out the parent's live 2MB PMD without PTL, TLB flush, or
> rmap/refcount/deposited-pgtable/RSS cleanup (corrupting parent memory
> and
>   triggering Bad rss-counter / nr_ptes bugs on exit).
>       =E2=80=A2 The same race exists for huge PUDs in copy_pud_range()
> (pud_none_or_clear_bad(src_pud)).
>       =E2=80=A2 Similarly, copy_huge_pmd() reads special huge PMDs
> (VM_PFNMAP/VM_MIXEDMAP) locklessly and skips rechecking *src_pmd under
> src_ptl assuming it cannot change, so a concurrent MADV_DONTNEED under
> MADVISE_VMA_READ_LOCK could leave the child mapping a stale/zapped PFN
> PMD.
>   2. **Silent CoW data corruption / lost parent writes due to deferred
> flush_tlb_mm(oldmm)**
>   __copy_present_ptes(), copy_huge_pmd(), and
> copy_hugetlb_page_range() write-protect parent PTEs/PMDs without
> flushing TLBs; dup_mmap() defers the flush to flush_tlb_mm(oldmm)
> after all VMAs are copied. Normally, because each copied VMA remains
> VMA-write-locked until
>   mmap_write_unlock(oldmm), no parent thread can handle a CoW write
> fault before flush_tlb_mm(oldmm) finishes.
>   Without the VMA write lock, while CPU 0 is still in dup_mmap()
> copying later VMAs:
>       =E2=80=A2 CPU 1 (parent thread A) still holds a stale writable TLB =
entry
> to old_folio (now CoW-shared with the child).
>       =E2=80=A2 CPU 2 (parent thread B, no cached TLB entry) writes to th=
e
> same page, faults on the R/O PTE under per-VMA read lock, enters
> wp_page_copy(), and copies old_folio into new_folio
> (__wp_page_copy_user()) before taking PTL and calling
> ptep_clear_flush().
>       =E2=80=A2 Any store by CPU 1 through its stale writable TLB entry a=
fter
> __wp_page_copy_user() and before ptep_clear_flush() lands directly in
> old_folio while pte_same() still succeeds =E2=80=94 losing thread A's wri=
te in
> the parent (new_folio) and leaking it into the child (old_folio).
>   3. Broken guard-page (MADV_GUARD_INSTALL) state and KCSAN race on vm_fl=
ags
>   madvise(MADV_GUARD_INSTALL) runs under MADVISE_VMA_READ_LOCK and
> atomically sets VMA_MAYBE_GUARD_BIT on mpnt via vma_set_atomic_flag()
> before installing PTE_MARKER_GUARD entries:
>       =E2=80=A2 vm_area_dup(mpnt) asserts
> ASSERT_EXCLUSIVE_WRITER(orig->vm_flags), which would trip under KCSAN.
>       =E2=80=A2 If vm_area_dup(mpnt) copies mpnt->vm_flags just before
> MADV_GUARD_INSTALL sets VMA_MAYBE_GUARD_BIT and installs
> PTE_MARKER_GUARD PTEs:
>           =E2=80=A2 On a file-backed VMA without anon_vma, tmp misses
> VM_MAYBE_GUARD (part of VM_COPY_ON_FORK), so vma_needs_copy() returns
> false and drops the guard regions in the child.
>           =E2=80=A2 On a VMA with anon_vma !=3D NULL, copy_page_range() c=
opies
> the PTE_MARKER_GUARD entries into tmp, leaving the child VMA with
> guard PTE markers without VM_MAYBE_GUARD set (breaking collapse checks
> such as file_backed_vma_is_retractable() and future merges/forks).
>
>   4. Inconsistent address-space snapshots against UFFDIO_MOVE and
> tcp_zerocopy_receive()
>       =E2=80=A2 When UFFD_FEATURE_EVENT_FORK is not enabled, dup_userfaul=
tfd()
> never increments octx->mmap_changing. Because move_pages()
> (UFFDIO_MOVE) only takes per-VMA read locks (uffd_move_lock()), it
> could move an exclusive folio from a not-yet-copied src address/VMA
> into an
>       already-copied dst address/VMA (losing the page at both
> addresses in the child), or move a zero page from an already-copied
> src to a not-yet-copied dst (duplicating it at both). Even with
> UFFD_FEATURE_EVENT_FORK, octx->mmap_changing is only incremented once
> dup_mmap()
>       reaches the first VMA using octx, so earlier non-uffd VMAs rely
> on VMA write-locking to prevent cross-VMA moves.
>       =E2=80=A2 tcp_mmap() sets VM_MIXEDMAP (in VM_COPY_ON_FORK, without
> VM_DONTCOPY), so copy_page_range() would race with
> tcp_zerocopy_receive() zapping and inserting pages under
> vma_start_read_unlocked().
>   5. Immediate debug assertions (CONFIG_DEBUG_VM)
>   Both copy_page_range() and copy_hugetlb_page_range() call
> vma_assert_write_locked(src_vma) on every CoW VMA, which immediately
> fires VM_WARN_ON_ONCE_VMA(!__is_vma_write_locked(vma), vma) because
> oldmm->mm_lock_seq was bumped by mmap_write_lock_killable(oldmm) while
> mpnt-
>   =EF=BF=BA>vm_lock_seq was never updated.
>
> >
> > > Same issue exists with hugetlb wp too. And god only knows with uffd w=
p :)
> > >
> > > 2. THP - can destroy parent THP mappings
> > >
> > > copy_pmd_range() does:
> > >
> > >       if (pmd_is_huge(*src_pmd)) { copy_huge_pmd(); ... }
> > >       if (pmd_none_or_clear_bad(src_pmd))
> > >               continue;
> > >
> > > Without the write lock, a concurrent fault can install a huge PMD via
> > > do_huge_pmd_anonymous_page() or filemap_map_pmd()/do_set_pmd().
> > >
> > > The issue is that pmd_bad() fires for leaf PMD (ugh) on at least x86 =
and arm64,
> > > meaning that'll clear the page table entry.
> > >
> > > I think Hugh left a comment alluding to this before:
> > >
> > >        * copy_pmd_range()'s prior pmd_none_or_clear_bad(src_pmd), and=
 the
> > >        * error handling here, assume that exclusive mmap_lock on dst =
and src
> > >        * protects anon from unexpected THP transitions; ...
> > >
> > > It's like the mess around pmd_trans_unstable() :(
> >
> > ... could we fix this by taking the ptlock during the copy operation?
> >
> > > 3. copy_pte_range() skips the required pmd_same() recheck assuming wr=
ite lock
> > >
> > > It uses pte_offset_map_rw_nolock() with a dummy pmdval and:
> > >
> > >        * We already hold the exclusive mmap_lock, the copy_pte_range(=
) and
> > >        * retract_page_tables() are using vma->anon_vma to be exclusiv=
e, so
> > >        * the PTE page is stable, and there is no need to get pmdval a=
nd do
> > >        * pmd_same() check.
> > >
> > > (Probably needs updating for VMA write lock...)
> > >
> > > 4. The asserts
> > >
> > > Mentioned above!
> > >
> > > I suspect there's more as well.
> > >
> > > Some of it could be changed, but it'd all be at the cost of behaving =
very
> > > strangely (no VMA lock but mmap write lock) while manipulating things=
.
> > >
> > > And I am not really happy with changing page table entries in the par=
ent VMA
> > > (for CoW) without a VMA write lock held.
> > >
> > > I also wonder whether it would achieve all that much really - the iss=
ue is with
> > > holding the VMA lock across I/O, anything else that tries to grab a w=
rite lock
> > > is going to end up being the new thing that's blocked (mprotect, munm=
ap, mremap,
> > > mlock etc.)
> > >
> > > I think doing something like this would need a very significant redes=
ign and I'm
> > > not convinced it's one that really achieves what we want given all th=
e other
> > > cases that'd get blocked by the VMA lock being held still.
> > >
> > > --
> > > Cheers, Lorenzo

