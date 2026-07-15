Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61227C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 16:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zRqubD3luHeA7X/syA0VT/Dcqiifb7fpA/4yHhPmrAA=; b=RgV1xxXCfU/zIBVIZygjPkMVWD
	nNqiJPZJicduMa6PTcB8IXYoJ/zfeZ3oswZgkN0r4IkDOEC0yW58xkwVJvCP16ug8s27ijLgS4vhM
	t7atyf3OI//MP5RWqTTCaxev4VCvI6m1pJlCCDuwPdBelboIhbe1tfrNKIRH7srMrAo/lJswfem3H
	cd0rtdNquhVIC7ddPZ9dcM2Ay1jqoLU3EgQlXRIVmDic276hUDCeNbbgi29V0437ulccg8KgHYdaI
	aMHIYOoal66ugLjdXNSn+k0OVahna9SmUcJ1U+n168Z8gQS5Ksya6iSnrsTJ6VFBBBnjzwjn2DfED
	QVdVc14Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk2M6-0000000FRhG-0Iyf;
	Wed, 15 Jul 2026 16:21:06 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk2M2-0000000FRfz-2L8R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 16:21:04 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso2730046a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 09:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784132460; x=1784737260; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zRqubD3luHeA7X/syA0VT/Dcqiifb7fpA/4yHhPmrAA=;
        b=bh6c9+0puYwMSayV0bsnnkgMAL3EPh95+pNmJe3dWHgc7G7zJ/b9pGOlpPFK+Y+UVb
         DV+XDmJLMPrhjEAVoKL+hCmmM+ddYTXpGieNXBz3EDtaHLrfNUbwb/9yAkv1SVYvZf53
         dho0Imy3ty2N1SzzIobVLQEozBINpiOz/eOl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784132460; x=1784737260;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zRqubD3luHeA7X/syA0VT/Dcqiifb7fpA/4yHhPmrAA=;
        b=jFR0K/+X/yXeEYyJssM5yX6T7ypXkDZnfMtcl3aMNW/3cUkREXB1u6jluq1ERTUZ3p
         R7q5hec8wP8Iu0n3cQqK8I10xb7Ri0jiNbTnjuF5+ljIGo67neWCyJ0oqRV9ZSVWAM8h
         X4bI1+nP/Fqj/VINQtgevdzztWINbk8OB+aLIj4U7IzX3Z3DtA0tcbttTbDZSqMD69Q2
         XG6EdLs0GYz9LemfQVPGqFxOMHLVw3M0XiQv4dGTAOqWh0hVBs0szaW592bfjrKr6Kjs
         D0EYFVW7FuGtVMTmYBqGWocSqPaf5JmAKANWecQjU9tMoHOLNeAfFV24mUqLCyV8mTBa
         pc5g==
X-Forwarded-Encrypted: i=1; AHgh+Rru/MSPVCkF2pTWz6qpDDbyx+JqTKUYFEAOSJDvfyelslr+dq0kxNCk39zqc2n6x+NkaIIGyZMjBK1ppx/6pcoB@lists.infradead.org
X-Gm-Message-State: AOJu0YyIfcwovowRGnOLP0Zm5y51D9zrvxNtL91yaxJ7m4UJqpxzD1EM
	5enMeF+eAgY+S1+PttxoU5JywR6XrjBLTYuSNpMtkL7ENBThbP+/B749Kw6EGRdSpQ==
X-Gm-Gg: AfdE7ckDtubjPB877QxPQ9cTDUiACXUGSWUfjkCk5sZsS4MHd2clk4NiwsljnoBgYmG
	p0a3eFgW3SV3FQRYrnEweuNk1qpKvOPkVo/OwFTuwAPJKWiKuNKKx9UP54OboRDJ5DwLckwrgDC
	zS3J5YriFklzftgT0SsvR09IZBdJSv3M4fAJWOpGpahcOD3zJJmPwbqaVaSjAwNdK/xoWlqGegM
	P2k/QkDAuOK1kUnmbM4Qm6hDkhieDlPlspMnFRQZqaoDJ23dmY0RrvNlhaURYA4ruYJURzCe4ru
	ZF+RYHMFetBVo4q00HWnAyLMCFqy+oLrZVoA1UDVvAIPCDEjBtwp5s5ZDeR45auEl1w8ZZECUjq
	09qo9pEPRrdQrxCWbhwjhXxYQOQvxyY7G+T5+RU1h9ZjgoJJHINosyJQ5ZtHBIuTKRC8FlrnJ2m
	1yuzrcWUM5YHSDsMsOQkFpbiLttmxbPB54tsGamCmz+pyID+ZDM4Y=
X-Received: by 2002:a17:90b:2d4e:b0:380:fead:448d with SMTP id 98e67ed59e1d1-38dc74cf95bmr18138317a91.13.1784132460203;
        Wed, 15 Jul 2026 09:21:00 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:6749:92c4:a95f:a937])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-3140e5306afsm3225455eec.9.2026.07.15.09.20.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 09:20:58 -0700 (PDT)
Date: Wed, 15 Jul 2026 09:20:55 -0700
From: Brian Norris <briannorris@chromium.org>
To: Jens Remus <jremus@linux.ibm.com>
Cc: Indu Bhagat <ibhagatgnu@gmail.com>,
	Dylan Hatch <dylanbhatch@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Weinan Liu <wnliu@google.com>, Will Deacon <will@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Kosina <jikos@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
	joe.lawrence@redhat.com, linux-toolchains@vger.kernel.org,
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v5 0/8] unwind, arm64: add sframe unwinder for kernel
Message-ID: <alezZ6tDIXSBY-v9@google.com>
References: <20260428183643.3796063-1-dylanbhatch@google.com>
 <agcEMEl-QR0g6DgF@google.com>
 <CADBMgpx38SUUuYYCm612STqh01jqv817WnJeeXYTD7Uc1r-fug@mail.gmail.com>
 <4f429a50-df5d-411f-b40e-048d3cad5133@linux.ibm.com>
 <alWCuAA7r1otvROg@google.com>
 <6e0d0afc-8a54-4763-b25d-dea122c4cd12@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <6e0d0afc-8a54-4763-b25d-dea122c4cd12@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_092102_720109_82167A14 
