Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C88D606FB5A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 14:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UXWFq+Tt;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uMyxYTlw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RjJ2Hwu3lUOd6ON7ncjs7o5wy86KpEGCg7RvieuPzxo=; b=UXWFq+Tt9fg08d
	x0O5DuA+CPUyprIxXWPbkx99fWONW6gcKQpg10PrQ8EXtZ5qbw9dlrtkvH0pRkoCgMttYoQ9MtJkF
	IFh2+FVvnKiMTVX4NLJ36nvk31iwwqKx7RdgKsjP6Vl9/m4FfT71HHtIVinStXns09RCY/gWWQE2A
	fzmndXlR8yqobZ5Q8LCofh58wXqeAsYj9wgZc2ruB28Qcur2HX8SEjV5BILhVkfCep6P8m2OPzaPi
	IGNjk56ysen10qDaCOVHpTVaLcece7GHCO7gF5OK8WL8VVu19JL1REQ9QV670P3aXhE52+PDmXnvG
	LjASn5LbpqlQAZkdMbEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNtUM-0000000Gw3A-48bc;
	Mon, 02 Nov 2026 14:58:22 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNtUK-0000000Gw2m-3cwN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 14:58:22 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a214af2076so23819665e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 06:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793631499; x=1794236299; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RjJ2Hwu3lUOd6ON7ncjs7o5wy86KpEGCg7RvieuPzxo=;
        b=uMyxYTlwyaSKLwoO1mOcg+4f+6yj+MUhnWT9jrMdQql0+b9j4qw9n3b5HbEU+CLafD
         gE972H4sxnVUxTDgpOF5z20kJrjzOsZLFvgh7er20mZjVTyLBmO5toSGDFC3e0hCcvKX
         qahRH34MP2HXd5t5Xe6pcpyl6dDqDxbAlSnylI77x7YY9SMvoaEOR9ZniHITza6fQndh
         bZDyDXW9DDVUi/cQF5lwwf088oFgwHhobXDyb9g0rngH1dTESe5siNATYbXhdnj3D6Pn
         ITsFARuVUEulPyPGJIdtkjOtdvofAxgugvwSZ2BnGSDrwXYmjyx+l9y+S1bnfCopXLxF
         SmQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631499; x=1794236299;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RjJ2Hwu3lUOd6ON7ncjs7o5wy86KpEGCg7RvieuPzxo=;
        b=VVQAFc+V8hxo4pSdb3KpB/n538IJHUgnhkIVVyxwmTApfD79rDnKKFAFBjunmrMiyX
         rfZ94cMwgEU8MNSsScupLPITaA4Axm6+zhE5+d1HCHZZi2/oxSta4PVMydGFigVd5Pou
         OLXmYjJOQN5OfI9wR5ywisquOO6vi/UjxW1qOJhHM11u+Sf5Yh3YRik4FlBBFKNMWEmr
         DZYwECmMcMWbE6g42Nl8QQPseTIqAkCQoDpnSW5KQwIZILtXwWG57EeJSxl5DJhHn06S
         7RRN0cB6Tgns4FXmaifQcPfJcuZ0+e09BqxGR7ui7irwFBqJexvAW/wfWU/PBOnN2d5Z
         /IaA==
X-Forwarded-Encrypted: i=1; AKwUvBye6O7dNLkDWCCivFmitZnRgi7yCkaRWu0HJ6N4i3ga95Y5h3Wl9AIXjjeyY1ZZRFuK10GWxUU2uDSLwsuBSgq+@lists.infradead.org
X-Gm-Message-State: AFq9FYJVtV/8c6qdRpoinq3T4DIgUVAyvC7dTtl+YSxWMhV+AaqaAeDD
	tzgFCDmzlBIfEi1eIQblm9o2/TvGfypGglG4xVK/pij1+npUmDEHXubD
X-Gm-Gg: AYBFou02YUV7WT3qN0F/OaT72G4lBs4YfqvZnv3G3VyVnBY+GwTvHoq192ULwn5Lsg9
	wVgI/Kgg4+xbuPIkCPCO0GfTd09xRytqjnZFHiQfDWMDqTTDTcCANIjB57EQcs8YgyfYdXO9a/l
	JiM4D2iaRBXARwfCnxit+KXyMy9EdJhn0ooM35jArlCZqvcTkp4fg6KMy5dgiHcG4tVGDrMNfym
	ezANRGkyLGq3H2QcUqr2xx13yQhQAbM7T1HaO65b6RZ00I0pvCBsnh/HGgjdVBE01AfJDrpi01o
	w5F7UzIf5JD371SKYTORYufjZEo4QrOV243ekWiwHe32Jt/ZBXsp8Y8uJrnTftyB61SZW0ooMnF
	Iz+QmTHTr0leWfO5sXOicGagjIA42xf5uh0aqWvJYETdjIn26FsuaYNRL+dcoDPR0rqWb39h8ND
	21YKDtmiL3wwcD4HnQppqkH6wIfkPz5DFG/Zp/JL1O86jqw8ZYwekV0JzstgjXSZJE+SYw4VkQ6
	MIia4LkrkeN2VLCLxuCdOkNt4vUz3gI8R4TBo6ZGN+LF0ZOgpRn03NJu65xQYaNazpyBz0Oc4cY
	CLcHj90wA/7qOtpnHW90PfuNqwW60YM1tYCCrQLEv43/+qYcZqFgoVqtHRmaZVSJ
