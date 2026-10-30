Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB92606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 17:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1AfaKjLJ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XXxixyNt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=upOYi42AukgDUPkY3CbfHszXdyIJTLIGDSDpKiK4vxs=; b=1AfaKjLJ7lm05T
	v8h0Z8maIdK9P80zzmk4i0o737AfytCpXMOleCD3TKhj47Ba47UOh3LJrrqQlt/U9Q8LVqGLFHtKF
	loZMvnu0g8CY+M3olOfL3OOLH5GqZzLGjUrjypHhdhOWpLrr+hud4VyDmZ5zRawnEGsAK595VoawC
	CIYVxol/C9NJtQlS7mfxHlQ/DdRbV3xYod1zyP566R6WVWLHIz4li7cBeCClYvztlFMrXQwyAi9kw
	lWn9XOuYitgBdcZH1zf595gpZnSKBbvCgc+hptK6Zle8lvZHZA7FRJM5bEanvRzldcYrtG1z95yGv
	e2KAIN/VND4awlN0mALQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMq7M-0000000CCOn-05uG;
	Fri, 30 Oct 2026 17:10:16 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMq7D-0000000CCK4-1ws2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 17:10:08 +0000
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-7c3cecbda48so223184137.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 10:10:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793380205; cv=none;
        d=google.com; s=arc-20260327;
        b=mUos+wJz6eO7aIEyAIyD3FlnuhqRu1R3IhNx+1saMVyWjMq9VFPRXMp7AZCjDDgl7L
         rcIHwLLVsKfWtU5RVU6Hd9+x3cHZFqGpP2SfTKDfYNQdbm/dZoqTnsKAtOfgah3UuTo3
         d2ZXjyqIaxtplI97tl6pcamhgpoR9P9m5Mgu/Pci+fHX9pO04aNPKCbXizjMeG3rrQW0
         xhpEkTobJiy1b/MHqWBzmx+aZJjjVzSANvLV6klMuXgDR2Ukq/qAAauWmOBh6xeq4Cqd
         5k56DbkpF/Q5YowXBbgnkkDZbje13BP6YuukpTaSg+BgKg2A7/rfxabwUKJEUaU9mUTb
         Naqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=upOYi42AukgDUPkY3CbfHszXdyIJTLIGDSDpKiK4vxs=;
        fh=N54s9VuUeKU84KGNpqXcLzSMvGl6RNulN2BCcGjj/Jc=;
        b=lIRgAaEoSgJyRdTmhWjauEBqGxS7DmBd/lgBgOb7LetUinRaPcQ3Q/pJMN4gBF5Ixg
         o9fbMTDn/JBgtxW6OkjlFvsfgJY98IGoNHjJDDC67mNK9ibdd1qovJ3IC7Kjg5dZ5s3W
         gGSV5LkXoPSV7o1U5pLr+8O/cHac9q8QddMMIaCkMdD3iaGNB+pUeAW5RpR/it705lPN
         NmYilHbFNNutnC3bJFGSlTNS4oYfTaUJQEWfjBjg9o7VkeU2P3A1sDcTZEkF/Vlr5yq5
         zr9v121V9Y9nFU0ppcXyO7oAYpkHQ+JPQa2wlSuuuaXHQQsuRpsSgGpxIW8cwyvKyvP9
         dl5A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793380205; x=1793985005; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=upOYi42AukgDUPkY3CbfHszXdyIJTLIGDSDpKiK4vxs=;
        b=XXxixyNt9Q3mWJdHO30FKNxNAI7KCjCNFdxwBd1Q+f4gAozMpyVCTPxNZdFb+8z1cU
         tCF2Ddp2e3Mt4v2hCLTcJzd6JhnbLdbK6hEVu+DnmBTamlw0REXJAhpkfpX1XZqo+jXc
         15RuKYMp5dw0UL+Q3ODJh/UOxjA2458rink08rrPODsG9oVW2fWZS3QD2k8Amm5sbZLI
         gIW2iCP0/9E6sc19wNo0Kv3RhGnEEkbf2zxr7YZetDH7pcR5fElA30BRY7Zzweqpwv8L
         m4MGy2u8kbwfKHfmoFQsdJ5ndUU+Ath1acwVBwvnQiK6djKKM+CDW6dKhDoT2tQ3l7ec
         M3/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793380205; x=1793985005;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=upOYi42AukgDUPkY3CbfHszXdyIJTLIGDSDpKiK4vxs=;
        b=eHUkJpuhjca9+FM8U0SfpRoDr3ygUB+3QWm86GVwTcYzVTUAglWTG0cIuqHP+NIPy/
         5m2T8LwjMTOJ1IZiElkbAcux5L6yS2RgJlNwzcO/XCXuNMwcecmIU9NGmBzWiu8N1Zyn
         gQkDTAJkbvgjX/K98b/UnzGMvaUeGbTtcMBLmn954crcqWHdtGtrvoauGJ76YagQg1h5
         NeYu2i9o02yVCxDsZQsPUrvGrThJj70Kow7mjC005i2Qs9Urosek0YsX8wwk7V5dsRGo
         MrNSZ/IEgbmw860PAC0v1crG2mmreIAfqo1JjS93PyBTyTOYNW5zOeMI6BSUPXL7xxv5
         jboQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgZ2P8+qoYsPlngXdp4Vi/LVVT5QlT66XSH7r4EzU2oo8E6ATeAaysnCNIJFPhZFFHCsrn9zXl5EhHTQi0RZ2S@lists.infradead.org