X-CRM114-Status: GOOD (  42.11  )
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

Hi Jens,

Thanks for looking! Lots more output below. Feel free to ask for more
info you tink could help.`

On Wed, Jul 15, 2026 at 10:06:20AM +0200, Jens Remus wrote:
> On 7/14/2026 2:28 AM, Brian Norris wrote:
> > On Tue, May 19, 2026 at 01:05:23PM +0200, Jens Remus wrote:
>=20
> > I also work at the same company as Dylan and Mostafa, and am therefore
> > probably using the same company-maintained Linux distribution.
> >=20
> >> On 5/18/2026 7:55 PM, Dylan Hatch wrote:
> >>> On Fri, May 15, 2026 at 4:32=E2=80=AFAM Mostafa Saleh <smostafa@googl=
e.com> wrote:
> >>>> Not sure if related, but after updating my toolchain
> >>>> (aarch64-linux-gnu-gcc (Debian 15.2.0-4) 15.2.0), I hit link errors:
> >>>> ld.lld: error: arch/arm64/kernel/vdso/vgettimeofday.o:(.sframe) is b=
eing placed in '.sframe'
> >>>> ld.lld: error: arch/arm64/kernel/vdso/vgetrandom.o:(.sframe) is bein=
g placed in '.sframe`
>=20
> My understanding of above message is that the linker complains that the
> input object (e.g. vgettimeofday.o) has an .sframe section for which
> the linker script does not have any rule, so that it defaults to place
> it in .sframe in the output, which could not be the desired result.

Not sure if it's obvious to you, but I also found a few more details:

* This is most noticeable with CONFIG_WERROR=3Dy, which turns the linker
  warning into an error.

* It appears both with LD=3Dld.lld and with the default (bfd linker). bfd
  shows:

/usr/bin/aarch64-linux-gnu-ld.bfd: error: unplaced orphan section `.sframe'=
 from `arch/arm64/kernel/vdso/vgettimeofday.o'
/usr/bin/aarch64-linux-gnu-ld.bfd: error: unplaced orphan section `.sframe'=
 from `arch/arm64/kernel/vdso/vgetrandom.o'


Otherwise, I don't have to do much special to hit this. Just
cross-compile ARCH=3Darm64 defconfig.

> > I've also been hitting this for some time, and I'd like to see if I can
> > figure out what's going wrong. My current workaround is:
> >=20
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -946,6 +946,8 @@ ifdef CONFIG_CC_IS_GCC
> >  KBUILD_CFLAGS	+=3D $(call cc-option,--param=3Dallow-store-data-races=
=3D0)
> >  KBUILD_CFLAGS	+=3D $(call cc-option,-fno-allow-store-data-races)
> >  endif
> > +# No sframe generation for kernel if enabled by default
> > +KBUILD_CFLAGS	+=3D $(call cc-option,-Xassembler --gsframe=3Dno)
> > =20
> >  ifdef CONFIG_READABLE_ASM
> >  # Disable optimizations that make assembler listings hard to read.
> >=20
> >>> Previously when developing against the SFrame V2 format, I had fixed
> >>> these warnings with the VDSO Makefile change currently in this series:
> >>>
> >>> diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso=
/Makefile
> >>> index 7dec05dd33b7..c60ef921956f 100644
> >>> --- a/arch/arm64/kernel/vdso/Makefile
> >>> +++ b/arch/arm64/kernel/vdso/Makefile
> >>> @@ -38,7 +38,7 @@ ccflags-y +=3D -DDISABLE_BRANCH_PROFILING -DBUILD_V=
DSO
> >>>  CC_FLAGS_REMOVE_VDSO :=3D $(CC_FLAGS_FTRACE) -Os $(CC_FLAGS_SCS) \
> >>>                         $(RANDSTRUCT_CFLAGS) $(KSTACK_ERASE_CFLAGS) \
> >>>                         $(GCC_PLUGINS_CFLAGS) \
> >>> -                       $(CC_FLAGS_LTO) $(CC_FLAGS_CFI) \
> >>> +                       $(CC_FLAGS_LTO) $(CC_FLAGS_CFI) $(CC_FLAGS_SF=
RAME) \
> >>>                         -Wmissing-prototypes -Wmissing-declarations
> >>>
> >>>  CC_FLAGS_ADD_VDSO :=3D -O2 -mcmodel=3Dtiny -fasynchronous-unwind-tab=
les
> >>>
> >>> But the warnings seem to have returned after upgrading my toolchain,
> >>> possibly due to SFrame V3 or some confounding change in GCC. The
> >>> --gsframe in the assembler should be set to 'no' by default, so
> >>> perhaps GCC is providing an override --gsframe internally?
> >>
> >> Could it be that your build of binutils was configured with
> >> --enable-default-sframe, so that the GNU assembler defaults to generate
> >> .sframe?  AFAIK this configure option was meant for distributors and
> >> package maintainers.
> >>
> >> You can check as follows whether --gsframe defaults to "no" or "yes":
> >>
> >> $ as --help | grep -A1 gsframe
> >>   --gsframe[=3D{no|yes}]    whether to generate SFrame stack trace inf=
ormation
> >>                           (default: no)
> >> ...
> >=20
> > $ aarch64-linux-gnu-as --help | grep -A1 gsframe
> >   --gsframe[=3D{no|yes}]    whether to generate SFrame stack trace info=
rmation
> >                           (default: no)
> > --
> >   --gsframe-<N>           generate SFrame version <N> information. 3 =
=3D=3D <N>
> >   --scfi=3Dexperimental     Synthesize DWARF CFI for hand-written asm
> >=20
> >> Maybe build the VDSO separately with V=3D1 to see what assembler/compi=
ler
> >> options are effectively used (e.g. for vgettimeofday.o and vgetrandom.o
> >> mentioned in the linker error message above)?
> >=20
> > A slightly tweaked version of my vgetrandom.o build line:
> >=20
> > # CC      arch/arm64/kernel/vdso/vgetrandom.o
> >   aarch64-linux-gnu-gcc -Wp,-MMD,arch/arm64/kernel/vdso/.vgetrandom.o.d=
 -nostdinc -I./arch/arm64/include -I./arch/arm64/include/generated -I./incl=
