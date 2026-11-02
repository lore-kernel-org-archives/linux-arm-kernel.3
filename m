Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFEC606A90E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 16:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hawxs35K;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=G1w+A0ft;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QLucYeq7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Xq5JtlRc0bd7QYpBrNP/yR1XPt2PV3UUDwsNUvNWTIw=; b=hawxs35KF3ZqRQ
	43ZkIn9nUllAIuf+F6KgKYN4zxX3TNtXRVpzAUR1jcJyenaHEK8EmY/KM7vskJT3uFaNU1xYBfu0m
	tAT7GTABAZ7tTCKsYmNAwmvRsxHb4jbGW5jbS/zsmoxUsDHahedw5TOjsYti8unkY8sXRZitqcKhs
	bb6IGzKV46CzFGs+HO+Gc9FSTd9zm7zdRnVXfeSRGxYGmCX3ptwbB8OdPYNOG+SFEf3392nSyFLyI
	l9V9Z8QXZSTZHIgmzLcnKki/4DvyhgNH5tT5TKysbcdhrhC6s0oocrKvTxu8yV8x5Iy+16hD3by8+
	kNSIf/GZS5CwB+hUsxnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNugA-0000000HGKE-1WgH;
	Mon, 02 Nov 2026 16:14:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNug9-0000000HGK1-1jn1
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Nov 2026 16:14:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Xq5JtlRc0bd7QYpBrNP/yR1XPt2PV3UUDwsNUvNWTIw=; b=G1w+A0ftPu1L4jT9QkKyT3xQk3
	gd+2uBS64wvsRTe2Ztuek+lB30Yuc24hdxkA1WzHCoK8SVaxGHvSe8bMmUhE/AMq94afyeK1LYJ2c
	QWOlbDQuIjVdMlNp541/WvGvuYklkSNcqXynWcQzr5GFXOeZb4r/ItzE4jmuF7xTW3XgtWiw+sjPJ
	2yf1fP9myNa+PkLTabxWkG8x6xQsxIUFls3ZBtq3FQvIxqc+7s9QufTfFHBqhxuzqWJqmWEx37DNf
	dPgZwzeouhDU3Xur4+4fYOudXlEGuBUxwWL0Ezyow12l/eyI9vnTdgYV0Li/WjclnpKqeDNHhElS5
	Q+RVC2Cw==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNug3-00000002nST-3MW0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 16:14:34 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso31701175e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 08:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793636069; x=1794240869; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xq5JtlRc0bd7QYpBrNP/yR1XPt2PV3UUDwsNUvNWTIw=;
        b=QLucYeq70jJ26aGSNcrBQroSLzjxO7tMZSnKCxXcstXKEv3dPZ6C8qZcODhyv8fSKs
         6tNhYqkxNsVSjsk5e4OvJ/1W5w4njZsYDRxlRbtiROVIbvVOETsl3+wvHv9At3vWOdiN
         LzzKOh2gxpgmRKclMhEfyFD7f5IznFIhwJzYgRw/5w/+7Biz1IrtL2doQIWL+DGKwM50
         R+CGegYw9j3YB/gqEXgMfVNuKpcsReRP1gnlsUA09706RZknISUE0VWoj9VbZPvs0m/K
         yFwec8bN708HO2SqQzRFfnSqFuCV7rWxFkUXCOZ2Sr6v9qJQ6on6QallZP1FxPHfbOza
         NRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793636069; x=1794240869;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xq5JtlRc0bd7QYpBrNP/yR1XPt2PV3UUDwsNUvNWTIw=;
        b=UhUZvqJiXw4Y7qK6NDHVVOdjxIukzk+hn5myO4MmAf5xnmPkltAyfen9ZnMJL6v4jY
         wdXPPs3WRxIIrBVAmsFMsvBEl3AjmE2SvZfukbs4pcWQYnHKbRXdrFUAhzeQJvoTW8AW
         8CmKjrJnvsZz0WhQg7PZNYUOZwGoJw1BQOmht9oufW6GzuwAwiLDYPV8jB8Jxp3hHtZD
         S/K9NOQQOw4B1DoBfwQFcevly5keBTID7ISlNdioYQquLFs/uNUXzs1gD4Uvx1Z8kpyg
         GHxC0KKHteeFpyDTTio23bpeQ8pI6N6ifA26DzFPhQZhPiL9f0HC2wr5Dtkl3H5bVedb
         Cmeg==
X-Forwarded-Encrypted: i=1; AKwUvByhzt+2u5N6hr4ajtQwraHNr8ceqacZ1PQz1R2aKDBbsE39FZ/dFzfqzTcfQoXoAoFu+Tn7h3ZobZWjGAZcIpM5@lists.infradead.org
X-Gm-Message-State: APuU4Z/NM0fmFXuH+253YZww+2f43ELIPTuLu6u6CGjiMmWsSXvOUREK
	h0gEL0s1PRw7fsL/77w3wTownpEfdrlwyyRqOUro6JZNIjT3dKoxIsiZ
