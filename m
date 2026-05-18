Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1567CD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 11:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oasN+OgbaOKUdlSyv4LBJZ12kRuvWjrq6B74m1t66gg=; b=LE1P8j7hAdkZVO40ZWItMwSZFq
	FlhXW56XYQzETz+oLV6w50PeuW9x6swhPgHr4cRBGTYTzK+8C7eAIX8mRFCmgaTbwgbA+0mb6RdGZ
	21Qqj7g4bz1frlH3qQbzrcJ8Z3zsFlf4M7gGbSBVxlaNXAar1t52/1pBy0lxvWwXFnY/VRsB8CHpP
	OekyXgsCQKO1ppJ1uDH4OJE0zJJ3Hm4cNm+0PTgP+jRZAIw8rFIqSPhW4imsSYD3cIpNW/St38Nhg
	/wQ+XAsLfONPp1j9exMW35sNllJmd/cxMx6jN9FFZFRk99C1bcejTI3wEmmbGXB6trlb6w6wH8F+6
	xxVlUdrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOw6z-0000000FQJO-2JmQ;
	Mon, 18 May 2026 11:26:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOw6w-0000000FQID-36Ox
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 11:26:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=oasN+OgbaOKUdlSyv4LBJZ12kRuvWjrq6B74m1t66gg=; b=eL2mbhbDTbqr2FJ0QY3ovZ1caA
	OPjAdt6ptGo5kwYBoZdwl18WfK0B3he9IROqzvOcjRB2elCNq6SiS9Cmg5G3icYoGMugZC8/0r6M2
	XrDuRwbMq4jh7SO82b7xorHw8aAHchRzI5nE24F/6DqzdvKG3x9NzMw/NN+aed5bxncA1LypbzhVg
	Ft677xtkTukhsjuM54KYKLtPUefgRoGVqnDYE6HGjNbNRuk/dLlJ19raEUBUCD+/5c8SzZBMJMGLc
	3L7y66afGx2ScHwJdgyVPv+SMCYNbZjWheJMfM63CAfch3NxAeacgonUk23nRnALP9jPv06kxnC/r
	FQcGGyBg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOw6t-0000000AvgL-1ako
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 11:26:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 34512445EA
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 11:26:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1926EC2BCC7
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 11:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779103567;
	bh=F3n0UdinpQtyBJO33nDrHQ72Dx0uW0V/XKaoM2m07kI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=O8IvfexkDPZxGEyZROkgccN1L69eenHdSVSaiLCJLi9IOLeCdY4yLFNSTvg+8yDJV
	 mxEkJxHVjUZ+HsDY9UVUpADstXbsIIVrXbyU/fflkXWc9y1wfEccgA+9PaU2w4ZPv+
	 FFufwX0XuMFTMyMlF8iWmFykWDgP8CajHbq4m3yTaAtnJ/jxH8ABB6OVYnFFc2tECU
	 8AnXZTzhin77WWkefbT9s7QO6vN0VHfbGE3q90Y6oSZRWUNyNtiqBz84jL2LAP/A1B
	 PvjatWLWSpZs9qxCNPvQpSYClBXHFNZlPzgRnTKCKEAEO7vV0OVVHc6w0SmT7EoRzt
	 LxxjhSJ/kMAsA==
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-902deb2412fso283445285a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 04:26:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8QJk3sJUrID7U9rs2l7sBBA99KnJqpSorahE3nxRjjm0Uf9kyNa1P/O1JhThjQAai0oz5FwTUzYcXfVGZqFmbB@lists.infradead.org
X-Gm-Message-State: AOJu0YxDMfgDIW1S8UQTTBYAvdWX/iKuZrLkiQseZuxgECP3V8u/el2M
	AYstTrYbV6Wi8RrgxROlUDGCFH4kii0lsMZ/B+otUY5uLz6hOnCqZY/69+wy0HpfY2g7DI9Wwf/
	LRS8a602R67Gwx9iJ2GC6tdD0MMmZjBY=
X-Received: by 2002:a05:620a:414a:b0:910:4023:4fd2 with SMTP id
 af79cd13be357-911cca9d25emr2230185485a.5.1779103565699; Mon, 18 May 2026
 04:26:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260430040427.4672-1-baohua@kernel.org> <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org> <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org> <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <agrWuDNGddNmvMFD@lucifer>