ude -I./include -I./arch/arm64/include/uapi -I./arch/arm64/include/generate=
d/uapi -I./include/uapi -I./include/generated/uapi -include ./include/linux=
/compiler-version.h -include ./include/linux/kconfig.h -include ./include/l=
inux/compiler_types.h -D__KERNEL__ -mlittle-endian -DCC_USING_PATCHABLE_FUN=
CTION_ENTRY -DKASAN_SHADOW_SCALE_SHIFT=3D -Werror -fshort-wchar -funsigned-=
char -fno-common -fno-PIE -fno-strict-aliasing -std=3Dgnu11 -fms-extensions=
 -mgeneral-regs-only -DCONFIG_CC_HAS_K_CONSTRAINT=3D1 -Wno-psabi -mabi=3Dlp=
64 -fno-asynchronous-unwind-tables -fno-unwind-tables -mbranch-protection=
=3Dpac-ret -Wa,-march=3Darmv8.5-a -DARM64_ASM_ARCH=3D'"armv8.5-a"' -DKASAN_=
SHADOW_SCALE_SHIFT=3D -fno-delete-null-pointer-checks -O2 -fno-allow-store-=
data-races -fstack-protector-strong -fno-omit-frame-pointer -fno-optimize-s=
ibling-calls -ftrivial-auto-var-init=3Dzero -fzero-init-padding-bits=3Dall =
-fno-stack-clash-protection -fno-inline-functions-called-once -fmin-functio=
n-alignment=3D8 -fstrict-flex-arrays=3D3 -fno-strict-overflow -fno-stack-ch=
eck -fconserve-stack -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=3Dim=
plicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -W=
error=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-ad=
dress -Wno-address-of-packed-member -Wframe-larger-than=3D2048 -Wno-main -W=
no-type-limits -Wno-dangling-pointer -Wvla-larger-than=3D1 -Wno-pointer-sig=
n -Wcast-function-type -Wno-unterminated-string-initialization -Wno-array-b=
ounds -Wno-stringop-overflow -Wno-alloc-size-larger-than -Wimplicit-fallthr=
ough=3D5 -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Werror=
=3Ddesignated-init -Wenum-conversion -Wunused -Wno-unused-but-set-variable =
-Wno-unused-const-variable -Wno-packed-not-aligned -Wno-format-overflow -Wn=
o-format-truncation -Wno-stringop-truncation -Wno-override-init -Wno-missin=
g-field-initializers -Wno-shift-negative-value -Wno-maybe-uninitialized -Wn=
o-sign-compare -Wno-unused-parameter -g -mstack-protector-guard=3Dsysreg -m=
stack-protector-guard-reg=3Dsp_el0 -mstack-protector-guard-offset=3D1344 -f=
no-common -fno-builtin -fno-stack-protector -ffixed-x18 -DDISABLE_BRANCH_PR=
OFILING -DBUILD_VDSO -O2 -mcmodel=3Dtiny -fasynchronous-unwind-tables -incl=
ude ./lib/vdso/getrandom.c   -I./arch/arm64/kernel/vdso -Iarch/arm64/kernel=
/vdso    -DKBUILD_MODFILE=3D'"arch/arm64/kernel/vdso/vgetrandom"' -DKBUILD_=
BASENAME=3D'"vgetrandom"' -DKBUILD_MODNAME=3D'"vgetrandom"' -D__KBUILD_MODN=
AME=3Dvgetrandom -c -o arch/arm64/kernel/vdso/vgetrandom.o ./arch/arm64/ker=
nel/vdso/vgetrandom.c
>=20
> That command line does not have any --gsframe[-3] (e.g. -Wa,--gsframe).
> I am not aware of any binutils release / repository state where the
> --gsframe default was broken.

FWIW, I'm usually testing on both v7.1 and approx v7.2-rc3, to make sure
my results are consistent, and it's not already somehow fixed.

> @Indu: Do you have any idea what could be going on?
>=20
> > I mostly don't know what I'm looking for w.r.t. gsframe features, but
> > I'm willing to poke at my compiler/assembler/build-process.
>=20
> Could it be that your gcc injects --gsframe e.g. via its spec file?
> Maybe that would show up if you run above command manually and append
> gcc option -v?

I've dumped most of the output below. I see that the 'as' invocation
includes --gsframe, but I'm not sure why.

