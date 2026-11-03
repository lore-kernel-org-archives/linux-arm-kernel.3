Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FFC606A331
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 15:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MWUXh3/9;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qRqtbM4g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TeMclKfCDNmL6wdCZNtIoHpg1BgrBEBrtRcEWNmtqAc=; b=MWUXh3/90wrcHw
	RaHi/JnAEvOFm1Coo2HEZuhqU1vV0FlOVmYLl1WPXSdgsHZy+cU+GgH3eAguNFvk0BdiReYttnAY9
	cTIUZE2xN7LmaP7dh7Nv4QBdna0HZsPXAu5DseVhrH3Gcd0FB4qHh678bjxbCySMNZ/DsbkpAUCAN
	/WcakzBmQjmRMfzUBKmyNwjVeQAxCNlF5cjZz0PZ0jqScXp9LD7e6wmLQK25r/uqik6j1AOr23dSC
	9tQESUxwHvTPae5xB2qxIUZi++3qPmm62z7aFTtCB23Fpx2r17GK34v7WlJUr/Wf2x1gcxTxkdnOZ
	MbKO0UJtBvgJpZRsOqvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGji-000000030tI-2TI5;
	Tue, 03 Nov 2026 15:47:46 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGjf-000000030sc-03Jt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 15:47:44 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-1a3c08d6928so5497397c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 07:47:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793720862; cv=none;
        d=google.com; s=arc-20260327;
        b=MWewMDqooVR0SN/SypVeSWozSXNZAr1MKP1Ylm4lFWIruj/aXzC8OeIBgsbnUe7efF
         7Y/RzEOLVtEh0Qi5zDo35C9Y1NzARdw2IS6fytd3cspmJw9XUV8/W+mr218mhSd869vR
         jcicqfbh4+85vXna2AWPRPsuzVltC0miQk9lwNn4M7WrCP+9ATp0IR1yOuR0AYgmv472
         LI4Vjf0pp3DuXWLBPLLWQk4b7DJX1VOwPvHuOB/vbaab32CYXFu5z1ffjs1I0AHJVYhg
         sOKFRYYfU1zbaNKOheoKSSyJg6Pcpd1nz2Jh7R74LqexnA8xEMkKLcEslseMJRcqu1M9
         44Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TeMclKfCDNmL6wdCZNtIoHpg1BgrBEBrtRcEWNmtqAc=;
        fh=/lFjRChdJ1icTSsgJMmZ5tuvoSHSKN+m8eXpgQos77w=;
        b=fW9B6t+D2O+fq+efOP6IPz4TJe/t8KevTlAPDTvbvSrqzQY1HMRJOB6bkfp//Mqp5V
         5THWv0Oy/PGjKynWxS/ZOwz/7WoyF5Zqy06X+8KEDRZalIrgQBFj9SP85bgpNPWVf7kq
         HPOPKqMZsn6uQr+MjNzU7lGKEo7oIS116wZzeyLZp1KFHYF4h3TmDz0K/ph1ou5f8Xmy
         mNegcZscuhyU5e+BtQo4PXoXmjdaBLZamQqtn8j2EHGCKskJ1I3i9yjWbYhHm4aA22Nt
         Is+VG5kjmlEYcs8riyZaO0pVDWAUyGpIcucOZDDiy3eTEWVnAcSb1BFAVkpITy58+ycG
         hQkw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793720862; x=1794325662; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TeMclKfCDNmL6wdCZNtIoHpg1BgrBEBrtRcEWNmtqAc=;
        b=qRqtbM4gBImbkosxy+pGoPuUNrFeCzRTK/7BzVd2XMBY0J1WQpe/9JGUj/zJ7qSVMw
         tlmC76cTvYd+oTgsNNxiK+PNCZn/d6nh37phJMWPn3ovDsnDkqeVck7GRkZWkfNUahUK
         IieiRUhO5lWDrj6OcZ5xKT3DSG4wVcHTlENKhGYgNoSSBD2gzHKJ2Yryj8wvB8Krsalg
         4955b6FZ2LrV/jJ5JoIyz+Bx6ldS6DFw4Isa6RQo0hneaMvRrtYcE/8dOh+kqMBWoMnL
         nOAaV7fxzllE/rJXpqbsnBFuluHep3rP/ULFslTUT8IEqWr0qlbeC8K5iMpFhxT8rMm2
         hoCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793720862; x=1794325662;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TeMclKfCDNmL6wdCZNtIoHpg1BgrBEBrtRcEWNmtqAc=;
        b=idgeFFLbyKAVlAQhq6sBevc+s4Lfrr5ANjxb2ubcoR4QhQsozWv/1LunKfYHTRoGFl
         7HWZO3d3cdMTrlGcWSv+9O+BUcorIbCRkxQpr7kFbw3EoIIHRshIhvRjITI0KN4veYPd
         sSWRBMPchBxuOgVyu8+YRnRSvImwMbvIBmZEkbuFkyEOPBPrhMww/0bYMoLGsXrrGkMN
         JJ+Z39i1MAT+82k8zhJDv881maXWq68vmTv5KZaDKwa3yV0niUDy7o21+U0wYP8j3ucd
         i75a+5k1EPkfuKMmCU6Co8sgzXbxPY7/GGVfOa87FVgqQTwVi1n+Y3tK78f+vzfASbZF
         Nzaw==
