Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E36D9CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 20:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ae+dijTOTo/8e3HvGN3FEZCQc/7H0q/1pnPZoGZAADo=; b=eoOa3swHnNtVBCCubjLJePRJ+s
	Jd683E3ONqE2tY15M7lj2JFBtzBA7vSZfNQVzkA61mXhMjnTryGrNeBTyLypMpVyj4x9eBxUxmM3k
	MLBCOEJRHDH+7QAod5SJBatHw93PZiC7vGLaFoqbUlHIBt5XOmqY77IufpX1Ezi6lSbpuAvKvdS24
	+xJlPxzG2LWCRi6x/OEMtPQe9XpE7JsKd87sA86/1CSCXjR7CQnkFXdi8A9J7g51Bv2C0mKYXfhjO
	5v28HkaFnSO2gAhGxLgJTjFyUYkx+F9ZL12vRx32ZqWUnsuxwa2TblYE3kWk0uAUDTE4RMBornfaY
	HpeEcZHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPRRa-00000002mYD-11v4;
	Tue, 19 May 2026 20:53:38 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPRRE-00000002mW5-3NTU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 20:53:37 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-67e9e343b22so6129960a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 13:53:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779223995; cv=none;
        d=google.com; s=arc-20240605;
        b=Qdo1IzlvRWqmwm8RQIvEFOzE9A/jtDZNdhqG3qu7Evc+lCbs/g/s8PgA6pKMGrFV+g
         KLb9BUlQ36/qoJsDmjA39ez+Rh39tsUO4lAROPy8QFF1v1YrMAhJC4CHWfr9aPG9AfGk
         6l1F1Ww7ueOY1kAyCSLFNvEFgSY7wCNUSBlURFk1FsfbqsZMK/RByJb5+Sx/URuF7bg4
         C+mc6pCtqXY8uyroJv3SItNmcVhO4+kSPpV/xZAyQrpp9JWbqvp388LpTW8bjcUVGK+g
         FVEYR9KmlB/ZdOvh2ZI6h6Rpbzv36t55JWo0Li0vHps5ceQ7mULO2nP2jQMEdyZulluh
         yJ7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ae+dijTOTo/8e3HvGN3FEZCQc/7H0q/1pnPZoGZAADo=;
        fh=dnZ23eaU2ugj4/dkNF1qlzh0uAgAe+2l/fv/Q9jUnDg=;
        b=W0ojPGRAxndELhMtgZgZFAT0sDDHzP/FyUMEgLQacg8gbKEQ3mBYDUOjYSIXKg0Le4
         X6vO4tJzbQGrtc38e4kMkirdWWPzVdBXPqeMV9mKQ+3VLlAIZPlIpOfKR/zRHDP+u+QS
         uXqXLWjXWHd3/OfrUYQGYmsjfmqbJIf+nmRf7j+hnnRbvoAsbNSKclSr0dh6g7EclwVE
         bPHo3pLsp47uBiO0pZMFyf0R9IQObc1Uc45fO0n6XoxztSeu+1X8r3zQPzl9Zk8ROEZE
         fGQol12EizSbegVv44w2P41WKq/E1vzleLYUC9uVDq8/x+vbtTC8OhL4BigNQb8byq2M
         7E+A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779223995; x=1779828795; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ae+dijTOTo/8e3HvGN3FEZCQc/7H0q/1pnPZoGZAADo=;
        b=IrVp+opXrNxLUTK8wwjUs9X7y0WaYj3sHXbm+aBMdzgE39kjItaUaJd+6xFIPl1SqR
         m5wbzgxIrGLynAjrxA8oDWX84bHemnqF5XSqWF3KwIpYtkGz8UDukyCq0l5h/+tsO3n/
         QqUMnq9N0MquFEhtJr+1ozlC5tClT/QwOSWwEWeQEAIlMnxS+QNa0a2mlSNUg3M0dHb6
         fMVHoulXkv4Lu9VFEpT2VKTKi4Wd4UxsNHvJJuFqJrBJOrbAyTAsht6OWDdfMBdIPrCJ
         7nwyW/5qNtexOBWAZ3wvc35djXMhl8ep8Wi6nyb/YSwBghfxCuI30fMnCAohwyU05Sb6
         TCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779223995; x=1779828795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ae+dijTOTo/8e3HvGN3FEZCQc/7H0q/1pnPZoGZAADo=;
        b=fXNZUefBdbTMWLVMfwzQy26xeQ1yYdmZGPGMHIRJCEAf0KkgKfjNhM1MLtVXkuhrAU
         JzQkI+EtIG4tu7YXSEXygdkgpVRA9cUreLSABybtUQkM6EeX+J9Eaqxs3u32bbedEoBG
         U2yl1UCRX3a4SXcfvKqv92L0c6PrQCLpRGmaV03HGdKl9u88hcDXCiLuwF98tqw9lc+Z
         pwdDXB+tZZCkJqzSZPlHtV3n1nxtL62XyPbigEVTArPlenKEB4FK59+Mgpz/WH8cPYm+
         gcDtd2gWWoMW/ZuYT4IdT5EfMmuIG5F74QxELmWstlV3l3ch4L6DvqBzhsD7Yf5OwMKH
         Wvgg==