X-Gm-Gg: AYBFou0LxvFtZSZfFrdPd/0X5gxsF7Sm0HGPTudbVxxfz+qK7Kwg1UXqwv0QhD6GuVe
	n34/N0jsqwTjTs6RiOz3G7YVW0488hnYZK5WlX/gOwEHXwjUkhCE4/C7dx/RXs0XThYCjwv7/M6
	96RstScoTnCRNzlDo+2C0mkrTi8OB+QpzH5B39eIvhL0n5zqcrPu0YKpx5yLhQz6fdOTq0mbMai
	gE80a6BPDAyMR1+7UFWNWG8CUNWlSrFCiUAh1jZv9/f6RCfSYQnPTBK9RBTkPB4itrn75qpEIJe
	4HZcE1tWC9s76uxuGRWERdfYPiGuudea8rTyhouWXnwg0/EvhNSS56tqB+cIed3PAAnz7Kz0MCF
	N0bemDYyPXLc0keY3T3GtzY9ygrlVdBOC/s3qNAaYcHS/CwgpayW/VQ9IHRBNMd7vnufkHTnOJp
	2CBkw2P+bzjCOC4oOg6Nm8/s8SCmxFWk2eZEc57FKUlFo6m6k17Jev/za1mMtHKu2yAUj0+EqUS
	HRuhfrLhGhM0AP6P1+eMQuGJdfoV/k5DIYbWG4SGkhDfxhHxQc5h1s2D5BuCR4rM0lbF5zydHel
	PaXptVqIHbrPVGa1S9jpvEDEIGCiOWJtp5SE+QV/MdYUU42McJRLtRHa2X6JOE+F
X-Received: by 2002:a05:600c:c118:b0:4af:79ee:f660 with SMTP id 5b1f17b1804b1-4af79eef775mr111736695e9.31.1793636069327;
        Mon, 02 Nov 2026 08:14:29 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf0b36853sm267629925e9.0.2026.11.02.08.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:14:28 -0800 (PST)
Date: Mon, 2 Nov 2026 16:14:26 +0000
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
Message-ID: <20261102161426.2403d308@pumpkin>
In-Reply-To: <CAOLeWCu4NiedyXmoLwwnTvJitRwgg6PQq9LApO=k36ktN3-XWA@mail.gmail.com>
References: <20260927131838.6774-1-demyansh@gmail.com>
	<20260927184414.6c0c8867@pumpkin>
	<CAOLeWCt+yFs29yWg6DrRH42HD9ConLgTEbW=wMKtEoTW5ROHvw@mail.gmail.com>
	<CAHfVqdX4AmqXs_oD5OCjU8R5ts=98=RmgCmJ3D5gLyk=Xtrfkw@mail.gmail.com>
	<CAOLeWCu4NiedyXmoLwwnTvJitRwgg6PQq9LApO=k36ktN3-XWA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_161432_310008_F02D6A9D 
X-CRM114-Status: GOOD (  24.69  )
X-Spam-Score: -0.2 (/)
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

On Mon, 2 Nov 2026 16:14:06 +0100
Demian Shulhan <demyansh@gmail.com> wrote:

> > The scalar path seems like generic C code and not restricted to arm64,
> > curious how that performs against existing (e.g. x86) assembly
> > optimized implementation. =20
> Depends. I think __builtin_addcll() is needed to get roughly the same
> performance as the asm version. In my tests GCC on arm64 turns it
> into adds + cset instead of adcs like on x86.
> But I will look at it, thanks!

The C version I posted earlier has the loop:
    buf +=3D count;
    count =3D -count;
    sum =3D carry =3D 0;
    do {
        val =3D *(u64 *)(buf + count);
        sum +=3D val;
        carry +=3D sum < val;
    } while ((count +=3D 8));

for aarch64 you get:
.L4:
        ldr     x1, [x0, x4]
        adds    x2, x2, x1
        cinc    x3, x3, cs	# adc $0,%rxx on x86
        adds    x4, x4, 8
        bne     .L4

I suspect that is close to optimal - especially for fast cpu with
out of order execution.

https://godbolt.org/z/eso79K7Wq

David

>=20
> =D0=BF=D0=BD, 2 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 12:=
44 saeed bishara <saeed.bishara.os@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Sun, Nov 1, 2026 at 3:34=E2=80=AFPM Demian Shulhan <demyansh@gmail.c=
om> wrote: =20
> > >
> > > I would prefer to keep only the scalar version of the fused copy+csum.
> > > It reads the data once instead of twice, and on real Armv9 hardware it
> > > cuts end-to-end cycles/byte for bulk TCP over WireGuard by 3-12%
> > > depending on the core (+6-8% throughput). It uses only general-purpose
> > > registers, so there is no FPSIMD state to save and it is safe in any
> > > context.
> > >
> > > If you are OK with the scalar path, I can send v2 with NEON dropped,
> > > the scalar path only, and the KUnit fix for the x86 zero-length case
> > > Jakub reported.
> > > =20
> > The scalar path seems like generic C code and not restricted to arm64,
> > curious how that performs against existing (e.g. x86) assembly
> > optimized implementation.
> > saeed =20


