Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542F7606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 03:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EWc4jZkq;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lVVJkrcu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5B9lX6DZI5S1tAfFM57GnAbiozq6dSyTVBcFVL3BszE=; b=EWc4jZkqcA/7vc
	9QBNbFGphGfZXovVJo7ot/5INyQzpPaKXLoBt3S8iV5SGwWl2C5p+biKlc+ziRe0FN1iJF4xvBc64
	6cSIrnrT0BpqMttBzJ+qbUGm5CGDeWseRd5bNwFKDcyZIyw/T3oQxC3zLYIJZTURhRFfKpGfOQUOo
	40j+kLIUKuqgj9F4+Kuk4rTcxVEjzM4CvZtst3ZpD8A5WzAsJjS/j1QqCVOSJZccaqnDEzS/s/GyQ
	3JoxsreN5inHPPgMt3Fx+YrwRXgdTXwbaazBJN8HL6hT+kXi4LXIoXuM9YWcAdtPQylGApFiKD3Rh
	Fe0X858X/qfzGmpXec2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOoH2-00000007gJw-1Xx1;
	Thu, 05 Nov 2026 03:36:24 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOoH0-00000007gJK-16rK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 03:36:23 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-8b32bbd39d5so2450257b3.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 19:36:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793849780; cv=none;
        d=google.com; s=arc-20260327;
        b=ijXLrwY+BZhpv9b1Tq27EMVH2zo1Sr6LnZV8GA1h8eYnqQBF4qchAdvS41XjZvVOGg
         K3vKyh8QWOZjBHD+259ReB4gIhY7n6Jm0wi2Ff7RYkSA+m4GeBqkKkxifpMc/PmdYnj+
         5YhzQ8DAjpoC+0ICyA6j7gUuA2PK1IWJu7eTI7aH7KYpXQd+rgoCCEZdANj7eE/4DOFd
         9Jgre8XqwD2r6tGGegHIEFxIKNq0FrA0y9opnrpBs1OaueUnwMvXUD+v0PddOm8NXfX9
         rpmkEvKHxbPtkobv05oF8ILglEVrxGDe7HhPErrALroxCn2GsS3kN10EBE7EshT3S5HB
         /AfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5B9lX6DZI5S1tAfFM57GnAbiozq6dSyTVBcFVL3BszE=;
        fh=bwaU6mtfW78Fiz9BHUp1LAZeHsPLCRCRZzy53ECJmBY=;
        b=WONP5gMLEcfv8LeD2Jq9gZDowVmmr+e4O2szLXMWksW8dcqpyC/IByEO6wgvYqd8sB
         UGYqL3ck0uUjOJvtbJHfqTdzYArypotIU3y/wBycsy0ECU1uoPp3x12odgUkkJkHOxRW
         t2u7o8x9RgtY0OaN/qfTWZWi9wmmawhdebnLMPihPU5mzLTQcSCgj6Ropvz0DpLPeWSb
         DpULUQRlzf3z1HAlrWq18gb615Dxc1vdfofzaxPW1hwLFtQro17sgj59OD5HLGK8eO5e
         2sjk2nJozyq5isG9BT2y9e2KIvxydjmH6WUR7zeOTfQrnmCxt90YjeFRSvyDYwnfWmKY
         q/vQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793849780; x=1794454580; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5B9lX6DZI5S1tAfFM57GnAbiozq6dSyTVBcFVL3BszE=;
        b=lVVJkrcucPB93V1iPTOBvwynhCBmAmFiSKAeI1KG8gilA554NQ4X4yWAGO7RrFPfIy
         WtlUgunhypi+e2RFC8G29I11J54BNu11n61GlC4djRqUJyx7E5HNh2a9Xb5hy1fyikoq
         b2dJ4w4JlwfEfpQLiqtBM8P0YXLT5RpKwiuOvKQFFecqSzEa0mRP4vxV/HkoSTralK8k
         AraIo0OJYh0Z/d08yMvF3yjFNdLpRK/Ky4K1vBMKSOS5JxJn5ctdXU+nRCj29OiMxvzi
         qxJtBYGiFM1vm7nnMFJ6H0AG+FxCH5ARRdYs8WVXYArEYGz2wBw/grYqeFrt0JIL7R1A
         Vt4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793849780; x=1794454580;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5B9lX6DZI5S1tAfFM57GnAbiozq6dSyTVBcFVL3BszE=;
        b=unWXmP/gJT02Ps0Fy3o8djhLRDsmhO2W2XdRpo3MRfaFESw8s2zxrLMIgabQmyTtrE
         KGEI9bDdCvrHL47lOp7+zGLatXXbMQflekxm6beI3CpXsp0w5uEZJr09Re5sN9XP08/8
         Qa2KKV3hrY0EH0YUp5m+Yj2omKny2YwmOQJxnsgZz1GKM9+y3TF/an1QLmqexj0H2WRX
         65vLA3MbLDiuoKU3NiX39rs5dpeTOKn9knQ4MiORxOHbaVPWQ45VQDntkZdfqyhD2uvk
         U8YUb8P6pkDc+B/6TABRcfnd/i5O73rvITGgHZ38EoWku2l5UQsit8AVPViVq+ljz3D6
         mKug==
