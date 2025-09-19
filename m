Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B4DCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 07:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lKUwlYcyEb2AIqKd1dYu9uxWeQuGteTN3Dp78TBNc+Y=; b=aThISYGz4XW29SCZOYCw3JjqXC
	TXrhNaq2El+1xNc+BRYGX/Cricf83tDgW69HC0N9bkMccOLuSqJllVuNOvRpG/+CEJnamKvtX4p5v
	09S+NcJj37kX+RzSmBVK/0yxWrVGiBxAwo6+8xmwaz8+XMSrmUgmWth/jyhk4grPrHYqOq1BqzysH
	S2LLEwNPrxmUg7A3Tz44GmAY234XE+RzuSgfYTWxLpstUTgDf4rjUU58MkmbLb68EQAxfncaOONhr
	b2CfpFbLst4yhz0tMtshJPGHCfU6Z1kBp5cdGeoNRJh+xs0koxbQMA1UAVJu2+8xNZTQI6ma0E8ei
	olNVtIjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVT8-0000000238v-3Wip;
	Fri, 19 Sep 2025 07:23:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVT7-0000000238o-3sPg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 07:23:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EBA386021B
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 07:23:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA7DC4CEFC
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 07:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758266624;
	bh=4z5IzNpbZoD/MiBv9++W6dpZfMbg2AneQBZTGVldb4c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=spuHT6p4PssjNGg3QjVC30z63pE2tlpjAuyS9IwaLGeYW968yey5cKTJ0viT5DelR
	 vJXujClOzz+MAOo52k4bpoUSXJxCxyedFqnBCWJTIsyMPvwPx5I6u3gj28/zV0Makq
	 0F2mf0ZVOptk/ehGyKSm32nbDv3MqAWWoB8QgydCd5ZiIxFiYlRQ15QF5juu4CtK8W
	 OHcfF8ZVIoN8BEjPTFZzgnxvCKNeCzpQ9yjc16ICX7+q+w7F28gJ7zx82vAt0MTwr9
	 TIXChujXmtEgGljCpuFq+EczgPG2adSMuU3c1RX+kRuNyxBkM5VeaGAs8z0Ayy5eGY
	 M7+md3WdLKkDQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5608b619cd8so1911254e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 00:23:44 -0700 (PDT)
X-Gm-Message-State: AOJu0YycpJVo5c9DmtQTfhURNtR8lsFYKb4NltMUnfsBSoS3Tev4BBBW
	oyzzJbghnIxpyTtOmsO1mp8dykmA7i4FBJokak5iAB+Au16THIJEkSfgqGnrWhAmohqH/+tTRmj
	PcSXcPZYKTxw9Sg4/9E1xWy5vbCF8cqw=
X-Google-Smtp-Source: AGHT+IFyUocpWVA/Dpm52DRykLrDb4n7DoQtBwqSoq4DsJvJMM7DuzC65VV//etK409JbtrVxzpYyKjaW8L2aU0COPE=
X-Received: by 2002:a05:6512:130f:b0:577:7bf5:f0a5 with SMTP id
 2adb3069b0e04-579dfccaecfmr864278e87.4.1758266622781; Fri, 19 Sep 2025
 00:23:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAHi4H7FKjYf0c90qoN9bSORboru+S718-k1eJYh4pVoDcJPGHw@mail.gmail.com>
 <CAMj1kXGnyNdq5pxY1kZwBr1n9idKvHU=tyCM0Wie5Ys3RkW3SA@mail.gmail.com>
 <CAHi4H7FcLZVJzGg5Q63MAJFPRDOp1c6507XUXyyz0ajJKdtk=w@mail.gmail.com>
 <CAMj1kXFtrLgS2mp0Y++u06rv5XrKTu=h-LDZ=w-3fxJchCLZpQ@mail.gmail.com>
 <CAHi4H7EC_T67sTjh8kQbObR0NmREQXR1xmfX_7jophAdxEZQqQ@mail.gmail.com>
 <CAMj1kXFGtMGi428LLo0Go-spKxhEV6CLXat6nS8=VH8CdfRRLA@mail.gmail.com>
 <CAHi4H7Eife7_sKxTk_nhvv7StwiX=A6UTe8Cxe_w_p1oYfp2yA@mail.gmail.com> <CAHi4H7Fjk-X+2A+7-WF+i6zv=RHgbPeJ6aHZFxxaUmPPC=U3Kw@mail.gmail.com>