X-Received: by 2002:a05:600c:4585:b0:4a7:8fe8:130c with SMTP id 5b1f17b1804b1-4ac1889d5a1mr230617865e9.28.1793631498658;
        Mon, 02 Nov 2026 06:58:18 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac0b4df257sm164791725e9.4.2026.11.02.06.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:58:18 -0800 (PST)
Date: Mon, 2 Nov 2026 14:58:16 +0000
From: David Laight <david.laight.linux@gmail.com>
To: saeed bishara <saeed.bishara.os@gmail.com>
Cc: Demian Shulhan <demyansh@gmail.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Eric Biggers <ebiggers@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Marco Elver <elver@google.com>, Ard Biesheuvel
 <ardb@kernel.org>, Robin Murphy <robin.murphy@arm.com>, David Gow
 <davidgow@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, Nathan
 Chancellor <nathan@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com,
 netdev@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 0/2] arm64: csum: Add fused copy and Internet checksum
Message-ID: <20261102145816.00a06c47@pumpkin>
In-Reply-To: <CAHfVqdX4AmqXs_oD5OCjU8R5ts=98=RmgCmJ3D5gLyk=Xtrfkw@mail.gmail.com>
References: <20260927131838.6774-1-demyansh@gmail.com>
	<20260927184414.6c0c8867@pumpkin>
	<CAOLeWCt+yFs29yWg6DrRH42HD9ConLgTEbW=wMKtEoTW5ROHvw@mail.gmail.com>
	<CAHfVqdX4AmqXs_oD5OCjU8R5ts=98=RmgCmJ3D5gLyk=Xtrfkw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_065820_955261_D5383A74 
X-CRM114-Status: GOOD (  22.93  )
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

On Mon, 2 Nov 2026 13:44:37 +0200
saeed bishara <saeed.bishara.os@gmail.com> wrote:

> On Sun, Nov 1, 2026 at 3:34=E2=80=AFPM Demian Shulhan <demyansh@gmail.com=
> wrote:
> >
> > I would prefer to keep only the scalar version of the fused copy+csum.
> > It reads the data once instead of twice, and on real Armv9 hardware it
> > cuts end-to-end cycles/byte for bulk TCP over WireGuard by 3-12%
> > depending on the core (+6-8% throughput). It uses only general-purpose
> > registers, so there is no FPSIMD state to save and it is safe in any
> > context.
> >
> > If you are OK with the scalar path, I can send v2 with NEON dropped,
> > the scalar path only, and the KUnit fix for the x86 zero-length case
> > Jakub reported.
> > =20
> The scalar path seems like generic C code and not restricted to arm64,
> curious how that performs against existing (e.g. x86) assembly

The x86 asm version manages to do more than one 'add with carry' every
clock. That needs the massive out-of-order execution unit and the ability
to have multiple independent 'flags' registers live at the same time.
The generic C do_csum() (I just looked at lib/checksum.c) is horrid
There are three dependent alu operations per iteration.

It is likely that the pipelineable:
u64 sum64_a(unsigned char *buf, unsigned long count)
{
    u64 val, sum =3D 0, carry =3D 0;

    buf +=3D count;
    count =3D -count;
    do {
        val =3D *(u64 *)(buf + count);
        sum +=3D val;
        carry +=3D sum < val;
    } while ((count +=3D 8));

    sum +=3D carry;
    sum +=3D sum < carry;
    return sum;
}
or:
u64 sum64_b(unsigned char *buf, unsigned long count)
{
    u64 val, sum =3D 0, carry =3D 0;
    unsigned char *end =3D buf + count;

    do {
        val =3D *(u64 *)(buf);
        sum +=3D val;
        carry +=3D sum < val;
    } while ((buf +=3D 8) !=3D end);

    sum +=3D carry;
    sum +=3D sum < carry;
    return sum;
}

will generate 'pretty good' code https://godbolt.org/z/K9ob6d8vv.
The first needs 'reg+reg' addressing, the second better for mips-like
cpu that have 'compare and branch' rather than a flags register.

gcc and clang seem to make a reasonable job of compiling those
(provided buf isn't u64 *).
Today it left the 'negative offset from end' loop alone,
but it has a nasty habit of pessimising it.
For x86-64 gcc is generating:
.L4:
        addq    (%rdi,%rdx), %rax
        adcq    $0, %rcx
        addq    $8, %rdx
        jne     .L4

I think a zen5 would execute that at one iteration per clock.
Intel cpu can only execute two clock loops - so it needs unrolling once.
If you unroll it once (with separate sum/carry variables) there
is a moderate chance of it running faster than 'one word per clock'
(two words/clock is probably wishful thinking, zen5 can do 6 add/clock
but some timings I've done imply that memory addressing can use and alu
add).

For slower cpu (especially in-order ones with memory read delays)
you may need interleave the code, eg giving the loop:
    val0 =3D *(u64 *)buf;
    do {
        val1 =3D *(u64 *)(buf + 8);
        sum0 +=3D val0;
        carry0 +=3D sum0 < val0;
        val0 =3D *(u64 *)(buf + 16);
        sum1 +=3D val1;
        carry1 +=3D sum1 < val1;
    } while ((buf +=3D 16) !=3D end);

I didn't try those loops when I was timing the cksum code a few
years back.

They have the big advantage of a small loop stride.

David

> optimized implementation.
> saeed