$ aarch64-linux-gnu-gcc -Wp,-MMD,arch/arm64/kernel/vdso/.vgetrandom.o.d -no=
stdinc -I./arch/arm64/include -I./arch/arm64/include/generated -I./include =
-I./include -I./arch/arm64/include/uapi -I./arch/arm64/include/generated/ua=
pi -I./include/uapi -I./include/generated/uapi -include ./include/linux/com=
piler-version.h -include ./include/linux/kconfig.h -include ./include/linux=
/compiler_types.h -D__KERNEL__ -mlittle-endian -DKASAN_SHADOW_SCALE_SHIFT=
=3D -Werror -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-=
aliasing -std=3Dgnu11 -fms-extensions -mgeneral-regs-only -DCONFIG_CC_HAS_K=
_CONSTRAINT=3D1 -Wno-psabi -mabi=3Dlp64 -fno-asynchronous-unwind-tables -fn=
o-unwind-tables -mbranch-protection=3Dpac-ret -Wa,-march=3Darmv8.5-a -DARM6=
4_ASM_ARCH=3D'"armv8.5-a"' -DKASAN_SHADOW_SCALE_SHIFT=3D -fno-delete-null-p=
ointer-checks -O2 -fno-allow-store-data-races -fstack-protector-strong -fno=
-omit-frame-pointer -fno-optimize-sibling-calls -ftrivial-auto-var-init=3Dz=
ero -fzero-init-padding-bits=3Dall -fno-stack-clash-protection -fmin-functi=
on-alignment=3D4 -fstrict-flex-arrays=3D3 -fno-strict-overflow -fno-stack-c=
heck -fconserve-stack -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=3Di=
mplicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -=
Werror=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-a=
ddress -Wno-address-of-packed-member -Wframe-larger-than=3D2048 -Wno-main -=
Wno-type-limits -Wno-dangling-pointer -Wvla-larger-than=3D1 -Wno-pointer-si=
gn -Wcast-function-type -Wno-unterminated-string-initialization -Wno-array-=
bounds -Wno-stringop-overflow -Wno-alloc-size-larger-than -Wimplicit-fallth=
rough=3D5 -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Werror=
=3Ddesignated-init -Wenum-conversion -Wunused -Wno-unused-but-set-variable =
-Wno-unused-const-variable -Wno-packed-not-aligned -Wno-format-overflow -Wn=
o-format-truncation -Wno-stringop-truncation -Wno-override-init -Wno-missin=
g-field-initializers -Wno-shift-negative-value -Wno-maybe-uninitialized -Wn=
o-sign-compare -Wno-unused-parameter -g -fno-var-tracking -femit-struct-deb=
ug-baseonly -mstack-protector-guard=3Dsysreg -mstack-protector-guard-reg=3D=
sp_el0 -mstack-protector-guard-offset=3D1344 -fno-common -fno-builtin -fno-=
stack-protector -ffixed-x18 -DDISABLE_BRANCH_PROFILING -DBUILD_VDSO -O2 -mc=
model=3Dtiny -fasynchronous-unwind-tables -include $LINUX/lib/vdso/getrando=
m.c    -DKBUILD_MODFILE=3D'"arch/arm64/kernel/vdso/vgetrandom"' -DKBUILD_BA=
SENAME=3D'"vgetrandom"' -DKBUILD_MODNAME=3D'"vgetrandom"' -D__KBUILD_MODNAM=
E=3Dvgetrandom -c -o arch/arm64/kernel/vdso/vgetrandom.o arch/arm64/kernel/=
vdso/vgetrandom.c  -v
Using built-in specs.
COLLECT_AS_OPTIONS=3D'-march=3Darmv8.5-a'
COLLECT_GCC=3Daarch64-linux-gnu-gcc
Target: aarch64-linux-gnu
Configured with: ../src/configure -v --with-pkgversion=3D'Debian 15.2.0-4' =
--with-bugurl=3Dfile:///usr/share/doc/gcc-15/README.Bugs --enable-languages=
=3Dc,ada,c++,go,d,fortran,objc,obj-c++,m2,cobol,algol68 --prefix=3D/usr --w=
ith-gcc-major-version-only --program-suffix=3D-15 --enable-shared --enable-=
linker-build-id --libexecdir=3D/usr/libexec --without-included-gettext --en=
able-threads=3Dposix --libdir=3D/usr/lib --enable-nls --with-sysroot=3D/ --=
enable-clocale=3Dgnu --enable-libstdcxx-debug --enable-libstdcxx-time=3Dyes=
 --with-default-libstdcxx-abi=3Dnew --enable-libstdcxx-backtrace --enable-g=
nu-unique-object --disable-libquadmath --disable-libquadmath-support --enab=
le-plugin --enable-default-pie --with-system-zlib --enable-libphobos-checki=
ng=3Drelease --without-target-system-zlib --enable-multiarch --enable-fix-c=
ortex-a53-843419 --disable-werror --enable-checking=3Drelease --build=3Dx86=
_64-linux-gnu --host=3Dx86_64-linux-gnu --target=3Daarch64-linux-gnu --prog=
ram-prefix=3Daarch64-linux-gnu- --includedir=3D/usr/aarch64-linux-gnu/inclu=
de --with-build-config=3Dbootstrap-lto-lean --enable-link-serialization=3D32
Thread model: posix
Supported LTO compression algorithms: zlib zstd
gcc version 15.2.0 (Debian 15.2.0-4)
COLLECT_GCC_OPTIONS=3D'-nostdinc' '-I' './arch/arm64/include' '-I' './arch/=
arm64/include/generated' '-I' './include' '-I' './include' '-I' './arch/arm=
64/include/uapi' '-I' './arch/arm64/include/generated/uapi' '-I' './include=
/uapi' '-I' './include/generated/uapi' '-include' './include/linux/compiler=
-version.h' '-include' './include/linux/kconfig.h' '-include' './include/li=
nux/compiler_types.h' '-D' '__KERNEL__' '-mlittle-endian' '-D' 'KASAN_SHADO=
W_SCALE_SHIFT=3D' '-Werror' '-fshort-wchar' '-funsigned-char' '-fno-PIE' '-=
fno-strict-aliasing' '-std=3Dgnu11' '-fms-extensions' '-mgeneral-regs-only'=
 '-D' 'CONFIG_CC_HAS_K_CONSTRAINT=3D1' '-Wno-psabi' '-mabi=3Dlp64' '-fno-un=
