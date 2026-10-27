Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899E2606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 02:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sKrG6AaO;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=CUeA9bfl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uqs34zcQCNfaKeG0W4YG4prKIZumwiPNl9JfXSdONU0=; b=sKrG6AaOzJ9TQc
	KQoBkGS6wjFcDch7lk1IlGPIQVLNX6sXQC6NjsXiS/uCIICKnKNXLqLrl/uZCqDTqJ320nM4OIeD9
	A2VYmj0rCtRnH5mHy4svRxhMfIFaGce1xSOZhwxQYPXcqcVImyikgma96oJBq703arSozJUBSvS0T
	PagZqF+le3oTkKzvejcZIIfKtaW1fZdux03OZ+kznrJIbPrVwM4GfTUKXdowR+vgCtAJE4rECtksp
	30cef2CIUOLVavi7h6hOt8Wny9fSmiButCRVZBDMjbH5yRY2EtOu4LWgdI1vW1noT+lEkyAnY0hVJ
	EJb/4Eqbew6KSVNPR39A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLX6l-00000003eRW-1PY7;
	Tue, 27 Oct 2026 02:40:15 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLX6h-00000003eQf-1jrs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 02:40:13 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-533202fe429so173951cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 19:40:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793068809; cv=none;
        d=google.com; s=arc-20260327;
        b=glrkIvEcrgeQCmS9vxOFWuwVZk0H9Z9mPRuG2sWCpHZRf5p+l41xXA9FGWiRCw1orv
         GOCd/8deVzdbutWHgEKVmudew2q48iZVmJPSQvJ2r49eod1Cd/KhtI1X7nquxkvWrHsY
         zymyzYQL7wLHYH7iW6kuGxF8uFDtkw+R4h1vmSHINqu3A5gU4Rl7kbnNGQsK1LyncIip
         pza0Tx2ABo5s3Xdz3nInFrV+ElJvhoR6TVPxIzaWBDNr1+yi/Oay9j/XD3qbWNe4dLme
         wKmn1ratG9iH4TMH+vK/OetsQpwZOeHg/cm2Gm7OK3Lt9WhYM0rGbPGh1gU3I161hWY1
         2YYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uqs34zcQCNfaKeG0W4YG4prKIZumwiPNl9JfXSdONU0=;
        fh=85MPXhpV/h7Uowy6QKDtz2RIXuhGuO1lcmY1/4KgFY0=;
        b=T6Wp55+3LNajvwBO/n7zQ7YCR+dUuj/am3T2UZMF890yimDzzwFOB4oRk33GiWnl97
         6wIBxrsm2k0roAgPT5Bx318AId/hYIWsQNpP9Kv5vluZzhnnaItiw8fef49L7P23EwC7
         3VwIcfSZDgitDVwS31uklfY1+9Nw59/bq5Jk8StxkFsSGhYDg0fXemPC5bknMjz3+CtJ
         k6fmStD2BoyCuUeJ0sHrz8+ff7lHANeIpMzvE3urhJ6ZzX/ugkIBTRagL8wH6PeQlFde
         S250lG7yP1z2UWsnBsgSyR2EwZQU48nFF9jsHMeEbWMzuayaQrMvUrSnxxXnX/sBFXm2
         t1Ow==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793068809; x=1793673609; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uqs34zcQCNfaKeG0W4YG4prKIZumwiPNl9JfXSdONU0=;
        b=CUeA9bflwaNcA8/hayqLGRSy/YUT6Oub9usLgvWbSM3VtYDMkPk76ZYZg5u2lNxiXz
         Purozt+bPDhbdDdFQFbVMs7dVzmHzUu5Qho/33/rNKNRkDQFMH9L1YxQdwdYaEpml8h5
         VdCilNmpOY1MEILaiFzBFlrv6JZSFo6p8DkEfPSLm8d/F6ORP1WxM7jgblCDHuBK1hel
         F/BqqaeeKL1u/IouU3aTqOFHEaV7bl1iCfiZxLP/PAEqlmV8hiw01AvsGk/REd78bnWW
         y91EAGQ90gdbkPlstTyOrdvvVIL/EI2EMUpZnJU8llq6a9deHQDhMVI8i0mRKv51kiBi
         qnuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793068809; x=1793673609;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uqs34zcQCNfaKeG0W4YG4prKIZumwiPNl9JfXSdONU0=;
        b=AS8dvTO2hmggoeMGfKdxFHWir9BzXs8J4TNwvu6U1Ygyu70elYYi8j/F6v/8X7WOVR
         gAQsHuHg+Ja8Wu8IxhYh2VS8X4dhPh2bgfb4fdHji9jwFgkt72g3quEtRzsDQxuPydD0
         SfI9BLiLJZPrnJBMKqrGCxqgtgPCeqLOEewvHi4u9mDiZsT0FWuDa/Ofo+bv/nlFuFZT
         JUYnXVHqprC/OYuWfIAhrQDiUreT6UcgcQbYqOWz7XmT+y39eX+gHyf/aWVgkfaIreBE
         0MYmkgceS5BBfKTQZr2lJDROyvNXoqxcnvyUrJU5JzcKQUpDcJyIrfWvOTT5PHCCoRrP
         JcEg==
