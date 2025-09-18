Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD78CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 22:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BKIVF2yu6ep3l1J9geN5lnR6goEL44zCh0srILxv1n4=; b=4P3EtCPbrS767r3jzKS5aR5osx
	K2z0r/+DDJCYvs1flM/Ytej25q7s66RfP69uu9mXnncISdV1BF6O5BCQh0WC0DZYiyUUxxzZ/PA+D
	gTaB/5G3KzNQ6Ahj2n8sFf2QrfPnRcIMLOmQZBj9WLBQLx4+g5y2zyN6sCtn71ea4S3yO32WSzVLi
	VKSrvp1yO7CGmmodA9zLuEyTyzanHe9b+QOx0yDn+xjBmCxiBwt8qbOODHszG/+6OQZp0bJlcj/Hu
	dMwZAHANG/w9kPibvBYvE2KQwQXSieMp/sIBF/TpfygZJUSC8F3rnva3Kru/9NaVpt0wMfO2Q2i5l
	fSMqSNPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzNJI-00000001M6C-29uN;
	Thu, 18 Sep 2025 22:41:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzNJH-00000001M5X-0sZZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 22:41:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4516960228
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 22:41:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8CAFC4CEFA
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 22:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758235261;
	bh=llVdBGEs/BifxSpohbEWtgpPQnLm19LpTK+OWEo3Z9w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Vhj3OBqdfppe3lVysDfGXyTH/mNK7Plp2UnpCoDqmgDeHgNkKQG0CWFF2Q0SfgPmN
	 PSFv5iEnp0LCgyoU1RHR6R9kesL7pLFpW1tShEqIaNPAgS0kBUrUhaYn+FYr9insvl
	 C7qLlkS7l1ZPYfR9AdUGPTmtV98ssiMbIA6665pKes02/dfYZ417uWuvcOq8TdkP1l
	 HYnHaasODZoqcGGKXsg8P+xKWYz67Y8LXbm/tUxR2PUb56kE+fCgfUxqzx5cTcWrTF
	 SzD7q9LwM24AE4J/SbSpPWqPihe6Wu5kg/haLTYWhyjBmVPemIXtQMxUYt+oa1PoLb
	 c+xU89KeY10Zw==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-336af6356a5so12697851fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 15:41:01 -0700 (PDT)
X-Gm-Message-State: AOJu0YyhuWjvIIp7S911vyy3KwVh/VnO3s6XFHZFOZVVeH9DWlHejXMR
	VWk/e2XPYDsJQj6CdypvmuC8Z6Y6Zn9ZfXRsmxmiqvkynAWUlYE2CVLTvBZYVropYEiiT2EmfIC
	HjeHhg00Ob66z/gHgfVWtHqAL92b4qq0=
X-Google-Smtp-Source: AGHT+IHNY81q5U5UNEf5baDKU70RrmkFrVBbZa9gB6bpZalfC9i3O+rKe2VtlgVWgtjR965hg42JdFr970WtgLqBCj0=
X-Received: by 2002:a05:651c:25d2:20b0:35f:73ba:e757 with SMTP id
 38308e7fff4ca-3641660ab32mr2978451fa.5.1758235260125; Thu, 18 Sep 2025
 15:41:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAHi4H7FKjYf0c90qoN9bSORboru+S718-k1eJYh4pVoDcJPGHw@mail.gmail.com>
 <CAMj1kXGnyNdq5pxY1kZwBr1n9idKvHU=tyCM0Wie5Ys3RkW3SA@mail.gmail.com>
 <CAHi4H7FcLZVJzGg5Q63MAJFPRDOp1c6507XUXyyz0ajJKdtk=w@mail.gmail.com>
 <CAMj1kXFtrLgS2mp0Y++u06rv5XrKTu=h-LDZ=w-3fxJchCLZpQ@mail.gmail.com> <CAHi4H7EC_T67sTjh8kQbObR0NmREQXR1xmfX_7jophAdxEZQqQ@mail.gmail.com>
