Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C61D2E034
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 08:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hLN+f25blJAyf0tB+UBo8FV7r3eylLtSd3D5TOYgEjo=; b=KjcuKp1IwANRPiZkPC1dMSv3iw
	8OZQKZLbEq7dnCaG4W/fiHW99rm3KAzwS6YGOdUrh1uPkBV/GzMwuMo1+c3fpR898Ab/RmGhKn+b4
	TY5S+Uusq24JSAdjao4n1tuWZxL9WB/r/G8rrkFwaeo0Jt8+UfyIyufCftNJFNelqLUj2AraHZkkD
	65Rx8Uet0lnJVcCR1l/3LoP8DwaiyIlhQVDaTGh6CZHcAV5/keD+hXyM+AZjyq18Tmblpm+z1s9t3
	8bNeh++P+/AUwZCNTrwBUog3SulF4rvO72ooGBaNaRQvuIa7N00vSaZi9Ie7J6fgAwXx0oIEJ8LE3
	B/buDmFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRQx0-00000009D8i-3s2k;
	Fri, 05 Dec 2025 08:14:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRQwx-00000009D8D-44Jt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 08:14:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DCCD1440A5
	for <linux-arm-kernel@lists.infradead.org>; Fri,  5 Dec 2025 08:13:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD978C113D0
	for <linux-arm-kernel@lists.infradead.org>; Fri,  5 Dec 2025 08:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764922438;
	bh=ju7JY4UeryL2eAre+8vh1xSEmLaVUzDSMO5aHr1fGik=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fnSiQ+iCZojlF+XDj1m5+W8RbNDZ9YhevDC42uyADsI8BgxlBlJobX1erc7NfWh1S
	 0+DNcYeWuHjsILtI33zAsNZ/W5v8UOhzkP7mSGEa6676KOtIIr6XO3m/OWSpZarIbE
	 R3JUqcxYAqvXqLjlMa6prE0IbSOHFnrhbSwZpAOn8jwcPW2Asgp1JN53Ngp0/m8wp9
	 /lXBsShx7BD65HA63rcT+ugjQcgyJUy+N9q3qyMoGY17pfWOn31zNvnujyGkY9Itg6
	 rNObV/qBA1z7axrTAKcToEgySlvqH/vtlK64Yf/0XzxBfJ4iAvSwInpxuNntGe9Tnc
	 TQIPeHCbAFTjQ==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-37ba5af5951so17679331fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 00:13:58 -0800 (PST)
X-Gm-Message-State: AOJu0Ywkjv47sRA0YfwqceiWh3Gb2yhbaPWsvnZKJ+ceU0IajpqXGTiz
	0hdPbtTpWANyEHwoirY+ZAcd6Qf4hcvZ+7QAhsiQUu20wcu/x6rZbzY21AARu8lYV+f6pjGuYvI
	Q/spAnTZ0JDjuWjIxwe/S8bK+0B4QrLQ=
X-Google-Smtp-Source: AGHT+IHFr1pioy7T4dGDdvXbjllkJmwH7DYy8+khq+vuZNcLpr/IYp4ClSKWBYAqKOT4Hik4/6/FGWo2ye4F1a+U4g4=
X-Received: by 2002:a05:6512:e8a:b0:594:74f9:3b3 with SMTP id
 2adb3069b0e04-597d3fafdd8mr3496744e87.29.1764922437162; Fri, 05 Dec 2025
 00:13:57 -0800 (PST)
MIME-Version: 1.0
References: <20251204162815.522879-2-ardb@kernel.org> <20251205064809.GA26371@sol>
In-Reply-To: <20251205064809.GA26371@sol>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 5 Dec 2025 09:13:46 +0100
X-Gmail-Original-Message-ID: <CAMj1kXE8qn7MSY1A31CrHRSxw+NXqNGLo=FLo4D-COMhxPAMiw@mail.gmail.com>
X-Gm-Features: AWmQ_bkLvyxuy46AibQu26n751P_heeUmfYSPQbayiew0ssc4Yee2kk-EHyBaus
Message-ID: <CAMj1kXE8qn7MSY1A31CrHRSxw+NXqNGLo=FLo4D-COMhxPAMiw@mail.gmail.com>
Subject: Re: [PATCH] arm64/simd: Avoid pointless clearing of FP/SIMD buffer
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Kees Cook <keescook@chromium.org>, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_001400_130861_2329C381 
X-CRM114-Status: GOOD (  35.82  )
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

