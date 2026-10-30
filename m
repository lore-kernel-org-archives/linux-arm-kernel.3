Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4F5606A324
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 18:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=olwcTPTi;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rgCcChog
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zCM05k2C0awIth60s9Z4jRxjplzssn0gUpe0d+ZqU04=; b=olwcTPTi0teaad
	FmP9D2K2OTsj6IAZ4SN7r4SKcn4I9I6U+ukJpFcuxDPpUOzztTwoBi58gmzSPDcR6xrrhCV7HDZ79
	aoh25xDorN+LIgXT22QzDMGaWAKk6cNB6Hxzhy7CmsnFPoQPckoz751PxSU+EUFgk9i5e+aTAE6+Z
	Oxut7EskGTJdS4TsBka5hqhhI4GSSbiSph+dtzTf1khs7hyOgaAIRfWIM1QKz6t57w64q014mkFds
	cDD/v+zAbevGatYSQftUrZJlND2l6c+sbwFfOK52rbzVisM/6wK8muDHZMptkq054xwrWK9eGpg4C
	PTC32q/GQy166R3XT9iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMr2K-0000000CMmA-0ID6;
	Fri, 30 Oct 2026 18:09:08 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMr2H-0000000CMjw-2axP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 18:09:07 +0000
Received: by mail-ua1-x92b.google.com with SMTP id a1e0cc1a2514c-9906a5410f5so1924840241.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 11:09:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793383743; cv=none;
        d=google.com; s=arc-20260327;
        b=Y+lsnFb2T4u8mQjCsqMVIrIDJnDAVxSqAAw96UJSnXgfuNkbwUz5GYValo9KWMAg2p
         5prn0DqzMpYPxeIJLr4oAAsDX99x4QUqARKnOlxWxoh9Gs5fF95/RsuidYu5lDpfaw1b
         hIhIqrnEavxj4eVkZCHwrE6y7hbjvAOHFIV8GuiFCr3ZeamIBbuk20Ipqm+8Tnj95M1p
         p7IswwZQT2wFK8aDtWwY+wPA6IgABUvUjLoKyS3t9cbNDLF7dSSpcMeQ55ytVh9a0N/z
         YD6Mro1hw2VBucCETjxRcGNMytX8Vnj6IQtPhZX+W3SzqF6q1GX3fmneYmdd18nQuePf
         g4aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zCM05k2C0awIth60s9Z4jRxjplzssn0gUpe0d+ZqU04=;
        fh=6H5SBUbab6OX6vKUHdzZujRiAFGSLmnAf7OSu9ldPSE=;
        b=nlsTo3F0pHEqQOgNpbuZahdADI/7/Lr9FJ0U/FIhTNIwCRmnGVQI1jcKtoN8bWvTfP
         q7vVkca2r936Hhr5sywdSZImUVQx2Rptv3GF60QyoXKj6ZNKfm97SiRXv028ylK9r216
         wtYJMvUzYnm0lSEPw/6H1exOYefs02jqRNXwGzFLU0DPimpXKRdxQ7lDiWK8p59/zsLI
         dYiHTQs6wiiuXl5aHxl/4YPGLJb3uQTPtMIpKCLMHk7nyzizOk8bKer8GKX1NYxALdGV
         4VLt8PNP+1qygDpW7vdahYXGe0jWtzlg0ZKpPW/292VWZGQfDsc2OPBs6tGKBaxYAeQE
         KTzw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793383743; x=1793988543; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zCM05k2C0awIth60s9Z4jRxjplzssn0gUpe0d+ZqU04=;
        b=rgCcChogqUv4D2YHlnHFMxQMWaKc2r4hZQvsbuEbQia6+BGvjpU3niNu3i233cz9TY
         oml/mMA1iy9w+HQSROthLs+HHBzohG0fof8UDDejDwTjeTNW+DmcOLFKQdVCYlEO87iB
         4cmj2wurdRX0su9/S7d6vGDyhJqv+Czv8IyDJOwhlQdWO9nBDA8euBV42KK60D2M9DmG
         tnkVhnTJmwkmc/rQhDaAikpN+0A4+8EL08tHw7pSy5bsm2PMxnL136RA779IGMU7ktz6
         SEPgxhPqP9JzKNAKXGhTyy6x0WZsHKLJLOajVEBioaJDYRHG5kEhpFkUxKolNJ62auc3
         wziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793383743; x=1793988543;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zCM05k2C0awIth60s9Z4jRxjplzssn0gUpe0d+ZqU04=;
        b=n4KgiWECKvY/pbXs0QwW3+NIk4Y567OCCUXKCj+ltWkDM7e/pJ1Y+ReixW4lRqPs3X
         e8P1jq7isFCQ69UcfCgyU10hqzVjxTnQk5eQC4QMgpeIW14XYz0ADUptgj0uqe3c+GLK
         HHPtnroTqh9RUKexgzgXoYdtscbTq6Ya2r/RP5q3ap04KaMkLy+8t/Wb+iKdcUg6WBaS
         sZqO/5dB7yaabBlY0ST5nGX3JUIPXaFzCwZ6tRBiufR+kMiLI9l2564NsxaCvw0SJKKJ
         bharFDGTmZ6fuZqTKTE3UABTU5PAX7vMQQNArY4/l/IcgIRCyAEVoK7I73/gEhAs9eOw
         kqJA==