In-Reply-To: <CAHi4H7EC_T67sTjh8kQbObR0NmREQXR1xmfX_7jophAdxEZQqQ@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 19 Sep 2025 00:40:48 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFGtMGi428LLo0Go-spKxhEV6CLXat6nS8=VH8CdfRRLA@mail.gmail.com>
X-Gm-Features: AS18NWDPX_avJGNbay0fBJypdi_o9Q4cqHr3w4anx6nFxsZzJ3Iq68fvVl1q2Ns
Message-ID: <CAMj1kXFGtMGi428LLo0Go-spKxhEV6CLXat6nS8=VH8CdfRRLA@mail.gmail.com>
Subject: Re: armv7 R_ARM_PREL31 relocation out of range error when loading module
To: William Zhang <william.zhang@broadcom.com>
Cc: Linux ARM List <linux-arm-kernel@lists.infradead.org>, 
	Kursad Oney <kursad.oney@broadcom.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Wenchung Su <wenchung.su@broadcom.com>, 
	"song@kernel.org" <song@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 18 Sept 2025 at 20:30, William Zhang <william.zhang@broadcom.com> w=
rote:
>
> On Wed, Sep 17, 2025 at 11:55=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org>=
 wrote:
> >
> > On Thu, 18 Sept 2025 at 04:11, William Zhang <william.zhang@broadcom.co=
m> wrote:
> > >
> > > On Wed, Sep 17, 2025 at 3:11=E2=80=AFAM Ard Biesheuvel <ardb@kernel.o=
rg> wrote:
> > > >
> > > > On Wed, 17 Sept 2025 at 04:55, William Zhang <william.zhang@broadco=
m.com> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > We recently ran into the driver loading error resulting from
> > > > > apply_relocate function when it handle the R_ARM_PREL31 case in
> > > > > arch/arm/kernel/module.c:
> > > > > section 29 reloc 0 sym '': relocation 42 out of range (0xc2ab9be8=
 ->
> > > > > 0x7fad5998)
> > > > >
> > > > > After some dig, it seems this issue is caused by this change:
> > > > > ac3b43283923 ("module: replace module_layout with module_memory")
> > > > >
> > > > > I can see the necessity of this change but it seems it can cause =
this
> > > > > kind of error under certain configurations. In our particular cas=
e, we
> > > > > use the 2G/2G split and our armv7 board has 1GB ddr memory. This =
means
> > > > > the kernel lower memory is from 0x8000-0000 to 0xc000-0000 and vm=
alloc
> > > > > range is from 0xc000-0000 and above.
> > > > >
> > > > > Before this module layout change, the module is loaded through tw=
o
> > > > > layout sections: core and init. The driver in the test is fairly =
big
> > > > > and core module layout(text, data, rodata, sections) can not fit =
into
> > > > > the 16MB MODULE memory so both text, data and rodata fallback to
> > > > > vmalloc range. But with this change, it will text, data and rodat=
a one
> > > > > by one. So it ends up text in the MODULES memory but rodata is
> > > > > allocated in VMALLOC and the distance is more than 1GB hence we
> > > > > believe it causes the above error when R_ARM_PREL31 relocation ca=
n not
> > > > > support more than 1GB offset.
> > > > >
> > > > > Since the default split is 1G/3G model, the distance between vmal=
loc
> > > > > and module memory is always below 1G so we won't see this issue. =
But
> > > > > it seems to us the problem is real when use 2G/2G split.
> > > > >
> > > > > It appears the sections containing R_ARM_PREL31 in our driver are
> > > > > mostly in .ARM.exidx section. Some search shows this is used by A=
RM
> > > > > C++ exception handling but our driver does not use C++. Is there =
a way
> > > > > to disable such section for R_ARM_PREL31? If not, is there any
> > > > > workaround or fix to handle this run-time R_ARM_PREL31 relocation
> > > > > issue? The same apply_relocate function can handle R_ARM_JUMP24 o=
ut of
> > > > > range using PLTS. Can this apply to R_ARM_PREL31?
> > > > >
> > > >
> > > > Hi William,
> > > >
> > > > Two options come to mind:
> > > >
> > > > 1) use the frame pointer for unwind information instead of the C++
> > > > exception metadata, i.e., enable CONFIG_UNWINDER_FRAME_POINTER
> > > >
> > > > 2) ensure that ARM.exidx sections are allocated from the same bucke=
t
> > > > as the .text sections they annotate, e.g., something like the below
> > > >
> > > > --- a/arch/arm/kernel/module-plts.c
> > > > +++ b/arch/arm/kernel/module-plts.c
> > > > @@ -225,6 +225,11 @@
> > > >                         mod->arch.init.plt =3D s;
> > > >                 else if (s->sh_type =3D=3D SHT_SYMTAB)
> > > >                         syms =3D (Elf32_Sym *)s->sh_addr;
> > > > +#if defined(CONFIG_ARM_UNWIND) && !defined(CONFIG_VMSPLIT_3G)
> > > > +               else if (s->sh_type =3D=3D ELF_SECTION_UNWIND)
> > > > +                       s->sh_flags |=3D SHF_EXECINSTR;
> > > > +#endif
> > > > +
> > > >         }
> > > >
> > > >         if (!mod->arch.core.plt || !mod->arch.init.plt) {
> > >
> > > Thank you Ard for your quick response!   We tried the option 1 and
> > > also tried with gcc -fno-unwind-tables option just for the driver,
> > > both do not generate any PRREL31 relocation and the driver can load
> > > successfully.
> > > But we have some tool that needs to use the unwind tables so option 2
> > > will be the right direction for us.
> > >
> > > Applied your patch however it still reports the same error but from
> > > different section as we confirmed all the ARM.exidx sections are
> > > allocated from .text section.
> > >      mod_mem_type 0 execmem_type 0 base 0x7f3e8000 size 0x6eb000
> > >      mod_mem_type 1 execmem_type 4 base 0x7fad4000 size 0x9e000
> > >      mod_mem_type 2 execmem_type 4 base 0xc21a4000 size 0x3dd000
> > >      mod_mem_type 4 execmem_type 0 base 0x7f1ae000 size 0x1000
> > >      mod_mem_type 5 execmem_type 4 base 0x7fb73000 size 0x10c000
> > >      section 43 reloc 11360 sym '': relocation 42 out of range
> > > (0x7facca74 -> 0xc2580734)
> > >
> > > This loc address  0x7facca74 is from the MOD_DATA memory based on mod
> > > mem allocation log above.
> > > I also print some extra info about the dstsect with
> > >     pr_err("dstsec name %s add %#lx size %u rel 0x%px rel offset %u\n=
",
> > >         strtab + dstsec->sh_name, dstsec->sh_addr, dstsec->sh_size,
> > > rel, rel->r_offset)
> > > and got this print out
> > >     dstsec name FUNCTION__.2 add 0x7fabd3c0 size 86912 rel 0xc33f931c
> > > rel offset 63156
> > >
> > > FUNCTION__.2 is in the rodata section from the symbol table.
> > >
> > > So looks like there is reference to ARM.exidx from the data/rodata
> > > section and that also need to be taken care of?
> >
> > It looks like the ARM.exidx, which is now in .text (the first entry in
> > your table), contains a reference to code that is emitted in .rodata
> > rather than .text, and .rodata (mod_mem_type 2) is emitted in the
> > vmalloc space, and is too far from .text.
> >
> This loc address 0x7facca74 is actually from the MOD_DATA mod_mem_type 1.
> Seems to me that it is some .data reference .rodata but how is this possi=
ble?
>

How so? That MOD_DATA region starts at 0x7fad4000, no?

> > If FUNCTION__.2 is really a function, why is it in .rodata and not in .=
text?
> >
> Not that symbol is not a function. I believe it is probably some
> string or fixed data
> that the compiler generated for a function so it is in .rodata.  There
> are many of
> these instances from the objdump:
>
> 00001058 l     O .rodata 0000000b __FUNCTION__.2
> 00001118 l     O .rodata 0000001b __FUNCTION__.2
> ...
>

So one thing you might consider is to find a way to emit these into
.text as well, or any other section that has the 'x' bit set.

