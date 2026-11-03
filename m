Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC69606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 22:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VBaPOEvz;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EqFKs/n1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7Y4hWEy3KCqBGcgLZyC88t/BtG1nVv31oLpGNCBZoVw=; b=VBaPOEvzGATYkM
	I/v6k8zhLR5YzxVtfo1n65n3gi94PVmaombFC8DFKjIGOPhs+CJ/GGnXfW/PDapC0xs5UQJVMBQt7
	S13OZskBgsgRuHgCnXMKVenZlHb5Fm1hn4+eVE+sB85XN2PdsSTcxuOkvtYJTxZvL4W1+qiqaTv2V
	SrRKK/L3xYFdzDXIyC3lJDFci3tH6uTjrUxa3y3QeZl6tYn9AH1NU65ng2tseOA0GGKbOh9EcG0Hh
	Zmyy8B2THHZISfmDqZAEoV8r9nOJDSFxbGXov4JErmQ064T63/pYYdCovVI7hskn209cTbM+byx+q
	BoGU1G6/H338LRSGJOxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xON9Z-00000003rzi-48au;
	Tue, 03 Nov 2026 22:38:54 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xON9X-00000003rz0-0IX5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 22:38:52 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so15198575e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 14:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793745529; x=1794350329; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7Y4hWEy3KCqBGcgLZyC88t/BtG1nVv31oLpGNCBZoVw=;
        b=EqFKs/n19/3/hdRzYZLHXlnPkRscy2WQn2KO/PJdX/y5ughnAHRUQkZDk6Y6MDaH6V
         bD4lqSB6X6DNONhLMawLKUi7w7JYDz0IHFCQ5ao/EzmgY9Zh6Ct7TcnSz19oSLdWdzvC
         ztmRIX1ys6nHeyYZLmnhqwDVIn+ZjrmTLa3XRTDx7G6qF17luyGfo2at+azayZTks0Hc
         RdDPivGokYDVFaJ3NOhiIgqjSB2qkRE69Xk7+QnPMzMVLnx/WiuSC8BkzXmfcmqcnINV
         6sN2bCfgiTAV6ZoKz/XNoKoXVbJ+xx653uS+UUJYBbx1JlCzXGQ7m65QxhUfT2hglics
         nqtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793745529; x=1794350329;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Y4hWEy3KCqBGcgLZyC88t/BtG1nVv31oLpGNCBZoVw=;
        b=qnSAwuHqxQkv3fvDEu9M1AhDeIOWR3JU+j2mAu79PuKXJgbhLnr2LwTDIMGZUwimFT
         L67S25olcN/tUc8GjPCiNcHrhLmQqVHLuZtVtq7eFcYb8BRfEqQm7MRBUd3fTFci/sxl
         +D4RbtH8702IL9qrvzIU/rjF7I/Tve7Qv7SJO4VqnvFK8Cje3tCBy1N9wBuVxRnVFIBj
         HIkYF35kYZixji7A5ZAOuomvvimNy+b7WOgDfM85r31tXzh1XRCLLhKkU38x7uPTJ1+s
         CPixEv7/xAPLsJLmsU5wE22+eZC13Vm6/onQ8if6rlHHWsHEgHd6StSd/GjPiNdoDaES
         /XaA==
X-Forwarded-Encrypted: i=1; AKwUvByOx9D67W4716Sbc8l6esQ0KCI1kxucADCr5adr7FA3P+CmGFr6WsEoZFkj6kR2HK7h94a/T1bRXYtvjWpEKf/f@lists.infradead.org
X-Gm-Message-State: APuU4Z9OK/1YLVpxOS+e8bLULNPs5CKDrLeoLCltrONhDT2uGi72gIQC
	xMGxKXsWDyU1ifOXm2sWguB29ZFG9JyC5mTarxu4Voqy/KDT3U9/8CT2