X-Forwarded-Encrypted: i=1; AKwUvBwvz8cdhKrRXst6vrCBtF0jUvso8a/exed2KkYhaAM9Fl/5sUAnlI7w+cXzyXBVApYA90GsXQipCOKx/p7cZVJg@lists.infradead.org
X-Gm-Message-State: APuU4Z+hMs11fNRz83cDVQT76mCsG1n94lwfcBGNLe/nwHSb015xFDIq
	KpNDkFD4ReZtZXROInpXhoPFzBYVA4BuFUOAtDAIoiSSalomn7J2guBKxpLNnBY8V7KPsZx5nwS
	la7cZ8akMbsOgeT2PqzhVekQdvSWkouM=
X-Gm-Gg: AYBFou1+rT/t3WRWmT81ni03uKAXzes88J2IbLREM9cySIegB/F0jmfDVhFxdTvGZeN
	OP/JAl1WiXvO7zryt/QK2aV7tX0bYEYH2Jotivk2A+DFU09nFWjsh3LMEJSaePgI6txW7GNXrSO
	N8CAClET40v51T64gT0hoav4fr8ymmvoKwzSzQ+/7eOanN8rU650MA+mzNI/X4NmAjK4ZnjdufQ
	uq+GAgTqIFgdF1YHoaUthe2/gPZH6YQzN0wQYT+RuUb7ZQJbr+JLZmUQQbyq0B6dVG0CNRQ08Mu
	DmBRrnYuZTVOXq4nETFZC+sWbL++78/R7Ob/m2e6d+++HAzEsdiw6KgovRvZ6sQAStLljbw2pYT
	vF2sU8M3CX7CVQVZwjEaEf7y5wjtu4+bQ1LTrUg==
X-Received: by 2002:a05:690c:e3cb:b0:8b0:e385:edc3 with SMTP id
 00721157ae682-8b2b6719311mr132765087b3.33.1793849779988; Wed, 04 Nov 2026
 19:36:19 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261015035118.9495-1-prasanth.padarthi10@gmail.com> <CAD++jLkx4oQ2ZuUSUQE1Qtrk-1XSMdnDjfLG0rrOm=gt9VD3VA@mail.gmail.com>
In-Reply-To: <CAD++jLkx4oQ2ZuUSUQE1Qtrk-1XSMdnDjfLG0rrOm=gt9VD3VA@mail.gmail.com>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Thu, 5 Nov 2026 09:06:09 +0530
X-Gm-Features: AclHuK9YMOK-xz_gxOFW3IfSoWRvHeDrckSu5fgcWiOJM4mFO9QGiU-P0B7A4RY
Message-ID: <CAMFFDGhD4K6PN8G+c-hQAL6RG9sVkjo6SXHB5===bYswHh0aTQ@mail.gmail.com>
Subject: Re: [RFC PATCH] pinctrl: aspeed: Handle GPIOZ6 pass-through strap on
 GPIO requests