X-Forwarded-Encrypted: i=1; AFNElJ9bwAI5b4/pO3epIOwtXSk+lhq1XM2wTcS/Qc1c7lDsXTgEkhiXDuIGOdvGcUo+Jr+4i4QI8e0pUI8VZN/ychpK@lists.infradead.org
X-Gm-Message-State: AOJu0YzKQRE2HOBpjOBjI596j79ouZC1Vrt1MowELF2lSh7LQ7n7U7u5
	AhGMdmrMwYci0xuypjvFq891DmUxqrU4lOXcnqaMWZO7FGcWGAIh5UOANOhq+BAOriIv/fOQZ5Q
	/GdqvapZnQqT0rUjBcGlLF1gLr3WLAP4=
X-Gm-Gg: Acq92OGekxVcAP1w5lWX/otfIcSzx3qimUxIFDW027F+EqpIgMu1CD6jVbonqEur5rA
	hP502oesmgrJJmYKrHFdJOgxlWONyFbWsUdF4FbZPhN9vlmpHOBUThAiIm2XJZPjAEIzi4hTeHI
	+a6UrbjIbfgZnhiPIkotaLIn0DwnQFsGQkSTEU6r4WJX8CAybqTlznNVzoCOYCKMTzIP/57m4vD
	OTbIknV6INDU6Q8KUCp+VbGbM7pp5KvK6q/eaIE6dFKZPxBkIcT7CXqzD0RsU6mNh72BLXEgJck
	MPPB/nq+/g==
X-Received: by 2002:a05:6402:24ce:b0:683:1cc8:84b5 with SMTP id
 4fb4d7f45d1cf-683bc1b7472mr10554792a12.4.1779223994390; Tue, 19 May 2026
 13:53:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260430040427.4672-1-baohua@kernel.org> <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org> <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org> <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <CAHbLzkrOSoh-jmR=uaNvx73n_wn+vExoKY0UzH5zGcfdAiDbNg@mail.gmail.com>
 <CAGsJ_4w_-Y8qNLDeLX9OWpLpK01YG2bF-N6_mGypgsauvfCvkA@mail.gmail.com> <CAHbLzkpbQ4Ca0xC74BJ6iJUVKdpH90qE+E=g7HkDXvcNH1+8+w@mail.gmail.com>
In-Reply-To: <CAHbLzkpbQ4Ca0xC74BJ6iJUVKdpH90qE+E=g7HkDXvcNH1+8+w@mail.gmail.com>
From: Yang Shi <shy828301@gmail.com>
Date: Tue, 19 May 2026 13:53:03 -0700
X-Gm-Features: AVHnY4IimOZqeIRblNaSy2KsMS8vB_GzCmlGYie_zXnP_ZtHrsCb1dPTmYJGNBE
Message-ID: <CAHbLzkp7WcXA6Zey2QjBDrcs1w2hP4dhBoda2G3XF+Q0h_hwsQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Barry Song <baohua@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, surenb@google.com, akpm@linux-foundation.org, 
	linux-mm@kvack.org, david@kernel.org, ljs@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, mhocko@suse.com, jack@suse.cz, 
	pfalcato@suse.de, wanglian@kylinos.cn, chentao@kylinos.cn, 
	lianux.mm@gmail.com, kunwu.chan@gmail.com, liyangouwen1@oppo.com, 
	chrisl@kernel.org, kasong@tencent.com, shikemeng@huaweicloud.com, 
	nphamcs@gmail.com, bhe@redhat.com, youngjun.park@lge.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	Nanzhe Zhao <nzzhao@126.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_135316_899202_95B4B08D 
X-CRM114-Status: GOOD (  65.22  )
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