X-Gm-Message-State: AFq9FYLDIMfqt9jVNalnL+ukkktkmWZdEWaDTIqDbO9Hx0tdBKrXUH+s
	UCirYGEW9458uHlM6b8T1m9Ynens1pScvtlY6OfWmq9V0aDuTKWWboTtAozaS+xwkYou8gu6mPH
	VapslUW2TynzLk3L3efytQf2ev3sSIF4=
X-Gm-Gg: AYBFou30iiMGQhDDdPjxcunMeLsnrePupmTeTWng5x5hZwqt9V3VVtJJnjoJnvhUc7U
	uAfroFA66/vOuxFv5HWVfMHVQAg0pGBjvo/jsY6vUPiIBcyKCD+mNLPCb6y8mytAnyY2dIbaWYO
	U6dG9UhbtMX56sgzQtHKI14J7/fXuZyJKrjQ5GZZvUICLHj8n688XVLCbgiWbpiyho4Jg9KhL26
	shasWCwW6I9xWE5SyLV9TV2AzICNtAIihNvhcNhy4Xu5S4hZzfpoX0tcSvEdqyYgJSIgPNKnPMP
	+zF0LZvtqfWpcA6+EMkW7apcpR4p0M5l7jNUNXa1N26ZY1IQ1Q4nSyFylZFoaUW665QMC756JV+
	OCe4Q0ytQJwkAEhjk69Q0syVx4NeatvW1uTxo4f/uZQVD0MZtZ9nfMIwQvNeh0ubhJfJEsFPwp5
	ap9UwkjYcfrEOg/aqSpOkBSYr496qiDhV5pUtjfY9oWzk6++F2mo2Ly64JEnOn+OhccMxGpJObg
	s4eyDt27+k9xPjLDglfCk1z+Cmh3OI=
X-Received: by 2002:a67:e10d:0:b0:7cc:1a41:20fe with SMTP id
 ada2fe7eead31-7d072cae2c9mr1521484137.25.1793380205451; Fri, 30 Oct 2026
 10:10:05 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com>
 <20261029-submit-serial-8250-dma-cancel-v1-v8-6-3fd56ba352ed@gmail.com>
 <auNW_Oc-Ao5Iw-Gw@ashevche-desk.local> <CADvTj4pOg4w5LpFW_E3qzP7FZDnDgpB8LyR9xxhT_mZre21vFw@mail.gmail.com>
 <auRl9ztbav4nHi7U@ashevche-desk.local>
