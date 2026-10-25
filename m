Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBCC606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 20:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Znfi74h5;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pIMos2BG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=C/RThAUA8B7cnZs887BkMxa6IkSw9Jpa0pELDADdrhA=; b=Znfi74h5zIjBjX
	YslRjabb9HaL3Xswioes8qZn8pUessVwryk3y1k+2q7evTqULmTaJ54lVz/UbLst53AC1edCTyOS/
	cUHvEIDNGF9maBkfgOroX9PKyFf0B+Sg4SCpKro0B1J/s3ZXr1memnINsB59Mhr9KmYfJD0gwR2eM
	UG09TQm9U4dIG4eHLawCBXeNimsWt4/iv433wR8aLGEs8JKnFOOmDYSHtLOoS24pFyTIN4OxQJA2e
	Tb3WmI+QMdNAmmZYhqx3SO7VFl0VauBqkIEcWX+ad8KmFB2v3r95HzjObi3rtYItgCD+wxRW/5X7Z
	SaoiC65+lIYgwV7q2PdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL4n4-00000001Pw9-33kL;
	Sun, 25 Oct 2026 20:26:02 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL4n1-00000001Pvk-2bCc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 20:26:01 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id ada2fe7eead31-7907f01e487so682594137.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Oct 2026 13:25:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792959957; cv=none;
        d=google.com; s=arc-20260327;
        b=oxmIV/vPPiPBcPaHORhg+T9P0ekYKjQlST0y81jfrQqqdfA+ub/GHOIu0S/6lmYmgz
         aDRe+QnwaRck/URNp5W90NiyTPC0PqxlT7t3ZzaO837xt7LrCwcSdYIG3kxWgoa9WED8
         mrLIRQxfuRSjDxdhvhYEQusRNjCjl3gdtZAFX3FPT42elXk1D74WWUQZ8hOUuapNzqJ5
         1dFvrWZjCSxvRe2MALhQ+hyPGyQdD6VRYtt+AcJSSkzhGNWHaf7KZDwH6+VpWILp15en
         xFS1M95nKC8ZBblBNwC7g+FtssOlvnhCxH1XQR8B/39Dy6I/ZX3Qdu6yWLm+7BvSnrus
         6jSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C/RThAUA8B7cnZs887BkMxa6IkSw9Jpa0pELDADdrhA=;
        fh=Muv3lCTyHqkdlm2LTUm2dGiE5XqLy58ySNqevnsF62g=;
        b=hpKyvNI1Ovpku7bdOyo90HOWpIm6KMMB7+x6ps3L+SxUBGYGbCnvYXcP90yoPkiU9i
         hTsEOIuf2q4fIz+0fsu8aIPkg+nzzLJ+B/Yx/2co8c0HKqex6JylxkdNZjmJNkjHd3/F
         9CVsF+FDBkhYovCafUJcTTWS6KJqh5xqQc/tYfR4KqtMnahu8pB0/NRYhDyyMkK/15Ef
         oNmqLlazSOsuR9WFqK0YACCLy3flFblg98laN+og31ScXs2H/qU7S3Z8JP6KF/tnnJn8
         evQ28FaUMQMyAhcXhmdrNTDfmdY7Ifob/qM6KV8MPKMUyTq/woCXgfxeY+4XLztfDHKj
         c1eQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792959957; x=1793564757; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C/RThAUA8B7cnZs887BkMxa6IkSw9Jpa0pELDADdrhA=;
        b=pIMos2BGwsKzgov4nopWSyMGccpqG9SnYsjr7ZeanoKPh6AWthCjIyaKiCjvFXmLwe
         c8cYQgkG49DIUKNjQ6GMcBKyt3gBuJH3IxoJlt2y9QyX5q30fRWipBJc4SQrTGv/EJN7
         TBmysVtuWW/+I24vWC5TywDzG3FeHuyXQ8rLtyNo7R6iKma3loSpsmA3x0T8NIyBEQmF
         6qrVvOZQehdW7ap2t5DlHZKeTTr3t0QrP4Y+mktV5PEE5X5yctu4TJygApKbPS9tc5dx
         2lzmbPBe6MbdQ1v394cVpH9naNqxFZ6nIbNC1dr8wMBnckHzqEh9aHWljoIjMhqzMS4h
         82+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792959957; x=1793564757;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C/RThAUA8B7cnZs887BkMxa6IkSw9Jpa0pELDADdrhA=;
        b=m01789adGj1G3pVG9mD7FT5lTDe879ESVu4gMJ+cvmd/S+9kGzKIsR210JZZc29l0/
         1ColhUgAlGW+NTfnzTQd5uSf2a+stmHP8BVO+LTtoJQ6TIFuECSYmMV0XXcZWKwI6kHh
         LtIQoa8tgmc6oYGhnaKbqQGwYFW46uJRUyi0C36x2VHHWtIbasKhoAGgp3fhf0YzsQNl
         cIVykjPlg8F/a18/1Msgiqi+GBONEc78KtIddSP6zhyW+Y2X0b2NHRAK9A3i43H59XXH
         P5eITLsLvGtkIFcOlmHZ0Cvq945v3vWDaaldUNmUntr1AJ9YcJU6/ChTeuUa3gc/0n8w
         vasQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHIMfdyS+UdVsBMsDoEZw35ZPsiLz5bKqkWLTsGdj6wDg+moOUQbpN1vXo8zvlytSV4ZeQq3xRTthoI1bunPOJ@lists.infradead.org