X-Forwarded-Encrypted: i=1; AKwUvBxtaqze/WP8/2mcVd0qquDA6t1DIUt+ldWC0A/23+gDRnsYlOV3/BjT8q2LCGW0KdU5N78foqJaq1na54S1Lxf0@lists.infradead.org
X-Gm-Message-State: APuU4Z8Qo3PcfuYXxomC/eJQ7WkcfTk/sReKKkiwkXVZlCXQOZtg0j/e
	ZtYsx65HoyDZtZlgXrQDkXMkGdIrVU2KlApLsia4edxThv1n7Mkpz8Ic01qF0VzLTkAK7SLkUoB
	ubM42vHfqsiMK6vsjktkZxRK7fCcaiWo=
X-Gm-Gg: AYBFou0I4tQJQhDdRRdr81YjRyWVe/woUqIgGeh52U0t9UkbUL5CHKbxjZSmd2AUiqI
	18wC2ZRfGvVRzsUHEsJGwEXttRbG+BxVL74L8Z97qw/WRx+HFKb93kIsNzPdg1HK5phmAGfz09E
	B7TgDyHRETcf3xHEWutAQTobc58ojH2enXksxVAL4e1wINAPQCO/+yL+WvURsUUgKLOI5HTbhpe
	bCr+m0uqqypSAoYUEBA8PJLVB5xgT9q8mE3yj5Ot93TozDvWx39dt41nuUFonYJ7f4j/KC4KQZT
	BQGRzEChw8OfV/lWvSCvWmF7XdbvpHDaxMIHPEK7Qgh0CdA7ANFf0zRhXdtYODoyUMAhkJPrCjL
	cc/Un6SBmYsmnW58YkD8KiwETw7Y377Nf2iIRg5+CRL0vrfHX1EMaNtSZ0iYBw6R9YKM8
X-Received: by 2002:a05:7022:3f0d:b0:18a:8164:ce4 with SMTP id
 a92af1059eb24-1ac4fb0c60amr20787898c88.0.1793720861540; Tue, 03 Nov 2026
 07:47:41 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260927131838.6774-1-demyansh@gmail.com> <20260927184414.6c0c8867@pumpkin>
 <CAOLeWCt+yFs29yWg6DrRH42HD9ConLgTEbW=wMKtEoTW5ROHvw@mail.gmail.com>
 <CAHfVqdX4AmqXs_oD5OCjU8R5ts=98=RmgCmJ3D5gLyk=Xtrfkw@mail.gmail.com>
 <CAOLeWCu4NiedyXmoLwwnTvJitRwgg6PQq9LApO=k36ktN3-XWA@mail.gmail.com> <20261102161426.2403d308@pumpkin>
