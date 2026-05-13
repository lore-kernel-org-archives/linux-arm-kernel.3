Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC412CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 08:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0JvhGAcyjgC6oFuK4AIORPgrR/vLGV8tdI2S+krpUgk=; b=p3S+OvBY4v4dDKyZHrTZHVGzfY
	J0i45al6R7eVcZQDxiajuAnw2/FDx5rmbaIV4rT3XwW0lblZLiimVnp9jj33oyilaFJZBj7NHOodd
	I0kDrKko5bQmjPStMor3nBuHrRCNqihj/BeK8i+zU/6Cc4dL+xTpjoS6PbD/LqPa0vnMjgtn/IZyy
	6POgldH65r5OuX8DaT3TVrTq8W1uGF73c8ocy6Xve+4S5Q8TjXBqZq6DXzXTzDYi70fTK1zf/IP55
	+OWiDMQvqXOqhBTFuS88aefUp4I+C+JQTCQpYNmYH4IMq+kH83nwydH4zBkkyLneCrriKuP0GccYE
	eUkLbggA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5Id-00000001nnF-1cRJ;
	Wed, 13 May 2026 08:50:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5Ic-00000001nml-2Ga2
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 May 2026 08:50:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0JvhGAcyjgC6oFuK4AIORPgrR/vLGV8tdI2S+krpUgk=; b=hlp4Zx4TToIpF4YkJJNEM99sJb
	N0Cy8MQI+AANeiYPugDVVJyN3KIifypNvwOeOmwffbIP/gZbMFreD5XuAwHiDCY0J05+ApVpDuSz3
	dv55WnAsMEhTuJ9qartP19ER941ORifhyiGygoj/2sYNCG6D2FCkx/ZH7cQtvnn/gY9dtPdbusWCP
	vI9gC0MeJGEq3ArUpra4rss9oxnuu5nZCpPnLkwoa6CJ+jOEGVzFIuBHLhty7tzp3HsBuUmaPudpR
	rd8dCNlXz0OiIEHsVXjH+dTfzVSwzmC3oIaMT9T8CLShQqrsoZNjbiAKZrK5UwfZZ0YT5vXKyMmbb
	0Xjrh2tw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5IN-0000000Gt6t-1j3S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 08:50:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D127C42A00;
	Wed, 13 May 2026 08:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 449B8C2BCB7;
	Wed, 13 May 2026 08:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778662221;
	bh=N9P1iXvYrJqLgZmIOtPNBCWH68XujKCrRJM/d7OA1NE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P3wsuP8z+CNKLupx+n1E2LTwB0iywnD4fV4upd41SWJq+wzKRFN+6l5o/Oie0iFXu
	 QdpC0QzmJbU/K5OQ8IyHfr06kiJlM7LBMiHCJFHxnYf1+zAE/YVHre4MLSRYgTodzF
	 2UX6okTeCTJI9YtbbKEiw4HSykdkmljvjNwc9qLFqVNHKyLSJ8pz4UoB8aqnGx16Mp
	 VHM75dVMdLqFiKF4Iy17YKPz7rWAnLkaR7h7HrJRw1/Fb3kroXQylFyEBZbcz6n1t4
	 Rrku0nAKE7qsstQILa3ifLy6O3io+f5iV74vmoN5D63J7MlkItbWbq+4JnF0SFHtfr
	 lDHvYuOSl8IsA==
Date: Wed, 13 May 2026 11:50:12 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Jann Horn <jannh@google.com>, Ard Biesheuvel <ardb+git@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Liz Prucka <lizprucka@google.com>,
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v4 02/15] mm: Make empty_zero_page __ro_after_init
Message-ID: <agQ7RMAw51RlNUOj@kernel.org>
References: <20260427153416.2103979-17-ardb+git@google.com>
 <20260427153416.2103979-19-ardb+git@google.com>
 <CAG48ez1DJ88a0pBCE-Q0VXyDuJgng8zdunb38g4b4JPU88exww@mail.gmail.com>
 <31252c1d-a98d-4635-ab61-ce5b649e256f@app.fastmail.com>
 <CAG48ez2xJwJDgxSH0u2G==9dOQJQxQ7WsQfU14O1H5hEWic1eA@mail.gmail.com>
 <fb5749bb-bc87-4f0b-9ec9-8a1eb7ded3b5@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fb5749bb-bc87-4f0b-9ec9-8a1eb7ded3b5@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_095024_338060_DF64BCE5 
X-CRM114-Status: GOOD (  25.55  )
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

On Tue, May 12, 2026 at 02:56:16PM +0200, Ard Biesheuvel wrote:
> On Mon, 11 May 2026, at 16:40, Jann Horn wrote:
> > On Mon, May 11, 2026 at 10:59 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> >> I think we should simply do something along the lines of the below,
> >> considering that the size of a data object tends to correlate with
> >> its minimum alignment.
> >>
> >> I do find it rather puzzling that the compiler emits empty_zero_page
> >> *after* zero_page_pfn - ideally, we'd combine the below with
> >> -fdata-sections so that the linker sees all individual objects, but
> >> I suspect that would create some problems elsewhere.
> >>
> >>
> >> --- a/include/asm-generic/vmlinux.lds.h
> >> +++ b/include/asm-generic/vmlinux.lds.h
> >> @@ -452,7 +452,7 @@
> >>  #define RO_AFTER_INIT_DATA                                   \
> >>         . = ALIGN(8);                                         \
> >>         __start_ro_after_init = .;                            \
> >> -       *(.data..ro_after_init)                               \
> >> +       *(SORT_BY_ALIGNMENT(.data..ro_after_init))            \
> >
> > Oh, neat, I didn't realize that's possible. That seems like a nicer
> > approach...
> 
> Neat but rather ineffective, unfortunately. (I don't see a size
> difference with the arm64 defconfig kernel)
> 
> Given that empty_zero_page only ever gets its address taken, we
> might just move it into the linker script if that requires tweaking
> anyway. We can just place it at the start of .rodata, which is
> already page aligned on most architectures (and will become page
> aligned unless EMPTY_ZERO_PAGE is #define'd by the arch linker
> script to something else)
> 
> 
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
> @@ -472,6 +472,17 @@
>  #endif
>  #endif
>  
> +#ifndef EMPTY_ZERO_PAGE
> +#ifndef __HAVE_COLOR_ZERO_PAGE

I don't think we want let architectures that don't use colored zero pages
redefine it.
If it will be really required we can add the ability to redefine
EMPTY_ZERO_PAGE later.

> +#define EMPTY_ZERO_PAGE                                        \
> +       . = ALIGN(PAGE_SIZE);                                   \
> +       empty_zero_page = .;                                    \
> +       . += PAGE_SIZE;
> +#else
> +#define EMPTY_ZERO_PAGE
> +#endif
> +#endif
> +
>  /*
>   * Read only Data
>   */
> @@ -479,6 +490,7 @@
>         . = ALIGN((align));                                     \
>         .rodata           : AT(ADDR(.rodata) - LOAD_OFFSET) {   \
>                 __start_rodata = .;                             \
> +               EMPTY_ZERO_PAGE                                 \
>                 *(.rodata) *(.rodata.*) *(.data.rel.ro*)        \
>                 SCHED_DATA                                      \
> 

-- 
Sincerely yours,
Mike.