In-Reply-To: <agrWuDNGddNmvMFD@lucifer>
From: Barry Song <baohua@kernel.org>
Date: Mon, 18 May 2026 19:25:54 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zqLfdWoTH9s7FFaqWWj0mESfikYgr7=GcV64qcuXrPxA@mail.gmail.com>
X-Gm-Features: AVHnY4LeGZMchPoL34USSPxXubMnUYltJ3Iu_W0eCgw6q0PgniLXvjRrK9TQyNs
Message-ID: <CAGsJ_4zqLfdWoTH9s7FFaqWWj0mESfikYgr7=GcV64qcuXrPxA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, surenb@google.com, akpm@linux-foundation.org, 
	linux-mm@kvack.org, david@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, mhocko@suse.com, jack@suse.cz, pfalcato@suse.de, 
	wanglian@kylinos.cn, chentao@kylinos.cn, lianux.mm@gmail.com, 
	kunwu.chan@gmail.com, liyangouwen1@oppo.com, chrisl@kernel.org, 
	kasong@tencent.com, shikemeng@huaweicloud.com, nphamcs@gmail.com, 
	bhe@redhat.com, youngjun.park@lge.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, Nanzhe Zhao <nzzhao@126.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_122612_036357_86E46FE9 
X-CRM114-Status: GOOD (  62.98  )
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

On Mon, May 18, 2026 at 5:47=E2=80=AFPM Lorenzo Stoakes <ljs@kernel.org> wr=
ote:
>
> On Sun, May 17, 2026 at 04:45:15PM +0800, Barry Song wrote:
> > On Sat, May 2, 2026 at 1:58=E2=80=AFAM Matthew Wilcox <willy@infradead.=
org> wrote:
> > >
> > > On Sat, May 02, 2026 at 01:44:34AM +0800, Barry Song wrote:
> > > > On Fri, May 1, 2026 at 10:57=E2=80=AFPM Matthew Wilcox <willy@infra=
dead.org> wrote:
> > > > >
> > > > > On Fri, May 01, 2026 at 06:49:58AM +0800, Barry Song wrote:
> > > > > > 1. There is no deterministic latency for I/O completion. It dep=
ends on
> > > > > > both the hardware and the software stack (bio/request queues an=
d the
> > > > > > block scheduler). Sometimes the latency is short; at other time=
s it can
> > > > > > be quite long. In such cases, a high-priority thread performing=
 operations
> > > > > > such as mprotect, unmap, prctl_set_vma, or madvise may be force=
d to wait
> > > > > > for an unpredictable amount of time.
> > > > >
> > > > > But does that actually happen?  I find it hard to believe that th=
read A
> > > > > unmaps a VMA while thread B is in the middle of taking a page fau=
lt in
> > > > > that same VMA.  mprotect() and madvise() are more likely to happe=
n, but
> > > > > it still seems really unlikely to me.
> > > >
> > > > It doesn=E2=80=99t have to involve unmapping or applying mprotect t=
o
> > > > the entire VMA=E2=80=94just a portion of it is sufficient.
> > >
> > > Yes, but that still fails to answer "does this actually happen".  How=
 much
> > > performance is all this complexity in the page fault handler buying u=
s?
> > > If you don't answer this question, I'm just going to go in and rip it
> > > all out.
> > >
> >
> > Hi Matthew (and Lorenzo, Jan, and anyone else who may be
> > waiting for answers),
> >
> > As promised during LSF/MM/BPF, we conducted thorough
> > testing on Android phones to determine whether performing
> > I/O in `filemap_fault()` can block `vma_start_write()`.
> > I wanted to give a quick update on this question.
> >
> > Nanzhe at Xiaomi created tracing scripts and ran various
> > applications on Android devices with I/O performed under
> > the VMA lock in `filemap_fault()`. We found that:
> >
> > 1. There are very few cases where unmap() is blocked by
> >    page faults. I assume this is due to buggy user code
> >    or poor synchronization between reads and unmap().
> > So I assume it is not a problem.
> >
> > 2. We observed many cases where `vma_start_write()`
> >    is blocked by page-fault I/O in some applications.
> >    The blocking occurs in the `dup_mmap()` path during
> >    fork().
> >
> > With Suren's commit fb49c455323ff ("fork: lock VMAs of
> > the parent process when forking"), we now always hold
> > `vma_write_lock()` for each VMA. Note that the
> > `mmap_lock` write lock is also held, which could lead to
> > chained waiting if page-fault I/O is performed without
> > releasing the VMA lock.
>
> Hm but did you observe this 'chained waiting'? And what were the latencie=
s?

