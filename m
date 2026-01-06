Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64683CE9D42
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 14:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jp2FJp4mip9k/yNPjJbmpok2wWGuJgO5Pl2nOe2MRoU=; b=SwDxAsKbZUB+EwjLnnEEXrr4MP
	Wm8VkeKAJX1ZjsIARfqkGCfo3vUaAhDV9OH3bEmslN2ETHT2sQDreD11MjVQEY6waA7sYiINlriON
	dJyFgbuv2wZRV9+kK07/9UHZb6SmQlSwVy/YxZhGPhul6HHBI/ChLTZMwCv+0RELqdXLo3dLYiY9p
	LaalkC+Eqd0SFeqmX7HmrH+doe890m0/prd9vQ9ZBXTfCv2OxRLvC5YDTfLL6nQJCx/P6uahZ5xBd
	vadnXWmVom8q5hySZ0eEB/UBoxgewkqZS92HH5Il+BGtyMhpPKVu1wOZMK9ozRR+71KPMd3lTcR7b
	blTYSDQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8TC-0000000DLQw-3WKf;
	Tue, 06 Jan 2026 14:55:38 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8T9-0000000DLPY-2Cac
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 14:55:36 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-88a35a00502so8701226d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 06:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767711334; x=1768316134; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jp2FJp4mip9k/yNPjJbmpok2wWGuJgO5Pl2nOe2MRoU=;
        b=kfgqFiOyquK5HRtEAJK1+0yTe9ioUyaTKVdbwgfzTG8U6Irpg2VRT1oXfJ2qe+40P5
         HgHQNslS1Z9fuXKL8TkLeelfw4e5tZ07eyNLxnFRGAMXsgCvtUDvFto4yCls1krkurjA
         AFD2ZjDeqzdFDawyILWR1JBxzWUICv7zAmzihQA0vubs6vY43nZh9aZwob95V7u/4qv6
         UA8f+2GpfyUTjlOuFMrLqTOUWlHvV59I8JKFu3RpC7mRquEKPjcWhJL26YB6kOT7rqul
         8rDw3B1Zr6Pl8XwqAbwnb0gYK2IU2Pid4163DYuWzEXAvJlVlan4+H+nvlJE1Odsoizk
         sfGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767711334; x=1768316134;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jp2FJp4mip9k/yNPjJbmpok2wWGuJgO5Pl2nOe2MRoU=;
        b=rA/3AeHaegzuCg6UBM7vx5dN7Wrj+qlrHQVBEkufvpA2mn/sPgUdqy6YM0rbcycpv9
         MSFMxkI88LVPijirhlt93b4OtEVy8iyR8U89PPiSL5PNU1cIMZd2FcTCYCfIzhULkIzw
         k5qB1abEOJSRm7dtwJKwtdjDV/fI355CeSUeClB07QE0FxuYoy6dhxFosb9RaTbDbxEa
         YDC6MOGHTJvXPf69reCFABthjwv+wEKXFTZNU5btv4bLX3axskTaUHf2pB5u4bPiNNYd
         SBN620+unb7r4JqeH/6Uwaq+KkXvzXe3fOY4wCcYKdgrPBPoYOugGevt4uweJaK8fyof
         Nu5A==
X-Forwarded-Encrypted: i=1; AJvYcCWUMx66l1qfUISsJkw95fWORx8+VuOv4HpATYuBI+imwZ2Y2pcdO1Kj1X+YPab1VbKppb8Z5WyV57l8AMEEcDY4@lists.infradead.org
X-Gm-Message-State: AOJu0YwUlfFHsVHXW7v1oP/IpFOu/PJ83R7a3E7JCXgB03PN/f059LBd
	LfsjV9C1zT93QsLS9dXFnTfEjidAOl0m91N9BcPS1YZpTQNAGDkYYJHuImSpbWhS