X-Forwarded-Encrypted: i=1; AKwUvBwC4rOWfmPKUyPHoPa1uwbaB0J/gMsydbZRRRyUMqZE1PmEkVt0LtT3f2g81WpCDw1sATjXbu1TnLjzzVs2+YmY@lists.infradead.org
X-Gm-Message-State: AFq9FYK6HNiL42fpnYqA5+ti/Nhz7+yVnQ2O1F7eqhb7E7REj4GWIhk0
	MibbLU+DOHScepAqJV8KimaxcppjoiMWWMQWzvkjQrrItkYTv39RbGV+Deg2VbFNtA1K3XK9WO0
	ie0yQQp1G/wOGFMvUxUr3zwmE3iWU+wdrZdYSOrwv
X-Gm-Gg: AYBFou2syPiiQA8d6kcFqBnl0+fACuAI6cFdKOTXRq3VkZOpc1jpGuE8D4ngdIKYJTe
	cGJvYRexusv2dnzRo+PLx4JzEyOocAfe9RDBZkjOZzefl1b5eJvtXlM1uLRCTs8n0efYHRfYrH/
	acJMomg85GqvYMzfmPJrkQprviWBZousLxGqeqlseV6TPRTUBHMgx4+tqMyjvuFdaI7kdarIXtH
	QwvHSOVNqH2vQyvGp5FdB3I2Nx3mYKuYyyAgu0vvSDzscxv9GuMdDMBfVN0gXQrgHPhOLWQxWyB
	F2iRP8//z7z179FShC3Kjl65Tw9+yZ6RTsAiaZf/X4X7mZYsaP7Fw5qGcxVZ63ee+qZLpdHMONg
	NN1eNxiFh884RI752ij/gWJnJ+by3rP15ves=
X-Received: by 2002:ac8:5cd0:0:b0:534:b7b2:634f with SMTP id
 d75a77b69052e-53e74f18ea0mr8104501cf.8.1793068808195; Mon, 26 Oct 2026
 19:40:08 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260911025613.1220845-1-zhanghongru@xiaomi.com>
 <arFYRAa-i7CIwmHL@gremlin> <arF-E3Nsw9ZliH0t@casper.infradead.org>
 <arI_w2wTfA00Mgy9@gremlin> <armexcXDiG8ryZd6@casper.infradead.org>
 <CAGsJ_4xuFi7K+crAcFQ998SxXS0xPM6QeA34JV+6+Sy005rXLg@mail.gmail.com>
 <ar7MsOb6IJLt4eLo@casper.infradead.org> <ar-o1TrOMGrrcxLX@gremlin> <ataDTEZIKOYtwhUF@casper.infradead.org>
In-Reply-To: <ataDTEZIKOYtwhUF@casper.infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 26 Oct 2026 19:39:57 -0700
X-Gm-Features: AclHuK_tjvOAxlKicwQpIP5-vlb-UBKyvjNqAPJfVeuqkSwvVjNbbsDgO4TDlgk
Message-ID: <CAJuCfpH88HGXyLzBr6YGxzTrOq18HaPcRvhN9RwEBxG_ptv7KQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20261026_194011_566359_942E18DB 
X-CRM114-Status: GOOD (  47.48  )
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