We have clearly observed that the `fork()` operations of many
popular Android apps, such as iQiyi, Baidu Tieba, and 10086,
end up waiting on page-fault (PF) I/O when the VMA lock is
held during I/O operations. This has already become a
practical issue. I also believe this can lead to chained
waiting, since the global `mmap_lock` blocks all threads that
need to acquire it.


>
> >
> > My gut feeling is that Suren's commit may be overshooting,
> > so my rough idea is that we might want to do something like
> > the following (we haven't tested it yet and it might be
> > wrong):
>
> Yeah I'm really not sure about that.
>
> Prior to the VMA locks, the mmap write lock would have guaranteed no conc=
urrent
> page faults, which is really what fb49c455323ff is about.
>
> So Suren's patch was essentially restoring the _existing_ forking behavio=
ur, and
> now you're saying 'let's change the forking behaviour that's been like th=
at for
> forever'.


I am afraid not. Before we introduced the per-VMA lock, we
were not performing I/O while holding `mmap_lock`. A page fault
that needed I/O would drop the `mmap_lock` read lock and allow
`fork()` to proceed.

Now, you are suggesting performing I/O while holding the VMA
lock, which changes the requirements and introduces this
problem.

>
> I think you would _really_ have to be sure that's safe. And forking is a =
very
> dangerous time in terms of complexity and sensitivity and 'weird stuff'
> happening so I'd tread _very_ carefully here.

Yep. I think my original proposal did not require any changes
to `fork()`, since it simply preserved the current behavior of
dropping the VMA lock before performing I/O. In that model,
`fork()` would not end up waiting on I/O at all.

What you are suggesting now appears to be performing I/O while
holding the VMA lock, which in turn introduces the need to
change `fork()`.

>
> >
> > diff --git a/mm/mmap.c b/mm/mmap.c
> > index 2311ae7c2ff4..5ddaf297f31a 100644
> > --- a/mm/mmap.c
> > +++ b/mm/mmap.c
> > @@ -1762,7 +1762,13 @@ __latent_entropy int dup_mmap(struct mm_struct
> > *mm, struct mm_struct *oldmm)
> >         for_each_vma(vmi, mpnt) {
> >                 struct file *file;
> >
> > -               retval =3D vma_start_write_killable(mpnt);
> > +               /*
> > +                * For anonymous or writable private VMAs, prevent
> > +                * concurrent CoW faults.
> > +                */
>
> To nit pick I think the comment's confusing but also tells you you don't =
need to
> specific anon check - writable private is sufficient. And it's not really=
 just
> CoW that's the issue, it's anon_vma population _at all_ as well as CoW.
>
> > +               if (!mpnt->vm_file || (!(mpnt->vm_flags & VM_SHARED) &&
> > +                                       (mpnt->vm_flags & VM_WRITE)))
> > +                       retval =3D vma_start_write_killable(mpnt);
>
> I think this has to be VM_MAYWRITE, because somebody could otherwise mpro=
tect()
> it R/W.
>
> I also don't understand why !mpnt->vm_file for a read-only anon mapping (=
more
> likely PROT_NONE) is here, just do the second check?
>
> (Also please use the new interface, so !vma_test(mpnt, VMA_SHARED_BIT) &&
> vma_test(mpnt, VMA_MAYWRITE_BIT))

Yep, I can definitely refine the check further. But before
doing that, I'd first like to confirm that we are aligned on
the direction.

If you still intend to hold the VMA lock while performing I/O,
then I think we should fix `fork()` to avoid taking
`vma_start_write()`.

>
> >                 if (retval < 0)
> >                         goto loop_out;
> >                 if (mpnt->vm_flags & VM_DONTCOPY) {
> >
> > Based on the above, we may want to re-check whether fork()
> > can be blocked by page faults. At the same time, if Suren,
> > you, or anyone else has any comments, please feel free to
> > share them.
> >
> > Best Regards
> > Barry
>
> Technical commentary above is sort of 'just cos' :) because I really ques=
tion
> doing this honestly.

I think we either need to fix `fork()`, or keep the current
behavior of dropping the VMA lock before performing I/O.

>
> I'd also like to get Suren's input, however.

Yes. of course.

>
> Thanks, Lorenzo

Best Regards
Barry