In-Reply-To: <CAHi4H7Fjk-X+2A+7-WF+i6zv=RHgbPeJ6aHZFxxaUmPPC=U3Kw@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 19 Sep 2025 09:23:31 +0200
X-Gmail-Original-Message-ID: <CAMj1kXG61XvxshYb1Mmq1XtY9fpbtF1Jb=1_5UOhi+2k+pJJ-w@mail.gmail.com>
X-Gm-Features: AS18NWC4C4P9yIKASsML1HT-j5ackUAbgigoeohfrY-CpAL795pBYs1d9E8OHP4
Message-ID: <CAMj1kXG61XvxshYb1Mmq1XtY9fpbtF1Jb=1_5UOhi+2k+pJJ-w@mail.gmail.com>
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

On Fri, 19 Sept 2025 at 08:58, William Zhang <william.zhang@broadcom.com> w=
rote:
>
>
>
> On Thu, Sep 18, 2025 at 5:25=E2=80=AFPM William Zhang <william.zhang@broa=
dcom.com> wrote:
>>
>> On Thu, Sep 18, 2025 at 3:41=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org>=
 wrote:
>> >
>> > On Thu, 18 Sept 2025 at 20:30, William Zhang <william.zhang@broadcom.c=
om> wrote:
>> > >
>> > > On Wed, Sep 17, 2025 at 11:55=E2=80=AFPM Ard Biesheuvel <ardb@kernel=
.org> wrote:
>> > > >
>> > > > On Thu, 18 Sept 2025 at 04:11, William Zhang <william.zhang@broadc=
om.com> wrote:
>> > > > >
>> > > > > On Wed, Sep 17, 2025 at 3:11=E2=80=AFAM Ard Biesheuvel <ardb@ker=
nel.org> wrote:
>> > > > > >
>> > > > > > On Wed, 17 Sept 2025 at 04:55, William Zhang <william.zhang@br=
oadcom.com> wrote:
>> > > > > > >
>> > > > > > > Hi,
>> > > > > > >
>> > > > > > > We recently ran into the driver loading error resulting from
>> > > > > > > apply_relocate function when it handle the R_ARM_PREL31 case=
 in
>> > > > > > > arch/arm/kernel/module.c:
>> > > > > > > section 29 reloc 0 sym '': relocation 42 out of range (0xc2a=
b9be8 ->
>> > > > > > > 0x7fad5998)
>> > > > > > >
>> > > > > > > After some dig, it seems this issue is caused by this change=
:
>> > > > > > > ac3b43283923 ("module: replace module_layout with module_mem=
ory")
>> > > > > > >
>> > > > > > > I can see the necessity of this change but it seems it can c=
ause this
>> > > > > > > kind of error under certain configurations. In our particula=
r case, we
>> > > > > > > use the 2G/2G split and our armv7 board has 1GB ddr memory. =
This means
>> > > > > > > the kernel lower memory is from 0x8000-0000 to 0xc000-0000 a=
nd vmalloc
>> > > > > > > range is from 0xc000-0000 and above.
>> > > > > > >
>> > > > > > > Before this module layout change, the module is loaded throu=
gh two
>> > > > > > > layout sections: core and init. The driver in the test is fa=
irly big
>> > > > > > > and core module layout(text, data, rodata, sections) can not=
 fit into
>> > > > > > > the 16MB MODULE memory so both text, data and rodata fallbac=
k to
>> > > > > > > vmalloc range. But with this change, it will text, data and =
rodata one
>> > > > > > > by one. So it ends up text in the MODULES memory but rodata =
is
>> > > > > > > allocated in VMALLOC and the distance is more than 1GB hence=
 we
>> > > > > > > believe it causes the above error when R_ARM_PREL31 relocati=
on can not
>> > > > > > > support more than 1GB offset.
>> > > > > > >
>> > > > > > > Since the default split is 1G/3G model, the distance between=
 vmalloc
>> > > > > > > and module memory is always below 1G so we won't see this is=
sue. But
>> > > > > > > it seems to us the problem is real when use 2G/2G split.
>> > > > > > >
>> > > > > > > It appears the sections containing R_ARM_PREL31 in our drive=
r are
>> > > > > > > mostly in .ARM.exidx section. Some search shows this is used=
 by ARM
>> > > > > > > C++ exception handling but our driver does not use C++. Is t=
here a way
>> > > > > > > to disable such section for R_ARM_PREL31? If not, is there a=
ny
>> > > > > > > workaround or fix to handle this run-time R_ARM_PREL31 reloc=
ation
>> > > > > > > issue? The same apply_relocate function can handle R_ARM_JUM=
P24 out of
>> > > > > > > range using PLTS. Can this apply to R_ARM_PREL31?
>> > > > > > >
>> > > > > >
>> > > > > > Hi William,
>> > > > > >
>> > > > > > Two options come to mind:
>> > > > > >
>> > > > > > 1) use the frame pointer for unwind information instead of the=
 C++
