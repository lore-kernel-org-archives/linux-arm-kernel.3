Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EBA606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 19:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0fYb3qog;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ia3eMdyA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xwTAuUAToCB+PtpxcqmiSYPvP1xLCOZOzG4SnyhT+Oc=; b=0fYb3qogZJRX4Y
	gGp39EAOFvuSFpQ1yfMs2mbGEdvgRUTw8MqCxZeZgxFcgryiicxkSObEe6DdttMRDgXazkphMW0Zv
	kNX0kg3cxLVVppWuhf2ePOHFrIpT8TfZHxWq7qTZtosoJj8F3Y4akcEfeWkx884QGDrRieliQL/kl
	H5J6QkDnoRilsRDPg3VrHNMv4URQ4IkWnyrXgKRxWqHt8i9qMwy/w0Z5VGmI3NlmMrL7GI7zsLfZH
	EF/nc4y3rJYUGL9Wwi5IfMTsXELKOnAOUrGfP64aXNj+ZJYV0BzSKfmlc+FsFhRmbb4QS0PArFnp3
	6aOysaOi7S0Sna8Z931w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQHA-00000003AHU-3Boe;
	Mon, 26 Oct 2026 19:22:32 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQH8-00000003AGs-17wC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 19:22:31 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2eac4877accso3841835ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 12:22:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793042547; cv=none;
        d=google.com; s=arc-20260327;
        b=RGHtKX3L69VB2qobfvaSLCfmJH3/s9Ddedtog3m9jU8TRxQXqorbUrw/GtXNkBBMyb
         tgohYkBBpS30YJ80HWCTqtbS0uq9CEFMEqrMhnoaJi2Otd+L8MZo7hraEBwOwCHQK071
         sSiXXhwCW7zXj8P1oifBSZ8K/X9H5HeTRdxC4e8PNn6ZTwFInoSW3n64fAh4AMxHxSYE
         SNUJCMFptqtuXE2hILXTLCke5OAlI2v39OVO0qfxl9i1I074recUZyI1caa5lJRiMV/f
         J+QceCaApQqhugc7FbinvwOHjAY0CJ8MDH8uwoyiVW2zskM8M+5nZWDz1kGbfYXBeVYy
         EomQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xwTAuUAToCB+PtpxcqmiSYPvP1xLCOZOzG4SnyhT+Oc=;
        fh=OEwjYbCUtR9+r417iSbXnB40zaZx3W8ITtO0Q2PJ5rA=;
        b=a8llx/ZiuRu7+sjGKf8p+ULro3TeiDLfM81RP2i3M/NpHNS+5WWLC9jU//urY8djCM
         aa+pU9pIc9C90TDGphxi8Iye29mDAwRzBuGE/NdqO1iz+Yxe81JgPhuALAY95mFNNGDe
         IDYKRW0GoDRoZPDThCgzWUTCBHaT6GE1rxzqQoxEe2SZCIzFIy3bgWj0yiPGc30xxJgw
         CIvRXUsx4EmRhu/rVozc4a4UXTV7naHZ6xQ3NFKPpEYJM969y8oCv41w87or/jZlLavR
         ZzfXCMTAwqI/YQFZDhwFb5X9uIb8hceM3FPI1rNbzG+zxYM8mwlHyVL6ZQxp+hQt+kco
         s4xQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793042547; x=1793647347; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xwTAuUAToCB+PtpxcqmiSYPvP1xLCOZOzG4SnyhT+Oc=;
        b=ia3eMdyAU0czvb7ZdXwnd0LiZi/IK/KSEcuyQ7sIK94HsikaV2ng7yUm24ckP4p8sb
         YIMRf/ZnKChKJ9djgxTXS4Ng8D/VPV4X+sXvS+gczGnzkzLHA2t891L9qEpjG45VlXCa
         UMEeHFhFdN03JfE2UDsCy/LRFPKheFSp1IN6PfYZHoD5bf8Vcmb/g8cXCyeBziUkfVEr
         MNzAYb7QtV4O1S+cr1b1otUZiXD3tShMeIRllT3NHplm0Q1fsn3S+zHE++7EbE5K1zVg
         9KQJN5BM281gE5OzecoPMF9Q7EjlSJu2DUf8z6y7aoKsUKMoN0lCCf0DifIp83Res1Tu
         gCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793042547; x=1793647347;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xwTAuUAToCB+PtpxcqmiSYPvP1xLCOZOzG4SnyhT+Oc=;
        b=THDxCS0tUscvT6fvNsU3yP8JnoofonDTNm/1yJ1fHGUUwPyWfoiC/Tu0SButHoe39+
         vgbeBl6lz5AJGjt3/wRgQLS/fpTF0hh4GgKnGAP1bIww1rg5og9y0EreFeLvDIqzDd52
         6qjq6NBaEhLQDy7lW/zP92v+q5LZYYK9IAE4+7n2ZbPVXRfKxxVQ3yxRHPKZ+UQQ+ut/
         AidECf6rnFd5dCQdiizem2aXBlFiBcYl4FxjROqkEWRJhECe4YFfDCYpNkiMO8zgsVvS
         Rnaei4TaUfA8lrjofns1P2aVobmjMM1wAsJ28OrxgsQ/U+torPN/mpB5cvEPEOOhqklM
         28VQ==
