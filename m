Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E74606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 17:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wP6ZhxbZ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aVWVyPBI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bfkoGr6eHduUtBaHwkrM0dSWX67wyi9EvMSHv231Bb8=; b=wP6ZhxbZUp0weu
	Fa6Z3GLvjO3zG0pSYUROCbHH4syrxhdsgbM/i9WFIXno1b5l+pQ8UJGZJ0jfQJOenCfrjyg8mwY1O
	Wq4lVlFMyvXrwLd89KyNHdaeq7OlpFGO/kjUCO1UokEywFOaJ5flayj6jBIRj7VegVIRo99FJgmwJ
	Q8gEZoPyiwk9vVb+4C4MUzeA0bGxk7Y5rbUUYHlwvHAwWHpxOnZoDb0l+VSmsrkgefc65fL1O9sWo
	R7WNCBgRdKMxqe7tNGZjmcKF5XNaw9I2pjLuzupv9kJg9zfyFru7fwat8GKJWawsJsPfbWV/GRMLW
	tGs4YeDiZi3NmI6rJ/nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTj4-00000009wWi-41NQ;
	Thu, 29 Oct 2026 17:15:43 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTj1-00000009wW8-1p49
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 17:15:41 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so3585049a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 10:15:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793294137; cv=none;
        d=google.com; s=arc-20260327;
        b=lkkPU3MzqVGT7Goosq/b9CaXKzeVrZMiNV/PbBnyUeZMFW9b59rSYT9xQpicQos2hl
         Ldne0Ptcr9p3QPywLOMHJFv0l9aYpg9E5mrC5oMp2FN2/ngGW5RGdCERZqXEubfX4omu
         3WcRPMiiqZXPcOhB6F9OjDNjgxBgl5wjEW/J5RJbqRTBbt6fEFUAPPOS1XFyGrNMXpyC
         dguNdFy9gF3zTL4Ku5s3AZlb9KDUkRT9RUIlfamq9w8FH1HdP5ODbsUurJ+mhypteSHV
         xONtlSmlxIYEg9GKYb9tgto27iYlMMK69xD7TcVejrbNMbtr3vmQruodL9k2R8yZUPLa
         j8QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bfkoGr6eHduUtBaHwkrM0dSWX67wyi9EvMSHv231Bb8=;
        fh=i5/3ZuwR0b0onwYLQKd/TIfJJJVCJTc7iINDQiby3dI=;
        b=nKNf3YG3941mQFPSAjX9+wvajmIsDT2zkunHl30GA/Cil+EZvYVvar9A4Vqi9d4hkA
         SADgyTk+EuqPVnsT6KnccZcMEK86T/XiCbLngMgt230RpiHkOgRYRL3bms3tcbV1NfZJ
         IiFKx+ntrLfG9lGaoOr8b74h59mweLC8k59qSMtnsl57eogwCycinQelUzkx9PHh7fnE
         yr22r9u1SOBgyk1Q3lbYvHyV8AMFWmk6B9x6tLrpVDMPqx7ogq8TxEXG3HwACEoxw6It
         XEeCMBSRnOS3TctT4gT+FAmiOYL8mohexjEadat8JaEztcNU+G/YMFfXBBZjIE0iEGH+
         APPQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793294137; x=1793898937; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bfkoGr6eHduUtBaHwkrM0dSWX67wyi9EvMSHv231Bb8=;
        b=aVWVyPBI2TZ2V+ffgnspxmYIjfhSADbg7pASXIxxDYv9o/8hvHLCMuvsjfnhtDDfGf
         mumHEYvXQGq6QrwTUKRaZKEtH70GTZNDUMSea9N7wYqUJJmpDi4hSYbbGncxEDVFfrDf
         /Gh7Rsw+tIG5zkYuifJ1fTrZIkAi6KUSBDI0IHPezisx5a/p/fXO+UBnE7/pYYI05fvY
         BMI6ThH4J/1+pLb0dp24WRTqnpPaAu79UzNB1/NuHdAiVdu0J8y0XO4ErGp4nbb9zw6J
         XoT65p4JIuCBMonj5YBjRoHKU0wfjdkhF8tc5LZIP7eD2qaPEzWrLfwbPLrBPd4DMZhD
         jznw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793294137; x=1793898937;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bfkoGr6eHduUtBaHwkrM0dSWX67wyi9EvMSHv231Bb8=;
        b=W8MbkV1ocsWSEWxjU7qYK5gICKz/dvpTtm4E5Ozx9McJK/vtwUzRjGQ3wHfYXropyS
         4q2kg2x4Cmjpbo/Onatk+yQQGlE5cH5rAaOuKmHUHYOw79QDt+Scalzvvflh6Vg+xnV6
         s5r+lIvc0zr0ylc0D5rD4BlVl0J+iFGdFEYI7oR7HjXRpkMUUeZwSxvT0UK05HDEUUvd
         UvCwFn8BF+e0waYivdg0oJM0OuJmgmWSk3xwfVt9XIYlOMHY705GRNH/eAsslJdzjvkt
         ZoXpnGPAVAl147H6CUfmA9LD2wZBXBsG7/qP1bP2Pv1X/He6c8Xxu2pIpc1SU4aoq3lh
         DzYA==
X-Forwarded-Encrypted: i=1; AKwUvBwunjjOquAy+spWyuUEIeqGoZ9hmPJbg1LKDh27AtiyDW2atgLyiDBeyj1YolzHkw14s4G8ZqUlHjWeCkW5ga/Z@lists.infradead.org
X-Gm-Message-State: AFq9FYKIa37orq3IWapUPhvJQad2I9XHud6kyQOeqGXjOmGokVjLR4KJ
	6m6c5PxjMayCKoTHrespEjYaUlDPAZD6qXBFbZ9JqYW4/otWLt9wLlJG6IkjICInR1n242QuKx4
	Lb7KWoHasVIxZS4alle+CCD/QVNRsPdk=
