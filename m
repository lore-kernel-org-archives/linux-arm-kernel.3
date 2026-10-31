Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87C9606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 18:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3Sb22pfl;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EBUqhIXH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ztiV5c0DfuFx8uDKCLiUp5o+ivOB8cWRN0pJNXnNfZU=; b=3Sb22pflIQ4lAW
	bMHeVQ6Db0tcjylwYrTxphV32hRUPKPkBX+r4BQzMeiEyOzd+c0NeUzfHMXFiY7X+eK57ribEGINb
	QkmWncSMeEd7BCfS9aUCIfAFBxEWUZH+Vq1Z94atWsgVKUM4Fi6mlZ6SVTAgrXVOahiB/0d2joKS7
	JIQcfq29GCJb88sRsTueioZE9x93DHCJpkHwb+RlU61Oj+5KeT1+gTRTHmWJ85M+ejMsEOnJ2wYni
	+tqQ7cykX+Ih1vY6nOEKpCkj3molelNaNnsoZPNfywgZIBmnvo6RNUNT6XyWgZ6+MYPmNYpqa7wVZ
	7S+fJ85SCo9eNxS9yDZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNDO8-0000000DYK7-2VKn;
	Sat, 31 Oct 2026 18:01:08 +0000
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNDO6-0000000DYJm-1u44
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 18:01:07 +0000
Received: by mail-vs1-xe32.google.com with SMTP id ada2fe7eead31-7ccae9f1a9eso973802137.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 11:01:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793469664; cv=none;
        d=google.com; s=arc-20260327;
        b=bnKF/DnC7qimWWlnsiN/WZZlqEqx6UpK1tid9CMG/TSYRPuPDWDiCS/Y3fE5bxcI3v
         MW24UgeIXgffVAecl39M9T7aFGTt5SRQliivByidZd8VXXj2Liv8l5CvGe4iXRTcJF4y
         wojPdFC3Ct1Jq8tOvQ1qVtH48A2qV/QtcgWhS88i8x1OGG/4N1AiN4hGEcdX72RvHh+Q
         jst6RSBU6mh3gK+hGnayxy1Gzz27juKYhr4/JXmtkouyp27MzbJMNPEbPbQPngdWUBt0
         7oRObWJMSsxwDc07JsrDfCPAunkJCUq/9UXpzEx/r5u9MgibmyCMFttLQt0KfFeQLtc3
         UmRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ztiV5c0DfuFx8uDKCLiUp5o+ivOB8cWRN0pJNXnNfZU=;
        fh=YfA2EvaIz5dF4Ks5kYS15pDhKLDEuy6KfHPZ2AFz584=;
        b=B7F9D+Qb4IeJnuYN+CxL3QfsxJGbZ30ObqgDw9lpWwibpiWlzV/uVeic5OozR+WMxW
         hBnp5K1kld8aYsNm7lDGqlUvIg/0fXeFXwCI8N9u21e9kM7MA+kcWMdiaMjKTRMOxSv6
         yrzLFJpW6XM/VPXxMNplrSOoPV5MctrQ7vJwcBV6bMmR8Xk2aaP4BmMydsZwm/Bsaj/M
         VLzUrwhFP5ts+M7oJQ83XkD9HUsH0nfIuqHnlCRBSjRXLIefpk5zkhm+Rm+mWBO2Q4k7
         w6uyD62p7FMELazaa0xuRV5xejiUl0M4DHGDdn5FPeSAOLccwY9k6sEWkfxROK5yolVh
         jF2g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793469664; x=1794074464; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ztiV5c0DfuFx8uDKCLiUp5o+ivOB8cWRN0pJNXnNfZU=;
        b=EBUqhIXHDsRUSZatCaOKEvEe719D1qjhWHVpRM+mkNQVlalkjgFJ+NyCx/YpwzK4vC
         zGmy6k2++yuyOy2chXdWNPBiH0WSblW+SboJ/KszbE5wchi/LEgAlrRF+dtvpVKZmQbo
         rpd387fMphGEozdhQDuo0+qfhfudh7ELzewpgxnweAzgAFay+Men/nuYVhkDnzNt9i6S
         C7R9Nf/nuyELxkB2+jq7Om0KoVT5P22cBQ2QQsP1goZhJxOVSz3EXeDxRqPRZMkEkOVJ
         /WdFromD818A9lS5tGg3+SH1axJ0x5GudoJsygxV+pCCra5jH21t1d2E5mTduNxhibCf
         3Fzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793469664; x=1794074464;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ztiV5c0DfuFx8uDKCLiUp5o+ivOB8cWRN0pJNXnNfZU=;
        b=up1OnjrTTaQn3soGL1qEg6MOTsDJbL/eTAUxMUImYYj5tcnvmSP+bZ7dXKtKzQQQDv
         PBviaSs+oTgBlGqSYUD4ILHdvAaBNchPHqQZZIZezhJX5tGJGlEdHd+EZWDI4VC4JY9s
         NosZfbNDIFxVCrO5+tBBJWqOTfL0fO7ukTzOKY8LfIzFd1xe26gWATIFhuZGJsJ8HgbX
         7sdgq70WqQc/HvhjtVCSIT/1VhRNXciIGjq7i52REGp8dg/wXvJ8IF+vNdRjBDhIyHEy
         Nt7628Cvw8o4+3khhPTIfs3ByFTZM9/6VqBgedxWVd8kegcwEVobBbaksVEkPJQPkPbg
         WehQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7RG0k6VnfrsgaKnJoNEN4aIhlxOJivhROYnPbokaSl9HSm6DAc1gaMKzvVyvEmV0/5oB+ieGbH9VoGI51xL8o@lists.infradead.org
