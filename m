Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCD1606D803
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PphY9azW;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zWVfppBZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LZy2AlGoHMhT5kSino03X+cU+0j9SA9toGXagMkx2FA=; b=PphY9azWx8vVzE
	11bc6tQNd7MPifN26VlwglSnfeNcvo+elLaVVsGy8n9pBHtRLI0lR6GJENz5YqdWfmnZepI9UXRkK
	lmiGnEbNCz+9Y1ZaP9xg7QIjfd+9N4BruCX0hyin51XWEGZaBRwAwul260hu3XV0CZLNU0zekYn9A
	5r9z02ed87xTucHjBCgrWOXrwKyixjpYTlIyWLWoC3o2lWPUi2ZkDFQkHDn4xQrSFp3NSRJfzzvIB
	j8m8OCe9Y/7ANpk7vQJBESrN7FRT4/qJmmf+5kStxszP5QjfWHaXX70nViFyWLbJJYHr5O6XI2TOW
	dys0MlJGRpuj9TI+bkDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvr7-00000008hhb-0inb;
	Thu, 05 Nov 2026 11:42:09 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvr5-00000008hh8-0TBl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:42:08 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso4781152eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 03:42:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793878926; cv=none;
        d=google.com; s=arc-20260327;
        b=oGTzjsM24EmjcAl5zFBvxDipbJ9s1uzh677ShoCx4rpkQb9tNy/pddZrS/tiNSvFHH
         Wcpv6q7h+FInb2QllwmwDEaj9h0E24Lc5rAxRYOMIpOnLnlGXT/zWPplxjG0oAXzg4rQ
         BdeVoNT/lrlTtyBPQPmw57KWnprY7h4NalK6XSrLgadsIuCbWpKNYbekcyLbS8dnN6aC
         pBxm8WUoXMADGX6g00LaarDo4ViVn27SYBBQ8wmTMZVuiClU3N+I+kuNWGDgMTCV+nOn
         D4f7ldMWsHTJOq3gv9WREFqLgviSmBh93TkFFDcgf34fKbKX40p8ZkYvAEloTk1RH5lF
         DNug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LZy2AlGoHMhT5kSino03X+cU+0j9SA9toGXagMkx2FA=;
        fh=QvixuWH3twUuUwwt+S/8Djg5vBhx539LWxeR3Udi3y8=;
        b=np6jCqnT1VFh/aZsV/CnGHRF/C3Qc5Rhp7nrfMMD5JQfup+jCa45g4F0+YQ1QjvUq/
         m/cHhFj9apDLvtCvNemSD8TDMX2FKQ6d4MIw+P8Z3u7lpHgAguPqPyKpbxhSUSm/Gt3m
         TxFEKv4llPvXbXBE20KzmT3K0QKbn3K5QT7k5wRgD37nMCgJrBBydpv/DT9m2ll37hco
         su+TSCjlxMDrX2QKQ8JPLQjryKQS5H6cTuW2qbGXj/xaNyPZXL6GnMzz1kjqNPWoF+qk
         04YAT84+dC20vhFeG2tLWltJVQcMn3QGL6ZWioR2JqRQNz0eL3DVye6bsZ7BTUrQlt5J
         pnYg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793878926; x=1794483726; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LZy2AlGoHMhT5kSino03X+cU+0j9SA9toGXagMkx2FA=;
        b=zWVfppBZ2IA5D/lEFQRzYzBmo/8/haaXQkfQSkuRVKZrNjDxpmpa0UTGzHrfh7jiPD
         xLnPQzj9HC5oqksWy5UZZZfisjcGdzPBrTJ3erDFXUETf/O20D/0lEQIXc3ICKrU9/9q
         sdkPZlGeSnuyrfCMP7NZexakljJRRiPKI17D1yZtRV8i+3q0M1u8Tu9QyloPBOZNcSxV
         txaEGewXk9BLbvWPUNu1e7rsn6Po6EKjAkXEwMZzUT3rCWzTzcc8gFMCkYLeuLmTD/jZ
         uMO8AbTRAlkvpTkyqh4Be2p/QsKlRczEnchT+pqVNz9rZD6yhJEKTS+Ah6XDcdYRANLK
         89iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793878926; x=1794483726;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LZy2AlGoHMhT5kSino03X+cU+0j9SA9toGXagMkx2FA=;
        b=FF6HZL3ZuV6dx5bBuor9KD2cIwRLJ6P84e/v+mitt9hY7XNOAj81X7Mjitzz2Vd5kH
         uoSxKaXgREmR6sSR9wicPREpKTjP/Z1FBJYuhqt+JP4gMW6IPqTwi5AxJBm7/Tml3a6c
         nYHZeKGVxaR/GuPUGvFmXvywyNgRnvdB8jmQQJ6Egi2c+QsTPcD4fXMlT/FWf2wVZ7Pc
         SsV2nHpyNV4mOEU6GSP9rs49AZ7g3riD0qwXr9RDJg2bn33TT8aznCiNFpin8Z6Chfv1
         K8kBCnVx1E0gpJKlsEw4RPVsnPjXkbCEYZn6JxNdUkdvJ3YZB9haWgqsnAWXk85MSiW0
         ljjA==