X-Gm-Gg: AYBFou3Zb8EW1eWkXyV/yePUS7WONCxW5KM1eJLdIc2xbR+iTAI1M5xFvu/Z1iX+0Ab
	SO1QhOXdZ5N5AOgduptBcxcR9HDSL8nuiea3ODlCBhWIImiiSEj9d7pLFMEq3K46r745/AuhYlI
	+yl0r0KXP1DqS+UPLwRo2mfmQb52hha3F3cPu4VmTgMWiXYfmvWPNPD4hvyCPCsbjxgB+9iaxvk
	KQuv0EZ1WaGjznaGdI2qlX/6BkXPUYT8tTO227SDJXGVn41lIfch0aRf7us91y5nfvFhokiOV4K
	CJh3BI6rnqTMM819x5/mHAfZxYsSs7Q4l8t6bNjN9pzzfMwt0NEg5Hk1K53FoquLYbbfY+4u/xX
	DPBkp6Tf9F4rjClqfmbA+mbWTA7PNSTFTTZNaYBRQ9IqeXXfLWLLz4iAchCEg1lWTUK1tUZJBsi
	dnTi8PPVPDbWj6iAaLOFVG/CxI9L8ERzbZVBqT26qDuleHoMIJeQR7DCOBqPM60PfAsLFd2l7lw
	cgqwk4QRzo5Oil7R9IGZjAu/pUhQA==
X-Received: by 2002:aa7:c687:0:b0:6b3:f840:59b5 with SMTP id
 4fb4d7f45d1cf-6b49cc019b3mr3067325a12.27.1793294136580; Thu, 29 Oct 2026
 10:15:36 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com>
 <20261029-submit-serial-8250-dma-cancel-v1-v8-4-3fd56ba352ed@gmail.com> <auNV7Vco5O3vVwRH@ashevche-desk.local>
In-Reply-To: <auNV7Vco5O3vVwRH@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 11:15:23 -0600
X-Gm-Features: AclHuK8a3pNXQ_IsYXCQfDMZzFxdEUJPDH5qKP3q2TLb8CO-tQBpFEH7zYCUMxU
Message-ID: <CADvTj4oi6dFzWkjFXie1U49A70Y7Mb=4exga-=2SmG7fN2pLrA@mail.gmail.com>
Subject: Re: [PATCH v8 4/6] serial: 8250: drain canceled TX DMA before reusing
 its buffer
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
X-CRM114-CacheID: sfid-20261029_101539_945094_7C465398 
X-CRM114-Status: GOOD (  19.91  )
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
X-Spam-Status: No, score=-1.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 8:19=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Oct 29, 2026 at 01:37:00AM -0600, James Hilliard wrote:
> > uart_flush_buffer() resets the transmit kfifo before calling the driver=
.
> > serial8250_tx_dma_flush() terminates DMA asynchronously and clears
> > tx_running, allowing a new write to replace tx_size while a detached
> > callback has not yet run. That callback can then consume bytes
> > from the new transmission. Reusing the reset kfifo can also overwrite t=
he
> > source of a transfer that has not stopped yet.
> >
> > Reserve the flushed FIFO storage through serial core before returning
> > from the flush callback. Keep tx_running set until a worker synchronize=
s
> > the terminated channel, suppressing old callbacks and new submissions
> > during that interval. Return the mapping to CPU ownership before releas=
ing
> > the reservation and waking writers. Normal transfers continue to use th=
e
> > FIFO directly.
> >
> > Reuse the locked completion processing after retirement, including OMAP
> > delayed register restoration and transmitter-empty handling. Take a run=
time
> > PM reference around worker UART accesses and drain the worker before
> > releasing the channels. Shutdown releases the FIFO reservation after
> > stopping DMA and unmapping its source. Serial core keeps writes and wak=
eups
> > gated until startup or resume makes the port ready again.
> >
> > Track a flushed FIFO separately from the transfer length. If terminatio=
n
> > fails, retain the reservation until normal completion and account the
> > completed bytes without advancing the reset FIFO. After successful
> > cancellation, process a zero-length completion once callbacks have drai=
ned.
> >
> > The race was found by inspecting cancellation and restart while prepari=
ng
> > H616 UART DMA support.
> >
> > Retain the tx_running check in both completion callbacks. Releasing the
> > reservation relies on the DMA provider draining detached callbacks when
> > dmaengine_synchronize() returns; provider callback-lifetime fixes suppl=
y
> > that guarantee for controllers which previously lacked it.
>
> ...
>
> > -     bool                    shutting_down;
> > +     bool                    shutting_down:1;
> > +     bool                    tx_terminating:1;
> > +     bool                    tx_flushed:1;
>
> What is the meaning of bool XXX:1? Have you checked with `pahole` the res=
ult?

These are one-bit boolean fields, intended to pack the state flags
into one byte.

I've now compared layout probes using the kernel type definitions and
saved build flags, changing only those bitfields to ordinary bools.
For the complete v8 structure, including the RX flags, pahole reports:

                            Bitfields   Plain bool
    ARM32 / Clang               212         220
    ARM64 / GCC                 368         376
    ARM64 / GCC / PREEMPT_RT     368         376

The sizes are in bytes. All six flags share one byte in the packed
version. This saves eight bytes in each checked configuration.

The packing is a layout choice, not an atomicity mechanism; updates
still require the UART port lock. Given the measured saving, I'd keep
it unless there is another concern with using bool bitfields here.

>
> --
> With Best Regards,
> Andy Shevchenko
>
>