On Fri, 5 Dec 2025 at 07:50, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Thu, Dec 04, 2025 at 05:28:15PM +0100, Ard Biesheuvel wrote:
> > The buffer provided to kernel_neon_begin() is only used if the task is
> > scheduled out while the FP/SIMD is in use by the kernel, or when such a
> > section is interrupted by a softirq that also uses the FP/SIMD.
> >
> > IOW, this happens rarely, and even if it happened often, there is still
> > no reason for this buffer to be cleared beforehand, which happens by
> > default when using a compiler that supports -ftrivial-auto-var-init.
> >
> > So mark the buffer as __uninitialized. Given that this is a variable
> > attribute not a type attribute, this requires that the expression is
> > tweaked a bit.
> >
> > Cc: Will Deacon <will@kernel.org>,
> > Cc: Catalin Marinas <catalin.marinas@arm.com>,
> > Cc: Kees Cook <keescook@chromium.org>
> > Cc: Eric Biggers <ebiggers@kernel.org>
> > Cc: Justin Stitt <justinstitt@google.com>
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  arch/arm64/include/asm/simd.h | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > The issue here is that returning a pointer to an automatic variable as
> > it goes out of scope is slightly dodgy, especially in the context of
> > __attribute__((cleanup())), on which the scoped guard API relies
> > heavily. However, in this case it should be safe, given that this
> > expression is the input to the guarded variable type's constructor.
> >
> > It is definitely not pretty, though, so hopefully here is a better way
> > to attach this.
> >
> > diff --git a/arch/arm64/include/asm/simd.h b/arch/arm64/include/asm/simd.h
> > index 0941f6f58a14..825b7fe94003 100644
> > --- a/arch/arm64/include/asm/simd.h
> > +++ b/arch/arm64/include/asm/simd.h
> > @@ -48,6 +48,7 @@ DEFINE_LOCK_GUARD_1(ksimd,
> >                   kernel_neon_begin(_T->lock),
> >                   kernel_neon_end(_T->lock))
> >
> > -#define scoped_ksimd()       scoped_guard(ksimd, &(struct user_fpsimd_state){})
> > +#define scoped_ksimd()       \
> > +     scoped_guard(ksimd, ({ struct user_fpsimd_state __uninitialized s; &s; }))
>
> Ick.  I should have looked at the generated code more closely.
>
> It's actually worse than you describe, because the zeroing is there even
> without CONFIG_INIT_STACK_ALL_ZERO=y, simply because the
> user_fpsimd_state struct is declared using a compound literal.
>
> I'm afraid that this patch probably isn't a good idea, as it relies on
> undefined behavior.  Before this patch, the user_fpsimd_state is
> declared using a compound literal, which takes on its enclosing scope,
> i.e. the 'for' statement generated by scoped_guard().  After this patch,
> it's in a new inner scope, and the pointer to it escapes from it.
>
> Unfortunately I don't think there's any way to solve this while keeping
> the scoped_ksimd() API as-is.
>

How about

--- a/arch/arm64/include/asm/simd.h
+++ b/arch/arm64/include/asm/simd.h
@@ -48,6 +48,8 @@ DEFINE_LOCK_GUARD_1(ksimd,
                    kernel_neon_begin(_T->lock),
                    kernel_neon_end(_T->lock))

-#define scoped_ksimd() scoped_guard(ksimd, &(struct user_fpsimd_state){})
+#define scoped_ksimd()         __scoped_ksimd(__UNIQUE_ID(fpsimd_state))
+#define __scoped_ksimd(id)     struct user_fpsimd_state __uninitialized id; \
+                               scoped_guard(ksimd, &id)

 #endif