On Tue, May 19, 2026 at 11:50=E2=80=AFAM Yang Shi <shy828301@gmail.com> wro=
te:
>
> On Tue, May 19, 2026 at 4:07=E2=80=AFAM Barry Song <baohua@kernel.org> wr=
ote:
> >
> > On Tue, May 19, 2026 at 5:21=E2=80=AFAM Yang Shi <shy828301@gmail.com> =
wrote:
> > >
> > > On Sun, May 17, 2026 at 1:45=E2=80=AFAM Barry Song <baohua@kernel.org=
> wrote:
> > > >
> > > > On Sat, May 2, 2026 at 1:58=E2=80=AFAM Matthew Wilcox <willy@infrad=
ead.org> wrote:
> > > > >
> > > > > On Sat, May 02, 2026 at 01:44:34AM +0800, Barry Song wrote:
> > > > > > On Fri, May 1, 2026 at 10:57=E2=80=AFPM Matthew Wilcox <willy@i=
nfradead.org> wrote:
> > > > > > >
> > > > > > > On Fri, May 01, 2026 at 06:49:58AM +0800, Barry Song wrote:
> > > > > > > > 1. There is no deterministic latency for I/O completion. It=
 depends on
> > > > > > > > both the hardware and the software stack (bio/request queue=
s and the
> > > > > > > > block scheduler). Sometimes the latency is short; at other =
times it can
> > > > > > > > be quite long. In such cases, a high-priority thread perfor=
ming operations
> > > > > > > > such as mprotect, unmap, prctl_set_vma, or madvise may be f=
orced to wait
> > > > > > > > for an unpredictable amount of time.
> > > > > > >
> > > > > > > But does that actually happen?  I find it hard to believe tha=
t thread A
> > > > > > > unmaps a VMA while thread B is in the middle of taking a page=
 fault in
> > > > > > > that same VMA.  mprotect() and madvise() are more likely to h=
appen, but
> > > > > > > it still seems really unlikely to me.
> > > > > >
> > > > > > It doesn=E2=80=99t have to involve unmapping or applying mprote=
ct to
> > > > > > the entire VMA=E2=80=94just a portion of it is sufficient.
> > > > >
> > > > > Yes, but that still fails to answer "does this actually happen". =
 How much
