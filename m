Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC275606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 22:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jqSNfowf;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DsOlmmZN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2OfqgWNLYUmZ1gnSmkRsn07TKyfZDdq4vI9UsfMbPGw=; b=jqSNfowftO/PCM
	MKtfMv++j86h5VI99wcK10K87CPCuweiLuFUd3oWDmSPfflsblO1x8nXHCjsgs7deQa1fevrT7Sll
	9cScla5JEX3uuf1hmX5mr0d/Q4AVY5OHDs6cKMpEDsvnDO9Py3gFNRFcBeOuCXUP6hqzf/N66sb8p
	WtP1I9ov1EKj1kNXbDAOqTlXMTxhINGklneAwKqqI2HE0Ser0oBA4uEyZFCt1zm5NcudihCCJw1vI
	zhXVUV5wyFMMNekN+mXmbepvrGLNMsR05GsUkqKE+BE6roZWrmr4cev6xc6Phk0ChFt2S6vagqrK6
	5oyFeld6k3z4z/AkuT5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL6R3-00000001Tg2-0LRG;
	Sun, 25 Oct 2026 22:11:25 +0000
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL6Qz-00000001Tfd-1BYr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 22:11:23 +0000
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-9906a5410f5so2631248241.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Oct 2026 15:11:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792966279; cv=none;
        d=google.com; s=arc-20260327;
        b=TP8d4kMOe6k13ENXgpbNJwjqiYcd7VogbgJjBdtZ2iFyAeEsh/h9i5Jj9GJufEGqE9
         dZwE2VaakyfM7FV+CPEpnUsCwx3tm33EQCJcoloal172aSdhm/Ntv7yaYQX+t4jfopar
         rfaNLrKvlCqqhX0GNTRgYvnImYIY6gBwfTT9tSguNmZbMnv5tsLmP7kpsH9t7fAvcOdv
         5EbHxC8c8Ry/Aeq2Ms3CgEzCkz3jErekcdEbSN+Dt4NKPo9LEMU8YA4nt9r4ti8dtU3/
         El/XLHhvNRrnO54Q3dhdzwadElqK1F92aYWpRLmuj12dRAn+WXSn2Ni4ZoLHf8IFGywu
         X5Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2OfqgWNLYUmZ1gnSmkRsn07TKyfZDdq4vI9UsfMbPGw=;
        fh=aGzXHgT2Ts0EL5eWdR/I9DC+FDexGzsZDctwFnTyxNM=;
        b=QyBdY66S3drdCeCJ2KSCrUhL702fdLsxfMd7YmgGmPMQzl25DHvz1WT/VacmOe6fgM
         +KMvnpfp/4D5JFXAnXJ9vJDnyK7xYIIs4aPNCo5BJkkv2KewH9x6vdZPILJXcxol5VI0
         YaRCzo6XlOkH4jSagycmA0+GJFn7sTuxtpNv7jPbzmy2ghBhYVdRmHPFrb8y6MUugQV/
         wIaas66cqwGAo44NrRukrl/hI+XP589XW3aUnKNsp6Z74fFQBICgmqoIJ0UvHn/5UAN3
         NXeqpjpoTRReccPRCn4Ua1/g3QARJC8EvAe4r/Rb5hMOzC5W+FTIwPrIlpr/0mZIsBW4
         0HLw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792966279; x=1793571079; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2OfqgWNLYUmZ1gnSmkRsn07TKyfZDdq4vI9UsfMbPGw=;
        b=DsOlmmZNu3PurFB13XBWD1vpR2rdGmGWmG/lFps5exVBPXg1QOMG7ZWW19UTFllBpC
         /Y13AjG5bbBkVGq7KPj+M9PugNV3rAN20koE1ObDBbCwlKVu1KO+lQVf7XlWqFUNacbY
         mb6UqVfdFt4WydCMWc7a06k9uradbp6ZPY0xgdGvz14L3CYdtEqyqa/sFsdmagWykuQx
         k5x2vzySlb7BPhmk9iFB70wkZjzNO0vyHXklhK/yZbXerFwtp1YQf7+h3ULJv8prf4nD
         unUoRs27mzvyQT64fp9KVZM4CqirgSSFMnKt3YEnnnbjInAMXXX+jJZDQXl5O4yE5dI1
         vd3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792966279; x=1793571079;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2OfqgWNLYUmZ1gnSmkRsn07TKyfZDdq4vI9UsfMbPGw=;
        b=u2tuxbBiZO67dNR1tJtQUmT/0NizV5HajNX1minSNl75MfBGJN7O5bIIKFhLLYfkd1
         K3xNkCsZy6egBtNF6/1WFlZaHAXAwK2flGBKIg5EYDYgJ2TKH4UIr/qMgPuwkhuKpu0D
         hLie0l68QYsUwvd3rioasgQDHGdrsMGK9cEPi59P8+aJlQWelgG34/rkgDAFxHoNfUWq
         7hBv2qJJiMGKGJj4ee42CpRhBxgPnbHfz+SjM0j2QaF3utQbWuZovUIqwnhmHAq2DLtL
         4hfQCHHRQBfBPcRSc9MDBU96PDb4AyvI2Bvf4mk4HBXD/SHpWu9iE1L1vrGJhxSQ1nP0
         B9+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxx9fFSTsfhEd2ucYOk9bIAu23AcNGTRURBFx6RIORB23Ao9Gm7fTgY9mbtjo0glBrL+TfNKVhnLJdFAkjiAoO+@lists.infradead.org