X-Forwarded-Encrypted: i=1; AKwUvBxSvtn8dzfBKIYgkfx3vkFWYKOq94vZqhiI1J12YoocHc++aQzUfCKL/GwlSOorZqV4F+2KO8+R8T24R3tLl5+7@lists.infradead.org
X-Gm-Message-State: AFq9FYLl3o/1fwo5TN00hUUPXrvKKT/Lvek9MtfyssRfClG8TF0hwrao
	Xa3NKpwtonuUKLDgkUxCKkkSsp/jlXx4tAFXosrKV9VZtWJtTQoanBBWwWsGAAHTh4Bm3LY3N/S
	1CqDSNpu7RfH+4LQieVbM8p9JfuVVYIc=
X-Gm-Gg: AYBFou1lzdtXlIkRkqV2gy3qFXsdCyEQ+LhWJlwNfcg6EuSnEdU+mJjaLMiYd0LUXin
	vx7Hwis6wq+RPDHrXAY4nDcsHJgFeVCufW1MdYzyGpLvS+eRQAR0QqACHIRC1rCS0Wr6OAHH7j7
	pxbNkskHooLFg4oY/51Fr04MvYPeBGgbos7QowW8xRLANMdvujymJV+sauXkMqJl+kvARlZWqJG
	hIKMGV64AB494+T5xQe12gmsYvyn6EqpOeg4iMQtSA6z9x9udtnOcvMzapQJtsIGd0/63/H/q4J
	x5EwvajKoWP6E8VTwRuKkj2r5FCS2Fpy4svJdIUHseLCspjPqFACws2JKfGW0Jq9v2uA1UuodQa
	PAWdhEH85WqvxzUeKjYB8T39LO4vsSpn1DGVyGWI0j4yIwwSMKuC9rNpvr1444TXnVGjrwiDOyQ
	Qi1O8EbT/lfH0NNFrl2N3c983nzpdeFrdYkBx0vWbUEUPCEoNbCyrYbebXm2iaP37ky1z+ys98W
	/L2MplN1sfbpIJW8LNzIjLV8Wwwyw==
X-Received: by 2002:a05:6102:e07:b0:7b3:9d2e:c1a2 with SMTP id
 ada2fe7eead31-7d0543af600mr2250112137.42.1793383743550; Fri, 30 Oct 2026
 11:09:03 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com>
 <20261029-submit-serial-8250-dma-cancel-v1-v8-6-3fd56ba352ed@gmail.com>
 <auNW_Oc-Ao5Iw-Gw@ashevche-desk.local> <CADvTj4pOg4w5LpFW_E3qzP7FZDnDgpB8LyR9xxhT_mZre21vFw@mail.gmail.com>
 <auRl9ztbav4nHi7U@ashevche-desk.local> <CADvTj4p8tjwdftg+H11ob0iaBZKxXrTdkSmhfZHjOYunm5tr9w@mail.gmail.com>
 <auTZtteCFnuoMD3p@ashevche-desk.local>
In-Reply-To: <auTZtteCFnuoMD3p@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 30 Oct 2026 12:08:52 -0600
X-Gm-Features: AclHuK8c5dKv2-dU28EFYCOPnAfJ1MA-zFVMtXg5QQ7p9buAg8gKSWCKNovPJxw
Message-ID: <CADvTj4rXXAEnTyu_AzpF41a2YSHHG1ANozCUSePBoH3QZYbBQg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20261030_110905_752972_1ED2B5F9 
X-CRM114-Status: GOOD (  33.12  )
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

