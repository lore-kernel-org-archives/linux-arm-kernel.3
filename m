Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A7C9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 00:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/KLAlmdqk7zVgY56HlRPXq3QqECg7aFAIKoSOWepQBw=; b=LccTjyWY4hTMJJNzVXi6Xiv1Jp
	K/54d1nYH4QJZxhB5inBClaI4iUy1ZAz9HMKwWJ1bNxAwoxrn2xaA0hs3r/62qFeAf0ZBJkNaDVjx
	mZkZ1q5Fh0CNh/6pARIzw1Qdj+42L0JjGwj3JogKjTXS4KO16EC2TsIoN14Py2XPA/pUNL3ltr/gg
	z3AkKOzGPN+VP87EdFlcUP5/vaZ3LZKTXo0SoxNGDe8ioBc6UILPOJkuTBt+Zm+KcTexTkZ91Gt78
	xhCbxyb71tuF4hleMZAb30lKAFxKeMYTF5JY+RXaGRQWiUA1cYaRVHAZIX3ThZ2K2r33k1kj4c3ut
	25QUl7vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjR0y-0000000AbNk-3ja5;
	Tue, 14 Jul 2026 00:28:48 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjR0w-0000000AbNO-0Lrd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 00:28:47 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-848882fdb18so147385b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 17:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783988925; x=1784593725; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/KLAlmdqk7zVgY56HlRPXq3QqECg7aFAIKoSOWepQBw=;
        b=kF2M8VrQQ9vAdbiyPywrSM2S1BN4YIVv4H1mAUqTbstb5i1pDSJndZJz8zAeUauGhS
         dJ8NL1Y9nAAfIbYBX3vWaEPrS4SNKTecR5ywXwPVkbi9uyOOt6MVAIY0E/4LvIk5TgIG
         KatDIitay2CCugQszSjCYrjCKyxPhQ1tGA32Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783988925; x=1784593725;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/KLAlmdqk7zVgY56HlRPXq3QqECg7aFAIKoSOWepQBw=;
        b=BgExNxiAZrGF9EYPFAfcoWQO6DEARtLnuEiA3m3RjHYuC5k1vrJH09T7+0mN5SLECl
         r52GX+ia40YG6DrfQgrin0DXCeExK/0D5du/hRorbWXXBVzKzkZaVMsxIlEV9zm+7kfl
         ykHTRnGlBhuBtdenVimDNToXCu2AuFISrv3JlqhVK+AgBds9xHF2FeE2g6TWjg65y/wz
         fGIwEzZmTmQaQ99ZJh/Y96TZdwAJZcFLEeYfhNg/o8dUgxAtdUvIQk0WaTGdkv5F99sw
         77Y7P8MJufHKXw5uCOPf4RxzDElhWeuClAvXvtf62K6Nz3a5Tb9Bh+R0a8CqHUCi8BOW
         DiHg==
X-Forwarded-Encrypted: i=1; AHgh+RqslKH0IwQxedX1F1rwXOWiEMq+uVWlSYNR1kQTtVKzgHfIZEWs/XCU8Oy0VVBivdcRxaMryNVZaE4DXFumJFbn@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4NKOBUZ6zOvxSJkRwSv8bQ4iGlmJApgLVoRQEHnW6/f1ZpwJY
	bJGwKisVFvAhjLSAQP9Q9i0BbYZd0o/kROLKEkjU16wA9mzfGNaD88omjPkdA+3sjA==
X-Gm-Gg: AfdE7ckSwJvEnm9iVTiywCzlZJ0741PxK0SSEPfvpxXMm1/xSmbfGHG+sEJSqwRA52X
	UYQwTC2rnH/wGsPciuWLjz4FA2ZNZ6wRwliKsTO8Uk/g7eRA6qj/FRNluh/pJO3zVOPDNnYAn2Y
	0rkBTqh10EoReW5LdtpNIuYdRXeMzMtNB92dCKRJ9ffBx3FRLWoJt/UOwhJwFVIbZvfsdse1rFw
	TxbHBmZGNdwAd60q0xB8HR1bX8odPxhy8lF1yEZB/vyR6tf+cDaT01LOaXd8iAYUBOXfLGnPSub
	IMdfKchiHL5/Q/EbqfwYxC0Mfp8C1wuQI68m82Z+jtK89tpYMLzVJ/lLYKVEGqTY2pBilVrs7c+
	Z1NHJMBPT1HECDfe0SEsBWpUyKDyKMm9qJB2iFZYhKaPLCMch3+Cmuurivf+k3Fd2YyFxFCwTsJ
	Sy3BTGZqIKSJ/UWDHIlsR6syypVk4ER7UAw/oKvGBKzgu7HgfNsEk=
