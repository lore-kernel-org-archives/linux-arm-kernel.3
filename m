Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8527DCD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 16:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PN7wogKQxLF7VClh2nnnslFM/kkLG8IOHcqvhbrXuxI=; b=oEPYrCCgiI+Gh/EI4E8FSfKj+U
	DxdAOAY+2A9uH2rM+51dRE9gBHlFeVEqGBZ3oCJP9A3g3nYA2UQR3znqJu0K/0t9FbA/lAlL1re4+
	nQ1Kh2ohTqghjXeNI5ou6YKiUDqu1TqYJqp84JniEuF44zLCgFaPJpnDqvimrq9O08KhHf7njbUEZ
	URkj9E2RIu2Y9Vj0Kq/9X9GI5jKr9BqBGWw01tq7BMAzp/BfWZ4hkidI8nFspMMAHZCIBqTSXJ0A3
	yR5bRDvqd/FG/lVI6SH7PTeok5rk7aoqYWgzPcJ1yE/vUZnGke0QaVGWjDr0TggbgMJK6IU4X324k
	PnmO4qJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbhjr-00000005CXv-0w4m;
	Mon, 22 Jun 2026 16:43:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbhjq-00000005CXm-0Duy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 16:43:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7879E40E48
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Jun 2026 16:43:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43F321F00A3A
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Jun 2026 16:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782146589;
	bh=PN7wogKQxLF7VClh2nnnslFM/kkLG8IOHcqvhbrXuxI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=XtYEXhAHPT62soHNZM2g8T7mB2yrj2DmxihkUmAQbIOL7H3WL0cQaFfXPeiByjsgW
	 JuYgYrqr5dM1JAZqxj0K42ik4COfXEw4l7wQlT5h4FVAwfsmadHEEB1xhbjq1eKtly
	 ZYQssIq5NDEPngOIs9i+tv4cztesNwaq7uHN2QecevMnWGD5+yvTfmhyDn/VJ+hejp
	 nhkCMNGW68m60jjmC7JfHGvn9rzq+syBKZGE3EfuKeTRwKBtlDiJ202daRsSvsN/h+
	 eg3gqSXLSJ71iiYDY/m4jzdQSeK2WyO/I19NK0XFiCrz87pm3XhvxlWmfWaPjljgVd
	 NoSeUDfY72Wiw==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8459DF40084;
	Mon, 22 Jun 2026 12:43:08 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-01.internal (MEProxy); Mon, 22 Jun 2026 12:43:08 -0400
X-ME-Sender: <xms:HGY5agc3XEiDGXRAk6R5kQ-w6OBCYbElfnwR9ZmTI6fhh5XkzfN7Tg>
    <xme:HGY5atCLtlBCPFZHq-r9YEndPdMn_mtE8PW07LatrheAcOYcOro0MpaWWIf1hVoa6
    qPe08mZjPIlDfzhscPnFDu6JVzBf6RIw8yicHAn15JlfiRngJSD31c>
X-ME-Proxy-Cause: dmFkZTF53aT3vr3RJy0/mjtaR2SAmkMkVdvRezRGlzFgDlqFwrn7fonUnhXEXC0uJoMmLO
    H746fRtP0UdFgOA5W8EsygTmCyiaEi3cNN00KXXDF3c1d8jlrI7ZFO3eV7qy6Rb3GKEgpP
    0ibskE58I4dwqJgvZ+NkLdM1+XvCWcxu7no4Wxtd+nTmEiTI+gw7iRnZH2ymxkIA//JJKh
    CZAHK7wSUuFaYn5p2t0FTJgczuDWz7fHP3+EYr5edR8wwfshgtVQI8VjjMwhsuNm3Gb3oP
    nEEDLMaoMG+rSe+0ITIiAHozUvyws9kyYVjdWXyZ7/XtgFD7xV4Kpom+babNSUVv1AxPnJ
    mevKTrdFShKAIdUNnaCQrvwg3tQcXqtsOjXPRJ740BvK+gL1OjuiXpI4IWytbpqPPknqYE
    Qf8EIig2O3m+qd/RjuTZuF/0nldUXZZwZDMRheXZCMAC9bsQ28DON6BBBcUBE9mwrF+cBo
    83oh4Ci0gLcb3Dp5nfJ/ucuyNJKfn5m8XAanmp8pyO8241rD294LDWFRvMuj251nD6/2j4
    5qPBaFxnT/0OFhrUUw3P9BOJkxtdziGRx2Yk1Sj9zi4d8/eg4wMVaDOD201QDhQFKmWGFZ
    FQKWcphStjTZ1qep4iQCyHZkmZ4lGFcw1jAKI7iAtO+pGNc3TE4XklcBvQEA
X-ME-Proxy: <xmx:HGY5aqG4TXNAKz_1PoiOTMnF2P5v8OkGZ9x1230WA8P63fD8RDU6Hw>
    <xmx:HGY5alaisRAPsFg7d1oN9P2I4M8d1aPn6bOPxZ0flYbIn6s2OEUGqg>
    <xmx:HGY5akC-nWI0IwkGp4NNQUxqYsXssG-g27Ed0AhwVrSerPKg5pHjVA>
    <xmx:HGY5all8gCcKAwqo-irqxCWxiKwjnmbHU5yDK7krdhwX1FQqZvN_1g>
    <xmx:HGY5atylBaVTFy7YKvUwHMwtIi7Pg4XD8p6fAbE2HfDMyL4sO4CEzI82>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 61F69182008C; Mon, 22 Jun 2026 12:43:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Mon, 22 Jun 2026 18:42:46 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Kevin Brodsky" <kevin.brodsky@arm.com>,
 "Ard Biesheuvel" <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Fuad Tabba" <fuad.tabba@linux.dev>
