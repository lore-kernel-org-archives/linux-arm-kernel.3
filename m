Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC16CD13D3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 08:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gsja1Tz+rhPHbp8iV7O9zKzPr/S35iY6Pqpgahku324=; b=RUOuoPdSPrLlsaZtly+THc2ivX
	dd2EE+5lFFTkP8qA9X3cXmvoxPd7CJkMYBt88M97duHt8Dd6/dounPbuYvZLkB1K9rBu/h5XkBrP3
	ARjxxEiv5lvy8jmTIYNtPmYuj5I2uMWJFvwEK7Yo0Gcu0je/7PuGvxDA7r3VKc3CHIWZ6FzDpdxic
	qjvNw/MhZgQnBH/VMtlnaL4UuMhARaJtqgHWow/ZamvZuJSvtIlXGrCcaDs4bhtTAGx3XRcICTlna
	Suf8b8xG2KPHAQ8LDDXPrfqqZoB2pXENbc2sLoK9WQs/VU5QmGph8AUSNqddf/0+3o1m2UuP112Ok
	DbEd6FGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIMJT-00000004whH-01HN;
	Thu, 30 Apr 2026 07:59:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIMJQ-00000004wgk-2ZGp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 07:59:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F10CD4389E;
	Thu, 30 Apr 2026 07:59:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75635C2BCC7;
	Thu, 30 Apr 2026 07:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777535995;
	bh=RlgmLDmovw9KydWIeUdHmFKeIsmjH23V0zBe8kpL4Cs=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=aAqyg273PDpc50LZvPBeOR6rSZUHFFZbAbyQJ2Pc6RXtFo2c1GeMvBU3jLUw4TYVK
	 uoJkGWEgBgAEgv8q3hHisg5NCoPHTs68u4w5SA831Utd46l0tm51f2dq8gpJyCocUo
	 0vyWDpVrzfhc0dNtP4GcWzOoOszX+mS/Ed2oCjvVgpxSus6gFof2LjkShhGFq+I15n
	 OCyz9EDzu4ve0KwvxWcJ5fEHNMUskZhlSTKYyCSUonlFVrWPlSA0tIFgrC72u+i3tj
	 chCIxFGXk5SeqBr/IXZaE9nQ7DlK6LSGTY1+8A45Abqg/Fr3H/RJ7cS17HdMtpYb8B
	 hEremIhSdxOqw==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 877ADF40075;
	Thu, 30 Apr 2026 03:59:54 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Thu, 30 Apr 2026 03:59:54 -0400
X-ME-Sender: <xms:-gvzaWLZtz-eFkUXzPv3zczEIaEfJ1FUV5QeipPUycSGJE98X7YeMg>
    <xme:-gvzaY9ufIyz1elohm9UB15pOEOz4pDuwdkPY1Y2cyr4AMAcHGdLp5JiFeJ-AWJfo
    ATPHRo15OYOZv67raCAfyDBxr3b3GfoYhIvwjy6iHqM9ZgSERw8qg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekieejkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhguuceu
    ihgvshhhvghuvhgvlhdfuceorghruggssehkvghrnhgvlhdrohhrgheqnecuggftrfgrth
    htvghrnhepueetieduieegkeejvdehudeiheettefgtdeugffhjefghfeftdelhedvheff
    hfdvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeijedthedttdejledq
    feefvdduieegudehqdgrrhgusgeppehkvghrnhgvlhdrohhrghesfihorhhkohhfrghrug
    drtghomhdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    oheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopehhuh
    grnhhgiihhrghohigrnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepfihilhhlsehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslh
    hishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehsthgvvhgvrdhkrghn
    ghesuhhnihhsohgtrdgtohhmpdhrtghpthhtohepiihhrghohigrnhhgrdhhuhgrnhhgse
    hunhhishhotgdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghr
    rdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:-gvzaTxRNxk9OubUoPV-ieejdrVE72P2S0kj0HnfGKRxha1_XEoTTA>
    <xmx:-gvzaVXeJq1P5sNI0aYhAi4zoixEXaFNMgYyroCYxl9xoxofLDNm7A>
    <xmx:-gvzadNjg8WBrS4HSGbiKgd6Z0lmm-Yu3_t4GSjg5Wk6pUWPIdC8cA>
    <xmx:-gvzafANjrN3V5s3U6ePifb2K0EQS2p9DyM-YMKk9IK9U8DyBTTH0A>
    <xmx:-gvzaSdNzqDVkoiqS8WjjADSbA5DOp1RqvontzEUN1qdBIwwy2ZXl732>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 698FF700065; Thu, 30 Apr 2026 03:59:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 30 Apr 2026 09:59:28 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Zhaoyang Huang" <huangzhaoyang@gmail.com>
Cc: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 steve.kang@unisoc.com
Message-Id: <eeef3acf-e166-4c01-b163-4ca9e6c77b4a@app.fastmail.com>
In-Reply-To: <CAGWkznHXAyr05NrwD3TqY_jMO6_AieE8KUZRpqF++icrbB=HEA@mail.gmail.com>
References: <20260429061752.2880923-1-zhaoyang.huang@unisoc.com>
 <8fcde357-aaa1-4bd2-a8b3-d660b94a38c6@app.fastmail.com>
 <CAGWkznGtGB58AZcwD51qfrFRcV5F060pH4ytyXXCuX6SxJNBOw@mail.gmail.com>
 <CAGWkznHXAyr05NrwD3TqY_jMO6_AieE8KUZRpqF++icrbB=HEA@mail.gmail.com>