On Mon, Oct 19, 2026 at 1:53=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Fri, Oct 02, 2026 at 02:12:35PM +0100, Lorenzo Stoakes (ARM) wrote:
> > On Thu, Oct 01, 2026 at 10:12:16PM +0100, Matthew Wilcox wrote:
> > > So what I didn't realise is that fork() waits for page faults to fini=
sh.
> > > I don't think that's necessary, so we can just stop doing that (white=
space
> > > damaged):
> > > I think this is safe.  I've booted a kernel with this change, and
> >
> > I'm afraid it's not safe :)
> >
> > We already actually did this (by mistake I think?) before. See commit
> > fb49c455323f ("fork: lock VMAs of the parent process when forking") - w=
e shipped
> > that in 6.4.0 -> 6.4.2 and it corrupted memory all over the place.
> >
> > Reports + a consistent reproducer:
> >
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D217624
> > https://lore.kernel.org/all/dbdef34c-3a07-5951-e1ae-e9c6e3cdf51b@kernel=
.org/
> > https://lore.kernel.org/all/b198d649-f4bf-b971-31d0-e8433ec2a34c@applie=
d-asynchrony.com/
>
> I wonder if we still need this.  The commit message says:
>
>     A concurrent page fault on a page newly marked read-only by the page
>     copy might trigger wp_page_copy() and a anon_vma_prepare(vma) on the
>     source vma, defeating the anon_vma_clone() that wasn't done because t=
he
>     parent vma originally didn't have an anon_vma, but we now might end u=
p
>     copying a pte entry for a page that has one.
>
> But we're holding the mmap_lock for write here, and we need to hold the
> mmap_lock for read in order to change a vma->anon_vma (asserted in
> __anon_vma_prepare() with mmap_assert_locked()).
>
> At the time of this commit, lock_vma_under_rcu() contained:
>
>         /* find_mergeable_anon_vma uses adjacent vmas which are not locke=
d */
>         if (!vma->anon_vma && !vma_is_tcp(vma))
>                 goto inval;
>
> so we really did have to wait for read holders to finish the fault.
> But commit a373baed5a9d deferred the check for a NULL anon VMA until we
> actually needed it, so I think commit fb49c455323f's logic was invalidate=
d
> by a373baed5a9d.
>
> Maybe I'm wrong.  This is all a bit out of my normal area.
>
> > Also we have asserts for this lock in copy_page_range() and
> > copy_hugetlb_page_range() which will now fail (and possibly more furthe=
r down
> > the stack?)
>
> Possibly we have to adjust some assertions to check that either we have
> the VMA locked or we have the MM write locked.  That doesn't seem
> unreasonable.
>
> > > My argument for why it's safe is that a thread which takes a page
> > > fault during fork() might have taken the page fault either before or
> > > after fork().  The faults will definitely happen in the parent proces=
s.
> > > They may or may not have happened in the child process, which can't
> > > possibly care whether or not they've happened.
> >
> > The problem isn't the child it's the parent - copy_page_range() _modifi=
es_ the
> > _parent_'s page tables in-place, on assumption that nothing else can ac=
cess
> > them (for CoW).
>
> I was perhaps unclear.  What I mean is that the child may or may not
> observe them as having happened.
>
> > And actually nowadays things are _even_ worse, you could also have conc=
urrent
> > page faults, MADV_DONTNEED, MADV_FREE, MADV_GUARD_INSTALL/REMOVE, UFFDI=
O_COPY +
> > UFFDIO_MOVE (yikes) all of which might introduce new issues + would hav=
e to be
> > audited too.
>
> Yup.
>
> > So - it turns out a lot of stuff implicitly assumes VMA write lock now:
> >
> > 1. CoW - deferred TLB flush race
> >
> > (The issue above)
> >
> > https://lore.kernel.org/all/20230705171213.2843068-2-surenb@google.com/
> >
> > This happens because __copy_present_ptes() does wrprotect_ptes() on the=
 parent