X-Gm-Message-State: AFq9FYIjil2zqJt1l5pBrHgoBP53SVIiQcM5ltRfE5FSAAkNoaHyxICW
	pYj1YpqyM2F2xc6bxjuB2lDeo1MlKzHIQUM32Ht7PYoCrrl7N327NF530SRR+sbG+/cpvqvqmna
	HwuksrpnMaTzI5txwpDhc5mQ+ZbzzcJQ=
X-Gm-Gg: AYBFou1v2pG3mPTGQAK6Fvx4SM5+L4R52vE4uQk121w8EYbQTgPVbnSlIBriTnUuT8O
	ezBO14Xu+f9OqJNsTwtFsg2S5VYzZgj6Rouk4xrOLhkQvh1t26pT8BOgzuv9zBSFLDKlkx2obaV
	pzvqqCzyjYQm7V0c1ViI1RWM0C3jcj+nMmatCpfP1n/xnlunIRcmUGWf7dd5PA8bHBFwneWoyfy
	tHYGj+VUYt1VbVfFWdEJ+LpHM5CXEsmV4W+fI/U1CN42sL8cxXZgto5uYVCVqHsiONwR6EcZr+J
	2cGnoZMT320rS4FexhZGnAIs8UTYBKTRQPp+wCldoUK16RNHmmlAlammQowd+d2lm+2rRr7Dt81
	i7UhWzkXORobgvt7p2d9lGKdnMAVRudOZW00v0JVaMwDc6DUBcCrcKtDcWAEnNhGytjgTkk3A9Q
	sJPeCf6soFXKyk37cVMYxaBfH4WBLn+IqFa3uTkMsvmgkLaNBcv4BdozQ0sE7q+0RcdempW/KAc
	RUnwJACAWbq4J/8eCPXZmxTYXpegw==
X-Received: by 2002:a05:6102:54a4:b0:7bf:8ec:4996 with SMTP id
 ada2fe7eead31-7ce5cd56791mr1192565137.20.1792966279613; Sun, 25 Oct 2026
 15:11:19 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261024-submit-serial-8250-dma-cancel-v1-v5-0-9e52968928d2@gmail.com>
 <20261024-submit-serial-8250-dma-cancel-v1-v5-2-9e52968928d2@gmail.com>
 <alpine.DEB.2.21.2610250459200.42255@angie.orcam.me.uk> <at4bw-G8czG-G7Wl@ashevche-desk.local>
 <CADvTj4psJcY2T1PG9H8_hJWjz62R7unj3PPgv3FrVquUMFVhGg@mail.gmail.com> <at5qKehogAjTa-fA@ashevche-desk.local>
In-Reply-To: <at5qKehogAjTa-fA@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 25 Oct 2026 16:11:08 -0600
X-Gm-Features: AclHuK8uppf4mumWz9vBy2Gysgc_7CSgy4TY8S57y0TXESxCvcndlkgEpAI5NvA
Message-ID: <CADvTj4qSgE6Rc--mWuqAcc8HTqN9EFOS_JM8Hp8e_=ka_ZLa6w@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20261025_151121_779688_390F6E10 
X-CRM114-Status: GOOD (  43.75  )
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