X-Gm-Message-State: AFq9FYIPzbC42K1+jYb/RcRzsLKPZEit3KZIakhpDo9h2JueN/rvsLJO
	V8SUvIFHXVkEhN9VLVnuHFU2YIT9kYaAwbMS0H4Vk3gq2PPYABnokoyPrO7tLSsWjN7cNLi/J3k
	AbWkNZY7RT9xxrxumKjoZwVvPDk0I7Q0=
X-Gm-Gg: AYBFou0yMIIMI7VVw6nXj1BvKUiuVAHyTvezJBvZUP+MThEo5pWNvMmcwiQhfbBUqu0
	lV+1CGhaLxyEYaHmjoDSyi5PNcPKlRXmEBJ7aPtBSeiuLMyIcn10ZfXmAnSW2iS7gXHscqE+VlZ
	LmnqlKxsXUN6XBsrAHkL8xQmqtjccA/YaQwE8yT/JpokWmXIFRuF0JppZsvpFZXxxQ/me/VepMw
	fMKnq4mv2+KLYDOAgwBRbwcBFwerHfEBTscwJseexuLMI+6zslWgcwmrLvX6FzqxIuAvDqiCrkR
	3cCOLCj20xNjxPn0B6dUnruifbUe55fnXv0brmrBgd9MNY/o6eLafuP49wTrkyk/8SMay7p2vjK
	05PdKIA0A6Xxm3/feTTcmiQ+hSvwKvBRGaSTcvboKgARBbDGKmoHCS4KjvRboBk6E2QEk2blQk8
	mLf8iTtq3YOYbwU/1qYcs0phVAMkDCL5ZEXTO1D5ALavK16fmdPold+9k5tWkbLwKLmkNm/kmTW
	U71jUUYAI+mLvhJ3le6kbWF68k/pg==
X-Received: by 2002:a05:6102:a213:20b0:7ce:645a:13a4 with SMTP id
 ada2fe7eead31-7ce645a802emr619643137.20.1792959957403; Sun, 25 Oct 2026
 13:25:57 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261024-submit-serial-8250-dma-cancel-v1-v5-0-9e52968928d2@gmail.com>
 <20261024-submit-serial-8250-dma-cancel-v1-v5-2-9e52968928d2@gmail.com>
 <alpine.DEB.2.21.2610250459200.42255@angie.orcam.me.uk> <at4bw-G8czG-G7Wl@ashevche-desk.local>
In-Reply-To: <at4bw-G8czG-G7Wl@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 25 Oct 2026 14:25:46 -0600
X-Gm-Features: AclHuK95EKPTnWE_5NOhWBwYmgu-dizSaKFvAkW3Q_P3x_TD5WYGvbT2T9PcLnc
Message-ID: <CADvTj4psJcY2T1PG9H8_hJWjz62R7unj3PPgv3FrVquUMFVhGg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20261025_132559_697928_B272B87C 
X-CRM114-Status: GOOD (  21.26  )
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

On Sun, Oct 25, 2026 at 9:10=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sun, Oct 25, 2026 at 05:10:03AM +0000, Maciej W. Rozycki wrote:
> > On Sat, 24 Oct 2026, James Hilliard wrote:
> >
> > > uart_write_wakeup() expects the UART port lock to be held. Several wo=
rker,
> > > DMA completion and interrupt paths call it without that lock, includi=
ng
> > > indirect calls from uart_handle_cts_change() and the transmit helpers=
.
> >
> >  Fair enough, and thank you for the cleanup and spotting the issue in t=
he
> > first place, however...
>
> He already issues a v6. I think the tactics against AI contributions shou=
ld be
> to not answer for a week or so until there will be a quiescent week.

At least with the workflow I've been using, a good signal for quiescence is
simply whether or not the Sashiko reviewer found issues.

I am feeding the Sashiko prompts into my local agent but it seems to
sometimes miss issues that get flagged by the public Sashiko reviewer
still.

I've been attempting to peel off independently reviewable fixes where
feasible as well to minimize the amount of patches/code during respins
as well.

> At least that's what I learn from this patch storm.

Whenever my local branch accumulates significant refactoring/changes
due to Sashiko or manual reviews I generally try and send out the new
revision fairly quickly in an attempt to avoid reviewers wasting time
reviewing code that is obsoleted by the new fixes/changes in my local
branch.

Locally I actually have far more UART related patches in an integration
tree that I've held off on sending for now since they are dependent upon
the prerequisite fixes I have already sent. My unposted patches actually
have an even larger amount of code changes than all the UART related
patches that I've posted so far, at least when measured in terms of total
lines of code changed.

The large amount of patches I ended up with seems to have mostly come
about due to the AI agent identifying most of these bugs while iterating on
and debugging new features(most of which are still largely unsent so far).

The strategy I've been using is to send small isolated fixes separately and
then reference them as needed in the larger series that depend on them.
I figure this should make the changes easier to review than having them
all in a larger series. I contributed the changes[0] to make this compatibl=
e
with the Sashiko reviewer actually.

I also use a custom AI agent controlled hardware in the loop test harness
which makes iterating/testing changes much faster since the AI agent can
autonomously test and iterate on changes far faster than is possible to do
manually. This test setup also allows much more thorough testing as a lot
of error handling or uncommonly hit code paths can then be tested using
AI generated fault injection tests on real hardware tailored to the specifi=
c
fix being validated. I manually review the final changes before sending as
well of course.

I'm constantly refining these patch development/review workflows as well
so feel free to give me any suggestions for anything I should change to
make review easier.

[0] https://github.com/sashiko-dev/sashiko/pull/389

>
> --
> With Best Regards,
> Andy Shevchenko
>
>

