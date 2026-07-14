Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E31AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 07:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yavgJsn42/mg7FbRzuzYhczZGQV3Jism9aLSRgEzMNU=; b=BfVN0fC7RpefWa7Z39Wlm3F+F2
	v9BntGO4D99pG4MLzG86BRZIabAeCE6LW8kOVoHl88p9IKSEmkzdKOlMiBoD5zCSxcGpWAdpH/F/0
	XwgeOdys4pX6QFXTXbFhK6gsx614qVocP60YWV/i4GUVP4ZU+SXYV1u9TExuq1hCWw6uD/j4pp2cr
	5h+AiXtvN1t1cYQMpt9TF9a2asS5BqXVg1SXz4LxAdAvX8lLieWiZUAfjLN9JUQ89kvVZatHerTXk
	6IzJr0lracCnc/qd2xTJHIklCCiqOG6DtHu6FfgV0Ffe5jvRuZlL8v0KKLeabyKBhoKvX+S/iDDhj
	pPw+me/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjXup-0000000BEWs-1CFb;
	Tue, 14 Jul 2026 07:50:55 +0000
Received: from mail-vs1-f50.google.com ([209.85.217.50])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjXum-0000000BEWN-26c7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 07:50:53 +0000
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-738bd0b7960so476318137.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 00:50:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784015451; x=1784620251;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yavgJsn42/mg7FbRzuzYhczZGQV3Jism9aLSRgEzMNU=;
        b=YBQgGqcnbDeglCkhgX09MC4sW2aZ5x52r9kqmbGV9V5BecDACKV7YbBYv97hJswtvb
         MDPsD5Ij/6RSnkhjfOktOP/4PLezoThnujHy8RsWKoqPFRaPnzmU56/HmHj3KEeVWWFi
         syDP07aHWw1KuDmweUoMz6p2B7KOT3xNvEMBPRSNbhJNnPVfBuh8gKm+FfafHnY9Tfed
         7rdkxn17Wn1D1MiwFaMhFhHkJ0tqmzyWzIHAfhkpwn18EEimnPgSrmNEBL9l+BS8WjzL
         UxkLcIN15EaSdaoQi9hR41awUhloBwjSOMDIbzUQy6he/NyC2H/rw+t2GXiDxtZ/xGz1
         UOgA==
X-Gm-Message-State: AOJu0YymNUzboo9J8Co0bkC2w+bkbWxBVDCptWDzosd1LZyfyYlan9nb
	1xqJugl+6/4KSi1h3qb42bc+eQgEaTpoEMabRFW5qaUhtkP6uqQBkNPxa9uT6i76rTE=
X-Gm-Gg: AfdE7cmEN71WFr7TLaeYo8puxVQNK5ENizW+PodQE3hUUy5ynWRv2gcxXE6+OA5eXRu
	qnQfUt9CODKxFMqTCrceoDjLXGslNpPYcQNe7PoX83n4wlQ08ip0I93r1sNSEWfFbcWA6dDBEpp
	3e9/ZNSVYAKYDGsq/F4lweGAQEB+V12tdggL5/LoBDIOTkIXUXPLIOXA94f88V2e53xkQm6VXNn
	qao/a3D86CBzRS068wOgWZIIIkvC7C4SUiVW7Dw+opowBsh25iXclIUA0OMddl0YyJwd5T3Dqhe
	DQvyic1hoJfGisC52luChPy7M2WL4Mz1r3IJdVoFV53boBqq+io/D6Gb8AkMZe5AnLWMeBikuTt
	G4axA6L68xMUulQhzk3lUsFpB17qbZYnIw35wC1aPUxaYChGEhQ3KDzSBtAMqMFgesCs7d4FHW1
	2Z8cK082D6tR3XitigKqQrifBKhmBUJ1831bNqzOoj/p/foW29ABIy9ZQXLAz5
X-Received: by 2002:a05:6102:2926:b0:631:7781:fe91 with SMTP id ada2fe7eead31-74533bf9656mr8049853137.9.1784015451179;
        Tue, 14 Jul 2026 00:50:51 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96ed663ded3sm9230065241.12.2026.07.14.00.50.50
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 00:50:50 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-966e7380109so324273241.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 00:50:50 -0700 (PDT)
X-Received: by 2002:a05:6102:1608:b0:739:15ef:cdfb with SMTP id
 ada2fe7eead31-74533b84395mr8279731137.5.1784015450565; Tue, 14 Jul 2026
 00:50:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260710160450.64967-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdUQJ8mzUi0birB5f1KnCMX_QufHTgYB7AW=d3ZoFer+Yg@mail.gmail.com> <1d0d4074-90ca-4b33-9bd3-ff27aa0fd4d4@mailbox.org>
In-Reply-To: <1d0d4074-90ca-4b33-9bd3-ff27aa0fd4d4@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Jul 2026 09:50:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWNcbMxONo=PaHqJnD1EErc8AzYLf0MceD+vt9UhmsVfQ@mail.gmail.com>
X-Gm-Features: AUfX_mxwFeauCKqv0YVOv7ObJuQMatx6kqMpuGapev3XA_vc1zBsK6ZaiEApGuY
Message-ID: <CAMuHMdWNcbMxONo=PaHqJnD1EErc8AzYLf0MceD+vt9UhmsVfQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: ironhide: Describe inline ECC carveouts
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_005052_544479_C96A1177 
X-CRM114-Status: GOOD (  24.51  )
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

Hi Marek,

On Tue, 14 Jul 2026 at 01:27, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 7/13/26 11:11 AM, Geert Uytterhoeven wrote:
> >> +               ecc@1e66660000 {
> >> +                       reg = <0x1e 0x66660000 0x0 0x999a0000>;
> >> +                       no-map;
> >> +               };
> >
> > Given all DB[0-7]FSDRAMECCAREA00 registers on Ironhide contain
> > 0x0000cccc (md.l e98[0-3][7f]450 1), I think the last 3 regions should
> > start at offset 0xcccc0000 instead of 0x66660000, too.
> > As a bonus, we get 4.8 GiB back ;-)
> I asked about that part internally already, and yes, it does take away a
> lot of DRAM. I think it is safer to reserve more DRAM and have a stable
> system than reserve less DRAM and deal with potential stability issues.
> I also think we can always update the reserved memory nodes in the
> future and shrink them to make more DRAM available, once we know that it
> is safe to do so.

Agreed
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-fixes for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