X-Gm-Message-State: AFq9FYI7eBteXuuRwITsLGyDDCtW5MOT2SZPGhNVhuGT5mxh9EamwiXU
	8rJugCqb1wu6teLhdCkK71DjaSfNXvjVQ8Hfo0F+LbzwAak97nuKsqilz6h3C2ZP9ddqSnGRqLX
	xa/uhr/fZpr5eCNGFcv/qLwxN3QJyVKE=
X-Gm-Gg: AYBFou24nxdfmowB2LYwHYxqR6j9CMbgm8fdoEpjt/RmW9/oGN0kTEAs53g6CLKrvww
	fLhKJy4LQe/8ok2TrQOg0aOzYLrnh52H0gpTRYSKkLZY5cuY97wylol8kogASb84cLaXdHJHonE
	76vuHANLNwZrUecnmEdcbgWt/6K4++r6hUVdHwrT9AGN8IGeoioSfxpNPRTigIRa/4LO/qvqsym
	1SG6QVIgWZ6PV+1zYJc9eyA9P0Mz31bv5BRu0QfuGlVygB9/OVP+dhh8qFGA2OXSGCmSK31dtWb
	pI0nlsaiOfMf4ctUWM1g7P1kH3ZG6/BwpM6UMaArJ/+aABqhpfUf4sdm9JdzxWsTUdVz0n6QMTB
	05EVYV4ifm6DtSdSZIuOBlFmrl2NnzgphuoQekh6af8IQxAZhDJxrynM8CbOIy5IQ7Bfy9I9b3o
	pvE8yWtWTeLKp8G8RyLl9vWi9hawZk7+wrpnikZ52wB0qyT3OK94bsiI0zbNYqrDrHwIqiZbqa/
	mQsYLXqEYhI6MWSIkHH+PuycDbzDQ==
X-Received: by 2002:a05:6102:c4f:b0:7cc:3eb0:6ece with SMTP id
 ada2fe7eead31-7d072d53fa3mr3076240137.33.1793469664332; Sat, 31 Oct 2026
 11:01:04 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com>
 <20261029-submit-serial-8250-dma-cancel-v1-v8-6-3fd56ba352ed@gmail.com>
 <auNW_Oc-Ao5Iw-Gw@ashevche-desk.local> <CADvTj4pOg4w5LpFW_E3qzP7FZDnDgpB8LyR9xxhT_mZre21vFw@mail.gmail.com>
 <auRl9ztbav4nHi7U@ashevche-desk.local> <CADvTj4p8tjwdftg+H11ob0iaBZKxXrTdkSmhfZHjOYunm5tr9w@mail.gmail.com>
 <auTZtteCFnuoMD3p@ashevche-desk.local> <CADvTj4rXXAEnTyu_AzpF41a2YSHHG1ANozCUSePBoH3QZYbBQg@mail.gmail.com>
 <auWqUIBUs0_7bnGU@ashevche-desk.local>
In-Reply-To: <auWqUIBUs0_7bnGU@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 31 Oct 2026 12:00:51 -0600
X-Gm-Features: AclHuK8CrIpMhatn91Js9Zu09dawz3gtrtGWd_ctbAp5jI12V9IMTbfHBekYVDc
Message-ID: <CADvTj4rej-zOtwwN8CtchQ8A9L-fdG0dL_XwBb0zTFv5m=+j4Q@mail.gmail.com>
Subject: Re: [PATCH v8 6/6] serial: 8250: retain DMA resources when
 termination fails
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Raul E Rangel <rrangel@chromium.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Tony Lindgren <tony@atomide.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Richard Genoud <richard.genoud@bootlin.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	=?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Timur Tabi <timur@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_110106_543340_19DBC545 
X-CRM114-Status: GOOD (  37.49  )
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 31, 2026 at 2:44=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Oct 30, 2026 at 12:08:52PM -0600, James Hilliard wrote:
> > On Fri, Oct 30, 2026 at 11:54=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Fri, Oct 30, 2026 at 11:09:53AM -0600, James Hilliard wrote:
> > > > On Fri, Oct 30, 2026 at 3:40=E2=80=AFAM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Thu, Oct 29, 2026 at 11:19:59AM -0600, James Hilliard wrote:
> > > > > > On Thu, Oct 29, 2026 at 8:24=E2=80=AFAM Andy Shevchenko
> > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > On Thu, Oct 29, 2026 at 01:37:02AM -0600, James Hilliard wrot=
e:
>
> ...
>
> > > > > > > > +     while (rx_ret || tx_ret) {
> > > > > > > > +             dev_err_ratelimited(p->port.dev,
> > > > > > > > +                                 "DMA termination failed: =
RX %d, TX %d; retrying\n",
> > > > > > > > +                                 rx_ret, tx_ret);
> > > > > > >
> > > > > > > > +             msleep(100);
> > > > > > >
> > > > > > > Huh?!
> > > > > > >
> > > > > > > > +             if (rx_ret)
> > > > > > > > +                     rx_ret =3D dmaengine_terminate_sync(d=
ma->rxchan);
> > > > > > > > +             if (tx_ret)
> > > > > > > > +                     tx_ret =3D dmaengine_terminate_sync(d=
ma->txchan);
> > > > > > > > +     }
> > > > > > >
> > > > > > > This is unacceptable. Sleeping is okay, but value should real=
ly match the
> > > > > > > baudspeed and other parameters of the transfer.
> > > > > >
> > > > > > This sleep is backoff after dmaengine_terminate_sync() has retu=
rned
> > > > > > an error, rather than an estimate of UART transmission time. Ea=
ch
> > > > > > retry asks the provider to stop the channel again; elapsed time=
 is
