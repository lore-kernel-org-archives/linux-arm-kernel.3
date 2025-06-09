Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA8EC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 22:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/hq0btBK5TQK/jQfASAZ7ArH/Py2u4qhWqQQYIBxtEI=; b=MxNsJzuQpaft6iaXux3e2QEUNl
	9hgxnz2jNwKXyRTy3gFHpfaL6iNQz8H4IvV4cL9arY582TRV36I+XaD1tFf1ozUGYstQtsRrCLntJ
	Vjl8wNA6P/8CsaNwsxi4T0JdHlySwSpFmVnbV84bzWMzIQivXpgBdjObs43yRmAjUdMp/RA0GyszG
	EiztyKMUsl8mft9XFqSNdFSgd2c4w6Gfq2guw/DyLNboQ4e6PnmZBfxxvb8C/qCriYkp855NBE5TZ
	wqZ8RXTqo0o8Zfza/r/KEfQGoX9awGzE5ETbsmrnsKRMEILLGGfTPR95ZoTzTB1I2tCQO1LT/CcZb
	GPAiV8KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOl8z-00000005MSZ-312u;
	Mon, 09 Jun 2025 22:39:05 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOl6q-00000005MBp-2ZZ8;
	Mon, 09 Jun 2025 22:36:53 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4a6f3f88613so22625721cf.1;
        Mon, 09 Jun 2025 15:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749508610; x=1750113410; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/hq0btBK5TQK/jQfASAZ7ArH/Py2u4qhWqQQYIBxtEI=;
        b=mtVsdTebZPmNqTwtlpTrlOlEsfwNDJIBqj47NeCFEAMiBmVXBDoosm+ATj8FH8n2Rc
         lBctxrN29zOdRJQpQhFOVjPH/8pc2wtsFoMyT6VbCYXU0v61dv3OGoRR6Xsn2aWMx+nX
         xbi3Dir0Uxqstqnozp6OgVR1odW8+xw4g+DefY73vfPIlpjVYEm8l0GH6C0YDmzrsYjy
         e9uS2TEOCCy2QwbJRWRzTxTcpVogb4nr71oks6qWsS7XTkbtXk6VE8AFAarHvwiXGoNs
         PHT6jsOvrLSEH13jVdB9y5FuDQzhRir5nKFDGwoWmBjJeJxViiDAlXsp6kzFLEBeeWur
         sKpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749508610; x=1750113410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/hq0btBK5TQK/jQfASAZ7ArH/Py2u4qhWqQQYIBxtEI=;
        b=f3aSoUhz0GaIHb1w7bLWdWGbb2w9lOUn7o0NLnkXsLcVoN5IhrjWmN8DQ7H78YOzjE
         oc00pkblNoYvR6YQiZToR9nTfprtc5sawoZwLw2ryFlqEBrVleRWprxYTUxMyQI5IUWD
         uUgyZNougzp7bcO/ssTSSeF3znN6rx7isDHzs3u9EP1TnMNT2tRXtSU/MVE088OgogL6
         7n47bkihY4ACDHlPdUlnQx+VQeFymdgbviwFtyCldoFCi/3mn7JCPnQwMEeaq7Y9uvTk
         Yta9lTWbIc5bhI9g0eRHW4V43PoK6PQ6h6yya4nWAkqxJmHSyMHHyXhOCTedhhcoQwm9
         ymBw==
X-Forwarded-Encrypted: i=1; AJvYcCUcgKRj2UBu9YQR2sSzxsi6t6cIivSvji4FnY4V0eT6v9I4W2VPqtRlQ4GZLOrgdicowBmJh1ZsHEkza+U=@lists.infradead.org, AJvYcCWR86gP28MyyfXgGogEo3vcf5X5/cm3b0kGMc809t02UNTHOYRqlQOjfvs2ptyo1W2I8oNx5Pmg/8BQ1umuBeWf@lists.infradead.org
X-Gm-Message-State: AOJu0YxoF2MDA2mmKp5AxGL1TLub3B5nHZgLdppqw73LxWKwfHkNlmqi
	QYZSVLxoaUB07bXhyZLrxEPgR7ryvlSEJWwfAIF9zAlo+C2jJq6JE8vk452PJHjseLZf6uPWDTG
	14Lz7On3SgPb2DY7nS+Zx11jPN1L/YRE=
X-Gm-Gg: ASbGncvTAFNDcyBXjiOnRiUZJS8F2lq4ZhIWo/pshzQRB8mLWImNJ0ioG8v0XQ5/aiC
	D8M7qNuuaii/h/vXYVFRcZB0X6mw2lHIQUlo5ZDdIGvo92mYzuHutDpyes5ZPWHrVYzcXrICvhS
	3PPc+HbX4mc8C/L6BO3n+a2duUj31PQqz+UtIkFdvwlgQ=
X-Google-Smtp-Source: AGHT+IEs8tHro3Bqg7q8bk+joLEpnvyUJ+PSWmsKZZ858+7uklxqykPVE6FCaw1PpU8qCZAfdipBs10XMfJUvah5VmA=
X-Received: by 2002:a05:6214:f2a:b0:6fa:f94e:6e75 with SMTP id
 6a1803df08f44-6fb08f5f7c4mr277251346d6.25.1749508610272; Mon, 09 Jun 2025
 15:36:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250607200454.73587-1-ebiggers@kernel.org> <CAGRGNgV_4X3O-qo3XFGexi9_JqJXK9Mf82=p8CQ4BoD3o-Hypw@mail.gmail.com>
 <20250609194845.GC1255@sol>