In-Reply-To: <20261102161426.2403d308@pumpkin>
From: Demian Shulhan <demyansh@gmail.com>
Date: Tue, 3 Nov 2026 16:47:29 +0100
X-Gm-Features: AclHuK_ib7dEyaiKe1UK4pPwMx_v8L7eBFgO0-a0RmurEZQOzqGEC7L3Ybfd7oc
Message-ID: <CAOLeWCviRtGMhGJQx3HHFQOze439576PQqr4tmvjGkMMfYfcog@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: csum: Add fused copy and Internet checksum
To: David Laight <david.laight.linux@gmail.com>
Cc: saeed bishara <saeed.bishara.os@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Eric Biggers <ebiggers@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Marco Elver <elver@google.com>, Ard Biesheuvel <ardb@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	David Gow <davidgow@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com, 
	netdev@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_074743_059980_4E4743E1 
X-CRM114-Status: GOOD (  25.96  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> .L4:
>         ldr     x1, [x0, x4]
>         adds    x2, x2, x1
>         cinc    x3, x3, cs      # adc $0,%rxx on x86
>         adds    x4, x4, 8
>         bne     .L4
Agreed, that is a nice loop for the sum-only case, one dependent op on
the sum chain and no builtin needed.
For the copy case I tried the same form on x86 (Zen 3, GCC 15, Clang
19-22, -O2) with a store added, against csum-copy_64.S, as posted it ran
at 0.85x of the asm with GCC and 0.73-0.76x with Clang (which rewrites
it into setb/adc), and ~0.8x unrolled 2x/4x - a bit slower than the
posted 4-accumulator loop (0.88-0.95x).

=D0=BF=D0=BD, 2 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 17:14=
 David Laight <david.laight.linux@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:


>
> On Mon, 2 Nov 2026 16:14:06 +0100
> Demian Shulhan <demyansh@gmail.com> wrote:
>
> > > The scalar path seems like generic C code and not restricted to arm64=
,
> > > curious how that performs against existing (e.g. x86) assembly
> > > optimized implementation.
> > Depends. I think __builtin_addcll() is needed to get roughly the same
> > performance as the asm version. In my tests GCC on arm64 turns it
> > into adds + cset instead of adcs like on x86.
> > But I will look at it, thanks!
>
> The C version I posted earlier has the loop:
>     buf +=3D count;
>     count =3D -count;
>     sum =3D carry =3D 0;
>     do {
>         val =3D *(u64 *)(buf + count);
>         sum +=3D val;
>         carry +=3D sum < val;
>     } while ((count +=3D 8));
>
> for aarch64 you get:
> .L4:
>         ldr     x1, [x0, x4]
>         adds    x2, x2, x1
>         cinc    x3, x3, cs      # adc $0,%rxx on x86
>         adds    x4, x4, 8
>         bne     .L4
>
> I suspect that is close to optimal - especially for fast cpu with
> out of order execution.
>
> https://godbolt.org/z/eso79K7Wq
>
> David
>
> >
> > =D0=BF=D0=BD, 2 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 1=
2:44 saeed bishara <saeed.bishara.os@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Sun, Nov 1, 2026 at 3:34=E2=80=AFPM Demian Shulhan <demyansh@gmail=
.com> wrote:
> > > >
> > > > I would prefer to keep only the scalar version of the fused copy+cs=
um.
> > > > It reads the data once instead of twice, and on real Armv9 hardware=
 it
> > > > cuts end-to-end cycles/byte for bulk TCP over WireGuard by 3-12%
> > > > depending on the core (+6-8% throughput). It uses only general-purp=
ose
> > > > registers, so there is no FPSIMD state to save and it is safe in an=
y
> > > > context.
> > > >
> > > > If you are OK with the scalar path, I can send v2 with NEON dropped=
,
> > > > the scalar path only, and the KUnit fix for the x86 zero-length cas=
e
> > > > Jakub reported.
> > > >
> > > The scalar path seems like generic C code and not restricted to arm64=
,
> > > curious how that performs against existing (e.g. x86) assembly
> > > optimized implementation.
> > > saeed
>