X-Forwarded-Encrypted: i=1; AKwUvBznVCKxmoZE+QH2rbCndSw5AaGGrD4eeCUbpiH6KutL5gsWK47rh4TyvY1/co0xwYoXhIXcuk/bmg7H8+OkBVbc@lists.infradead.org
X-Gm-Message-State: APuU4Z8X+/DMuLSPEh8TbxaiJUXRPgCicatIh6J2WazH8QqZgZesx70o
	eE+8eV7PX4Itjb/OXrSiV0/H3KZULZiiEQY2A8Ng4Y9nvR2l9l0Q3SWECfi/zzmlfJldyLzGMGY
	ilxcjGHZEetzBdCIuSPA6Im40suBUTic=
X-Gm-Gg: AYBFou3dgqoON5VCgN97fJk6XzCC6I7SQ/xHR0Oq/v4wmC6skWu10LA3JB7Uxcz0AKF
	m0+X67CNTZSE5OqwgkSVn8EHMCuDZJIaebOimp54QKJP0XTViAeZXzZ22vL394TB5s3ZqP829Mx
	IGnRRNFK0BoG/6vr0LWYlygWZe+RU7T8F5Q6m431/QzuqFmfKfjWThv3IrM/RUzN4Mb54jS3Ect
	Ii8Gh7vlNf2mE+PnXuxsTSGs3ylodBmj7XAtU2PWuGxoqBrCIGPRMKG8qZiuB7uDBK+3XdMl68z
	nxNuToI8KKh2aRoFGQWjnGBD0db4Ig/p6brfOq5Mx/T7Ti7nRTz8jm0pDto4KjExdEltB7V+mrQ
	LZXgPpSXo3wbLuBfJFEqcqQVptPGfsEp6Y4zKONWvKL0s1FXkk8wHbOaRVxmBxDER2vs=
X-Received: by 2002:a05:701b:4281:20b0:158:1ed2:cb58 with SMTP id
 a92af1059eb24-1ac5e6f5362mr29461112c88.39.1793878925686; Thu, 05 Nov 2026
 03:42:05 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260927131838.6774-1-demyansh@gmail.com> <20260927184414.6c0c8867@pumpkin>
 <CAOLeWCt+yFs29yWg6DrRH42HD9ConLgTEbW=wMKtEoTW5ROHvw@mail.gmail.com>
 <CAHfVqdX4AmqXs_oD5OCjU8R5ts=98=RmgCmJ3D5gLyk=Xtrfkw@mail.gmail.com>
 <CAOLeWCu4NiedyXmoLwwnTvJitRwgg6PQq9LApO=k36ktN3-XWA@mail.gmail.com>
 <20261102161426.2403d308@pumpkin> <CAOLeWCviRtGMhGJQx3HHFQOze439576PQqr4tmvjGkMMfYfcog@mail.gmail.com>
 <20261103223846.5e6a1dfc@pumpkin>
In-Reply-To: <20261103223846.5e6a1dfc@pumpkin>
From: Demian Shulhan <demyansh@gmail.com>
Date: Thu, 5 Nov 2026 12:41:54 +0100
X-Gm-Features: AclHuK8YmBfrvU8U1rrj8-xeeVAzdXMtREA20yl9x0xVbHvq-vQqOjWILfZrKI8
Message-ID: <CAOLeWCvDKWAuCJ1cW1bbhtmvhV6ei2cPYcQVw_4sM+i1tc+-wg@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: csum: Add fused copy and Internet checksum
To: David Laight <david.laight.linux@gmail.com>, 
	saeed bishara <saeed.bishara.os@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Eric Biggers <ebiggers@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Marco Elver <elver@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Robin Murphy <robin.murphy@arm.com>, David Gow <davidgow@google.com>, 
	Brendan Higgins <brendan.higgins@linux.dev>, Nathan Chancellor <nathan@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kunit-dev@googlegroups.com, netdev@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_034207_156866_6E6B85C4 
X-CRM114-Status: GOOD (  38.30  )
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

> The scalar path seems like generic C code and not restricted to arm64,
> curious how that performs against existing (e.g. x86) assembly
> optimized implementation.

Hi David, Saeed,

I tested David's sum64() loop, with the store added, on x86-64 and arm64.
It is portable and correct on both, but no single C form was fast on
both:

- x86-64, vs csum-copy_64.S (GCC 15, Clang 19-22): with dst alignment
  and 64 bytes per pass it reaches 0.89-0.94 of the asm. The form costs
  two ALU ops per word (add + adc $0) against one adc in the asm, so even
  a hand-written asm version of it stays at 0.94-0.98.
- arm64, vs the scalar loop from my series (four accumulators,
  res + (res < data)): the same 64-bit loop is 0.90x, while the same
  loop on 128-bit val/sum with 2-4 independent lanes is 1.19-1.24x. On
  x86 those 128-bit lanes drop to 0.40-0.52 of the asm with GCC.