> > without a TLB flush (that's deferred until the end of the fork).
> >
> > But unfortunately without a VMA write lock something can then replace t=
he page
> > table entry in the meantime and you can end up with data loss as a resu=
lt.
>
> Is it that fb49c455323f commit message is insufficient and we need to
> prevent simultaneous fork/page fault for other reasons, then?

Yes, I think so. It refers to one of the reasons VMA lock is needed
during fork, but as Lorenzo points out, there are a number of other
reasons that require fork to protect VMAs. Note that some of those
reasons, like MADV_GUARD_INSTALL and UFFDIO_MOVE did not exist at the
time fb49c455323f was written.

Below is the list that AI pointed out, and I think Lorenzo covered
most if not all of them:

Without vma_start_write_killable(mpnt):
      1. In-flight VMA readers that locked mpnt before
mmap_write_lock_killable(oldmm) continue running concurrently with
dup_mmap().
      2. New VMA readers (page faults via lock_vma_under_rcu(),
madvise under MADVISE_VMA_READ_LOCK, userfaultfd via uffd_lock_vma() /
uffd_move_lock(), vma_start_read_unlocked(), etc.) continue to succeed
on mpnt while dup_mmap() duplicates its VMA metadata and page tables.

  (Note: When this lock was originally added in fb49c455323f, one
prominent trigger was a concurrent fault calling anon_vma_prepare() on
a VMA with mpnt->anon_vma =3D=3D NULL while anon_vma_fork() /
vma_needs_copy() ran. Although __vmf_anon_prepare() now requires
mmap_read_trylock()
  when !vma->anon_vma, removing vma_start_write_killable(mpnt) today
still breaks several critical invariants.)
  =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
  ### What would happen if we removed it

  1. **Destruction of live 2MB THP mappings ("bad pmd" -> pmd_clear())
in copy_pmd_range()**
  As noted in the comment in copy_pte_range(), copy_pmd_range()
assumes no concurrent THP transitions on src_pmd:
    if (pmd_is_huge(*src_pmd)) { ... }
    if (pmd_none_or_clear_bad(src_pmd))
        continue;
  On an anonymous VMA that already has mpnt->anon_vma !=3D NULL, a
concurrent per-VMA-locked THP fault (do_huge_pmd_anonymous_page()) or
UFFDIO_MOVE can install a transparent huge PMD into *src_pmd right
after pmd_is_huge(*src_pmd) observed pmd_none.
pmd_none_or_clear_bad(src_pmd)
  then sees pmd_bad(*src_pmd) =3D=3D true (a THP leaf PMD satisfies
pmd_bad()), prints "bad pmd ...", and calls pmd_clear_bad(src_pmd) =E2=80=
=94
wiping out the parent's live 2MB PMD without PTL, TLB flush, or
rmap/refcount/deposited-pgtable/RSS cleanup (corrupting parent memory
and
  triggering Bad rss-counter / nr_ptes bugs on exit).
      =E2=80=A2 The same race exists for huge PUDs in copy_pud_range()
(pud_none_or_clear_bad(src_pud)).
      =E2=80=A2 Similarly, copy_huge_pmd() reads special huge PMDs
(VM_PFNMAP/VM_MIXEDMAP) locklessly and skips rechecking *src_pmd under
src_ptl assuming it cannot change, so a concurrent MADV_DONTNEED under
MADVISE_VMA_READ_LOCK could leave the child mapping a stale/zapped PFN
PMD.
  2. **Silent CoW data corruption / lost parent writes due to deferred
flush_tlb_mm(oldmm)**
  __copy_present_ptes(), copy_huge_pmd(), and
copy_hugetlb_page_range() write-protect parent PTEs/PMDs without
flushing TLBs; dup_mmap() defers the flush to flush_tlb_mm(oldmm)
after all VMAs are copied. Normally, because each copied VMA remains
VMA-write-locked until
  mmap_write_unlock(oldmm), no parent thread can handle a CoW write
fault before flush_tlb_mm(oldmm) finishes.
  Without the VMA write lock, while CPU 0 is still in dup_mmap()
copying later VMAs:
      =E2=80=A2 CPU 1 (parent thread A) still holds a stale writable TLB en=
try
to old_folio (now CoW-shared with the child).
      =E2=80=A2 CPU 2 (parent thread B, no cached TLB entry) writes to the
same page, faults on the R/O PTE under per-VMA read lock, enters
wp_page_copy(), and copies old_folio into new_folio
(__wp_page_copy_user()) before taking PTL and calling
ptep_clear_flush().
      =E2=80=A2 Any store by CPU 1 through its stale writable TLB entry aft=
er
__wp_page_copy_user() and before ptep_clear_flush() lands directly in
old_folio while pte_same() still succeeds =E2=80=94 losing thread A's write=
 in
the parent (new_folio) and leaking it into the child (old_folio).
  3. Broken guard-page (MADV_GUARD_INSTALL) state and KCSAN race on vm_flag=
s
  madvise(MADV_GUARD_INSTALL) runs under MADVISE_VMA_READ_LOCK and
atomically sets VMA_MAYBE_GUARD_BIT on mpnt via vma_set_atomic_flag()
before installing PTE_MARKER_GUARD entries:
      =E2=80=A2 vm_area_dup(mpnt) asserts
ASSERT_EXCLUSIVE_WRITER(orig->vm_flags), which would trip under KCSAN.
      =E2=80=A2 If vm_area_dup(mpnt) copies mpnt->vm_flags just before
MADV_GUARD_INSTALL sets VMA_MAYBE_GUARD_BIT and installs
PTE_MARKER_GUARD PTEs:
          =E2=80=A2 On a file-backed VMA without anon_vma, tmp misses
VM_MAYBE_GUARD (part of VM_COPY_ON_FORK), so vma_needs_copy() returns
false and drops the guard regions in the child.
          =E2=80=A2 On a VMA with anon_vma !=3D NULL, copy_page_range() cop=
ies
the PTE_MARKER_GUARD entries into tmp, leaving the child VMA with
guard PTE markers without VM_MAYBE_GUARD set (breaking collapse checks
such as file_backed_vma_is_retractable() and future merges/forks).

  4. Inconsistent address-space snapshots against UFFDIO_MOVE and
tcp_zerocopy_receive()
      =E2=80=A2 When UFFD_FEATURE_EVENT_FORK is not enabled, dup_userfaultf=
d()
never increments octx->mmap_changing. Because move_pages()
(UFFDIO_MOVE) only takes per-VMA read locks (uffd_move_lock()), it
could move an exclusive folio from a not-yet-copied src address/VMA
into an
      already-copied dst address/VMA (losing the page at both
addresses in the child), or move a zero page from an already-copied
src to a not-yet-copied dst (duplicating it at both). Even with
UFFD_FEATURE_EVENT_FORK, octx->mmap_changing is only incremented once
dup_mmap()
      reaches the first VMA using octx, so earlier non-uffd VMAs rely
on VMA write-locking to prevent cross-VMA moves.
      =E2=80=A2 tcp_mmap() sets VM_MIXEDMAP (in VM_COPY_ON_FORK, without
VM_DONTCOPY), so copy_page_range() would race with
tcp_zerocopy_receive() zapping and inserting pages under
vma_start_read_unlocked().
  5. Immediate debug assertions (CONFIG_DEBUG_VM)
  Both copy_page_range() and copy_hugetlb_page_range() call
vma_assert_write_locked(src_vma) on every CoW VMA, which immediately
fires VM_WARN_ON_ONCE_VMA(!__is_vma_write_locked(vma), vma) because
oldmm->mm_lock_seq was bumped by mmap_write_lock_killable(oldmm) while
mpnt-
  =EF=BF=BA>vm_lock_seq was never updated.

>
> > Same issue exists with hugetlb wp too. And god only knows with uffd wp =
:)
> >
> > 2. THP - can destroy parent THP mappings
> >
> > copy_pmd_range() does:
> >
> >       if (pmd_is_huge(*src_pmd)) { copy_huge_pmd(); ... }
> >       if (pmd_none_or_clear_bad(src_pmd))
> >               continue;
> >
> > Without the write lock, a concurrent fault can install a huge PMD via
> > do_huge_pmd_anonymous_page() or filemap_map_pmd()/do_set_pmd().
> >
> > The issue is that pmd_bad() fires for leaf PMD (ugh) on at least x86 an=
d arm64,
> > meaning that'll clear the page table entry.
> >
> > I think Hugh left a comment alluding to this before:
> >
> >        * copy_pmd_range()'s prior pmd_none_or_clear_bad(src_pmd), and t=
he
> >        * error handling here, assume that exclusive mmap_lock on dst an=
d src
> >        * protects anon from unexpected THP transitions; ...
> >
> > It's like the mess around pmd_trans_unstable() :(
>
> ... could we fix this by taking the ptlock during the copy operation?
>
> > 3. copy_pte_range() skips the required pmd_same() recheck assuming writ=
e lock
> >
> > It uses pte_offset_map_rw_nolock() with a dummy pmdval and:
> >
> >        * We already hold the exclusive mmap_lock, the copy_pte_range() =
and
> >        * retract_page_tables() are using vma->anon_vma to be exclusive,=
 so
> >        * the PTE page is stable, and there is no need to get pmdval and=
 do
> >        * pmd_same() check.
> >
> > (Probably needs updating for VMA write lock...)
> >
> > 4. The asserts
> >
> > Mentioned above!
> >
> > I suspect there's more as well.
> >
> > Some of it could be changed, but it'd all be at the cost of behaving ve=
ry
> > strangely (no VMA lock but mmap write lock) while manipulating things.
> >
> > And I am not really happy with changing page table entries in the paren=
t VMA
> > (for CoW) without a VMA write lock held.
> >
> > I also wonder whether it would achieve all that much really - the issue=
 is with
> > holding the VMA lock across I/O, anything else that tries to grab a wri=
te lock
> > is going to end up being the new thing that's blocked (mprotect, munmap=
, mremap,
> > mlock etc.)
> >
> > I think doing something like this would need a very significant redesig=
n and I'm
> > not convinced it's one that really achieves what we want given all the =
other
> > cases that'd get blocked by the VMA lock being held still.
> >
> > --
> > Cheers, Lorenzo