wind-tables' '-mbranch-protection=3Dpac-ret' '-D' 'ARM64_ASM_ARCH=3D"armv8.=
5-a"' '-D' 'KASAN_SHADOW_SCALE_SHIFT=3D' '-fno-delete-null-pointer-checks' =
'-O2' '-fno-allow-store-data-races' '-fstack-protector-strong' '-fno-omit-f=
rame-pointer' '-fno-optimize-sibling-calls' '-ftrivial-auto-var-init=3Dzero=
' '-fzero-init-padding-bits=3Dall' '-fno-stack-clash-protection' '-fmin-fun=
ction-alignment=3D4' '-fstrict-flex-arrays=3D3' '-fno-strict-overflow' '-fs=
tack-check=3Dno' '-fconserve-stack' '-fno-builtin-wcslen' '-Wall' '-Wextra'=
 '-Wundef' '-Werror=3Dimplicit-function-declaration' '-Werror=3Dimplicit-in=
t' '-Werror=3Dreturn-type' '-Werror=3Dstrict-prototypes' '-Wno-format-secur=
ity' '-Wno-trigraphs' '-Wno-frame-address' '-Wno-address-of-packed-member' =
'-Wframe-larger-than=3D2048' '-Wno-main' '-Wno-type-limits' '-Wdangling-poi=
nter=3D0' '-Wvla-larger-than=3D1' '-Wno-pointer-sign' '-Wcast-function-type=
' '-Wno-unterminated-string-initialization' '-Warray-bounds=3D0' '-Wstringo=
p-overflow=3D0' '-Walloc-size-larger-than=3D$XXX' '-Wimplicit-fallthrough=
=3D5' '-Werror=3Ddate-time' '-Werror=3Dincompatible-pointer-types' '-Werror=
=3Ddesignated-init' '-Wenum-conversion' '-Wunused' '-Wno-unused-but-set-var=
iable' '-Wunused-const-variable=3D0' '-Wno-packed-not-aligned' '-Wformat-ov=
erflow=3D0' '-Wformat-truncation=3D0' '-Wno-stringop-truncation' '-Wno-over=
ride-init' '-Wno-missing-field-initializers' '-Wno-shift-negative-value' '-=
Wno-maybe-uninitialized' '-Wno-sign-compare' '-Wno-unused-parameter' '-g' '=
-fno-var-tracking' '-femit-struct-debug-baseonly' '-mstack-protector-guard=
=3Dsysreg' '-mstack-protector-guard-reg=3Dsp_el0' '-mstack-protector-guard-=
offset=3D1344' '-fno-common' '-fno-builtin' '-fno-stack-protector' '-ffixed=
-x18' '-D' 'DISABLE_BRANCH_PROFILING' '-D' 'BUILD_VDSO' '-O2' '-mcmodel=3Dt=
iny' '-fasynchronous-unwind-tables' '-include' '$LINUX/lib/vdso/getrandom.c=
' '-D' 'KBUILD_MODFILE=3D"arch/arm64/kernel/vdso/vgetrandom"' '-D' 'KBUILD_=
BASENAME=3D"vgetrandom"' '-D' 'KBUILD_MODNAME=3D"vgetrandom"' '-D' '__KBUIL=
D_MODNAME=3Dvgetrandom' '-c' '-o' 'arch/arm64/kernel/vdso/vgetrandom.o' '-v=
' '-dumpdir' 'arch/arm64/kernel/vdso/'
 /usr/libexec/gcc-cross/aarch64-linux-gnu/15/cc1 -quiet -nostdinc -v -I ./a=
rch/arm64/include -I ./arch/arm64/include/generated -I ./include -I ./inclu=
de -I ./arch/arm64/include/uapi -I ./arch/arm64/include/generated/uapi -I .=
/include/uapi -I ./include/generated/uapi -imultiarch aarch64-linux-gnu -D =
__KERNEL__ -D KASAN_SHADOW_SCALE_SHIFT=3D -D CONFIG_CC_HAS_K_CONSTRAINT=3D1=
 -D ARM64_ASM_ARCH=3D"armv8.5-a" -D KASAN_SHADOW_SCALE_SHIFT=3D -D DISABLE_=
BRANCH_PROFILING -D BUILD_VDSO -D KBUILD_MODFILE=3D"arch/arm64/kernel/vdso/=
vgetrandom" -D KBUILD_BASENAME=3D"vgetrandom" -D KBUILD_MODNAME=3D"vgetrand=
om" -D __KBUILD_MODNAME=3Dvgetrandom -include ./include/linux/compiler-vers=
ion.h -include ./include/linux/kconfig.h -include ./include/linux/compiler_=
types.h -include /usr/local/google/home/briannorris/git/linux/lib/vdso/getr=
andom.c -MMD arch/arm64/kernel/vdso/.vgetrandom.o.d arch/arm64/kernel/vdso/=
vgetrandom.c -quiet -dumpdir arch/arm64/kernel/vdso/ -dumpbase vgetrandom.c=
 -dumpbase-ext .c -mlittle-endian -mgeneral-regs-only -mabi=3Dlp64 -mbranch=
