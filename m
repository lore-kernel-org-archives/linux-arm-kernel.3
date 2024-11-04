Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9242CD1BDC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 16:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gz9W97kzbASMatevlIVft40nyseDDdDJQYeu/gRdut8=; b=lxXwrW9BWEKNIN8I6KDUb6X1WT
	GOfAFyeLbjHkNoKIsLuOuJyZqzHTF3i5IYKV/VpAanGj4qqVnd7fCTBXodM/ueMqZ1AM1+E2QzrAC
	S2bHppizNMkwRTcOoXnZXwhABZo0jMAr66LwXzqnW50Lxtx8V2xrcyjmXKVUqAdYds2WffLvU++qv
	8diTFhMqnl7048AQ7ktHuUbAwI0A8iMa8qnGBK7WmuqiVEjRlzjzvk20ucXNqynFzynCWDFFJC/31
	bCA7ATJhR1b2/m4KMWQiovAd33nCWClUOx5wB2bWvWkR5b300jm/qY5YStfy1JMSvXGVeWdJYzwYC
	h+0cj+PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t80DV-0000000EPq6-38f4;
	Mon, 04 Nov 2024 16:46:13 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t80B6-0000000EPYY-3diL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 16:43:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C9A10A4132C
	for <linux-arm-kernel@lists.infradead.org>; Mon,  4 Nov 2024 16:41:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3577C4CECE
	for <linux-arm-kernel@lists.infradead.org>; Mon,  4 Nov 2024 16:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730738623;
	bh=aBhOe4jROECZsCOF9Tjcmoa8Wr7DnK4/FPB94XtakTg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fZ/yZayo8+pgEhlLGkp0knsZ8gROTvdaFHprhF4S95yhs/SzYvgr3EcpUh/OfOQ8c
	 fdUDh63cTsG55HbwD4fKxOQc3X0dJK7dlI3Qp4fn8PaKA7BdMYbK5ygtcN33n3vEbg
	 Y3iphWORNsEiwzId2LInjirXjmJ25FqpqjBNCOgw3cMNYx3sNV8NitMlqKy+4oJySv
	 sJTrMeFkpiyBlcM6QaxSKGmM24gmuSdvJIbR9+XB5X6cWVGnxCwXCpgiN1C/znacer
	 vuIwMnT3DFRXg4cDszA09H5h+5fxKP+viIMEaONjS0JWtAXoDVKc7+izNCdw46k4Br
	 xVNe5fg72rhcA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb5be4381dso40275221fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 08:43:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVSsmsBe89BUJBJCKI9I9HzU4whocGcX8AxsO+njnmDkoLtyaSrPhp1nLt7WzPSQucGl97gG948NZOJiLI6jOkd@lists.infradead.org
X-Gm-Message-State: AOJu0Ywcg6z8vCzk3OZHbfniqzHRuE1c3Kl/HCxWnUl+ahj2q4z0S4vD
	YTiB1DqycRPI+rP4zF5Dj2I2sg322vHPcsoOUYIUCMst6fKQ92jmVt1M5v8dDKJu6Gy+0WK/eR5
	r/VJ1feOK9nui+CZyxEik0V9YOBI=
X-Google-Smtp-Source: AGHT+IH1KZMDebhey0nwIugNW8TVwi5nnuXaaN7e10ukPGZVC5EQ9zfJMzg/lt4fHgRva3oS1C9NUpY7J4T5iFQkr/Q=
X-Received: by 2002:a2e:be20:0:b0:2fb:4951:172 with SMTP id
 38308e7fff4ca-2fcbdf5f742mr143126321fa.2.1730738622013; Mon, 04 Nov 2024
 08:43:42 -0800 (PST)
MIME-Version: 1.0
References: <20241101155800.3917462-2-ardb+git@google.com> <ZyjREXyABoQtkV8O@arm.com>
 <CAMj1kXFMBU1aPmL58NtyPu2kKpWurHBOYE4rmKvPwj0SA5Z+Dg@mail.gmail.com> <ZyjwHC2nekioWfAa@arm.com>
In-Reply-To: <ZyjwHC2nekioWfAa@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 4 Nov 2024 17:43:30 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFAa+eBORpX=Ld9bsL-dTgWasS1AW_c5GjSf9JH6GGvog@mail.gmail.com>
Message-ID: <CAMj1kXFAa+eBORpX=Ld9bsL-dTgWasS1AW_c5GjSf9JH6GGvog@mail.gmail.com>
Subject: Re: [PATCH] arm64/mm: Sanity check PTE address before runtime P4D/PUD folding
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org, 
	will@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_084345_064492_D78927FB 
X-CRM114-Status: GOOD (  29.02  )
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

On Mon, 4 Nov 2024 at 17:02, Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> On Mon, Nov 04, 2024 at 02:57:21PM +0100, Ard Biesheuvel wrote:
> > On Mon, 4 Nov 2024 at 14:50, Catalin Marinas <catalin.marinas@arm.com> wrote:
> > > On Fri, Nov 01, 2024 at 04:58:01PM +0100, Ard Biesheuvel wrote:
> > > > diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> > > > index dd5dcf7ae056..0d729adf894c 100644
> > > > --- a/arch/arm64/include/asm/pgtable.h
> > > > +++ b/arch/arm64/include/asm/pgtable.h
> > > > @@ -740,6 +740,11 @@ static inline bool pud_table(pud_t pud) { return true; }
> > > >                                PUD_TYPE_TABLE)
> > > >  #endif
> > > >
> > > > +static inline long sign_of(unsigned long addr)
> > > > +{
> > > > +     return (int)(addr >> 24) >> 31L; // bit 55 is the sign bit
> > > > +}
> > >
> > > That's a pretty generic name that trickles into the core code. It should
> > > be renamed to something that suggests arm64 addresses (and maybe some
> > > underscores to imply private).
> >
> > Fair enough.
> >
> > > Also, this assumes untagged addresses but
> > > I haven't checked whether that's the case for all call sites.
> >
> > Isn't bit #55 always guaranteed to be the sign bit?
>
> Ah, true, we have the cast to (int) which removes any tag bits.
>
> Why's the 31L? Does it affect the type? (it saves me from having to dig
> out the C standard).
>

Turns out that it doesn't - I'll drop the L suffix.

> > > >  extern pgd_t init_pg_dir[];
> > > >  extern pgd_t init_pg_end[];
> > > >  extern pgd_t swapper_pg_dir[];
> > > > @@ -932,6 +937,8 @@ static inline phys_addr_t p4d_page_paddr(p4d_t p4d)
> > > >
> > > >  static inline pud_t *p4d_to_folded_pud(p4d_t *p4dp, unsigned long addr)
> > > >  {
> > > > +     VM_BUG_ON(((u64)p4dp / sizeof(p4d_t) - sign_of(addr)) % PTRS_PER_P4D);
> > > > +
> > > >       return (pud_t *)PTR_ALIGN_DOWN(p4dp, PAGE_SIZE) + pud_index(addr);
> > > >  }
> > >
> > > I think I get it but please add a comment in the code, otherwise in a
> > > week time I'll wonder what this is.
> > >
> > > Even better if it could be written in a less cryptic way ;).
> > >
> >
> > Yeah, I tried to keep it concise so the code for the VM_BUG_ON()
> > doesn't bloat the function.
>
> Fine but add a comment along the lines of the commit log.
>

OK