In-Reply-To: <20250609194845.GC1255@sol>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Tue, 10 Jun 2025 08:36:39 +1000
X-Gm-Features: AX0GCFuUtzPWjE_fUMffnG3t-eGyXruP1OclUqP-Gat86eROO8R2ly8lc5p3jN0
Message-ID: <CAGRGNgXw5LcykjiRS3yteb0K8FmYtb9wp1CJPM+GCKAw7j4ktQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] lib/crc: improve how arch-optimized code is integrated
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org, linux-arch@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_153652_660955_2A8D5CED 
X-CRM114-Status: GOOD (  34.96  )
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

Hi Eric,

On Tue, Jun 10, 2025 at 5:49=E2=80=AFAM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> On Mon, Jun 09, 2025 at 06:15:24PM +1000, Julian Calaby wrote:
> > Hi Eric,
> >
> > On Sun, Jun 8, 2025 at 6:07=E2=80=AFAM Eric Biggers <ebiggers@kernel.or=
g> wrote:
> > >
> > > This series is also available at:
> > >
> > >     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebigger=
s/linux.git lib-crc-arch-v2
> > >
> > > This series improves how lib/crc supports arch-optimized code.  First=
,
> > > instead of the arch-optimized CRC code being in arch/$(SRCARCH)/lib/,=
 it
> > > will now be in lib/crc/$(SRCARCH)/.  Second, the API functions (e.g.
> > > crc32c()), arch-optimized functions (e.g. crc32c_arch()), and generic
> > > functions (e.g. crc32c_base()) will now be part of a single module fo=
r
> > > each CRC type, allowing better inlining and dead code elimination.  T=
he
> > > second change is made possible by the first.
> > >
> > > As an example, consider CONFIG_CRC32=3Dm on x86.  We'll now have just
> > > crc32.ko instead of both crc32-x86.ko and crc32.ko.  The two modules
> > > were already coupled together and always both got loaded together via
> > > direct symbol dependency, so the separation provided no benefit.
> > >
> > > Note: later I'd like to apply the same design to lib/crypto/ too, whe=
re
> > > often the API functions are out-of-line so this will work even better=
.
> > > In those cases, for each algorithm we currently have 3 modules all
> > > coupled together, e.g. libsha256.ko, libsha256-generic.ko, and
> > > sha256-x86.ko.  We should have just one, inline things properly, and
> > > rely on the compiler's dead code elimination to decide the inclusion =
of
> > > the generic code instead of manually setting it via kconfig.
> > >
> > > Having arch-specific code outside arch/ was somewhat controversial wh=
en
> > > Zinc proposed it back in 2018.  But I don't think the concerns are
> > > warranted.  It's better from a technical perspective, as it enables t=
he
> > > improvements mentioned above.  This model is already successfully use=
d
> > > in other places in the kernel such as lib/raid6/.  The community of e=
ach
> > > architecture still remains free to work on the code, even if it's not=
 in
> > > arch/.  At the time there was also a desire to put the library code i=
n
> > > the same files as the old-school crypto API, but that was a mistake; =
now
> > > that the library is separate, that's no longer a constraint either.
> >
> > Quick question, and apologies if this has been covered elsewhere.
> >
> > Why not just use choice blocks in Kconfig to choose the compiled-in
> > crc32 variant instead of this somewhat indirect scheme?
> >
> > This would keep the dependencies grouped by arch and provide a single p=
lace to
> > choose whether the generic or arch-specific method is used.
>
> It's not clear exactly what you're suggesting, but it sounds like you're
> complaining about this:
>
>     config CRC32_ARCH
>             bool
>             depends on CRC32 && CRC_OPTIMIZATIONS
>             default y if ARM && KERNEL_MODE_NEON
>             default y if ARM64
>             default y if LOONGARCH
>             default y if MIPS && CPU_MIPSR6
>             default y if PPC64 && ALTIVEC
>             default y if RISCV && RISCV_ISA_ZBC
>             default y if S390
>             default y if SPARC64
>             default y if X86

I was suggesting something roughly like:

choice
    prompt "CRC32 Variant"
    depends on CRC32 && CRC_OPTIMIZATIONS

config CRC32_ARCH_ARM_NEON
    bool "ARM NEON"
    default y
    depends ARM && KERNEL_MODE_NEON

...

config CRC32_GENERIC
    bool "Generic"

endchoice

> This patchset strikes a balance where the vast majority of the arch-speci=
fic CRC
> code is isolated in lib/crc/$(SRCARCH), and the exceptions are just
> lib/crc/Makefile and lib/crc/Kconfig.  I think these exceptions make sens=
e,
> given that we're building a single module per CRC variant.  We'd have to =
go
> through some hoops to isolate the arch-specific Kconfig and Makefile snip=
pets
> into per-arch files, which don't seem worth it here IMO.

I was only really concerned with the Kconfig structure, I was
expecting Kbuild to look roughly like this: (filenames are wrong)

crc32-y +=3D crc32-base.o
crc32-$(CRC32_ARCH_ARM_NEON) +=3D arch/arm/crc32-neon.o
...
crc32-$(CRC32_GENERIC) +=3D crc32-generic.o

but yeah, your proposal here has grown on me now that I think about it
and the only real "benefit" mine has is that architectures can display
choices for variants that have Kconfig-visible requirements, which
probably isn't that many so it wouldn't be useful in practice.

Thanks for answering my question,

--=20
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/

