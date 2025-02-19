Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D39C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 17:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p/nTRFO0Yd8987llqHIhS4dDnsUK3BfGiG2YPHH/Tuc=; b=nrP4Y2hNRsDCc1y/TSWkALQy49
	ZncAJQMnrJ4fX6Of6+AVOIbRw5hwoXJvtV1W6bBHaYDJBlE/vx7yZqR9pq6YLJ8BtbBSjrzHlCdFK
	sWPYdmnSp3BbgMIszED4Nc+dwN5PhhKYSkLO/yc/TyKmuzq16bHFV+mFjD7yKtrKWz0MZClc6NDiR
	/PKbxydJ4v5+asz/DXyD7txurlIwRta5XSIrlI2RZTeBssG5TOesp9yUovYwL1dGA+HZiTEu0OUwW
	aSgKs7ioqroAPPNQAwE/PPzw4Bk7pp9W9VvH0SjzJyD7hn5B+lpCc4DHUjEvOaVSsct8D/LFXvfle
	ElYVfP1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tko97-0000000EAGG-1Bsx;
	Wed, 19 Feb 2025 17:46:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tko7d-0000000E9tp-1i34
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 19 Feb 2025 17:44:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=p/nTRFO0Yd8987llqHIhS4dDnsUK3BfGiG2YPHH/Tuc=; b=SZbR7xW5V0SQiSuyc+m4JEvOGR
	Z7wk7TjATEecSL1eUSeExVrlgJVAD3vj/eVp7/fgiKIipEDjMZM4xzghpWYjZC/gOqYNNw6MTlMld
	u75suOU5ANMGD5C8DNiEA7SzuokDGn3lemPUTgj+Y0F+pbx6U3GhrHHUoOdhshanHeKylX0k6AzmH
	dkVzsh6tsVklddy0nLuU9jJ8IN2rcs6D0WAZbvbDrRdJVWjGxSnAT6k1DGhMH9fP4cvrz381li+wA
	HjsD1vXeUunh6mSOrmtMcLLuyBZn35GMajZjv3sqn5MR1rG7epf/40aseCLdobKPPvcVYWlLmKz+/
	z7JV2yMA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tko7a-00000002I6Y-0H83
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 17:44:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 648FA5C5A94
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 17:43:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D8DC4CED1
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 17:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739987068;
	bh=P9559ZQEN05cSHCNws4blnYdv7eulky3QojL+fa+sSY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DMVJe7fpqEzub1KPgxZn7wM8lKnowJesFXcu939vXCxxjWNHi/aaSGkjzV2USGA+I
	 czG8H64YjZoKH52M9tfDkVBuMDmORYpf5usSq2BmX5x97cZfcZJE+pB4+rqgp5Kbys
	 /zOwTN4d2ColFs79GZ2JjpaM19AiEL/2hUhWAQGA9i9Q9dHU+X4r+Wf0K5cf2J/rZk
	 m3PQS6GOpT2h6FKx1ZjtZZhD9XIyBmVA+QpsGL8OL6xUHbSdQVLwJnCghE5o+6ds2F
	 yJfGFafxs0NlQ6fMTrCF3hmeLGduHMgTEZLX+ZzHNDrnd9b6WMzVBjYkX47QukCp81
	 KGRyOX85z96fA==
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3d191bfeafbso102795ab.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 09:44:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVH93QXSGKhfwxoaouKu6nV08yyKX0kNcHBS/B7gInxBpNgdMTjgnBM+nsRxdeUykSqLbGu/V5EhztomQkP2Y15@lists.infradead.org
X-Gm-Message-State: AOJu0YwSPhZL/lmwzyPLcPpFxaxG51jW+lhi2CpbXd3T8/8pTmhhLbT9
	/W6KLHS/0Ean0MpFjMAK9Qntuc9J/McBH5x8rLQEZTGSeQHy8LVkXtIN0y/lVhHbeefNvHIMnG2
	w5KO8SGaxxkcJ4WlDZW/b/uitP5U=
X-Google-Smtp-Source: AGHT+IFqctJDLYt8o9POb825AvbprIhb3/YXU6tj6OURcv7+yyJpYdpSd7sBpONtuh0JXK7WxMebRgB47SmP6H7BRVc=
X-Received: by 2002:a05:6e02:4604:b0:3d2:b34d:a25b with SMTP id
 e9e14a558f8ab-3d2b34da6eamr51053525ab.16.1739987067676; Wed, 19 Feb 2025
 09:44:27 -0800 (PST)