Subject: Re: [PATCH] arch: arm64: fix KERNEL_SEGMENT_COUNT error
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_005956_714204_626F3E82 
X-CRM114-Status: GOOD (  27.07  )
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



On Thu, 30 Apr 2026, at 03:56, Zhaoyang Huang wrote:
> On Thu, Apr 30, 2026 at 9:29=E2=80=AFAM Zhaoyang Huang <huangzhaoyang@=
gmail.com> wrote:
>>
>> On Wed, Apr 29, 2026 at 5:28=E2=80=AFPM Ard Biesheuvel <ardb@kernel.o=
rg> wrote:
>> >
>> > Hello Zhaoyang,
>> >
>> > On Wed, 29 Apr 2026, at 08:17, zhaoyang.huang wrote:
>> > > From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
>> > >
>> > > During debug of a kernel panic, we find that the pte_t of the fin=
al
>> > > part of [data, end] segment got overflow to the next page of
>> > > init_pg_end[1] which is the gap page before early_init_stack[2].
>> > > This should be introduced by the KERNEL_SEGMENT_COUNT's value is 5
>> > > which should be 6 as map_segment are called 6 times for the segme=
nts
>> > > of (text, stext, rodata, inittext, initdata, data+bss)
>> > >
>> > > [1]
>> > > crash_arm64_v9.0.1> vtop ffffffed00601000
>> > > VIRTUAL           PHYSICAL
>> > > ffffffed00601000  83401000
>> > >
>> > > PAGE DIRECTORY: ffffffecffd62000
>> > >    PGD: ffffffecffd62da0 =3D> 10000000833fb003
>> > >    PMD: ffffff80033fb018 =3D> 10000000833fe003
>> > >    PTE: ffffff80033fe008 =3D> 68000083401f03
>> > >   PAGE: 83401000
>> > >
>> > >      PTE        PHYSICAL  FLAGS
>> > > 68000083401f03  83401000  (VALID|SHARED|AF|NG|PXN|UXN)
>> > >
>> > >       PAGE       PHYSICAL      MAPPING       INDEX CNT FLAGS
>> > > fffffffec00d0040 83401000                0        0  1 4000 reser=
ved
>> > >
>> > > [2]
>> > > ffffffed002c8000 (r) __pi__data
>> > > ffffffed0054e000 (d) __pi___bss_start
>> > > ffffffed005f5000 (b) __pi_init_pg_dir
>> > > ffffffed005fe000 (b) __pi_init_pg_end
>> > > ffffffed005ff000 (B) early_init_stack
>> > > ffffffed00608000 (b) __pi__end
>> > >
>> > > Signed-off-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
>> > > ---
>> > >  arch/arm64/include/asm/kernel-pgtable.h | 4 ++--
>> > >  1 file changed, 2 insertions(+), 2 deletions(-)
>> > >
>> > > diff --git a/arch/arm64/include/asm/kernel-pgtable.h
>> > > b/arch/arm64/include/asm/kernel-pgtable.h
>> > > index 74a4f738c5f5..14dd1c52552a 100644
>> > > --- a/arch/arm64/include/asm/kernel-pgtable.h
>> > > +++ b/arch/arm64/include/asm/kernel-pgtable.h
>> > > @@ -64,8 +64,8 @@
>> > >  #define INIT_IDMAP_FDT_PAGES (EARLY_PAGES(INIT_IDMAP_PGTABLE_LEV=
ELS,
>> > > 0UL, UL(MAX_FDT_SIZE), 1) - 1)
>> > >  #define INIT_IDMAP_FDT_SIZE  ((INIT_IDMAP_FDT_PAGES +
>> > > EARLY_IDMAP_EXTRA_FDT_PAGES) * PAGE_SIZE)
>> > >
>> > > -/* The number of segments in the kernel image (text, rodata, ini=
ttext,
>> > > initdata, data+bss) */
>> > > -#define KERNEL_SEGMENT_COUNT 5
>> > > +/* The number of segments in the kernel image (text, stext, roda=
ta,
>> > > inittext, initdata, data+bss) */
>> > > +#define KERNEL_SEGMENT_COUNT 6
>> > >
>> > >  #if SWAPPER_BLOCK_SIZE > SEGMENT_ALIGN
>> > >  #define EARLY_SEGMENT_EXTRA_PAGES (KERNEL_SEGMENT_COUNT + 1)
>> >
>> > I think the better fix would be
>> >
>> > --- a/arch/arm64/include/asm/kernel-pgtable.h
>> > +++ b/arch/arm64/include/asm/kernel-pgtable.h
>> > @@ -68,7 +68,7 @@
>> >  #define KERNEL_SEGMENT_COUNT   5
>> >
>> >  #if SWAPPER_BLOCK_SIZE > SEGMENT_ALIGN
>> > -#define EARLY_SEGMENT_EXTRA_PAGES (KERNEL_SEGMENT_COUNT + 1)
>> > +#define EARLY_SEGMENT_EXTRA_PAGES (KERNEL_SEGMENT_COUNT + 2)
>> Thanks for the comment. This makes sense since KERNEL_SEGMENT_COUNT is
>> also used for defining vmlinux_seg[] in declare_kernel_vmas.
> Is the following fix more reasonable, since it makes both map_segment
> and declare_kernel_vmas compatible with the value 6?
>

No, please fix this as I suggested.