X-Gm-Gg: AY/fxX61vmowhsXbYfaC9h4ZPW03T7Hs0UVJsOlJpwv7NE1uuJPlcvWP2waqryDAX0O
	Qawu5saYF7XHdxGc38FMkTN9qDvLkqjzIkn7j2sNbYlfaaZdYrEguagNJXz+HV5ALnUf/VDCS3s
	giy7p1dL83z6B8a/Oe5gX5JrfegAmnG39BikjR2wQhyy4K9FA75Bd+0+ZIAwFCLkVFStY2H8ulU
	Yy/ue1G1/Z7dv3dvx4BUL3dzud7h6Cj4uwn+32wCKyB6HgP7BtFh2Ls0GznpSaaOdHrOQObC73p
	Qr0qo4u4seSYGt6aj4NCPZBuWN+ER5LHraj5Rwr4EWL8Sz2QQP+JKWCY8WTHxd2d4Z3N9DeP6tL
	3Dt2lG4qyM1JMcq3uFhkKUzIjIRaC1CeLcFFOwW3kyK+OxpvDeYjDEgNXdQSiWjHQQkQGCTUbbh
	DwBaonhZHfYOSDe+ZfxbddF+b8i87HtdE2icvkNmVnF6zn5HMtF4986gXSdpSr3oRt6JOsbtpIm
	4tfxgZHg/GSaBY=
X-Google-Smtp-Source: AGHT+IG5y3ihX/nTQRrfdnHMzNLd9H06QzeACVIIpJzxoRgRUvLgvocrP0wK6dPyXld6Qki9Sw/yPg==
X-Received: by 2002:a05:620a:288c:b0:8ba:3d82:de2d with SMTP id af79cd13be357-8c37eba72a1mr370948885a.67.1767704008339;
        Tue, 06 Jan 2026 04:53:28 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4b917dsm164759585a.17.2026.01.06.04.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 04:53:27 -0800 (PST)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 1A164F4006A;
	Tue,  6 Jan 2026 07:53:27 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 06 Jan 2026 07:53:27 -0500
X-ME-Sender: <xms:xwVdaeSwbODV7JqbJ70h7aGUkLI7HOUIqGtt0UjiY610MF7ckv8YEg>
    <xme:xwVdaTtqxf6X0AeSmMq2jiMUHiapXLUuSuZyJ5C68VWdlE2GQRJ4aEWMigN514O-Z
    BWYgOWPHY2GeXQDqo442If5_P2j_xb-eKTigT9gEv78i-Ij-tjV0A>
X-ME-Received: <xmr:xwVdaXZb5P9ZpRNJkzh2SnpqGPacj89O-78H8b7BMQL9JrV7xyey9juS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutddtvdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffei
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepfedupdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprg
    hlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepfihilhhlsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrgh
    dprhgtphhtthhopehrihgthhgrrhgurdhhvghnuggvrhhsohhnsehlihhnrghrohdrohhr
    ghdprhgtphhtthhopehmrghtthhsthekkeesghhmrghilhdrtghomhdprhgtphhtthhope
    hlihhnmhgrghejsehgmhgrihhlrdgtohhmpdhrtghpthhtoheptggrthgrlhhinhdrmhgr
    rhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdroh
    hrgh
X-ME-Proxy: <xmx:xwVdae9J9x8NVgALl-fYcI0QyRYoJ8m4It2cassa207a7v4AO5AS5w>
    <xmx:xwVdaRDZBNB3WNQx4PzUXkrUELWrCDwMSb-w1jqBFkK0Cfzgn4_t8w>
    <xmx:xwVdaSspqARYw-uR9irVFm2eOEvEv4sQoz9Uj2_d1Kyqx7WVrftBdw>
    <xmx:xwVdaTY_Z8cWkR_hhc-sOC9FlhMGZEOlJUBtP3nKJNhE-HvXSTqXtA>
    <xmx:xwVdaQ2LGWFdzBBPz915RcVkKGU6vZncXMNXyt0GIVzyJMw7Lo_LJt7k>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Jan 2026 07:53:26 -0500 (EST)
