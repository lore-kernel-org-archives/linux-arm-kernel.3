Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258D5CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 13:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vrwW8HJMZcY9Fq5J+G2ZrLwjCrrOc6AC4xQETMaCZKg=; b=eKT3xsH+UV3GnCDbFOrJov33o4
	mGZh3fQZ4fvBRiF2oW/3T/02V1y9M3/V3SGhSNLmbjKkKqEAhLNXfqYYhZBJImBE4+Bjz8Bzd2fpJ
	ERvy1zTPnwlRJlLK3LPkuiSiIlQNW0avIlasnUWz296LtA8kdNboNXkB6Q1DPmCV3EnCrXtt3GTx+
	UNNI0LtMhd3i17WO3buIP97bOQPn4tuoCE9jUQakZWQQ1pjGxaWyOBjgVyBIGtWvO+c+V1pnuENSp
	MiXFGonRh9COnTKIZ7/jOq7HeqBv9/WX7rGXGpbyrlsFnI+iMtoCD14Ztq6ODInD7R0ascGP/uL+F
	RO5JHlsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9nb-00000002nBt-2Zu8;
	Wed, 13 May 2026 13:38:55 +0000
Received: from mail-ua1-f49.google.com ([209.85.222.49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9nZ-00000002nB6-0HFA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 13:38:54 +0000
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-95cd8b71105so3759926241.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 06:38:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778679532; x=1779284332;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vrwW8HJMZcY9Fq5J+G2ZrLwjCrrOc6AC4xQETMaCZKg=;
        b=j2JTIt0HTGWdOXcJXwW6SMKy6vWFZ04bZg4SpDhWeMQRG+lTzcjrgxBlulKPPJibyz
         MynMrT8diroLobOA4JzA4qw96p/ETQVQmyFmZejrhkzRzVLRbxwCiZFyx+P7Ih0GhzXG
         vMT4vJdWUp2KgEM7b23V87bCdLldR7siv70Fe73UWx7GhOptj+6bwff04vzQkC7nRoXF
         bCoFFgtH5Abb8TkXgBFeIT3D6VMyhBl2bqIELDZLkjx4dTeGtYZE/eE2sBDCYq/365l2
         6/COQJLuZCMCtbDlR1TYQpC+RNlrzE1fILCgU2TZGfcvZP6jTGGP1eT5r1aRV2U5eMyq
         2Ecw==
X-Gm-Message-State: AOJu0YwAkOHpNb2m2BzrgaJRPkG5blQz4jNBYzVWF8pmMDKrbjjbF+BR
	SZLynrRNIGqx2Isz+hvx4C3+kBTKqomd07auapJ33hO60LKiC/dqCVqDxZgKN7Na
X-Gm-Gg: Acq92OFxHcLyJtG+n8UWf5A8J75fJ/wb5tsbujczBOEJOZ6P4rouxoKjZ+ZTxMkeeas
	BEOvFIiaZBdk5ETrKaoSNJypELU04r7+Cg2BG4tmC8MsNM6cJarFpJxyU/Sa3tQJzjWis4gmRxj
	elMAZ2sjd7DH6Pc0RLgxlo4YmDwxprZTCBzdKG08NKNd5zN0JxV8O1znVy3EhUodbYm8Ed65DEH
	oI1ZYkJQAhQ5YW4dYQ5qhWcoVhow4nRbnWb1aoKf9WtCctTMMkdxJOuXpHiVaSd9HaJwXTAPJss
	rTr3eCoMJB6J6f0tgru4eGy8WstO1qTok+Co0hz3GW7m6rastkwWhWlJKtgpriUq5E/Iu3jE6tH
	asXYoCdhcKg54l1k7zDtZz/8raFcmX4AkCnPvWkPV1E9OXW0KFcNr1kri+55oYTHumCzfdJMgLz
	SiW3fa+wZ41SC1Rm5xGvvTK2reqSWoFEiTkR7pA2GU5+svgnKwYv4daDteIwyX
X-Received: by 2002:a05:6102:d8c:b0:610:1c78:9531 with SMTP id ada2fe7eead31-637761505a7mr1462582137.24.1778679531551;
        Wed, 13 May 2026 06:38:51 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95f21a274dbsm8910583241.7.2026.05.13.06.38.51
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 06:38:51 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-95f61c1ace0so1958220241.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 06:38:51 -0700 (PDT)
X-Received: by 2002:a05:6102:2924:b0:631:b365:40f6 with SMTP id
 ada2fe7eead31-63775f441f7mr1566639137.23.1778679530826; Wed, 13 May 2026
 06:38:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260502185557.93061-1-marek.vasut+renesas@mailbox.org>
 <20260502185557.93061-3-marek.vasut+renesas@mailbox.org> <CAMuHMdUXjwyVk2kuGAJOdPHw=qv_iwO2pSR3Rp+5ayoP2QG25w@mail.gmail.com>
 <c4e6e48d-9a8f-48f0-8666-22efebf86d8a@mailbox.org>
In-Reply-To: <c4e6e48d-9a8f-48f0-8666-22efebf86d8a@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 May 2026 15:38:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUVAXZtWAUn5fDgTKszHh7voQMJMyPBxbUiqOYRSfzCzA@mail.gmail.com>
X-Gm-Features: AVHnY4LU1BBWpNxE_fkGvk4Rs-4viEWKSh1Rjw7iIL0Qt5GSNDkgP1kR7U3ItzU
Message-ID: <CAMuHMdUVAXZtWAUn5fDgTKszHh7voQMJMyPBxbUiqOYRSfzCzA@mail.gmail.com>
Subject: Re: [PATCH 2/4] clk: renesas: r8a73a4: Implement ZT/ZTR trace clock
 on R-Mobile APE6
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_063853_108928_CEB40370 
X-CRM114-Status: GOOD (  27.82  )
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

On Wed, 13 May 2026 at 15:37, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 5/13/26 3:15 PM, Geert Uytterhoeven wrote:
> > On Sat, 2 May 2026 at 20:56, Marek Vasut
> > <marek.vasut+renesas@mailbox.org> wrote:
> >> Implement ZT trace bus and ZTR trace clock on the R-Mobile APE6.
> >>
> >> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> >
> > Thanks for your patch!
> >
> > /sys/kernel/debug/clk/clk_summary looks a bit off to me:
> >
> >      zt                         0       0        0        208000000
> >      ztr                        0       0        0        277333334
> >
> >> --- a/drivers/clk/renesas/clk-r8a73a4.c
> >> +++ b/drivers/clk/renesas/clk-r8a73a4.c
> >> @@ -43,6 +43,8 @@ static struct div4_clk div4_clks[] = {
> >>          { "m1", CPG_FRQCRA,  4 },
> >>          { "m2", CPG_FRQCRA,  0 },
> >>          { "zx", CPG_FRQCRB, 12 },
> >> +       { "ztr", CPG_FRQCRB, 16 },
> >
> > 20?
> >
> >> +       { "zt", CPG_FRQCRB, 12 },
> >
> > 16? (12 is zx, cfr. above).
> >
> > I.e. the same shifts as on R-Mobile A1.
> >
> >>          { "zs", CPG_FRQCRB,  8 },
> >>          { "hp", CPG_FRQCRB,  4 },
> >>          { NULL, 0, 0 },
> >
> > After fixing the shifts, I get:
> >
> >      zt                         0       0        0        277333334
> >      ztr                        0       0        0        277333334
> >
> > which looks much better. If you agree, I can fix this while applying.
>
> Yes please. I can confirm in APE6 RM v0.7 that the ZTFC is at bit offset
> 16 and ZTRFC at bit offset 20 . Thank you for spotting this.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2 with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