In-Reply-To: <auRl9ztbav4nHi7U@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 30 Oct 2026 11:09:53 -0600
X-Gm-Features: AclHuK8FtznzJujmH4YHgrWNDCpi98ee8eK0vX_qbau-y3ULhcsZAztidkT31Us
Message-ID: <CADvTj4p8tjwdftg+H11ob0iaBZKxXrTdkSmhfZHjOYunm5tr9w@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20261030_101007_535123_34D964B6 
X-CRM114-Status: GOOD (  26.98  )
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

On Fri, Oct 30, 2026 at 3:40=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Oct 29, 2026 at 11:19:59AM -0600, James Hilliard wrote:
> > On Thu, Oct 29, 2026 at 8:24=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Oct 29, 2026 at 01:37:02AM -0600, James Hilliard wrote:
>
> ...
>
> > > > +     while (rx_ret || tx_ret) {
> > > > +             dev_err_ratelimited(p->port.dev,
> > > > +                                 "DMA termination failed: RX %d, T=
X %d; retrying\n",
> > > > +                                 rx_ret, tx_ret);
> > >
> > > > +             msleep(100);
> > >
> > > Huh?!
> > >
> > > > +             if (rx_ret)
> > > > +                     rx_ret =3D dmaengine_terminate_sync(dma->rxch=
an);
> > > > +             if (tx_ret)
> > > > +                     tx_ret =3D dmaengine_terminate_sync(dma->txch=
an);
> > > > +     }
> > >
> > > This is unacceptable. Sleeping is okay, but value should really match=
 the
> > > baudspeed and other parameters of the transfer.
> >
> > This sleep is backoff after dmaengine_terminate_sync() has returned
> > an error, rather than an estimate of UART transmission time. Each
> > retry asks the provider to stop the channel again; elapsed time is
> > never treated as evidence that the resources are safe to free.
> >
> > The particular 100 ms interval has no hardware-derived justification.
> > However, I don't yet see a sound way to derive the retry cadence from
> > baud rate either. RX can be waiting for input, TX can be held by flow
> > control, and callback retirement is a separate requirement from
> > moving bytes through the UART.
> >
> > Do you have a particular provider failure mode in mind where retrying
> > termination should follow the serial transfer timing? I'd like to
> > base the interval on the condition that can make termination succeed,
> > rather than substitute a wire-time estimate for an arbitrary delay.
>
> Termination of DMA sometimes require to clean up internal FIFOs and other=
 state
> machines. That's what happens on HW side. In the software waiting for too=
 much
> may lead to the very big undesired latencies. The value of 100ms sounds i=
nsane
> to me for the HSUART cases (megabaud range of speed). Also note, not ever=
y PCB
> design uses HW flow control, so this may be even worse for them.

The 100 ms interval can add unnecessary teardown latency if a failed
termination becomes retryable much sooner. There is no hardware-derived
justification for that particular value.

The FIFO/state-machine draining is part of the provider's stop sequence.
For example, DW performs its FIFO-empty polling inside
dwc_terminate_all(). If termination succeeds, this patch proceeds without
the retry sleep, regardless of baud rate. The sleep is only reached
after an error during DMA release, not during normal RX delivery.

Baud rate can influence how quickly a transmit FIFO drains, even without
flow control. However, the termination error does not tell 8250 whether
that drain is still progressing, how much remains, or whether the
controller needs a different recovery operation. That distinction matters
when choosing a retry interval: a shorter interval reduces the added
latency, but does not establish that retrying can recover the channel.

There is also a specific API detail here: dmaengine_terminate_sync()
returns immediately if device_terminate_all() fails, without reaching
dmaengine_synchronize(). Consequently, an error leaves callback draining
unconfirmed as well. The retry cadence can change, but resource release
still requires successful termination and synchronization.

>
> > Regardless of the retry interval, shutdown cannot release the buffers
> > until the provider establishes that DMA and its callbacks have stopped.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