Date: Tue, 6 Jan 2026 20:53:24 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,	Magnus Lindholm <linmag7@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,	Mark Rutland <mark.rutland@arm.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,	Lyude Paul <lyude@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,	rust-for-linux@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 2/5] rust: sync: add READ_ONCE and WRITE_ONCE
Message-ID: <aV0FxCRzXFrNLZik@tardis-2.local>
References: <20251231-rwonce-v1-0-702a10b85278@google.com>
 <AaMhgQBVJNQ-lfS70C2wyfbsXmJnxoK2QB0Qn6z77hc-gErX1ZpvLzFO-EJrFXKRQml2Qfqe87TLzFwYybVb1g==@protonmail.internalid>
 <20251231-rwonce-v1-2-702a10b85278@google.com>
 <87ldiaj560.fsf@t14s.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ldiaj560.fsf@t14s.mail-host-address-is-not-set>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_065535_586127_9AD1BDB7 
X-CRM114-Status: GOOD (  41.83  )
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

On Tue, Jan 06, 2026 at 01:29:11PM +0100, Andreas Hindborg wrote:
> "Alice Ryhl" <aliceryhl@google.com> writes:
> 
> > There are currently a few places in the kernel where we use volatile
> > reads when we really should be using `READ_ONCE`. To make it possible to
> > replace these with proper `READ_ONCE` calls, introduce a Rust version of
> > `READ_ONCE`.
> >
> > I've written the code to use Rust's volatile ops directly when possible.
> > This results in a small amount of code duplication, but I think it makes
> > sense for READ_ONCE and WRITE_ONCE to be implemented in pure Rust when
> > possible. Otherwise they would unconditionally be a function call unless
> > you have a system where you can perform cross-language inlining.
> >
> > I considered these functions in the bindings crate instead of kernel
> > crate. I actually think it would make a lot of sense. But it implies
> > some annoying complications on old compilers since the #![feature()]
> > invocations in kernel/lib.rs do not apply in the bindings crate.
> >
> > For now, we do not support using READ_ONCE on compound types even if
> > they have the right size. This can be added later.
> >
> > This fails checkpatch due to a misordered MAINTAINERS entry, but this is
> > a pre-existing problem.
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  MAINTAINERS                |   2 +
> >  rust/helpers/helpers.c     |   1 +
> >  rust/helpers/rwonce.c      |  34 ++++++++
> >  rust/kernel/sync.rs        |   2 +
> >  rust/kernel/sync/rwonce.rs | 188 +++++++++++++++++++++++++++++++++++++++++++++
> >  5 files changed, 227 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 12f49de7fe036c2439c00f9f4c67b2219d72a4c3..1d0cae158fe2cc7d99b6a64c11176b635e2d14e4 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -4117,9 +4117,11 @@ F:	arch/*/include/asm/atomic*.h
> >  F:	include/*/atomic*.h
> >  F:	include/linux/refcount.h
> >  F:	scripts/atomic/
> > +F:	rust/helpers/rwonce.c
> >  F:	rust/kernel/sync/atomic.rs
> >  F:	rust/kernel/sync/atomic/
> >  F:	rust/kernel/sync/refcount.rs
> > +F:	rust/kernel/sync/rwonce.rs
> >
> >  ATTO EXPRESSSAS SAS/SATA RAID SCSI DRIVER
> >  M:	Bradley Grove <linuxdrivers@attotech.com>
> > diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> > index 79c72762ad9c4b473971e6210c9577860d2e2b08..28b79ca7844fb744e5ad128238824921c055ec82 100644
> > --- a/rust/helpers/helpers.c
> > +++ b/rust/helpers/helpers.c
> > @@ -48,6 +48,7 @@
> >  #include "rcu.c"
> >  #include "refcount.c"
> >  #include "regulator.c"
> > +#include "rwonce.c"
> >  #include "scatterlist.c"
> >  #include "security.c"
> >  #include "signal.c"
> > diff --git a/rust/helpers/rwonce.c b/rust/helpers/rwonce.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..55c621678cd632e728cb925b6a4a2e34e2fc4884
> > --- /dev/null
> > +++ b/rust/helpers/rwonce.c
> > @@ -0,0 +1,34 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +/*
> > + * Copyright (C) 2025 Google LLC.
> > + */
> > +
> > +#ifdef CONFIG_ARCH_USE_CUSTOM_READ_ONCE
> > +
> > +__rust_helper u8 rust_helper_read_once_1(const u8 *ptr)
> > +{
> > +	return READ_ONCE(*ptr);
> > +}
> > +
> > +__rust_helper u16 rust_helper_read_once_2(const u16 *ptr)
> > +{
> > +	return READ_ONCE(*ptr);
> > +}
> > +
> > +__rust_helper u32 rust_helper_read_once_4(const u32 *ptr)
> > +{
> > +	return READ_ONCE(*ptr);
> > +}
> > +
> > +__rust_helper u64 rust_helper_read_once_8(const u64 *ptr)
> > +{
> > +	return READ_ONCE(*ptr);
> > +}
> > +
> > +__rust_helper void *rust_helper_read_once_ptr(void * const *ptr)
> > +{
> > +	return READ_ONCE(*ptr);
> > +}
> > +
> > +#endif
> > diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
> > index 5df87e2bd212e192b8a67644bd99f05b9d4afd75..a5bf7bdc3fa8a044786eafae39fe8844aeeef057 100644
> > --- a/rust/kernel/sync.rs
> > +++ b/rust/kernel/sync.rs
> > @@ -20,6 +20,7 @@
> >  pub mod poll;
> >  pub mod rcu;
> >  mod refcount;
> > +pub mod rwonce;
> >  mod set_once;
> >
> >  pub use arc::{Arc, ArcBorrow, UniqueArc};
> > @@ -30,6 +31,7 @@
> >  pub use lock::spinlock::{new_spinlock, SpinLock, SpinLockGuard};
> >  pub use locked_by::LockedBy;
> >  pub use refcount::Refcount;
> > +pub use rwonce::{READ_ONCE, WRITE_ONCE};
> >  pub use set_once::SetOnce;
> >
> >  /// Represents a lockdep class. It's a wrapper around C's `lock_class_key`.
> > diff --git a/rust/kernel/sync/rwonce.rs b/rust/kernel/sync/rwonce.rs
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..a1660e43c9ef94011812d1816713cf031a73de1d
> > --- /dev/null
> > +++ b/rust/kernel/sync/rwonce.rs
> > @@ -0,0 +1,188 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +// Copyright (C) 2025 Google LLC.
> > +
> > +//! Rust version of the raw `READ_ONCE`/`WRITE_ONCE` functions.
> > +//!
> > +//! C header: [`include/asm-generic/rwonce.h`](srctree/include/asm-generic/rwonce.h)
> > +
> > +/// Read the pointer once.
> > +///
> > +/// # Safety
> > +///
> > +/// It must be safe to `READ_ONCE` the `ptr` with this type.
> > +#[inline(always)]
> > +#[must_use]
> > +#[track_caller]
> > +#[expect(non_snake_case)]
> 
> I really do not think we need to have screaming snake case here. I
> understand that this is what the macro looks like in C code, but we do
> not need to carry that over.
> 

We should really do a atomic_load and atomic_store (implemented by
Atomic::from_ptr()) to those usages:

    unsafe atomic_load<T: AtomicType, O: AcquireOrRelaxed>(ptr: *mut T, ordering: O) -> T {
        Atomic::from_ptr(ptr).load(ordering)
    }

    unsafe atomic_store<T: AtomicType, O: AcquireOrRelaxed>(ptr: *mut T, v: T, ordering: O) {
        Atomic::from_ptr(ptr).store(v, ordering);
    }

This unifies the underlying implementation and clarify the atomicity of
these operations.

Regards,
Boqun

> 
> Best regards,
> Andreas Hindborg
> 