> > > > > performance is all this complexity in the page fault handler buyi=
ng us?
> > > > > If you don't answer this question, I'm just going to go in and ri=
p it
> > > > > all out.
> > > > >
> > > >
> > > > Hi Matthew (and Lorenzo, Jan, and anyone else who may be
> > > > waiting for answers),
> > > >
> > > > As promised during LSF/MM/BPF, we conducted thorough
> > > > testing on Android phones to determine whether performing
> > > > I/O in `filemap_fault()` can block `vma_start_write()`.
> > > > I wanted to give a quick update on this question.
> > > >
> > > > Nanzhe at Xiaomi created tracing scripts and ran various
> > > > applications on Android devices with I/O performed under
> > > > the VMA lock in `filemap_fault()`. We found that:
> > > >
> > > > 1. There are very few cases where unmap() is blocked by
> > > >    page faults. I assume this is due to buggy user code
> > > >    or poor synchronization between reads and unmap().
> > > > So I assume it is not a problem.
> > > >
> > > > 2. We observed many cases where `vma_start_write()`
> > > >    is blocked by page-fault I/O in some applications.
> > > >    The blocking occurs in the `dup_mmap()` path during
> > > >    fork().
> > > >
> > > > With Suren's commit fb49c455323ff ("fork: lock VMAs of
> > > > the parent process when forking"), we now always hold
> > > > `vma_write_lock()` for each VMA. Note that the
> > > > `mmap_lock` write lock is also held, which could lead to
> > > > chained waiting if page-fault I/O is performed without
> > > > releasing the VMA lock.
> > > >
> > > > My gut feeling is that Suren's commit may be overshooting,
> > > > so my rough idea is that we might want to do something like
> > > > the following (we haven't tested it yet and it might be
> > > > wrong):
> > > >
> > > > diff --git a/mm/mmap.c b/mm/mmap.c
> > > > index 2311ae7c2ff4..5ddaf297f31a 100644
> > > > --- a/mm/mmap.c
> > > > +++ b/mm/mmap.c
> > > > @@ -1762,7 +1762,13 @@ __latent_entropy int dup_mmap(struct mm_stru=
ct
> > > > *mm, struct mm_struct *oldmm)
> > > >         for_each_vma(vmi, mpnt) {
> > > >                 struct file *file;
> > > >
> > > > -               retval =3D vma_start_write_killable(mpnt);
> > > > +               /*
> > > > +                * For anonymous or writable private VMAs, prevent
> > > > +                * concurrent CoW faults.
> > > > +                */
> > > > +               if (!mpnt->vm_file || (!(mpnt->vm_flags & VM_SHARED=
) &&
> > > > +                                       (mpnt->vm_flags & VM_WRITE)=
))
> > > > +                       retval =3D vma_start_write_killable(mpnt);
> > > >                 if (retval < 0)
> > > >                         goto loop_out;
> > > >                 if (mpnt->vm_flags & VM_DONTCOPY) {
> > >
> > > Maybe a little bit off topic. This is an interesting idea. It seems
> > > possible we don't have to take vma write lock unconditionally. IIUC
> > > the write lock is mainly used to serialize against page fault and
> > > madvise, right? I got a crazy idea off the top of my head. We may be
> > > able to just take vma write lock iff vma->anon_vma is not NULL.
> > >
> > > First of all, write mmap_lock is held, so the vma can't go or be
> > > changed under us.
> > >
> > > Secondly, if vma->anon_vma is NULL, it basically means either no page
> > > fault happened or no cow happened, so there is no page table to copy,
> > > this is also what copy_page_range() does currently. So we can shrink
> > > the critical section to:
> > >
> > > if (vma->anon_vma) {
> > >     vma_start_write_killable(src_vma);
> > >     anon_vma_fork(dst_vma, src_vma);
> > >     copy_page_range(dst_vma, src_vma);
> > > }
> > >
> > > But page fault can happen before write mmap_lock is taken, when we
> > > check vma->anon_vma, it is possible it has not been set up yet. But i=
t
> > > seems to be equivalent to page fault after fork and won't break the
> > > semantic.
> >
> > Re-reading Suren's commit log for fb49c455323ff8
> > ("fork: lock VMAs of the parent process when forking"),
> > it seems that vm_start_write() is used to protect
> > against a race where anon_vma changes from NULL to
> > non-NULL during fork. In that scenario, we hold the
> > mmap_lock write lock, but not vma_start_write(), so a
> > concurrent anon_vma_prepare() could still install an
> > anon_vma.
> >
> > "    A concurrent page fault on a page newly marked read-only by the pa=
ge
> >     copy might trigger wp_page_copy() and a anon_vma_prepare(vma) on th=
e
> >     source vma, defeating the anon_vma_clone() that wasn't done because=
 the
> >     parent vma originally didn't have an anon_vma, but we now might end=
 up
> >     copying a pte entry for a page that has one.
> > "
> >
> > If that is the case, then your change does not work.
> >
> > Nowadays, nobody calls anon_vma_prepare(vma) directly.
> > Instead, vmf_anon_prepare() is used, and we always
> > require the mmap_lock read lock before calling
> > __anon_vma_prepare(). As a result, anon_vma cannot
> > transition from NULL to non-NULL during fork.
> >
> > So the original race condition has effectively
> > disappeared.
>
> anon_vma_prepare() has some usecases too, but it seems like it
> requires taking read mmap_lock too if I read the code correctly.
>
> >
> > You also mentioned the madvise() case. If I understand
> > correctly, madvise() should take mmap_lock before
> > modifying anon_vma. Only some parts of madvise() can
> > support per-VMA locking. Therefore, we probably do not
> > need:
> >
> > if (vma->anon_vma) {
> > vma_start_write_killable(src_vma);
> > ...
> > }
>
> I think we still need write vma lock to serialize anon_vma fork
> otherwise we may see:
>
>         CPU 0                                                 CPU 1
> fork                                                       page fault
>    src vma has no anon_vma
>        skip vma fork
>
> allocate anon_vma for src vma
> vma_needs_copy() sees anon_vma
> copy page
>
> Then we may end up being no anon_vma for dst vma, but with pages mapped i=
n it.

Sorry, this should not happen because creating anon_vma in page fault
needs to take mmap_lock.

Thanks,
Yang

>
> Thanks,
> Yang
>
> >
> > >
> > > Anyway, just a crazy idea, I may miss some corner cases.
> >
> > To me, it seems that we could remove vma_start_write()
> > entirely now. Or is that an even crazier idea?
>
>
> >
> > Thanks
> > Barry