X-Gm-Gg: AYBFou3GHkClL1mgPwsvPf5K7yBJvmH0oF/K3zYUuml4w7vOnYJzYKUY6vCDrS7r5/S
	W8kxxe3hu/BmKTNg99UOKvCMkrrP5N4kaZ6I0A2GvjMnwaUprJraU9kYWsn+x4paIQ07YeY+6AV
	tFNPg/BliDUIRCr0fP7LMoM2gC2pCsuSQe/AnC+Ta0zJW0EDbhuy3e2ql8u0bQ4GUVZ0UUq2L9Z
	vFCwvGGGnTMwn+pZh6N6ARdHoYU17BoKENpEVd9tV1rfRUeMQJ+tFFCHWrygtHPtEmEr4eIOpgQ
	Es3Vz7DzFW236I9u8Jn5TR/UKAyUcborfh5E/RfGioAlTm/ffz3Rl1NGKySr4qrlUYDx6cpEms7
	KFSmcoijcPxrQgtLf19xggWEQ8kRmRTEEOGBY0lUXG4FdYbcr6b6iWeIAdJh9BXSTdWJ/HYr/WE
	xvax6QiyVMX7cTFG/i+90Mr1oQB6L88SbIQHe/mIp7q3C7zHJZ1e2PcHUfLpjJDAhPKxsUEFk6r
	crSAYjUkbUXHYdCscyO1ljW7DKseThuGxa5cVG/IJBagNtX2Z6d9PhZhWjMowMBcZw50uVCjrgb
	LF0rPZLtp7CvFK0as72ZIaArpybFwV7e9boDo7b5EzBBKVJ8qMFXkQm9LrajuKjBSi7CBvLAj2S
	+tuhjK8/AwA==
X-Received: by 2002:a05:600c:6555:b0:4a1:d45a:3ae9 with SMTP id 5b1f17b1804b1-4aa8b05fa4bmr341420665e9.15.1793745528451;
        Tue, 03 Nov 2026 14:38:48 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea18104bsm467832f8f.6.2026.11.03.14.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:38:48 -0800 (PST)
Date: Tue, 3 Nov 2026 22:38:46 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Demian Shulhan <demyansh@gmail.com>
Cc: saeed bishara <saeed.bishara.os@gmail.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Eric Biggers <ebiggers@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Marco Elver <elver@google.com>, Ard Biesheuvel
 <ardb@kernel.org>, Robin Murphy <robin.murphy@arm.com>, David Gow
 <davidgow@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, Nathan
 Chancellor <nathan@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com,
 netdev@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 0/2] arm64: csum: Add fused copy and Internet checksum
Message-ID: <20261103223846.5e6a1dfc@pumpkin>
In-Reply-To: <CAOLeWCviRtGMhGJQx3HHFQOze439576PQqr4tmvjGkMMfYfcog@mail.gmail.com>
References: <20260927131838.6774-1-demyansh@gmail.com>
	<20260927184414.6c0c8867@pumpkin>
	<CAOLeWCt+yFs29yWg6DrRH42HD9ConLgTEbW=wMKtEoTW5ROHvw@mail.gmail.com>
	<CAHfVqdX4AmqXs_oD5OCjU8R5ts=98=RmgCmJ3D5gLyk=Xtrfkw@mail.gmail.com>
	<CAOLeWCu4NiedyXmoLwwnTvJitRwgg6PQq9LApO=k36ktN3-XWA@mail.gmail.com>
	<20261102161426.2403d308@pumpkin>
	<CAOLeWCviRtGMhGJQx3HHFQOze439576PQqr4tmvjGkMMfYfcog@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_143851_139090_843F5E9C 
