Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCA1606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 16:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GqC3tSHi;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Q8K09W07
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sbR6KDZ54pfKvX4mBD6E1CqiOyZSCDGH5Y/Tf8ZG/yY=; b=GqC3tSHiwNq0MC
	vQYHOhiBen7t5Kvl5LTCWqANvgB5LL+6V45vz0sA5OdnflKPNkInoIvQ0s0bsNFRZUN7PU5IUD/2k
	n4JcLD4PR4ds7LYrCVtQEkXgH623FpZe/L/vd3urJlc9jkHOSr5P+9QaA2hWu6B02e0xUS6DMTE9E
	FEPgnaDDTCo2BXnpMiNvonyRaBhcXzMJR81wYCNXP8n85/jU/yDCMb5Ky/OIa8/SKCGssyc8Q4x9U
	rjeSUmDVJqnpKXeq4di/ZjMwwo5yDP/qPjyZHs1CmvVGsCURKbWEJss6MU9g0ZMEEaOk9nCe0NXaG
	Ch1wh65+o7q0iL2vMDwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLNps-00000002v6G-044B;
	Mon, 26 Oct 2026 16:46:12 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLNpp-00000002v5J-3amC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 16:46:11 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6b1aa377c61so4168625a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 09:46:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793033168; cv=none;
        d=google.com; s=arc-20260327;
        b=UCw7xvAIOuWLoNnPHrB+h+wq/QDafd9LOhSsx0Um2g53cFBXm7z1IVlA8yZD7uhQic
         ljel7Rsqe59trwmkPquJilyhQBIDFROUjaWuYEfcoWQgXjbZR58Rc7A0O9JcSf8bG3cx
         SK815eKskReLWJI8cK34Nl5UcaborZU0Y9t1IqMF9ocKzfe6Kk7fFjR9MpjPSzF/ag4w
         bMRDK1BBCrEe/kGuuuGUQV7Ochg58wPqDIBcjrtE0lLEWxU5Ux+r5boEFEYT/xvR4Vhk
         qoXCBafWO8h7Nd0SYRX81lKLmAPI2C4cCvClsx6OtA+ylurTEZMuKbA3BfThWnhyoAiD
         B6WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sbR6KDZ54pfKvX4mBD6E1CqiOyZSCDGH5Y/Tf8ZG/yY=;
        fh=x3vd5r1MJlfVDFKD1w5h4IELCYvQ/CQiGHcKYXoXZ9k=;
        b=povZwgByL9LuL+Akp6sGAq7LB2wRVE2bLfuBHRtOaagrL+pC2JhHMJTe+T7UA+7IO5
         000m3WOulVEmmFvk3K5Kwf9ghwJpRTkzZdpV0r3J9Wp7m07s0Qf9drUwwAS7AlGbyXP/
         35ZrNoikx3bsE3+X8d4sMPvsUbttWmRgubG75xHb1opJVfMgVp/6cCM7a+CA//B2gnu/
         tsXq1IBNXXjhJlyFOe3ozVuEpFjkm06MvyGh2MPsh9JX4idfDx6WgV4bx1KrVXqzD1xQ
         AntfMCoAIOk7PFLnPdhSV65/g5/beaeDQXE9KqPpUacI8XmS4F0dPI40a1F4FYV+twcD
         hK7Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793033168; x=1793637968; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sbR6KDZ54pfKvX4mBD6E1CqiOyZSCDGH5Y/Tf8ZG/yY=;
        b=Q8K09W07Yr46glxbX26+kXo7ibptFGH8IBWSbLPQA3WXAqXlG6wec9jA48jLKYqWUN
         cvKRU8xX/TI+mAy2k3sCQM3h9gFCqbV7Q1xOg1aHU2IbOzPGNm+Tb0dnz4sp69Iqk8sd
         2qpPL0oEF3oeHxeEdWEjqfnni8VhdeizQAJFSvZek2JYcFEtSLw1tZJStgDDhIutqFcw
         tTFHJnCmLzXaKrg3A0n7XhpwFni8Xc/U+ifkINolwlpOg5Ag1Wfxr9hgLbsYGRbB6Xcb
         bJA8aw4pP/hywPfx4Pwt0OC6Tj+7P4wngrDWnxWUUHZ3eDTn2FcV3aw254O954i7QIRg
         CJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793033168; x=1793637968;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sbR6KDZ54pfKvX4mBD6E1CqiOyZSCDGH5Y/Tf8ZG/yY=;
        b=26RWvliWojHzaz0q+5NAD9nrQk8hZy2IphYjCbfXOkIH0Qx9cB4G3BiLBWmv5IYilT
         C/BllzM/FzZD9kaqNnguRV18OAewDi03TJaXw+Y5mtia8qo9q3bU4zgYgMdH1NzXU72B
         V3eVaznG0sk63eZ+yD5sfwcKBqQLeu62/oUucNfKPKfg92EqCjjajNDMW7q6doIkBwMb
         7qdiX0NImBq4V4nnQu2G30KBmlvyfNntlNLmHa/NMLkHQCE5WyyxbCEgC9pEmLuYSHey
         Oxn9YakcNezX9DswW5eYUgJHW3Ie9AQ921phtwMxF5kkwKimpCXDGQ99cRp8ZlsQdA27
         eZdg==