On Fri, Oct 30, 2026 at 11:54=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Oct 30, 2026 at 11:09:53AM -0600, James Hilliard wrote:
> > On Fri, Oct 30, 2026 at 3:40=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Oct 29, 2026 at 11:19:59AM -0600, James Hilliard wrote:
> > > > On Thu, Oct 29, 2026 at 8:24=E2=80=AFAM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Thu, Oct 29, 2026 at 01:37:02AM -0600, James Hilliard wrote:
>
> ...
>
> > > > > > +     while (rx_ret || tx_ret) {
> > > > > > +             dev_err_ratelimited(p->port.dev,
> > > > > > +                                 "DMA termination failed: RX %=
d, TX %d; retrying\n",
> > > > > > +                                 rx_ret, tx_ret);
> > > > >
> > > > > > +             msleep(100);
> > > > >
> > > > > Huh?!
> > > > >
> > > > > > +             if (rx_ret)
> > > > > > +                     rx_ret =3D dmaengine_terminate_sync(dma->=
rxchan);
> > > > > > +             if (tx_ret)
> > > > > > +                     tx_ret =3D dmaengine_terminate_sync(dma->=
txchan);
> > > > > > +     }
> > > > >
> > > > > This is unacceptable. Sleeping is okay, but value should really m=
atch the
> > > > > baudspeed and other parameters of the transfer.
> > > >
> > > > This sleep is backoff after dmaengine_terminate_sync() has returned
> > > > an error, rather than an estimate of UART transmission time. Each
> > > > retry asks the provider to stop the channel again; elapsed time is
> > > > never treated as evidence that the resources are safe to free.
> > > >
> > > > The particular 100 ms interval has no hardware-derived justificatio=
n.
> > > > However, I don't yet see a sound way to derive the retry cadence fr=
om
> > > > baud rate either. RX can be waiting for input, TX can be held by fl=
ow
> > > > control, and callback retirement is a separate requirement from
> > > > moving bytes through the UART.
> > > >
> > > > Do you have a particular provider failure mode in mind where retryi=
ng
> > > > termination should follow the serial transfer timing? I'd like to
> > > > base the interval on the condition that can make termination succee=
d,
> > > > rather than substitute a wire-time estimate for an arbitrary delay.
> > >
> > > Termination of DMA sometimes require to clean up internal FIFOs and o=
ther state
> > > machines. That's what happens on HW side. In the software waiting for=
 too much
> > > may lead to the very big undesired latencies. The value of 100ms soun=
ds insane
> > > to me for the HSUART cases (megabaud range of speed). Also note, not =
every PCB
> > > design uses HW flow control, so this may be even worse for them.
> >
> > The 100 ms interval can add unnecessary teardown latency if a failed
> > termination becomes retryable much sooner. There is no hardware-derived
> > justification for that particular value.
> >
> > The FIFO/state-machine draining is part of the provider's stop sequence=
.
> > For example, DW performs its FIFO-empty polling inside
> > dwc_terminate_all(). If termination succeeds, this patch proceeds witho=
ut
> > the retry sleep, regardless of baud rate. The sleep is only reached
> > after an error during DMA release, not during normal RX delivery.
> >
> > Baud rate can influence how quickly a transmit FIFO drains, even withou=
t
> > flow control. However, the termination error does not tell 8250 whether
> > that drain is still progressing, how much remains, or whether the
> > controller needs a different recovery operation. That distinction matte=
rs
> > when choosing a retry interval: a shorter interval reduces the added
> > latency, but does not establish that retrying can recover the channel.
> >
> > There is also a specific API detail here: dmaengine_terminate_sync()
> > returns immediately if device_terminate_all() fails, without reaching
> > dmaengine_synchronize(). Consequently, an error leaves callback drainin=
g
> > unconfirmed as well. The retry cadence can change, but resource release
> > still requires successful termination and synchronization.
>
> Most likely this is AI slop. I can't see the justification for 100ms.
> Can you explain that?

100 ms was an arbitrary backoff to avoid a tight retry loop if
termination keeps failing. It was not derived from the baud rate,
FIFO depth, or a DMA provider's recovery timing.

That motivation explains sleeping between retries, but not choosing
100 ms. I don't have evidence supporting that particular interval.

>
> > > > Regardless of the retry interval, shutdown cannot release the buffe=
rs
> > > > until the provider establishes that DMA and its callbacks have stop=
ped.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