Message-Id: <2d27eaa8-3324-48b3-97b0-aecf63639c18@app.fastmail.com>
In-Reply-To: <2deff570-0497-4438-94ba-a9691881a016@arm.com>
References: <20260619163940.3185308-2-ardb+git@google.com>
 <2deff570-0497-4438-94ba-a9691881a016@arm.com>
Subject: Re: [PATCH] arm64: mm: Defer read-only remap of data/bss linear alias
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Hi Kevin,

On Mon, Jun 22, 2026 at 5:23=E2=80=AFPM Kevin Brodsky <kevin.brodsky@arm=
.com> wrote:
>
> On 19/06/2026 18:39, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > Fuad reports that in some cases, the KVM init code may apply relocat=
ions
> > to variables that reside in .data, and does so via the linear map. T=
his
> > means that remapping .data read-only beforehand is a bad idea, and
> > results in an early boot crash.
> >
> > These variables in .data are only present when CONFIG_NVHE_EL2_DEBUG=
 or
> > CONFIG_NVHE_EL2_TRACING are enabled, which is why it was not spotted=
 in
> > testing.
> >
> > So move the remap to mark_rodata_ro(), which is a reasonable place to
> > put this, and ensures that it happens much later during the boot. It
> > also means that rodata=3Doff is now taken into account, and so the l=
inear
> > alias will remain writable in that case.
> >
> > Cc: Fuad Tabba <fuad.tabba@linux.dev>
> > Fixes: f2ba877402e5 ("arm64: mm: Map the kernel data/bss read-only i=
n the linear map")
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> > =C2=A0arch/arm64/mm/mmu.c | 11 ++++++-----
> > =C2=A01 file changed, 6 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> > index 9f354971b7e4..1f7eca86b5c1 100644
> > --- a/arch/arm64/mm/mmu.c
> > +++ b/arch/arm64/mm/mmu.c
> > @@ -1198,11 +1198,6 @@ static void __init map_mem(void)
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __map_memblock(star=
t, end, pgprot_tagged(PAGE_KERNEL),
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags);
> > =C2=A0 =C2=A0 =C2=A0 }
> > -
> > - =C2=A0 =C2=A0 /* Map the kernel data/bss read-only in the linear m=
ap */
> > - =C2=A0 =C2=A0 __map_memblock(init_end, kernel_end, PAGE_KERNEL_RO,=
 flags);
> > - =C2=A0 =C2=A0 flush_tlb_kernel_range((unsigned long)lm_alias(__ini=
t_end),
> > - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(unsigned long)lm_alias(__bss_stop));
> > =C2=A0}
> >=20
> > =C2=A0void mark_rodata_ro(void)
> > @@ -1221,6 +1216,12 @@ void mark_rodata_ro(void)
> > =C2=A0 =C2=A0 =C2=A0 update_mapping_prot(__pa_symbol(_text), (unsign=
ed long)_text,
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 (unsigned long)_stext - (unsigned long)_text,
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 PAGE_KERNEL_RO);
> > +
> > + =C2=A0 =C2=A0 /* Map the kernel data/bss read-only in the linear m=
ap */
> > + =C2=A0 =C2=A0 update_mapping_prot(__pa_symbol(__init_end),
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (unsigned long)lm_alias(__init_end),
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (unsigned long)__bss_stop - (unsigned long)__init_end,
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 PAGE_KERNEL_RO);
>
> I was rather confused by this patch until I saw in master:
>
> f102131c842d Revert "arm64: mm: Unmap kernel data/bss entirely from the
> linear map"
> 81479b6888f8 Revert "arm64: mm: Defer remap of linear alias of data/bs=
s"
>
> ... which explains the diff, but it looks like there are multiple issu=
es
> here. Is my understanding correct that these reverts fix kvm_arm_init()
> because it needs to *read* from the linear map, while this new patch
> fixes some KVM configurations that need to *write* to the linear map?
>

Basically, yes.

> If so it might be good to give a recap in the commit message, because
> the reverts are easy to miss.
>

Ok

> It would also be good to explain why we can't do this in
> mark_linear_text_alias_ro() (presumably because this is too early). I =
do
> agree that honouring rodata=3Doff is a good thing, though.
>

I didn't consider that tbh - I'll check whether that is a more suitable
location. But generally, I think doing it later rather than earlier is
fine because it reduces the likelihood of hidden issues such as the one
being addressed by this patch, and I don't think doing this very early
makes a meaningful difference in terms of robustness.

> BTW, if only kvm_arm_init() needs to read the data/bss via the linear
> map, maybe we can still unmap it later?
>

Yes, it is still my intent to bring back the patches that unmap this ali=
as
entirely, including some additional tweaks for the fixmap PTE level table
that I dropped after an earlier revision. But that will be 7.3 material,
whereas this fixes a regression due to the changes that were pulled for =
7.2.
=C2=A0

