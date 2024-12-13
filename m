Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5EB7E77180
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 15:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=43Ur9i+9lJzhFNNc9nCq7jYHKY+JdnEg7pprLiaBgA4=; b=XShpUyu9CWOmbP
	9ToUqi7rd5/yyus6yENUbj7R1oqoT61QoEpgUrngDj8AaxjIBjCsCOXxCQQ0akq1glXrmYA8O3pHa
	ORBo2j04WaIInk9PgUI7iU6mEvDrDiP1Nu/zAUjHHeChnZ5v1AZ/AsV4UXRfW++cLAA61RskT/hZW
	aLxv/3UcnWMSxeTdw2Ap3M0JH8E3SzYvhKqmoKHrrhE/HTqfgDS893cbLWUnm1NuEYuQPxo7Bo1Uw
	otU9eWfuDBt9k9ACeo3yL7AfEeVVL88x5cb3s0LMRXHxuECEY0xuxB2iDY0sjGq3wEGJERMwMAICJ
	UeSe6EtpQOaaZCgTL5Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM7Kg-00000004EY2-1ByF;
	Fri, 13 Dec 2024 15:11:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM7JC-00000004EFm-3Zej
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 15:10:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B97405C6B67
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 15:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6D07C4CED0
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 15:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734102625;
	bh=7rGYYKks2MEAi+q8RZqhrYRZGipLH9Pjib1jzgb/fXk=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=mgg8RGr8gIjtj61OhTetZkA1d0aGvS4JT7KCZpCYNQDG2jzCy+Ml1Clx3hHlA9Y4G
	 QCJloxPBQB4s7QSs3XFhkziBrVo5Ffrdgd6pFJ+yJ2zNSgfLXufwVxtcUwL77xoJCj
	 deverJ7wwOzwL2dHfFG5PVjhNVFLRfCJwH8Edt5TUeJale+JlHUMxgBKvHaflnwH6k
	 udpURyFhiZyNwh7lWWc9KXK6nTGPVX+q57g72weRLCs/k10h61sdyiKASYwmlv4Y9h
	 bcNjNa9fZwDzjCZ+oFPobiKbhbplIHAhxhmoaGlNJ1ooQ+NqPjjYZZWazuubNdohWi
	 wkp3WKBCh+bGQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30037784fceso17059661fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 07:10:25 -0800 (PST)
X-Gm-Message-State: AOJu0YwB6AKRnN/JJqfnOVX23WgSDEayVBF+Y3xBJj8FrloxayZ8jMz3
	KmZg5Bu6MDJV3B8ydeDaSpi/qsz/BsAOKum2kKL967qO6vjCiLGTb35ZIslQr0rnbCufkVSTj4u
	Jib/scM7dlIn8U51z0eH/zLO0IZQ=
X-Google-Smtp-Source: AGHT+IGDFvr2zsjfqD8NaCsTVvFuyZlBxurx6y5trjl6JqR98HwSzgFaX+Zrs452OMiQuLpq6Zp9nyogMDd0TgQVXRI=
X-Received: by 2002:a05:651c:1994:b0:300:3a15:8f19 with SMTP id
 38308e7fff4ca-30254611fafmr13669331fa.32.1734102623974; Fri, 13 Dec 2024
 07:10:23 -0800 (PST)
MIME-Version: 1.0
References: <20241213141037.3995049-1-maz@kernel.org>
In-Reply-To: <20241213141037.3995049-1-maz@kernel.org>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 13 Dec 2024 23:10:11 +0800
X-Gmail-Original-Message-ID: <CAGb2v67vgoZr_1T579SrwG9UvNs0eRfT37Qk_g2k7Z-mRfEXNg@mail.gmail.com>
Message-ID: <CAGb2v67vgoZr_1T579SrwG9UvNs0eRfT37Qk_g2k7Z-mRfEXNg@mail.gmail.com>
Subject: Re: [PATCH] irqchip/gic-v3: Work around insecure GIC integrations
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Mark Kettenis <mark.kettenis@xs4all.nl>, Chen-Yu Tsai <wenst@chromium.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_071026_986472_92010A94 
X-CRM114-Status: GOOD (  26.88  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Dec 13, 2024 at 10:34=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrot=
e:
>
> It appears that the relatively popular RK3399 SoC has been put together
> using a large amount of illicit substances, as experiments reveal
> that its integration of GIC500 exposes the *secure* programming
> interface to non-secure.
>
> This has some pretty bad effects on the way priorities are handled,
> and results in a dead machine if booting with pseudo-NMI enabled
> (irqchip.gicv3_pseudo_nmi=3D1) if the kernel contains 18fdb6348c480
> ("arm64: irqchip/gic-v3: Select priorities at boot time"), which
> relies on the priorities being programmed using the NS view.
>
> Let's restore some sanity by going one step further and disable
> security altogether in this case. This is not any worse, and
> puts us in a mode where priorities actually make some sense.
>
> Huge thanks to Mark Kettenis who initially identified this issue
> on OpenBSD, and to Chen-Yu Tsai who reported the problem in
> Linux.
>
> Fixes: 18fdb6348c480 ("arm64: irqchip/gic-v3: Select priorities at boot t=
ime")
> Reported-by: Mark Kettenis <mark.kettenis@xs4all.nl>
> Reported-by: Chen-Yu Tsai <wenst@chromium.org>

Should be

Reported-by: Chen-Yu Tsai <wens@csie.org>

(I know it's confusing, I even mix up inboxes at work.)

> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Cc: stable@vger.kernel.org

Tested-by: Chen-Yu Tsai <wens@csie.org>

My RK3399 boots normally with pseudo NMI enabled with this patch now.
Also tried NMI backtraces through sysrq, though I'm not sure that
always goes through the pseudo NMI path?

> ---
>  drivers/irqchip/irq-gic-v3.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
> index 34db379d066a5..79d8cc80693c3 100644
> --- a/drivers/irqchip/irq-gic-v3.c
> +++ b/drivers/irqchip/irq-gic-v3.c
> @@ -161,7 +161,22 @@ static bool cpus_have_group0 __ro_after_init;
>
>  static void __init gic_prio_init(void)
>  {
> -       cpus_have_security_disabled =3D gic_dist_security_disabled();
> +       bool ds;
> +
> +       ds =3D gic_dist_security_disabled();
> +       if (!ds) {
> +               u32 val;
> +
> +               val =3D readl_relaxed(gic_data.dist_base + GICD_CTLR);
> +               val |=3D GICD_CTLR_DS;
> +               writel_relaxed(val, gic_data.dist_base + GICD_CTLR);
> +
> +               ds =3D gic_dist_security_disabled();
> +               if (ds)
> +                       pr_warn("Broken GIC integration, security disable=
d");
> +       }
> +
> +       cpus_have_security_disabled =3D ds;
>         cpus_have_group0 =3D gic_has_group0();
>
>         /*
> --
> 2.39.2
>
>