So I'll keep it in arch/arm64, and x86 keeps its asm. In the next
version I'll move the loop to 128-bit val/sum with independent lanes,
the same way arm64's do_csum() already works on __uint128_t.

Demian

=D0=B2=D1=82, 3 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 23:38=
 David Laight <david.laight.linux@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, 3 Nov 2026 16:47:29 +0100
> Demian Shulhan <demyansh@gmail.com> wrote:
>
> > > .L4:
> > >         ldr     x1, [x0, x4]
> > >         adds    x2, x2, x1
> > >         cinc    x3, x3, cs      # adc $0,%rxx on x86
> > >         adds    x4, x4, 8
> > >         bne     .L4
> > Agreed, that is a nice loop for the sum-only case, one dependent op on
> > the sum chain and no builtin needed.
> > For the copy case I tried the same form on x86 (Zen 3, GCC 15, Clang
> > 19-22, -O2) with a store added, against csum-copy_64.S, as posted it ra=
n
> > at 0.85x of the asm with GCC and 0.73-0.76x with Clang (which rewrites
> > it into setb/adc), and ~0.8x unrolled 2x/4x - a bit slower than the
> > posted 4-accumulator loop (0.88-0.95x).
>
> I just added *(u64 *)(dest + count) =3D val to one of my loops.
> gcc just replaces the 'add from memory' with mov/mov/add.
>
> I'm now confused though, I seem to be getting different output from earli=
er.
> With -Os (which I didn't think I was passing) clang is refusing to do the
> 'offset from end of buffer' loop.
> With -O2 it bloats everything by unrolling 4 times and adding lots of
> extra instructions.
> (AFAICT the optimiser has a completely incorrect cpu model.)
>
> If the compiler doesn't generate the expected code it is all pointless.
> The xor parity code loop had to be in the asm block to stop the compiler
> changing it to a much slower form.
>
> For the checksum code I have managed to work out how many bytes/clock
> the code was generating and getting it to (reasonably) match the expected
> values.
> But you have to use relatively short buffers to avoid D-cache effects.
>
> David
>
> >
> > =D0=BF=D0=BD, 2 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 1=
7:14 David Laight <david.laight.linux@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> >
> > >
> > > On Mon, 2 Nov 2026 16:14:06 +0100
> > > Demian Shulhan <demyansh@gmail.com> wrote:
> > >
> > > > > The scalar path seems like generic C code and not restricted to a=
rm64,
> > > > > curious how that performs against existing (e.g. x86) assembly
> > > > > optimized implementation.
> > > > Depends. I think __builtin_addcll() is needed to get roughly the sa=
me
> > > > performance as the asm version. In my tests GCC on arm64 turns it
> > > > into adds + cset instead of adcs like on x86.
> > > > But I will look at it, thanks!
> > >
> > > The C version I posted earlier has the loop:
> > >     buf +=3D count;
> > >     count =3D -count;
> > >     sum =3D carry =3D 0;
> > >     do {
> > >         val =3D *(u64 *)(buf + count);
> > >         sum +=3D val;
> > >         carry +=3D sum < val;
> > >     } while ((count +=3D 8));
> > >
> > > for aarch64 you get:
> > > .L4:
> > >         ldr     x1, [x0, x4]
> > >         adds    x2, x2, x1
> > >         cinc    x3, x3, cs      # adc $0,%rxx on x86
> > >         adds    x4, x4, 8
> > >         bne     .L4
> > >
> > > I suspect that is close to optimal - especially for fast cpu with
> > > out of order execution.
> > >
> > > https://godbolt.org/z/eso79K7Wq
> > >
> > > David
> > >
> > > >
> > > > =D0=BF=D0=BD, 2 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=
=BE 12:44 saeed bishara <saeed.bishara.os@gmail.com> =D0=BF=D0=B8=D1=88=D0=
=B5:
> > > > >
> > > > > On Sun, Nov 1, 2026 at 3:34=E2=80=AFPM Demian Shulhan <demyansh@g=
mail.com> wrote:
> > > > > >
> > > > > > I would prefer to keep only the scalar version of the fused cop=
y+csum.
> > > > > > It reads the data once instead of twice, and on real Armv9 hard=
ware it
> > > > > > cuts end-to-end cycles/byte for bulk TCP over WireGuard by 3-12=
%
> > > > > > depending on the core (+6-8% throughput). It uses only general-=
purpose
> > > > > > registers, so there is no FPSIMD state to save and it is safe i=
n any
> > > > > > context.
> > > > > >
> > > > > > If you are OK with the scalar path, I can send v2 with NEON dro=
pped,
> > > > > > the scalar path only, and the KUnit fix for the x86 zero-length=
 case
> > > > > > Jakub reported.
> > > > > >
> > > > > The scalar path seems like generic C code and not restricted to a=
rm64,
> > > > > curious how that performs against existing (e.g. x86) assembly
> > > > > optimized implementation.
> > > > > saeed
> > >
>

