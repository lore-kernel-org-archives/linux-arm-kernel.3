Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C62CD1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Dec 2025 09:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xzV6VTi3heQS7OEBQTMqLKOcv1aH7RFKY+W86ZpOgjY=; b=DheCe6QN+o2EFnmE2Qn+wh86V4
	pQCXvOvVTlK3oOEo8lJ+FlqA6AmXOmbPKU5MjbD4/n36nfeyG9W1i1neRtwZH+/oixfPk5zePFMrt
	r+2/rjHVA/YJtWvOdSztblInf30V3khQkH/RTUSmZ1r43xhP8K2CiFmO9KiR+bfeasMrt2KiLJrRm
	EJlSYiGU4UXeWyKCEtPx/fEinSde8vwFLz9hA4tAptNBgi2101L4lsucaeIKjEYDMdJni2grxKMIN
	e7Uzm7VZWkQ52pUHKDTCyZLYjauTfRdhAtRLoCp5Juv/GilUsKoTxQI8xoxG3aQjJGlDqxH0Sk/MG
	uyBIdu6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSBYR-0000000BeK3-3XIW;
	Sun, 07 Dec 2025 09:59:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSBYP-0000000BeJf-1r5t
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Dec 2025 09:59:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 86C1743D6A
	for <linux-arm-kernel@lists.infradead.org>; Sun,  7 Dec 2025 09:59:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6226DC4AF09
	for <linux-arm-kernel@lists.infradead.org>; Sun,  7 Dec 2025 09:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765101582;
	bh=uGPaKcAXCwluBElvNXo8BDPBTb28aZy1ms08Tpr950U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fmDTilKl5UfJeUwSA5kqIeECvBgWmBoKLlhEmf1OmH1Yfo9CnHlrds4/FT724WsC3
	 9lfqbmVrX1IsflsbpzjjBEf//osePVjF3KWAGc/EkD5tg9lHJn6eEoekwmca7c9VCh
	 kLe5I6jxnVgS/2ASBmjz1YeHl8angB8RBPq/bnlkCo2rOySe+Q6VW7+TfBgsPOACZO
	 /svlx5YeFr1f55iGp1h81SrJqvWTcyz5vrjefvdD43vGgiHCS/G1vdfzVe7EJXtea6
	 I0cAuzYpaY5L8cPWYw3VHbEkLFx/VzvF048un3EW2HReycqkdKp5k1ibi5kaRTlgg5
	 ylnoUJ9lRzhMQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5959105629bso3634986e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Dec 2025 01:59:42 -0800 (PST)
X-Gm-Message-State: AOJu0Ywq8p6uLD/vEsUhOTN94b1SAoORk86z1M9tMsXpxwpgJr9guxAs
	+HBh5UCd0KjOqbAh1yp9VOLYGyOOUN6BW4fzwGPweTY0X5ARHKl24iPJuIe5bxzuXij92CSXB6L
	RSWQTzS6Q9Da11FVJvKYbVhnVvEWoftM=
X-Google-Smtp-Source: AGHT+IFMmVSUmUSEk43NxxD0TDVPtzNN6TxJWqbhpuXN19U7veLd7x2sZIcvsglj4BUPMADLQD6gvXG33/u3xQ2EMrk=
X-Received: by 2002:a05:6512:b98:b0:590:6598:4edf with SMTP id
 2adb3069b0e04-598853bdd93mr1247185e87.47.1765101580691; Sun, 07 Dec 2025
 01:59:40 -0800 (PST)
MIME-Version: 1.0
References: <20251204162815.522879-2-ardb@kernel.org> <20251205064809.GA26371@sol>
 <CAMj1kXE8qn7MSY1A31CrHRSxw+NXqNGLo=FLo4D-COMhxPAMiw@mail.gmail.com> <20251207013004.GA143349@sol>
In-Reply-To: <20251207013004.GA143349@sol>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 7 Dec 2025 10:59:29 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEWYQYW92=yRG6sJmmrjc8MBz-fdauxX2pq+P2rKhcxmg@mail.gmail.com>
X-Gm-Features: AQt7F2r_c885jF7e5LFwwxhvJBSy2HGaP1WuTUjRCuI8rHNQbHcSJBPh29IiqDA
Message-ID: <CAMj1kXEWYQYW92=yRG6sJmmrjc8MBz-fdauxX2pq+P2rKhcxmg@mail.gmail.com>
Subject: Re: [PATCH] arm64/simd: Avoid pointless clearing of FP/SIMD buffer
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Kees Cook <keescook@chromium.org>, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_015945_529030_1BC7E782 
X-CRM114-Status: GOOD (  42.10  )
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