-protection=3Dpac-ret -mstack-protector-guard=3Dsysreg -mstack-protector-gu=
ard-reg=3Dsp_el0 -mstack-protector-guard-offset=3D1344 -mcmodel=3Dtiny -g -=
O2 -O2 -Werror -Wno-psabi -Wall -Wextra -Wundef -Werror=3Dimplicit-function=
-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-=
prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wno-addr=
ess-of-packed-member -Wframe-larger-than=3D2048 -Wno-main -Wno-type-limits =
-Wdangling-pointer=3D0 -Wvla-larger-than=3D1 -Wno-pointer-sign -Wcast-funct=
ion-type -Wno-unterminated-string-initialization -Warray-bounds=3D0 -Wstrin=
gop-overflow=3D0 -Walloc-size-larger-than=3D18446744073709551615EiB -Wimpli=
cit-fallthrough=3D5 -Werror=3Ddate-time -Werror=3Dincompatible-pointer-type=
s -Werror=3Ddesignated-init -Wenum-conversion -Wunused -Wno-unused-but-set-=
variable -Wunused-const-variable=3D0 -Wno-packed-not-aligned -Wformat-overf=
low=3D0 -Wformat-truncation=3D0 -Wno-stringop-truncation -Wno-override-init=
 -Wno-missing-field-initializers -Wno-shift-negative-value -Wno-maybe-unini=
tialized -Wno-sign-compare -Wno-unused-parameter -std=3Dgnu11 -version -fsh=
ort-wchar -funsigned-char -fno-PIE -fno-strict-aliasing -fms-extensions -fn=
o-unwind-tables -fno-delete-null-pointer-checks -fno-allow-store-data-races=
 -fstack-protector-strong -fno-omit-frame-pointer -fno-optimize-sibling-cal=
ls -ftrivial-auto-var-init=3Dzero -fzero-init-padding-bits=3Dall -fno-stack=
-clash-protection -fmin-function-alignment=3D4 -fstrict-flex-arrays=3D3 -fn=
o-strict-overflow -fstack-check=3Dno -fconserve-stack -fno-builtin-wcslen -=
fno-var-tracking -femit-struct-debug-baseonly -fno-common -fno-builtin -fno=
-stack-protector -ffixed-x18 -fasynchronous-unwind-tables -fasynchronous-un=
wind-tables -o /tmp/cc6nO0fY.s
GNU C11 (Debian 15.2.0-4) version 15.2.0 (aarch64-linux-gnu)
	compiled by GNU C version 15.2.0, GMP version 6.3.0, MPFR version 4.2.2, M=
PC version 1.3.1, isl version isl-0.27-GMP

GGC heuristics: --param ggc-min-expand=3D100 --param ggc-min-heapsize=3D131=
072
ignoring duplicate directory "./include"
#include "..." search starts here:
#include <...> search starts here:
 ./arch/arm64/include
 ./arch/arm64/include/generated
 ./include
 ./arch/arm64/include/uapi
 ./arch/arm64/include/generated/uapi
 ./include/uapi
 ./include/generated/uapi
End of search list.
Compiler executable checksum: 2014541e26adcb350b182f07eff54ec5
COLLECT_GCC_OPTIONS=3D'-nostdinc' '-I' './arch/arm64/include' '-I' './arch/=
arm64/include/generated' '-I' './include' '-I' './include' '-I' './arch/arm=
64/include/uapi' '-I' './arch/arm64/include/generated/uapi' '-I' './include=
/uapi' '-I' './include/generated/uapi' '-include' './include/linux/compiler=
-version.h' '-include' './include/linux/kconfig.h' '-include' './include/li=
nux/compiler_types.h' '-D' '__KERNEL__' '-mlittle-endian' '-D' 'KASAN_SHADO=
W_SCALE_SHIFT=3D' '-Werror' '-fshort-wchar' '-funsigned-char' '-fno-PIE' '-=
fno-strict-aliasing' '-std=3Dgnu11' '-fms-extensions' '-mgeneral-regs-only'=
 '-D' 'CONFIG_CC_HAS_K_CONSTRAINT=3D1' '-Wno-psabi' '-mabi=3Dlp64' '-fno-un=
wind-tables' '-mbranch-protection=3Dpac-ret' '-D' 'ARM64_ASM_ARCH=3D"armv8.=
5-a"' '-D' 'KASAN_SHADOW_SCALE_SHIFT=3D' '-fno-delete-null-pointer-checks' =
'-O2' '-fno-allow-store-data-races' '-fstack-protector-strong' '-fno-omit-f=
rame-pointer' '-fno-optimize-sibling-calls' '-ftrivial-auto-var-init=3Dzero=
' '-fzero-init-padding-bits=3Dall' '-fno-stack-clash-protection' '-fmin-fun=
ction-alignment=3D4' '-fstrict-flex-arrays=3D3' '-fno-strict-overflow' '-fs=
tack-check=3Dno' '-fconserve-stack' '-fno-builtin-wcslen' '-Wall' '-Wextra'=
 '-Wundef' '-Werror=3Dimplicit-function-declaration' '-Werror=3Dimplicit-in=