X-Received: by 2002:a05:6a21:d82:b0:3bf:6c08:fb98 with SMTP id adf61e73a8af0-3c110a1b5d2mr12532962637.58.1783988924631;
        Mon, 13 Jul 2026 17:28:44 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:5106:b6e9:abed:6332])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-13b659c865asm80749507c88.11.2026.07.13.17.28.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 17:28:43 -0700 (PDT)
Date: Mon, 13 Jul 2026 17:28:40 -0700
From: Brian Norris <briannorris@chromium.org>
To: Jens Remus <jremus@linux.ibm.com>
Cc: Dylan Hatch <dylanbhatch@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Weinan Liu <wnliu@google.com>, Will Deacon <will@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Indu Bhagat <ibhagatgnu@gmail.com>,
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
Message-ID: <alWCuAA7r1otvROg@google.com>
References: <20260428183643.3796063-1-dylanbhatch@google.com>
 <agcEMEl-QR0g6DgF@google.com>
 <CADBMgpx38SUUuYYCm612STqh01jqv817WnJeeXYTD7Uc1r-fug@mail.gmail.com>
 <4f429a50-df5d-411f-b40e-048d3cad5133@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4f429a50-df5d-411f-b40e-048d3cad5133@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_172846_173988_0128F312 
X-CRM114-Status: GOOD (  27.51  )
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

On Tue, May 19, 2026 at 01:05:23PM +0200, Jens Remus wrote:
> Hi Dylan and Mostafa!

I also work at the same company as Dylan and Mostafa, and am therefore
probably using the same company-maintained Linux distribution.

> On 5/18/2026 7:55 PM, Dylan Hatch wrote:
> > On Fri, May 15, 2026 at 4:32=E2=80=AFAM Mostafa Saleh <smostafa@google.=
com> wrote:
> >> Not sure if related, but after updating my toolchain
> >> (aarch64-linux-gnu-gcc (Debian 15.2.0-4) 15.2.0), I hit link errors:
> >> ld.lld: error: arch/arm64/kernel/vdso/vgettimeofday.o:(.sframe) is bei=
ng placed in '.sframe'
> >> ld.lld: error: arch/arm64/kernel/vdso/vgetrandom.o:(.sframe) is being =
placed in '.sframe`

I've also been hitting this for some time, and I'd like to see if I can
figure out what's going wrong. My current workaround is:

--- a/Makefile
+++ b/Makefile
@@ -946,6 +946,8 @@ ifdef CONFIG_CC_IS_GCC
 KBUILD_CFLAGS	+=3D $(call cc-option,--param=3Dallow-store-data-races=3D0)
 KBUILD_CFLAGS	+=3D $(call cc-option,-fno-allow-store-data-races)
 endif
+# No sframe generation for kernel if enabled by default
+KBUILD_CFLAGS	+=3D $(call cc-option,-Xassembler --gsframe=3Dno)
=20
 ifdef CONFIG_READABLE_ASM
 # Disable optimizations that make assembler listings hard to read.

> > Previously when developing against the SFrame V2 format, I had fixed
> > these warnings with the VDSO Makefile change currently in this series:
> >=20
> > diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/M=
akefile
> > index 7dec05dd33b7..c60ef921956f 100644
> > --- a/arch/arm64/kernel/vdso/Makefile
> > +++ b/arch/arm64/kernel/vdso/Makefile
> > @@ -38,7 +38,7 @@ ccflags-y +=3D -DDISABLE_BRANCH_PROFILING -DBUILD_VDSO
> >  CC_FLAGS_REMOVE_VDSO :=3D $(CC_FLAGS_FTRACE) -Os $(CC_FLAGS_SCS) \
> >                         $(RANDSTRUCT_CFLAGS) $(KSTACK_ERASE_CFLAGS) \
> >                         $(GCC_PLUGINS_CFLAGS) \
> > -                       $(CC_FLAGS_LTO) $(CC_FLAGS_CFI) \
> > +                       $(CC_FLAGS_LTO) $(CC_FLAGS_CFI) $(CC_FLAGS_SFRA=
ME) \
> >                         -Wmissing-prototypes -Wmissing-declarations
> >=20
> >  CC_FLAGS_ADD_VDSO :=3D -O2 -mcmodel=3Dtiny -fasynchronous-unwind-tables
> >=20
> > But the warnings seem to have returned after upgrading my toolchain,
> > possibly due to SFrame V3 or some confounding change in GCC. The
> > --gsframe in the assembler should be set to 'no' by default, so
> > perhaps GCC is providing an override --gsframe internally?
>=20
> Could it be that your build of binutils was configured with
> --enable-default-sframe, so that the GNU assembler defaults to generate
> .sframe?  AFAIK this configure option was meant for distributors and
> package maintainers.
>=20
> You can check as follows whether --gsframe defaults to "no" or "yes":
>=20
> $ as --help | grep -A1 gsframe
>   --gsframe[=3D{no|yes}]    whether to generate SFrame stack trace inform=
ation
>                           (default: no)
> ...