On Sun, Oct 25, 2026 at 2:44=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sun, Oct 25, 2026 at 02:25:46PM -0600, James Hilliard wrote:
> > On Sun, Oct 25, 2026 at 9:10=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Sun, Oct 25, 2026 at 05:10:03AM +0000, Maciej W. Rozycki wrote:
> > > > On Sat, 24 Oct 2026, James Hilliard wrote:
> > > >
> > > > > uart_write_wakeup() expects the UART port lock to be held. Severa=
l worker,
> > > > > DMA completion and interrupt paths call it without that lock, inc=
luding
> > > > > indirect calls from uart_handle_cts_change() and the transmit hel=
pers.
> > > >
> > > >  Fair enough, and thank you for the cleanup and spotting the issue =
in the
> > > > first place, however...
> > >
> > > He already issues a v6. I think the tactics against AI contributions =
should be
> > > to not answer for a week or so until there will be a quiescent week.
> >
> > At least with the workflow I've been using, a good signal for quiescenc=
e is
> > simply whether or not the Sashiko reviewer found issues.
> >
> > I am feeding the Sashiko prompts into my local agent but it seems to
> > sometimes miss issues that get flagged by the public Sashiko reviewer
> > still.
> >
> > I've been attempting to peel off independently reviewable fixes where
> > feasible as well to minimize the amount of patches/code during respins
> > as well.
> >
> > > At least that's what I learn from this patch storm.
> >
> > Whenever my local branch accumulates significant refactoring/changes
> > due to Sashiko or manual reviews I generally try and send out the new
> > revision fairly quickly in an attempt to avoid reviewers wasting time
> > reviewing code that is obsoleted by the new fixes/changes in my local
> > branch.
> >
> > Locally I actually have far more UART related patches in an integration
> > tree that I've held off on sending for now since they are dependent upo=
n
> > the prerequisite fixes I have already sent. My unposted patches actuall=
y
> > have an even larger amount of code changes than all the UART related
> > patches that I've posted so far, at least when measured in terms of tot=
al
> > lines of code changed.
> >
> > The large amount of patches I ended up with seems to have mostly come
> > about due to the AI agent identifying most of these bugs while iteratin=
g on
> > and debugging new features(most of which are still largely unsent so fa=
r).
> >
> > The strategy I've been using is to send small isolated fixes separately=
 and
> > then reference them as needed in the larger series that depend on them.
> > I figure this should make the changes easier to review than having them
> > all in a larger series. I contributed the changes[0] to make this compa=
tible
> > with the Sashiko reviewer actually.
> >
> > I also use a custom AI agent controlled hardware in the loop test harne=
ss
> > which makes iterating/testing changes much faster since the AI agent ca=
n
> > autonomously test and iterate on changes far faster than is possible to=
 do
> > manually. This test setup also allows much more thorough testing as a l=
ot
> > of error handling or uncommonly hit code paths can then be tested using
> > AI generated fault injection tests on real hardware tailored to the spe=
cific
> > fix being validated. I manually review the final changes before sending=
 as
> > well of course.
> >
> > I'm constantly refining these patch development/review workflows as wel=
l
> > so feel free to give me any suggestions for anything I should change to
> > make review easier.
>
> I already gave one: slow down. Better think than loop through AI and keep
> Sashiko busy. Your patches are valuable, no questions, but they are way
> too complicated to catch on withing an hours or a couple of days time fra=
me.

Yeah, I was already slowing down quite a bit. I probably should have starte=
d
sending some of these earlier but I wanted to see how my final integration =
tree
would look like first so that I could better peel out what was actually nee=
ded
as preparatory fixes in ways that would fit well with subsequent features.

> Some people might want to test the stuff. And sending too often you actua=
lly
> will get the opposite results, people will be tired to even start reviewi=
ng
> and/or testing your code as it's changed way too quickly.

My thought process was that people wouldn't want to be testing code that
had known bugs flagged in Sashiko reviews.

> Settle down first
> with something, put on the cover letter the answer why not all Sashiko's
> comments are being addressed (for example, due to amount of patches or th=
e
> series being focused on a certain issue).

So, in general I've been always attempting to resolve known Sashiko issues
in every subsequent re-spin, so that would be a bit tricky since I wouldn't=
 be
aware of the Sashiko issues until after the series has already been sent.

Usually the subsequent issues that get flagged are new issues only discover=
ed
after each new re-spin.

I do have a bunch of UART/DMA related patches that don't have flagged Sashi=
ko
issues so it probably makes sense to try and review those first while the l=
arger
series that have Sashiko flagged issues are still stabilizing.

>
> > [0] https://github.com/sashiko-dev/sashiko/pull/389
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