t' '-Werror=3Dreturn-type' '-Werror=3Dstrict-prototypes' '-Wno-format-secur=
ity' '-Wno-trigraphs' '-Wno-frame-address' '-Wno-address-of-packed-member' =
'-Wframe-larger-than=3D2048' '-Wno-main' '-Wno-type-limits' '-Wdangling-poi=
nter=3D0' '-Wvla-larger-than=3D1' '-Wno-pointer-sign' '-Wcast-function-type=
' '-Wno-unterminated-string-initialization' '-Warray-bounds=3D0' '-Wstringo=
p-overflow=3D0' '-Walloc-size-larger-than=3D$XXX' '-Wimplicit-fallthrough=
=3D5' '-Werror=3Ddate-time' '-Werror=3Dincompatible-pointer-types' '-Werror=
=3Ddesignated-init' '-Wenum-conversion' '-Wunused' '-Wno-unused-but-set-var=
iable' '-Wunused-const-variable=3D0' '-Wno-packed-not-aligned' '-Wformat-ov=
erflow=3D0' '-Wformat-truncation=3D0' '-Wno-stringop-truncation' '-Wno-over=
ride-init' '-Wno-missing-field-initializers' '-Wno-shift-negative-value' '-=
Wno-maybe-uninitialized' '-Wno-sign-compare' '-Wno-unused-parameter' '-g' '=
-fno-var-tracking' '-femit-struct-debug-baseonly' '-mstack-protector-guard=
=3Dsysreg' '-mstack-protector-guard-reg=3Dsp_el0' '-mstack-protector-guard-=
offset=3D1344' '-fno-common' '-fno-builtin' '-fno-stack-protector' '-ffixed=
-x18' '-D' 'DISABLE_BRANCH_PROFILING' '-D' 'BUILD_VDSO' '-O2' '-mcmodel=3Dt=
iny' '-fasynchronous-unwind-tables' '-include' '/usr/local/google/home/bria=
nnorris/git/linux/lib/vdso/getrandom.c' '-D' 'KBUILD_MODFILE=3D"arch/arm64/=
kernel/vdso/vgetrandom"' '-D' 'KBUILD_BASENAME=3D"vgetrandom"' '-D' 'KBUILD=
_MODNAME=3D"vgetrandom"' '-D' '__KBUILD_MODNAME=3Dvgetrandom' '-c' '-o' 'ar=
ch/arm64/kernel/vdso/vgetrandom.o' '-v' '-dumpdir' 'arch/arm64/kernel/vdso/'
 /usr/lib/gcc-cross/aarch64-linux-gnu/15/../../../../aarch64-linux-gnu/bin/=
as -v -I ./arch/arm64/include -I ./arch/arm64/include/generated -I ./includ=
e -I ./include -I ./arch/arm64/include/uapi -I ./arch/arm64/include/generat=
ed/uapi -I ./include/uapi -I ./include/generated/uapi --gsframe --gdwarf-5 =
-EL -mabi=3Dlp64 -march=3Darmv8.5-a -o arch/arm64/kernel/vdso/vgetrandom.o =
/tmp/cc6nO0fY.s
GNU assembler version 2.46.50 (aarch64-linux-gnu) using BFD version (GNU Bi=
nutils for Debian) 2.46.50.20260617
COMPILER_PATH=3D/usr/libexec/gcc-cross/aarch64-linux-gnu/15/:/usr/libexec/g=
cc-cross/aarch64-linux-gnu/15/:/usr/libexec/gcc-cross/aarch64-linux-gnu/:/u=
sr/lib/gcc-cross/aarch64-linux-gnu/15/:/usr/lib/gcc-cross/aarch64-linux-gnu=
/:/usr/lib/gcc-cross/aarch64-linux-gnu/15/../../../../aarch64-linux-gnu/bin/
LIBRARY_PATH=3D/usr/lib/gcc-cross/aarch64-linux-gnu/15/:/usr/lib/gcc-cross/=
aarch64-linux-gnu/15/../../../../aarch64-linux-gnu/lib/../lib/:/lib/aarch64=
-linux-gnu/:/lib/../lib/:/usr/lib/aarch64-linux-gnu/:/usr/lib/../lib/:/usr/=
lib/gcc-cross/aarch64-linux-gnu/15/../../../../aarch64-linux-gnu/lib/:/lib/=
:/usr/lib/
COLLECT_GCC_OPTIONS=3D'-nostdinc' '-I' './arch/arm64/include' '-I' './arch/=
arm64/include/generated' '-I' './include' '-I' './include' '-I' './arch/arm=
64/include/uapi' '-I' './arch/arm64/include/generated/uapi' '-I' './include=
/uapi' '-I' './include/generated/uapi' '-include' './include/linux/compiler=
-version.h' '-include' './include/linux/kconfig.h' '-include' './include/li=
nux/compiler_types.h' '-D' '__KERNEL__' '-mlittle-endian' '-D' 'KASAN_SHADO=
W_SCALE_SHIFT=3D' '-Werror' '-fshort-wchar' '-funsigned-char' '-fno-PIE' '-=
fno-strict-aliasing' '-std=3Dgnu11' '-fms-extensions' '-mgeneral-regs-only'=
 '-D' 'CONFIG_CC_HAS_K_CONSTRAINT=3D1' '-Wno-psabi' '-mabi=3Dlp64' '-fno-un=
wind-tables' '-mbranch-protection=3Dpac-ret' '-D' 'ARM64_ASM_ARCH=3D"armv8.=
5-a"' '-D' 'KASAN_SHADOW_SCALE_SHIFT=3D' '-fno-delete-null-pointer-checks' =
'-O2' '-fno-allow-store-data-races' '-fstack-protector-strong' '-fno-omit-f=
rame-pointer' '-fno-optimize-sibling-calls' '-ftrivial-auto-var-init=3Dzero=
' '-fzero-init-padding-bits=3Dall' '-fno-stack-clash-protection' '-fmin-fun=
ction-alignment=3D4' '-fstrict-flex-arrays=3D3' '-fno-strict-overflow' '-fs=
tack-check=3Dno' '-fconserve-stack' '-fno-builtin-wcslen' '-Wall' '-Wextra'=
 '-Wundef' '-Werror=3Dimplicit-function-declaration' '-Werror=3Dimplicit-in=