To: Linus Walleij <linusw@kernel.org>
Cc: andrew@codeconstruct.com.au, joel@jms.id.au, brgl@kernel.org, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_193622_343871_1887A7EB 
X-CRM114-Status: GOOD (  30.71  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Linus,

Thanks for following up. This work is still active.

The October 15 GPIO-request callback was superseded by RFC v2,
submitted on October 22:

[RFC PATCH v2 0/1] AST2600 global GPIOP passthrough handover experiment

October 22 RFC v2 cover letter:
https://lore.kernel.org/r/20261022024314.48623-1-prasanth.padarthi10@gmail.=
com

V2 transfers the global pass-through selection to per-pin SCU4BC
controls before pinctrl registration. It also handles SCU510[28]
through SCU514 and restricts affected requests if handover fails.

I have retested this implementation on B650D4U with a newly built
image and GPIO-only x86-power-control. Remote power-on, remote
graceful power-off and physical-button power-on passed, with
power-good transitions recorded in the journal.

SCU4BC remained 0x30000000 and SCU51C remained 0x1c80 across the
remote power-on/off tests. Electrical continuity, mixed-pair
forwarding and fault-path behavior remain unvalidated.

I will verify the requested base, rebase the October 22 version
and resend it as RFC v3 for renewed review.

Regards,
Prasanth

On Wed, Nov 4, 2026 at 5:49=E2=80=AFPM Linus Walleij <linusw@kernel.org> wr=
ote:
>
> Hi Prasanth,
>
> On Thu, Oct 15, 2026 at 5:51=E2=80=AFAM Prasanth Kumar Padarthi
> <prasanth.padarthi10@gmail.com> wrote:
>
> > On the ASRock Rack B650D4U, requesting GPIOP3 through gpiolib does
> > not provide working host power control when the GPIOZ6 pass-through
> > strap in SCU51C[9] is set.
> >
> > With the existing GPIO request path, SCU4BC reads zero, but a host
> > power-on request through x86-power-control times out waiting for
> > power-good:
> >
> >   SCU4BC =3D 0x00000000
> >   SCU510 =3D 0x00000000
> >   SCU51C =3D 0x00001e80
> >
> > The AST2600 A3 datasheet describes SCU51C[9] as an additional
> > pass-through enable for GPIOP0/P1, GPIOP2/P3 and GPIOP4/P5 when
> > SCU510[30] is clear.
> >
> > A diagnostic experiment that cleared only SCU51C[9], preserving all
> > other bits, allowed the same GPIO-only power-control implementation
> > to power on the host:
> >
> >   SCU51C: 0x00001e80 -> 0x00001c80
> >
> > SCU4BC and SCU510 remained zero. No per-operation THRU1 switching
> > or additional userspace delay was required.
> >
> > Add an AST2600-specific GPIO request callback that performs the
> > existing GPIO mux configuration and clears SCU51C[9] for GPIOP0-P5
> > when SCU510[30] is clear. Check register access errors and verify
> > that the strap bit cleared. Other GPIOs retain the existing path.
> >
> > This RFC handles only the GPIOZ6 strap source. It leaves SCU51C
> > unchanged when SCU510[30] is set and returns -EOPNOTSUPP for
> > GPIOP0-P5 requests when SCU510[28] is set.
> >
> > Hardware testing on B650D4U with this pinctrl candidate confirmed:
> >
> >   - Remote power-on: power-good asserted.
> >   - Remote graceful power-off: power-good deasserted.
> >   - Physical power-button power-on.
> >   - Physical power-button shutdown.
> >
> > These tests used x86-power-control with software button forwarding.
> > The earlier board-specific SoC driver, its DT node, custom sysfs
> > interface and diagnostic boot parameter were not used.
> >
> > This replaces the approach explored in the withdrawn B650D4U
> > power-passthrough RFC. The new proposal changes the existing pinctrl
> > driver and introduces no DT binding or userspace interface.
> >
> > Feedback is requested on two unresolved issues:
> >
> >   1. SCU51C[9] is shared by all three GPIOP pass-through pairs.
> >      Clearing it for one GPIO request may affect forwarding on
> >      another pair. How should that shared control be represented
> >      and coordinated with existing mux ownership?
> >
> >   2. The SCU510[28] enable path has not been validated. Returning
> >      -EOPNOTSUPP is a limitation of this candidate, not a proposed
> >      complete solution for every AST2600 configuration.
> >
> > Is the GPIO request callback the appropriate place to handle this
> > strap interaction, or should it be modeled through the existing
> > signal-expression mechanism?
> >
> >
> > Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
>
> I don't quite understand the status of this patch, if it is still up for
> grabs, please rebase it on v7.4-rc1 and resend so we can restart
> the review.
>
> Yours,
> Linus Walleij