X-Forwarded-Encrypted: i=1; AKwUvBwRvCp5WHUMesWGX+nTXLFdJNFuwpHFXtu928R9hC1jfrsgGT4Ijx/+aRKV26LDZOTXsB2rhgAQJCpSRAuai9TM@lists.infradead.org
X-Gm-Message-State: AFq9FYK0W+ug07C/P+j89TgVe03IWVG3bSPndyaFgTo1ZI+2YJ1qWRPG
	CdiZ6CsV0tWK2o/PAaN7UEHAoH3lEJST76pwdvHDpNO9xO0oZgBCmsBH2FkuamjyjycWG1ZCCo/
	F1y4gTbZD9Xna59iYyng1S9bTVM7WwynzUx4ODsswgkkm
X-Gm-Gg: AYBFou3XgYpF9mziLcFpRnRiXbIdawz4TJY0mRE/PY6LTqnr1YRvMKxRZm1rqMnXO+r
	YMFNQHIafMsyXyfI4HEeEYUm1Jzoo18md9Dgjigeo/vsyCmACM52+4A7dKuK6xuv9LlK6LiYJj8
	z5F5A0r4RUp7g9NQi4E1+qI4yUkwczgWjOCklIh7ScMP9CeYaaeOOv+wP7Fj3hn5lR/5Z2NFP8D
	l4xadr63RZD6QM5OM1c1R3HJsSHU4D4KmIBagtbNoaxUPScornFyx5nJ6WuodXQcv/1VSpqZ4N+
	mPH7MNb1Sj5bEZ9pAR2vicRzE3PB5Gc0Aphp7/9UQX0yN31BYiDuRpjbBO9J8HgPaTzzD7F8QFo
	EiXiLkgq41X3mdboCAxKchsahGqgkeiLx0ML6yqkNoPlpfi/6wAS2
X-Received: by 2002:a17:902:ce8d:b0:2e5:a355:56e4 with SMTP id
 d9443c01a7336-2ea9c5e30a0mr60160345ad.11.1793042547045; Mon, 26 Oct 2026
 12:22:27 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261025142412.112216-1-pmazzini@gmail.com> <474d4ed0-b011-49dd-853e-697448382a0e@arm.com>
In-Reply-To: <474d4ed0-b011-49dd-853e-697448382a0e@arm.com>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Mon, 26 Oct 2026 19:22:17 +0000
X-Gm-Features: AclHuK8V-ReT1uOg9VTcgyQYzBbm5tikcDUgJYabpKKgd9T74yNLPiBsMiogtYQ
Message-ID: <CAAxh=jupBYZsadg09ig1v+3OkfjLAf+Hd9NwoR_D=te9XKxkTw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] pinctrl: sunxi: number the IRQ banks from the
 first one that has IRQs
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_122230_328140_053D19F7 
X-CRM114-Status: GOOD (  31.49  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andre,

Thanks, understood. I will wait for proper reviews and for -rc1 before
posting again.

Pablo

On Mon, Oct 26, 2026 at 4:42=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> Hi Pablo,
>
> just some heads up about process:
> - Please do not repost that quickly! The kernel doc says to wait at
> least a day, but that's only the lower limit, in case the series is
> almost ready and there were only minor comments from real(!) reviewers.
> I would wait for a couple of days, after you got some proper reviews.
> The reason is that reviews (by humans) take time, and it's not like
> people are bored waiting for some patches to look at. So they might be
> interrupted by something or need to do some checks and research. It's
> pretty bad if their effort is ambushed by a new revision, which now
> means they need to start over.
> - Please do not repost just because Sashiko said something. Wait for a
> proper review. It's probably a good idea to acknowledge the comment, but
> don't just re-post then.
> - Try to avoid posting inside the merge window. Depending on the
> subsystem and maintainer, your posts might just be ignored, because they
> might be busy fixing up conflicts. But more importantly: you are missing
> the correct base: you should always base your patches on an -rc1, unless
> being told otherwise explicitly. And since -rc1 won't be out till
> Sunday, this is not a good timing.
>
> I will comment on the patch set separately.
>
> Cheers,
> Andre
>
>
> On 10/25/26 15:24, Pablo Mazzini wrote:
> > The DT pinctrl helper numbers the IRQ banks from PA, even when PA has
> > none. The A523 got a DT interrupt for its unimplemented PA bank to work
> > around that, the A733 would need the same, and on both PK is written
> > past the end of irq_array.
> >
> > Number the IRQ banks like the static drivers do, with irq_bank_map for
> > the A523 and A733, and drop the PA interrupt from the binding and the
> > A523 DT. The B288 (IRQ banks on PB, PD, PF and PG) then needs no
> > made-up interrupt.
> >
> > v3:
> > - apply irq_bank_map to the A733 register layout too (Sashiko)
> >
> > v2:
> > - give the A523 and A733 an irq_bank_map, and drop the PA interrupt
> >    from the binding and the A523 DT
> >
> > Pablo Mazzini (3):
> >    pinctrl: sunxi: dt: number the IRQ banks from the first one that has
> >      IRQs
> >    dt-bindings: pinctrl: sun55i-a523: one interrupt per implemented ban=
k
> >    arm64: dts: allwinner: a523: drop the PA GPIO interrupt
> >
> >   .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++---=
-
> >   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi            | 3 +--
> >   drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c               | 2 +-
> >   drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c               | 5 ++++-
> >   drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c                  | 8 +++----=
-
> >   drivers/pinctrl/sunxi/pinctrl-sunxi.h                     | 7 ++++---
> >   6 files changed, 17 insertions(+), 16 deletions(-)
> >
> >
> > base-commit: 4f0dbdbdb3ad122e8bbfb1d722fd584bac7124db
>