t' '-Werror=3Dreturn-type' '-Werror=3Dstrict-prototypes' '-Wno-format-secur=
ity' '-Wno-trigraphs' '-Wno-frame-address' '-Wno-address-of-packed-member' =
'-Wframe-larger-than=3D2048' '-Wno-main' '-Wno-type-limits' '-Wdangling-poi=
nter=3D0' '-Wvla-larger-than=3D1' '-Wno-pointer-sign' '-Wcast-function-type=
' '-Wno-unterminated-string-initialization' '-Warray-bounds=3D0' '-Wstringo=
p-overflow=3D0' '-Walloc-size-larger-than=3D$XXX' '-Wimplicit-fallthrough=
=3D5' '-Werror=3Ddate-time' '-Werror=3Dincompatible-pointer-types' '-Werror=
=3Ddesignated-init' '-Wenum-conversion' '-Wunused' '-Wno-unused-but-set-var=
iable' '-Wunused-const-variable=3D0' '-Wno-packed-not-aligned' '-Wformat-ov=
erflow=3D0' '-Wformat-truncation=3D0' '-Wno-stringop-truncation' '-Wno-over=
ride-init' '-Wno-missing-field-initializers' '-Wno-shift-negative-value' '-=
Wno-maybe-uninitialized' '-Wno-sign-compare' '-Wno-unused-parameter' '-g' '=
-fno-var-tracking' '-femit-struct-debug-baseonly' '-mstack-protector-guard=
=3Dsysreg' '-mstack-protector-guard-reg=3Dsp_el0' '-mstack-protector-guard-=
offset=3D1344' '-fno-common' '-fno-builtin' '-fno-stack-protector' '-ffixed=
-x18' '-D' 'DISABLE_BRANCH_PROFILING' '-D' 'BUILD_VDSO' '-O2' '-mcmodel=3Dt=
iny' '-fasynchronous-unwind-tables' '-include' '/usr/local/google/home/bria=
nnorris/git/linux/lib/vdso/getrandom.c' '-D' 'KBUILD_MODFILE=3D"arch/arm64/=
kernel/vdso/vgetrandom"' '-D' 'KBUILD_BASENAME=3D"vgetrandom"' '-D' 'KBUILD=
_MODNAME=3D"vgetrandom"' '-D' '__KBUILD_MODNAME=3Dvgetrandom' '-c' '-o' 'ar=
ch/arm64/kernel/vdso/vgetrandom.o' '-v' '-dumpdir' 'arch/arm64/kernel/vdso/=
vgetrandom.'


> Does the intermediate source or assembler source have any
> ".cfi_section .sframe" statement?
>=20
> $ make arch/arm64/kernel/vdso/vgetrandom.i

This fails to build with WERROR, because it seems to require the linker
step that fails, so I have to disable WERROR. Afterward:

$ grep -i sframe arch/arm64/kernel/vdso/vgetrandom.i
// (empty)

> $ make arch/arm64/kernel/vdso/vgetrandom.s

This fails to build.

$ make CROSS_COMPILE=3D'ccache aarch64-linux-gnu-' ARCH=3Darm64 -j80 arch/a=
rm64/kernel/vdso/vgetrandom.s
  CC      arch/arm64/kernel/vdso/vgetrandom.s
arch/arm64/kernel/vdso/vgetrandom.c:5:8: error: =E2=80=98__cvdso_getrandom=
=E2=80=99 undeclared here (not in a function)
    5 | typeof(__cvdso_getrandom) __kernel_getrandom;
      |        ^~~~~~~~~~~~~~~~~
arch/arm64/kernel/vdso/vgetrandom.c:7:1: error: unknown type name =E2=80=98=
ssize_t=E2=80=99
    7 | ssize_t __kernel_getrandom(void *buffer, size_t len, unsigned int f=
lags, void *opaque_state, size_t opaque_len)
      | ^~~~~~~
arch/arm64/kernel/vdso/vgetrandom.c:7:42: error: unknown type name =E2=80=
=98size_t=E2=80=99
    7 | ssize_t __kernel_getrandom(void *buffer, size_t len, unsigned int f=
lags, void *opaque_state, size_t opaque_len)
      |                                          ^~~~~~
arch/arm64/kernel/vdso/vgetrandom.c:4:1: note: =E2=80=98size_t=E2=80=99 is =
defined in header =E2=80=98<stddef.h>=E2=80=99; this is probably fixable by=
 adding =E2=80=98#include <stddef.h>=E2=80=99
    3 | #include <uapi/asm-generic/errno.h>
  +++ |+#include <stddef.h>
    4 |
arch/arm64/kernel/vdso/vgetrandom.c:7:94: error: unknown type name =E2=80=
=98size_t=E2=80=99
    7 | ssize_t __kernel_getrandom(void *buffer, size_t len, unsigned int f=
lags, void *opaque_state, size_t opaque_len)
      |                                                                    =
                          ^~~~~~
arch/arm64/kernel/vdso/vgetrandom.c:7:94: note: =E2=80=98size_t=E2=80=99 is=
 defined in header =E2=80=98<stddef.h>=E2=80=99; this is probably fixable b=
y adding =E2=80=98#include <stddef.h>=E2=80=99
make[4]: *** [scripts/Makefile.build:184: arch/arm64/kernel/vdso/vgetrandom=
=2Es] Error 1
make[3]: *** [scripts/Makefile.build:549: arch/arm64/kernel] Error 2
make[2]: *** [scripts/Makefile.build:549: arch/arm64] Error 2

> Can you please verify that your arch/arm64/kernel/vdso/vgetrandom.o
> actually contains an .sframe section:
>=20
> $ readelf -WS arch/arm64/kernel/vdso/vgetrandom.o

$ readelf -WS arch/arm64/kernel/vdso/vgetrandom.o | grep -i sframe
  [22] .sframe           GNU_SFRAME      0000000000000000 002438 000083 00 =
  A  0   0  8
  [23] .rela.sframe      RELA            0000000000000000 003988 000018 18 =
  I 24  22  8


Brian