>> > > > > > exception metadata, i.e., enable CONFIG_UNWINDER_FRAME_POINTER
>> > > > > >
>> > > > > > 2) ensure that ARM.exidx sections are allocated from the same =
bucket
>> > > > > > as the .text sections they annotate, e.g., something like the =
below
>> > > > > >
>> > > > > > --- a/arch/arm/kernel/module-plts.c
>> > > > > > +++ b/arch/arm/kernel/module-plts.c
>> > > > > > @@ -225,6 +225,11 @@
>> > > > > >                         mod->arch.init.plt =3D s;
>> > > > > >                 else if (s->sh_type =3D=3D SHT_SYMTAB)
>> > > > > >                         syms =3D (Elf32_Sym *)s->sh_addr;
>> > > > > > +#if defined(CONFIG_ARM_UNWIND) && !defined(CONFIG_VMSPLIT_3G)
>> > > > > > +               else if (s->sh_type =3D=3D ELF_SECTION_UNWIND)
>> > > > > > +                       s->sh_flags |=3D SHF_EXECINSTR;
>> > > > > > +#endif
>> > > > > > +
>> > > > > >         }
>> > > > > >
>> > > > > >         if (!mod->arch.core.plt || !mod->arch.init.plt) {
>> > > > >
>> > > > > Thank you Ard for your quick response!   We tried the option 1 a=
nd
>> > > > > also tried with gcc -fno-unwind-tables option just for the drive=
r,
>> > > > > both do not generate any PRREL31 relocation and the driver can l=
oad
>> > > > > successfully.
>> > > > > But we have some tool that needs to use the unwind tables so opt=
ion 2
>> > > > > will be the right direction for us.
>> > > > >
>> > > > > Applied your patch however it still reports the same error but f=
rom
>> > > > > different section as we confirmed all the ARM.exidx sections are
>> > > > > allocated from .text section.
>> > > > >      mod_mem_type 0 execmem_type 0 base 0x7f3e8000 size 0x6eb000
>> > > > >      mod_mem_type 1 execmem_type 4 base 0x7fad4000 size 0x9e000
>> > > > >      mod_mem_type 2 execmem_type 4 base 0xc21a4000 size 0x3dd000
>> > > > >      mod_mem_type 4 execmem_type 0 base 0x7f1ae000 size 0x1000
>> > > > >      mod_mem_type 5 execmem_type 4 base 0x7fb73000 size 0x10c000
>> > > > >      section 43 reloc 11360 sym '': relocation 42 out of range
>> > > > > (0x7facca74 -> 0xc2580734)
>> > > > >
>> > > > > This loc address  0x7facca74 is from the MOD_DATA memory based o=
n mod
>> > > > > mem allocation log above.
>> > > > > I also print some extra info about the dstsect with
>> > > > >     pr_err("dstsec name %s add %#lx size %u rel 0x%px rel offset=
 %u\n",
>> > > > >         strtab + dstsec->sh_name, dstsec->sh_addr, dstsec->sh_si=
ze,
>> > > > > rel, rel->r_offset)
>> > > > > and got this print out
>> > > > >     dstsec name FUNCTION__.2 add 0x7fabd3c0 size 86912 rel 0xc33=
f931c
>> > > > > rel offset 63156
>> > > > >
>> > > > > FUNCTION__.2 is in the rodata section from the symbol table.
>> > > > >
>> > > > > So looks like there is reference to ARM.exidx from the data/roda=
ta
>> > > > > section and that also need to be taken care of?
>> > > >
>> > > > It looks like the ARM.exidx, which is now in .text (the first entr=
y in
>> > > > your table), contains a reference to code that is emitted in .roda=
ta
>> > > > rather than .text, and .rodata (mod_mem_type 2) is emitted in the
>> > > > vmalloc space, and is too far from .text.
>> > > >
>> > > This loc address 0x7facca74 is actually from the MOD_DATA mod_mem_ty=
pe 1.
>> > > Seems to me that it is some .data reference .rodata but how is this =
possible?
>> > >
>> >
>> > How so? That MOD_DATA region starts at 0x7fad4000, no?
>> >
>> My bad.  Wrong math.. That address is in the MOD_TEXT so it totally
>> makes sense now.
>>
>> > > > If FUNCTION__.2 is really a function, why is it in .rodata and not=
 in .text?
>> > > >
>> > > Not that symbol is not a function. I believe it is probably some
>> > > string or fixed data
>> > > that the compiler generated for a function so it is in .rodata.  The=
re
>> > > are many of
>> > > these instances from the objdump:
>> > >
>> > > 00001058 l     O .rodata 0000000b __FUNCTION__.2
>> > > 00001118 l     O .rodata 0000001b __FUNCTION__.2
>> > > ...
>> > >
>> >
>> > So one thing you might consider is to find a way to emit these into
>> > .text as well, or any other section that has the 'x' bit set.
>> Thanks we will look more into this and see if it is possible.
>
>
> It turns out that section .ARM.extab also contains R_ARM_PREL31 relocatio=
n but this section has a regular type of PROGBITS.
> Below is the dump of the headers of the .ko module with .ARM.extab keywor=
d:
>
>   [27] .ARM.extab.t[...] PROGBITS        00000000 ac0e55 000000 00   A  0=
   0  1
>   [31] .ARM.extab.i[...] PROGBITS        00000000 ac17da 000000 00   A  0=
   0  1
>   [34] .ARM.extab.e[...] PROGBITS        00000000 ac17e4 000000 00   A  0=
   0  1
>   [41] .ARM.extab        PROGBITS        00000000 ac1a60 000054 00   A  0=
   0  4
> 000000fc  00001a2a R_ARM_PREL31      00000000   .ARM.extab
> 00000a5c  00001a2a R_ARM_PREL31      00000000   .ARM.extab
> 00003c24  00001a2a R_ARM_PREL31      00000000   .ARM.extab
> 0000479c  00001a2a R_ARM_PREL31      00000000   .ARM.extab
> 0000f6b4  00001a2a R_ARM_PREL31      00000000   .ARM.extab
> 00011ba4  00001a2a R_ARM_PREL31      00000000   .ARM.extab
> 000135cc  00001a2a R_ARM_PREL31      00000000   .ARM.extab
>     17: 00000000     0 SECTION LOCAL  DEFAULT   27 .ARM.extab.text.[...]
>     20: 00000000     0 SECTION LOCAL  DEFAULT   31 .ARM.extab.init.text
>     22: 00000000     0 SECTION LOCAL  DEFAULT   34 .ARM.extab.exit.text
>     26: 00000000     0 SECTION LOCAL  DEFAULT   41 .ARM.extab
>
> So with an extra check on this specific section,  the driver can load suc=
cessfully.   Can this be a real fix for this issue?

Yes, that seems reasonable. Apparently, both ARM.exidx and ARM.extab
need to live within -/+ 1 GiB of the .text sections they annotate, and
this is a reasonable and unintrusive way to achieve that.

> But if the section type is PROGBITS, why do we need to set the SHF_EXECIN=
STR flag?  Shouldn't it be treated as instruction by default?
>

PROGBITS just means the section contents in the file need to be copied
into the image in memory in order to initialize it, not that the
contents are code.

E.g., NOBITS means that the associated memory region needs to be
zeroed. Other types exist that are not part of the static memory image
at all (i.e., relocations, ELF notes, debug data, symbol tables, etc)

>
> --- a/arch/arm/kernel/module-plts.c
> +++ b/arch/arm/kernel/module-plts.c
> @@ -225,6 +225,12 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Sh=
dr *sechdrs,
>                         mod->arch.init.plt =3D s;
>                 else if (s->sh_type =3D=3D SHT_SYMTAB)
>                         syms =3D (Elf32_Sym *)s->sh_addr;
> +#if defined(CONFIG_ARM_UNWIND) && !defined(CONFIG_VMSPLIT_3G)
> +               else if (s->sh_type =3D=3D ELF_SECTION_UNWIND ||
> +                                (strncmp(".ARM.extab", secstrings + s->s=
h_name, 10) =3D=3D 0)) {
> +                       s->sh_flags |=3D SHF_EXECINSTR;
> +               }
> +#endif
>         }
>
>         if (!mod->arch.core.plt || !mod->arch.init.plt) {
>

You can send this out to the list as a patch. Please align the added
line vertically with the 's' after 'else if(' and add

Co-developed-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