On Sun, 7 Dec 2025 at 02:30, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Fri, Dec 05, 2025 at 09:13:46AM +0100, Ard Biesheuvel wrote:
> > On Fri, 5 Dec 2025 at 07:50, Eric Biggers <ebiggers@kernel.org> wrote:
> > >
> > > On Thu, Dec 04, 2025 at 05:28:15PM +0100, Ard Biesheuvel wrote:
> > > > The buffer provided to kernel_neon_begin() is only used if the task is
> > > > scheduled out while the FP/SIMD is in use by the kernel, or when such a
> > > > section is interrupted by a softirq that also uses the FP/SIMD.
> > > >
> > > > IOW, this happens rarely, and even if it happened often, there is still
> > > > no reason for this buffer to be cleared beforehand, which happens by
> > > > default when using a compiler that supports -ftrivial-auto-var-init.
> > > >
> > > > So mark the buffer as __uninitialized. Given that this is a variable
> > > > attribute not a type attribute, this requires that the expression is
> > > > tweaked a bit.
> > > >
> > > > Cc: Will Deacon <will@kernel.org>,
> > > > Cc: Catalin Marinas <catalin.marinas@arm.com>,
> > > > Cc: Kees Cook <keescook@chromium.org>
> > > > Cc: Eric Biggers <ebiggers@kernel.org>
> > > > Cc: Justin Stitt <justinstitt@google.com>
> > > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > > > ---
> > > >  arch/arm64/include/asm/simd.h | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > >
> > > > The issue here is that returning a pointer to an automatic variable as
> > > > it goes out of scope is slightly dodgy, especially in the context of
> > > > __attribute__((cleanup())), on which the scoped guard API relies
> > > > heavily. However, in this case it should be safe, given that this
> > > > expression is the input to the guarded variable type's constructor.
> > > >
> > > > It is definitely not pretty, though, so hopefully here is a better way
> > > > to attach this.
> > > >
> > > > diff --git a/arch/arm64/include/asm/simd.h b/arch/arm64/include/asm/simd.h
> > > > index 0941f6f58a14..825b7fe94003 100644
> > > > --- a/arch/arm64/include/asm/simd.h
> > > > +++ b/arch/arm64/include/asm/simd.h
> > > > @@ -48,6 +48,7 @@ DEFINE_LOCK_GUARD_1(ksimd,
> > > >                   kernel_neon_begin(_T->lock),
> > > >                   kernel_neon_end(_T->lock))
> > > >
> > > > -#define scoped_ksimd()       scoped_guard(ksimd, &(struct user_fpsimd_state){})
> > > > +#define scoped_ksimd()       \
> > > > +     scoped_guard(ksimd, ({ struct user_fpsimd_state __uninitialized s; &s; }))
> > >
> > > Ick.  I should have looked at the generated code more closely.
> > >
> > > It's actually worse than you describe, because the zeroing is there even
> > > without CONFIG_INIT_STACK_ALL_ZERO=y, simply because the
> > > user_fpsimd_state struct is declared using a compound literal.
> > >
> > > I'm afraid that this patch probably isn't a good idea, as it relies on
> > > undefined behavior.  Before this patch, the user_fpsimd_state is
> > > declared using a compound literal, which takes on its enclosing scope,
> > > i.e. the 'for' statement generated by scoped_guard().  After this patch,
> > > it's in a new inner scope, and the pointer to it escapes from it.
> > >
> > > Unfortunately I don't think there's any way to solve this while keeping
> > > the scoped_ksimd() API as-is.
> > >
> >
> > How about
> >
> > --- a/arch/arm64/include/asm/simd.h
> > +++ b/arch/arm64/include/asm/simd.h
> > @@ -48,6 +48,8 @@ DEFINE_LOCK_GUARD_1(ksimd,
> >                     kernel_neon_begin(_T->lock),
> >                     kernel_neon_end(_T->lock))
> >
> > -#define scoped_ksimd() scoped_guard(ksimd, &(struct user_fpsimd_state){})
> > +#define scoped_ksimd()         __scoped_ksimd(__UNIQUE_ID(fpsimd_state))
> > +#define __scoped_ksimd(id)     struct user_fpsimd_state __uninitialized id; \
> > +                               scoped_guard(ksimd, &id)
>
> I guess that will work.  It's not great that it will make scoped_ksimd()
> expand into more than one statement, which is error-prone and not
> normally allowed in macros.  But it looks okay for all the current users
> of it.
>

We could always repeat the 'for()' trick that the cleanup helpers use, e.g.,

for (struct user_fpsimd_state __uninitialized __st; true; ({ goto label; }))
    if (0) {
label:    break;
    } else scoped_guard(ksimd, &__st)

Would you prefer that?