MIME-Version: 1.0
References: <mb61py0yaz3qq.fsf@kernel.org> <CAPhsuW7dV7UR3PsGVx_DLBH5-95DAmLMGTPuY0NfUwWLZMSTrQ@mail.gmail.com>
 <20250214080848.5xpi2y2omk4vxyoj@jpoimboe> <CAPhsuW6dxPtgqZaHrZEVhQXwm2+sETreZnGybZXVKYKfG9H6tg@mail.gmail.com>
 <20250214193400.j4hp45jlufihv5eh@jpoimboe> <CAPhsuW6q+yhn0pGQb0K+RhXHYDkjEgomZ2pu3P_MEeX+xNRe0g@mail.gmail.com>
 <20250214232342.5m3hveygqb2qafpp@jpoimboe> <CAPhsuW48h11yLuU7uHuPgYNCzwaxVKG+TaGOZeT7fR60+brTwA@mail.gmail.com>
 <20250218063702.e2qrpjk4ylhnk5s7@jpoimboe> <CAPhsuW5ZauBrSz11cvVtG5qQBfNmbcwPgMf=BScHtyZfHvK4FQ@mail.gmail.com>
 <20250218184059.iysrvtaoah6e4bu4@jpoimboe>
In-Reply-To: <20250218184059.iysrvtaoah6e4bu4@jpoimboe>
From: Song Liu <song@kernel.org>
Date: Wed, 19 Feb 2025 09:44:16 -0800
X-Gmail-Original-Message-ID: <CAPhsuW4pd8gEiRNj920kO8c4JuEWoXT=MhFK-nWvJZ9QseefaQ@mail.gmail.com>
X-Gm-Features: AWEUYZlbvda0ssoST11NMSiSSWWtT-MfCvr9C6FVMAAFHGp3LqVR7dXcnBcn3yI
Message-ID: <CAPhsuW4pd8gEiRNj920kO8c4JuEWoXT=MhFK-nWvJZ9QseefaQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Puranjay Mohan <puranjay@kernel.org>, Weinan Liu <wnliu@google.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Indu Bhagat <indu.bhagat@oracle.com>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, roman.gushchin@linux.dev, 
	Will Deacon <will@kernel.org>, Ian Rogers <irogers@google.com>, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	joe.lawrence@redhat.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_174430_445491_3EDB88ED 
X-CRM114-Status: GOOD (  24.70  )
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

On Tue, Feb 18, 2025 at 10:41=E2=80=AFAM Josh Poimboeuf <jpoimboe@kernel.or=
g> wrote:
>
> On Tue, Feb 18, 2025 at 10:20:10AM -0800, Song Liu wrote:
> > Hi Josh,
> >
> > On Mon, Feb 17, 2025 at 10:37=E2=80=AFPM Josh Poimboeuf <jpoimboe@kerne=
l.org> wrote:
> > >
> > > On Mon, Feb 17, 2025 at 08:38:22PM -0800, Song Liu wrote:
> > > > On Fri, Feb 14, 2025 at 3:23=E2=80=AFPM Josh Poimboeuf <jpoimboe@ke=
rnel.org> wrote:
> > > > > Poking around the arm64 module code, arch/arm64/kernel/module-plt=
s.c
> > > > > is looking at all the relocations in order to set up the PLT.  Th=
at also
> > > > > needs to be done for klp relas, or are your patches already doing=
 that?
> > > >
> > > > I don't think either version (this set and my RFC) added logic for =
PLT.
> > > > There is some rela logic on the kpatch-build side. But I am not sur=
e
> > > > whether it is sufficient.
> > >
> > > The klp relas looked ok.  I didn't see any signs of kpatch-build doin=
g
> > > anything wrong.  AFAICT the problem is that module-plts.c creates PLT
> > > entries for regular relas but not klp relas.
> >
> > In my tests (with printk) module-plts.c processes the .
> > klp.rela.vmlinux..text.copy_process section just like any other .rela.*
> > sections. Do we need special handling of the klp.rela.* sections?
>
> Ok, I see how it works now:
>
> klp_write_section_relocs()
>         apply_relocate_add()
>                 module_emit_plt_entry()
>
> If that code is working correctly then I'm fresh out of ideas...

I tried to dump assembly of copy_process, but couldn't find any
clue. I am wondering whether this is an issue with gcc-14.2.1.

Puranjay, could you please try with a different gcc, like some
version of gcc-14?

Thanks,
Song