X-Forwarded-Encrypted: i=1; AKwUvByj2QxiM7+sSlcJhJDWbsetoeINV69ukVVWAK5eYHFftKTlvVtcgWBtKAQAq7PaH1F/K4wDcPpEpodW7r6aO0Uq@lists.infradead.org
X-Gm-Message-State: AFq9FYKkGRuvmNm35VUMkZF3AqclFPW/wnpuKv/QqQr0xylr5zqH30PV
	B54K3X7XF85NHnR/M3ZmlM2oHYJvuAg7JqnqXddASa06J3Z+2HogPzjzciAbURkh4UnTupkBkNv
	CrgnFsCOFluXxgxGTD+NX063JWdzGfgQ=
X-Gm-Gg: AYBFou3x7OAXtzVK/kAqPBrT5sYWU0KtsL/KZIjdKxVnPwwjE+v6oQIgFxgEXDLtvAz
	p3JN5sX2v5akZtO0pcYTBlGtQD0OgvDskUpcAA2FEAWsrIbine++ISXOPUQq6GQcc0aKHoDIs+g
	r3pMXFlTby7Z4MDp4qQHnk94IiX+pVA0gCRGMD/nVPr5K3pGQMKnHetxJiUdMwR0v1dp7deNwyA
	/1xY59opGNU6ayzgugWsFf9eBVLP6IRPPnehoa1CN6K/iu5XQydRcJMFeqLRqlI7m+tMknYJHzQ
	8VB9q7qfWnuFBzFTVNJk7HQW9Vftc/LF8Sf1Wykrg8uAXCF6x0PPEl+qKmhnSMeS+KdeT1SO41u
	UZ4rx/snJKlePosprONX7vM9tsRtgopPoUj5CCDXaaJYRGuqd8ddy1V2RSOMEqlM24DoWDMPNxc
	RFzY2iEPIiZKRghzdl/tMGSmV6bqCMonWBMSwoFj4BzvXrgCa6NFd+GhMv8//I0FUGiGDxjrQPQ
	hr2UlcLF8wOPzc6ACr+eIeegXzpihhhdo9IyV/rWqUhsumEzLQ=
X-Received: by 2002:aa7:ca44:0:b0:6b1:b611:a2af with SMTP id
 4fb4d7f45d1cf-6b442ff2fd3mr6024136a12.20.1793033167557; Mon, 26 Oct 2026
 09:46:07 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261024-submit-serial-8250-dma-cancel-v1-v5-0-9e52968928d2@gmail.com>
 <20261024-submit-serial-8250-dma-cancel-v1-v5-2-9e52968928d2@gmail.com>
 <alpine.DEB.2.21.2610250459200.42255@angie.orcam.me.uk> <at4bw-G8czG-G7Wl@ashevche-desk.local>
 <CADvTj4psJcY2T1PG9H8_hJWjz62R7unj3PPgv3FrVquUMFVhGg@mail.gmail.com>
 <at5qKehogAjTa-fA@ashevche-desk.local> <CADvTj4qSgE6Rc--mWuqAcc8HTqN9EFOS_JM8Hp8e_=ka_ZLa6w@mail.gmail.com>
 <at8eDFj2WNaXDaot@ashevche-desk.local>