> > > > > > never treated as evidence that the resources are safe to free.
> > > > > >
> > > > > > The particular 100 ms interval has no hardware-derived justific=
ation.
> > > > > > However, I don't yet see a sound way to derive the retry cadenc=
e from
> > > > > > baud rate either. RX can be waiting for input, TX can be held b=
y flow
> > > > > > control, and callback retirement is a separate requirement from
> > > > > > moving bytes through the UART.
> > > > > >
> > > > > > Do you have a particular provider failure mode in mind where re=
trying
> > > > > > termination should follow the serial transfer timing? I'd like =
to
> > > > > > base the interval on the condition that can make termination su=
cceed,
> > > > > > rather than substitute a wire-time estimate for an arbitrary de=
lay.
> > > > >
> > > > > Termination of DMA sometimes require to clean up internal FIFOs a=
nd other state
> > > > > machines. That's what happens on HW side. In the software waiting=
 for too much
> > > > > may lead to the very big undesired latencies. The value of 100ms =
sounds insane
> > > > > to me for the HSUART cases (megabaud range of speed). Also note, =
not every PCB
> > > > > design uses HW flow control, so this may be even worse for them.
> > > >
> > > > The 100 ms interval can add unnecessary teardown latency if a faile=
d
> > > > termination becomes retryable much sooner. There is no hardware-der=
ived
> > > > justification for that particular value.
> > > >
> > > > The FIFO/state-machine draining is part of the provider's stop sequ=
ence.
> > > > For example, DW performs its FIFO-empty polling inside
> > > > dwc_terminate_all(). If termination succeeds, this patch proceeds w=
ithout
> > > > the retry sleep, regardless of baud rate. The sleep is only reached
> > > > after an error during DMA release, not during normal RX delivery.
> > > >
> > > > Baud rate can influence how quickly a transmit FIFO drains, even wi=
thout
> > > > flow control. However, the termination error does not tell 8250 whe=
ther
> > > > that drain is still progressing, how much remains, or whether the
> > > > controller needs a different recovery operation. That distinction m=
atters
> > > > when choosing a retry interval: a shorter interval reduces the adde=
d
> > > > latency, but does not establish that retrying can recover the chann=
el.
> > > >
> > > > There is also a specific API detail here: dmaengine_terminate_sync(=
)
> > > > returns immediately if device_terminate_all() fails, without reachi=
ng
> > > > dmaengine_synchronize(). Consequently, an error leaves callback dra=
ining
> > > > unconfirmed as well. The retry cadence can change, but resource rel=
ease
> > > > still requires successful termination and synchronization.
> > >
> > > Most likely this is AI slop. I can't see the justification for 100ms.
> > > Can you explain that?
> >
> > 100 ms was an arbitrary backoff to avoid a tight retry loop if
> > termination keeps failing. It was not derived from the baud rate,
> > FIFO depth, or a DMA provider's recovery timing.
> >
> > That motivation explains sleeping between retries, but not choosing
> > 100 ms. I don't have evidence supporting that particular interval.
>
> Yep. And that's what my point is about. Any big sleeps has to be explaine=
d
> and justified.

100 ms was an arbitrary backoff for what I expected to be a rarely
exercised termination-error path. It avoids a tight retry loop, but
neither that nor the expected rarity justifies the particular value.
Successful termination on the first attempt adds no retry delay.

The constraint is that failed termination does not establish that DMA
and its callbacks have stopped. Returning from the current shutdown path
would let the serial core free the TX buffer while DMA might still own
it. Retrying preserves that ownership, but a permanently failing provider
can block shutdown indefinitely.

Would you suggest a different approach to handling termination failure
here, or a better basis for choosing the retry interval?

>
> > > > > > Regardless of the retry interval, shutdown cannot release the b=
uffers
> > > > > > until the provider establishes that DMA and its callbacks have =
stopped.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

