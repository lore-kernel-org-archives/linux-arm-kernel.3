Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EBA606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 19:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mio/Wgh3;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k1I1SJsF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5v98+mkBPyKcXGGfAa45H0MLFavlwhFEg5B6g7hFf9M=; b=mio/Wgh3FKYc2c
	PhVv6f+MUHY9jIzye4y1LTGomF86ZARa4KCA8Cbh6rAUBy2hT0jZ+R/bV9gS6+TGkFquubCX7IFGI
	13qGEfmmhJ6iSUERzxaRaRvBe/7vh/x1+qqZKytw5VpUD1pO9mL7fetR3QUXhAT1cZR5R6bzVXsD1
	Uec8XqLPLn2AvPtaaMq1iJTvZW75NUCKB4B4iBukPfM/8/fbgOfSX/OymisY8yKgMZ/C+h5DD+ab0
	8qY2opelPZTsXcveg7yu4qkHN6HYPKdnYmkajUkvwZ9WugP8+5hnNjvMuuIQIVAMHgheXCDRBl6YW
	7Fttowdk4yJtrFeRkUqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQqo-00000003CPb-1hRD;
	Mon, 26 Oct 2026 19:59:22 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQql-00000003COc-2DAQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 19:59:21 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-7c33cc572e6so226679137.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 12:59:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793044757; cv=none;
        d=google.com; s=arc-20260327;
        b=nUTWnAtLK0qsUPDHqOffGRe61fNxY+AHrnL9bJMnv6rG8zxDMg3BEMqS0zPh2EKJsI
         TdNroCWWGUsGl7pSNEbY2SOeOLHP9rN0MexYDPZHkQzp4Dta187ceRZR+I16wUePX7cg
         oI0aXj30VtKM1faaAvLdQDPpItEa5ASKLakPN+xQDqyGOK+a+OQbVL7kQ8Iw3aMNB/o4
         y/Z5gKnxEYn7CiPBQfpa4fPvYzGPkVZ28oq/30UHIQSgf3ED3F43EHTyuc33cEy0Ipa+
         kinYr5dcEOFv19yXnlzIiFnPaF68xJp9HorElwFQuuzk+PFaw/oRrhYODhrZQT1O8coA
         ewug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5v98+mkBPyKcXGGfAa45H0MLFavlwhFEg5B6g7hFf9M=;
        fh=1mNuJxKvtdwAfAY7PqmzKyuPofzSTQpIrpaH6ZerBRo=;
        b=kg7T0mq8nYktH+7IHVTbT1rABtQO3tJ9RB7vyynSVSWB4jh01W6/7+i45J9K4o5UOV
         D9+Yj3kA/GWhT5QamvmgTtbt8cxE/iv0KgctQdwIdi+ZACyEREvKA0ymuz7K+iG11h7t
         Xtwdpdgvcs9lIJ9KSmA5SAq6y5hSsy0onEPDWYlZUIe1ZzHJlsnUBcP4rWtM+Vs5/A2x
         X30s20Vt0XE7/mabyKOmMU87tVAFRfN5+5JSSzxQwaSZtf4LGvAEyM+Eeq5mviutQCI5
         hSIXIpNzBRcg0YsTQ/+IvjDhx8Op/PmMIoVFirZe8LGEAqUiFUFN56w813Hib41re64G
         CM7Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793044757; x=1793649557; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5v98+mkBPyKcXGGfAa45H0MLFavlwhFEg5B6g7hFf9M=;
        b=k1I1SJsFwwFODi7tjSScEysWnsLK+MtSbrDvhh1zhTGSIOC8uwARDhX0c+QXvGxuo0
         LtQllViZZnuAcKqqLszo68h4xi38rH6GxdD449bWneRMXBm/JTjzfI65hQlgwB6WJNJe
         +zxOX3TFMT4XZHTchRnlt2TVKeTV+EWBL1pSLinfpMhwxBFxr0oHBqBt9+Ip5EXUIwei
         iKIaD8TgSw87vnK/lfPTVT7ZbeIyvLwkFkomgZvtBOYVm009mMJY1yjoeLpqwb0CCrLV
         qiNYRx79am2z7DxvRMfMEgcdXSdV/zpaxta1nu2W3wkF8MgKC0VxJT2A47ebHUI71pJP
         GrLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793044757; x=1793649557;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5v98+mkBPyKcXGGfAa45H0MLFavlwhFEg5B6g7hFf9M=;
        b=BnvDZpgcOQJgveo6khFT73mq6r8wP1T2prwgiWvrmQJ65lKTKB3ZzJGDmRaU/whGpS
         FpUenOxDBoOLFEpHCq+gy1yQ5YX+oD7RO9Uypu9QzAiR5bhJiaqmi6P0+AR9qQQqG4Tf
         TXdruw1I56LpVr7VtareS0t+q/+1GIDEHfZbsjVxWq3S6FLqEk297D6liJllRiiMR5cA
         rYDpn28cbfnPTVjKZreOLqIRksfjiluMbvAeDyQeOI0+gqkdEqFGBQTwwPeoODceHZLx
         8+Jfbwue1bQ2AnfV7yDoHng1cK4VCk9hCUb+N9CBjNjEoZyhV68IN/7r5LwKvv2gqlqS
         XAJA==