$ aarch64-linux-gnu-as --help | grep -A1 gsframe
  --gsframe[=3D{no|yes}]    whether to generate SFrame stack trace informat=
ion
                          (default: no)
--
  --gsframe-<N>           generate SFrame version <N> information. 3 =3D=3D=
 <N>
  --scfi=3Dexperimental     Synthesize DWARF CFI for hand-written asm

> Maybe build the VDSO separately with V=3D1 to see what assembler/compiler
> options are effectively used (e.g. for vgettimeofday.o and vgetrandom.o
> mentioned in the linker error message above)?

A slightly tweaked version of my vgetrandom.o build line:

# CC      arch/arm64/kernel/vdso/vgetrandom.o
  aarch64-linux-gnu-gcc -Wp,-MMD,arch/arm64/kernel/vdso/.vgetrandom.o.d -no=
stdinc -I./arch/arm64/include -I./arch/arm64/include/generated -I./include =
-I./include -I./arch/arm64/include/uapi -I./arch/arm64/include/generated/ua=
pi -I./include/uapi -I./include/generated/uapi -include ./include/linux/com=
piler-version.h -include ./include/linux/kconfig.h -include ./include/linux=
/compiler_types.h -D__KERNEL__ -mlittle-endian -DCC_USING_PATCHABLE_FUNCTIO=
N_ENTRY -DKASAN_SHADOW_SCALE_SHIFT=3D -Werror -fshort-wchar -funsigned-char=
 -fno-common -fno-PIE -fno-strict-aliasing -std=3Dgnu11 -fms-extensions -mg=
eneral-regs-only -DCONFIG_CC_HAS_K_CONSTRAINT=3D1 -Wno-psabi -mabi=3Dlp64 -=
fno-asynchronous-unwind-tables -fno-unwind-tables -mbranch-protection=3Dpac=
-ret -Wa,-march=3Darmv8.5-a -DARM64_ASM_ARCH=3D'"armv8.5-a"' -DKASAN_SHADOW=
_SCALE_SHIFT=3D -fno-delete-null-pointer-checks -O2 -fno-allow-store-data-r=
aces -fstack-protector-strong -fno-omit-frame-pointer -fno-optimize-sibling=
-calls -ftrivial-auto-var-init=3Dzero -fzero-init-padding-bits=3Dall -fno-s=
tack-clash-protection -fno-inline-functions-called-once -fmin-function-alig=
nment=3D8 -fstrict-flex-arrays=3D3 -fno-strict-overflow -fno-stack-check -f=
conserve-stack -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=3Dimplicit=
-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=
=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-address=
 -Wno-address-of-packed-member -Wframe-larger-than=3D2048 -Wno-main -Wno-ty=
pe-limits -Wno-dangling-pointer -Wvla-larger-than=3D1 -Wno-pointer-sign -Wc=
ast-function-type -Wno-unterminated-string-initialization -Wno-array-bounds=
 -Wno-stringop-overflow -Wno-alloc-size-larger-than -Wimplicit-fallthrough=
=3D5 -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Werror=3Ddes=
ignated-init -Wenum-conversion -Wunused -Wno-unused-but-set-variable -Wno-u=
nused-const-variable -Wno-packed-not-aligned -Wno-format-overflow -Wno-form=
at-truncation -Wno-stringop-truncation -Wno-override-init -Wno-missing-fiel=
d-initializers -Wno-shift-negative-value -Wno-maybe-uninitialized -Wno-sign=
-compare -Wno-unused-parameter -g -mstack-protector-guard=3Dsysreg -mstack-=
protector-guard-reg=3Dsp_el0 -mstack-protector-guard-offset=3D1344 -fno-com=
mon -fno-builtin -fno-stack-protector -ffixed-x18 -DDISABLE_BRANCH_PROFILIN=
G -DBUILD_VDSO -O2 -mcmodel=3Dtiny -fasynchronous-unwind-tables -include ./=
lib/vdso/getrandom.c   -I./arch/arm64/kernel/vdso -Iarch/arm64/kernel/vdso =
   -DKBUILD_MODFILE=3D'"arch/arm64/kernel/vdso/vgetrandom"' -DKBUILD_BASENA=
ME=3D'"vgetrandom"' -DKBUILD_MODNAME=3D'"vgetrandom"' -D__KBUILD_MODNAME=3D=
vgetrandom -c -o arch/arm64/kernel/vdso/vgetrandom.o ./arch/arm64/kernel/vd=
so/vgetrandom.c

I mostly don't know what I'm looking for w.r.t. gsframe features, but
I'm willing to poke at my compiler/assembler/build-process.

Brian