X-CRM114-Status: GOOD (  34.76  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 3 Nov 2026 16:47:29 +0100
Demian Shulhan <demyansh@gmail.com> wrote:

> > .L4:
> >         ldr     x1, [x0, x4]
> >         adds    x2, x2, x1
> >         cinc    x3, x3, cs      # adc $0,%rxx on x86
> >         adds    x4, x4, 8
> >         bne     .L4 =20
> Agreed, that is a nice loop for the sum-only case, one dependent op on
> the sum chain and no builtin needed.
> For the copy case I tried the same form on x86 (Zen 3, GCC 15, Clang
> 19-22, -O2) with a store added, against csum-copy_64.S, as posted it ran
> at 0.85x of the asm with GCC and 0.73-0.76x with Clang (which rewrites
> it into setb/adc), and ~0.8x unrolled 2x/4x - a bit slower than the
> posted 4-accumulator loop (0.88-0.95x).

I just added *(u64 *)(dest + count) =3D val to one of my loops.
gcc just replaces the 'add from memory' with mov/mov/add.

I'm now confused though, I seem to be getting different output from earlier.
With -Os (which I didn't think I was passing) clang is refusing to do the
'offset from end of buffer' loop.
With -O2 it bloats everything by unrolling 4 times and adding lots of
extra instructions.
(AFAICT the optimiser has a completely incorrect cpu model.)

If the compiler doesn't generate the expected code it is all pointless.
The xor parity code loop had to be in the asm block to stop the compiler
changing it to a much slower form.

For the checksum code I have managed to work out how many bytes/clock
the code was generating and getting it to (reasonably) match the expected
values.
But you have to use relatively short buffers to avoid D-cache effects.

David

>=20
> =D0=BF=D0=BD, 2 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 17:=
14 David Laight <david.laight.linux@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>=20
>=20
> >
> > On Mon, 2 Nov 2026 16:14:06 +0100
> > Demian Shulhan <demyansh@gmail.com> wrote:
> > =20
> > > > The scalar path seems like generic C code and not restricted to arm=
64,
> > > > curious how that performs against existing (e.g. x86) assembly
> > > > optimized implementation. =20
> > > Depends. I think __builtin_addcll() is needed to get roughly the same
> > > performance as the asm version. In my tests GCC on arm64 turns it
> > > into adds + cset instead of adcs like on x86.
> > > But I will look at it, thanks! =20
> >
> > The C version I posted earlier has the loop:
> >     buf +=3D count;
> >     count =3D -count;
> >     sum =3D carry =3D 0;
> >     do {
> >         val =3D *(u64 *)(buf + count);
> >         sum +=3D val;
> >         carry +=3D sum < val;
> >     } while ((count +=3D 8));
> >
> > for aarch64 you get:
> > .L4:
> >         ldr     x1, [x0, x4]
> >         adds    x2, x2, x1
> >         cinc    x3, x3, cs      # adc $0,%rxx on x86
> >         adds    x4, x4, 8
> >         bne     .L4
> >
> > I suspect that is close to optimal - especially for fast cpu with
> > out of order execution.
> >
> > https://godbolt.org/z/eso79K7Wq
> >
> > David
> > =20
> > >
> > > =D0=BF=D0=BD, 2 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE=
 12:44 saeed bishara <saeed.bishara.os@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:=
 =20
> > > >
> > > > On Sun, Nov 1, 2026 at 3:34=E2=80=AFPM Demian Shulhan <demyansh@gma=
il.com> wrote: =20
> > > > >
> > > > > I would prefer to keep only the scalar version of the fused copy+=
csum.
> > > > > It reads the data once instead of twice, and on real Armv9 hardwa=
re it
> > > > > cuts end-to-end cycles/byte for bulk TCP over WireGuard by 3-12%
> > > > > depending on the core (+6-8% throughput). It uses only general-pu=
rpose
> > > > > registers, so there is no FPSIMD state to save and it is safe in =
any
> > > > > context.
> > > > >
> > > > > If you are OK with the scalar path, I can send v2 with NEON dropp=
ed,
> > > > > the scalar path only, and the KUnit fix for the x86 zero-length c=
ase
> > > > > Jakub reported.
> > > > > =20
> > > > The scalar path seems like generic C code and not restricted to arm=
64,
> > > > curious how that performs against existing (e.g. x86) assembly
> > > > optimized implementation.
> > > > saeed =20
> > =20