X-Forwarded-Encrypted: i=1; AKwUvBxbcJFOdF4yqF735LwpcN/zRYgZwZv+gi4m7WKRK78SH4RPlJTu2JJPO11MpdsnMUfSmaiSPTu39PAHDpe3hzo4@lists.infradead.org
X-Gm-Message-State: AFq9FYJIWB8OXhmkKrgoDfVom6wBVLSnZsytskSxxz+a7oFzbLA5ez1N
	3e/eN4ecukN+XE+iHFp4rIKlpm6n/dlhdtVDGrxMTOeYGwYwLiGXnepVHf1xWhavQoq5GbT+xFp
	V0qX3W20WWHqNQ3h26/bB5fNWqgopAU8=
X-Gm-Gg: AYBFou09IB9E+z4RkrUbRd6jb76oZyf0NG+9rbsZLSxloBzgpeUD8tfayOBlD+oPW7z
	JBZI6iBwcIgzMcyj8kMBTC0B4r4uek6sVfBKJAteH7gvkPkNzlcrG/j8JyvHPxEKUaIOxPDNp/u
	hWv3LMENvnfcOPOkrZ+Xrkl+NbcOnZIR8+4juzBY8KPbdff09oxEUp3LBiuAKVo8Eqx+f4818hx
	GL0SZIA2Vgfx177C4VSYPmMvie84XLpqSDLAS6u8uM1BA760pQI7TNk12CS6oTdvSkA2en9pUfa
	5NnFrEYgZ8O5nRkTHSwao6kEPXmxxA14LB8Ziv8R4VsO98H5OV3cq/b2BHgLzKv5LUJhNZBZz75
	bSCU4c52lGsn3V8TzB1HcGqARSsUyydDT2HAfYltTGNgRmWhukko6Hyv8bBDJan440JYXXpWaUv
	LAXtq1E+J4p4uTd6mCDkFeFX8ggEJrpgEAiu+tDVQahcLIPgJnUmeGz14D0q11hro6gMWgW5gwf
	wrYeDOaukEpwrYpX3vSae4O6rFsew==
X-Received: by 2002:a05:6102:3e8f:b0:7cb:bd9b:4873 with SMTP id
 ada2fe7eead31-7cea14fad38mr297588137.21.1793044757153; Mon, 26 Oct 2026
 12:59:17 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261024-submit-serial-8250-dma-cancel-v1-v5-0-9e52968928d2@gmail.com>
 <20261024-submit-serial-8250-dma-cancel-v1-v5-2-9e52968928d2@gmail.com>
 <alpine.DEB.2.21.2610250459200.42255@angie.orcam.me.uk> <at4bw-G8czG-G7Wl@ashevche-desk.local>
 <CADvTj4psJcY2T1PG9H8_hJWjz62R7unj3PPgv3FrVquUMFVhGg@mail.gmail.com>
 <at5qKehogAjTa-fA@ashevche-desk.local> <CADvTj4qSgE6Rc--mWuqAcc8HTqN9EFOS_JM8Hp8e_=ka_ZLa6w@mail.gmail.com>
 <at8eDFj2WNaXDaot@ashevche-desk.local> <CADvTj4oNz-bnSZP+kfau-7wBSWLjLTP5jrr6nLfdCHNPo3pS6w@mail.gmail.com>
 <at-vyZ1sDhYPu0W5@ashevche-desk.local>