In-Reply-To: <at8eDFj2WNaXDaot@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 26 Oct 2026 10:45:54 -0600
X-Gm-Features: AclHuK9i3gJhID1qYhY2EyC-ofDyvA_hJVRAckf-dNWT3ME93Ru8v8ikGWkk384
Message-ID: <CADvTj4oNz-bnSZP+kfau-7wBSWLjLTP5jrr6nLfdCHNPo3pS6w@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] serial: serialize asynchronous write wakeups with
 the port lock
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Raul E Rangel <rrangel@chromium.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Tony Lindgren <tony@atomide.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Richard Genoud <richard.genoud@bootlin.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	=?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Timur Tabi <timur@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_094609_935147_4AB68B63 
X-CRM114-Status: GOOD (  31.90  )
X-Spam-Score: -0.8 (/)
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
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 3:33=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sun, Oct 25, 2026 at 04:11:08PM -0600, James Hilliard wrote:
> > On Sun, Oct 25, 2026 at 2:44=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Sun, Oct 25, 2026 at 02:25:46PM -0600, James Hilliard wrote:
>
> ...
>
> > > Some people might want to test the stuff. And sending too often you a=
ctually
> > > will get the opposite results, people will be tired to even start rev=
iewing
> > > and/or testing your code as it's changed way too quickly.
> >
> > My thought process was that people wouldn't want to be testing code tha=
t
> > had known bugs flagged in Sashiko reviews.
>
> Sashiko reviews are not visible in my or any other mailbox. To see them I=
 have
> to go to some URL and so on, meaning to waste time to see why on the eart=
h the
> new version has been sent.

Maybe the Sashiko reviews are getting caught in spam filtering or something=
?
They are showing up for me and on the mailing list[0] so I'm a bit confused=
 why
you aren't seeing them. You shouldn't have to go to the web interface[1] to=
 look
up the reviews.

[0] https://lore.kernel.org/all/sashiko-outbox-183574@kernel.org/

[1] https://sashiko.dev/

> It's better before addressing Sashiko comments,
> reply to all people involved and to Sashiko's original email, so it will =
be
> visible in the previous version why you issued (actually about to issue) =
the
> next version.

Hmm, maybe it makes sense to enable recipients in the reply_to config[2]?

[2] https://github.com/sashiko-dev/sashiko/blob/v.0.6.3/projects/linux/mail=
ing_lists.toml#L290

> And before even issuing it, wait for a while, people might
> disagree with Sashiko judgement or your replies on how to address that.

I was assuming everyone was seeing the Sashiko reviews getting posted to
the mailing list already. The are ending up in lore so unless someone isn't
subscribed to the list I'm not sure why they wouldn't be seeing those revie=
ws
already.

>
> TL;DR: this mailing list is *not* a playground with you and Sashiko, the =
whole
> community is behind it.
>
> > > Settle down first
> > > with something, put on the cover letter the answer why not all Sashik=
o's
> > > comments are being addressed (for example, due to amount of patches o=
r the
> > > series being focused on a certain issue).
> >
> > So, in general I've been always attempting to resolve known Sashiko iss=
ues
> > in every subsequent re-spin, so that would be a bit tricky since I woul=
dn't be
> > aware of the Sashiko issues until after the series has already been sen=
t.
> >
> > Usually the subsequent issues that get flagged are new issues only disc=
overed
> > after each new re-spin.
> >
> > I do have a bunch of UART/DMA related patches that don't have flagged S=
ashiko
> > issues so it probably makes sense to try and review those first while t=
he larger
> > series that have Sashiko flagged issues are still stabilizing.
>
> Yes.
>
> > > > [0] https://github.com/sashiko-dev/sashiko/pull/389
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