In-Reply-To: <at-vyZ1sDhYPu0W5@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 26 Oct 2026 13:59:06 -0600
X-Gm-Features: AclHuK-pkQBp3tukGM9FdJ8ekfrjzUqdLwbnUIKbAlyu-Q9paOfNaII7ApJtovI
Message-ID: <CADvTj4o_CENc3i92OQEZudOErSKPUptT4t2CCqDaGbseuK0QcQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20261026_125919_585410_4109E359 
X-CRM114-Status: GOOD (  38.70  )
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
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 1:53=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Oct 26, 2026 at 10:45:54AM -0600, James Hilliard wrote:
> > On Mon, Oct 26, 2026 at 3:33=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Sun, Oct 25, 2026 at 04:11:08PM -0600, James Hilliard wrote:
> > > > On Sun, Oct 25, 2026 at 2:44=E2=80=AFPM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Sun, Oct 25, 2026 at 02:25:46PM -0600, James Hilliard wrote:
>
> ...
>
> > > > > Some people might want to test the stuff. And sending too often y=
ou actually
> > > > > will get the opposite results, people will be tired to even start=
 reviewing
> > > > > and/or testing your code as it's changed way too quickly.
> > > >
> > > > My thought process was that people wouldn't want to be testing code=
 that
> > > > had known bugs flagged in Sashiko reviews.
> > >
> > > Sashiko reviews are not visible in my or any other mailbox. To see th=
em I have
> > > to go to some URL and so on, meaning to waste time to see why on the =
earth the
> > > new version has been sent.
> >
> > Maybe the Sashiko reviews are getting caught in spam filtering or somet=
hing?
> > They are showing up for me and on the mailing list[0] so I'm a bit conf=
used why
> > you aren't seeing them. You shouldn't have to go to the web interface[1=
] to look
> > up the reviews.
> >
> > [0] https://lore.kernel.org/all/sashiko-outbox-183574@kernel.org/
> >
> > [1] https://sashiko.dev/
> >
> > > It's better before addressing Sashiko comments,
> > > reply to all people involved and to Sashiko's original email, so it w=
ill be
> > > visible in the previous version why you issued (actually about to iss=
ue) the
> > > next version.
> >
> > Hmm, maybe it makes sense to enable recipients in the reply_to config[2=
]?
>
> It's up to the list owners / subsystem maintainers.
>
> > [2] https://github.com/sashiko-dev/sashiko/blob/v.0.6.3/projects/linux/=
mailing_lists.toml#L290
> >
> > > And before even issuing it, wait for a while, people might
> > > disagree with Sashiko judgement or your replies on how to address tha=
t.
> >
> > I was assuming everyone was seeing the Sashiko reviews getting posted t=
o
> > the mailing list already. The are ending up in lore so unless someone i=
sn't
> > subscribed to the list I'm not sure why they wouldn't be seeing those r=
eviews
> > already.
>
> I assume you already answered your Q. mailing list in this sense doesn't =
mean
> recipients. I think it simply goes to the mailing list without forwarding=
.

Do we want those reviews going to recipients as well as the mailing list?

>
> You can ask at helpdesk@ how this is configured on the kernel.org side.
>
> > > TL;DR: this mailing list is *not* a playground with you and Sashiko, =
the whole
> > > community is behind it.
>
> > > > > Settle down first
> > > > > with something, put on the cover letter the answer why not all Sa=
shiko's
> > > > > comments are being addressed (for example, due to amount of patch=
es or the
> > > > > series being focused on a certain issue).
> > > >
> > > > So, in general I've been always attempting to resolve known Sashiko=
 issues
> > > > in every subsequent re-spin, so that would be a bit tricky since I =
wouldn't be
> > > > aware of the Sashiko issues until after the series has already been=
 sent.
> > > >
> > > > Usually the subsequent issues that get flagged are new issues only =
discovered
> > > > after each new re-spin.
> > > >
> > > > I do have a bunch of UART/DMA related patches that don't have flagg=
ed Sashiko
> > > > issues so it probably makes sense to try and review those first whi=
le the larger
> > > > series that have Sashiko flagged issues are still stabilizing.
> > >
> > > Yes.
> > >
> > > > > > [0] https://github.com/sashiko-dev/sashiko/pull/389
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

