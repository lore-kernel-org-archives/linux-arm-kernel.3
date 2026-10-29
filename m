Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2FC606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 08:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yadDQu0V;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=otDHJYKL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XRqdz8CmBop39zT0MOnXVWaLPZs5c98CxtCs0iCmyZ0=; b=yadDQu0V1RgrUF
	AaA4+R3MlMQLVWOwZoyYbyUIizTltRKPl7Y7l+NF1hS7dIlCm/FLMjxtrCu7kew+PIjNC1Q0Dyqu7
	MQHxnjK+/1beLvyHDF5aImjXqCPsAvS158A6j7aTnOX4vZ0kWmaMnaCFnuZbrKaLuxALu6/VdnjHY
	qJtY7TP2qR3Dv07jmug6zxEuPCtigd67+Co0/buL/Z0JEXwscMii5KGfcYVSBOVpfCy8iKLvOUtrW
	oMEtgOW+yL39qOqSF61wEnqzxX9u0LjwwVYCIY4wF0QNWH1QvZLqtgh6/Nr2YjObG4KPeaXPB0b68
	Pa8gIMaYSLHw8plSSoNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMLHI-00000008grq-23JP;
	Thu, 29 Oct 2026 08:14:28 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMLHF-00000008grG-0ODD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 08:14:26 +0000
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-7c03744ef27so583716137.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 01:14:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793261663; cv=none;
        d=google.com; s=arc-20260327;
        b=nx96Ywy9AuBLULTgc8GLL5QGm62hZIQwtDIjFoWdIvRiF2jsIIH/DAlY6cW6w2apTN
         oHMabwuKuVblpilw8Gn8rYTu2EiPh3QVau2BBVcNdgq4kCRBTene5czvYOcV8VynoZvY
         sXcwxUMz5TGNPAbWp+7nMQNhizdz7oJTybGjTVcpJ/pHwVyWb7zJHMpaYWMPg9ivL1E1
         eESpjJMMGrHdlAmPPY5ayM+DIuSknItYcmFYIrkPvQ8aznzSyEs8rBBup9VUaPqwDoY8
         W106Pky1RSreHKDncd6TPfg+rQ64OL+96dMDyvV0A9me1ce5J7B71j9Vp4lzvm3jBCYD
         253g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XRqdz8CmBop39zT0MOnXVWaLPZs5c98CxtCs0iCmyZ0=;
        fh=6tiyJ7TzC6x/WiH/8o8gmZ9i30HVS+WFPGGLaiHmijM=;
        b=MjqOvGAULHHGs0xivX6PLzi9HA5NLfVmlhM1Ne7w7VHNMYZw2u2z8u7Pd+jQIIewZH
         gssq3Bl2jAGFFezia8qd+9wzfyCbJHlDAXBcHSq+uTgLIpchaKhFOLqmY9VAg9SmcXr5
         O+1HvwrDbfUMg4AVqKVr5c3U58Nynpj53ZbGTBdYwWJzsL8bcTBSBo6N4y5QlQxdqWpq
         0qyy8j//iOolDiCtHPagDaqZsz1UmMZG1Yw/aYdu3y2bxiNOIfLm8Q0AZItJDsQHWTbJ
         vn+2s66TXsZ3hzuqoqMI9iVNPkNmMeHbNYt94V/Sy7S2Ux+hUJ27LReyy0idFMg5kWTs
         9+FQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793261663; x=1793866463; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XRqdz8CmBop39zT0MOnXVWaLPZs5c98CxtCs0iCmyZ0=;
        b=otDHJYKLopPGJNofftPsbXWX/+3+mCNbxavMaF5/VEF5vD3MdPt3WHUGigfU+TeGFJ
         ILu+L7aaV0Bmr9TeiEjBb2lzjt6mBPKwOfUCFefaYqNUs0rf1r+6ptRJuPhY2AeUuIWj
         eGoZXY1w7rr3ckAKE0PhJO0+e6ws7mmx3w7A1U1gD5ZTJ5pdG1HuZtY1IUHAW3xCxU90
         8pI/v22/1luXDEApKu7Iy2YFdzi1MrGll0i54zVVEe8E/0y7XXro19BzgHfsSfc87qsT
         IePNbKHJbYecIESzcv9pMCvE0cQsHgI/KZKSm3LX7efI/fg/xCXU+m/q4HHeJjZFh/7q
         au6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793261663; x=1793866463;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XRqdz8CmBop39zT0MOnXVWaLPZs5c98CxtCs0iCmyZ0=;
        b=LXci5ofvFw4gytVtNR6trV0/h31F8gab3W/3wjOpFiYwfknioBWtT3QubGsbRQCY4u
         k0Pop+18fu6GujX53vrp9sndq3v6ke20QccBPn5rBMIzOYv3SVx1LW0EQWPd2CWvDe0g
         cH8FXpeV/RvOvN7J8j7gKk5TPUddtxZXamK2+1D1j+k66KG3h7LmfiUDco+SaJvGhYiB
         TLUDEYEiT3bC6rkpGmu30y1ldBU6FIhJl9hMwcPt8d6W1EV0ACsjlvpv8UoXxzzJakCP
         Tq35YvkLvWDHFPJQS/WKjhtXOCEUpUxIf4/ZsyYwT29suo0HGhGEX6iHA4N4dSl3vmXX
         ovyg==
X-Forwarded-Encrypted: i=1; AKwUvBx9XMZR6Tj8SCispuaJ22QcMttt2a+2RR6CU/PhkoRsB6qaNaopQsBUtkijE4j1ToDjPSMpSAjlNe3QckHrpOwp@lists.infradead.org
X-Gm-Message-State: AFq9FYKvfHPoF1Qo+ATOSvOmGrGyeQqUjUikfM6ft6tao8bSXfLH3J9D
	k8d7IfFql4wNuNO1IN7PSSyaj+bip3HAVKz7rkVgJigDstwm0YqRip3a3Kaodg0QoodDF172504
	exvakH/1+c/FunznlCAlThqDMQ0rO3PM=
X-Gm-Gg: AYBFou3fmttEHU9jiyCLTagPCvWHTNEy3ubzwtB3AC4CNzQicN7uO9ZL7dN5ZDxcLrJ
	5+XUZGY79iGF7iYykjkjjVtboO3vQ+MFybuRBLMGsmRdiQsrcjbf6i2n+VDMtUmTUQ4wLQcXBMT
	LfAz8wC08SgixEfMRxrOxrqPLZCuBENp5SW+Yh7yfRsToMVYOm8x57dwe/jpMfDPuM9Su+05jlo
	EVa94laNOS6VPtxprTyBGePXGmsvEnUqwGefdPDU0O2xwzfn/t2f2wG04V6KtadgJF201nOzJE6
	dzm7aHAM87y3tjI6hx87RRt/qW0JKKAK5cqP5Hf2a/e+++M/vZe3oTkDAl+5IWtiPyuWsbQOKNx
	2SCGcmusZEQhbN8ZppoyS47SNeLbkzZJEJMfOMskrWFBFYS1mWeMqRaqkQXpLnS5IMJqk5P34hS
	IOEXStY80vsbWZt8jIdlxiqWl8V0wprd7Yp9WOdQ8Rgm12Fd0mNmbBJqCLpDSVLLsQzyS4bi81x
	jZ7NlU5J3rOaO3Te5lNTltCMpmRig==
X-Received: by 2002:a05:6102:424c:b0:7cc:2712:cafb with SMTP id
 ada2fe7eead31-7d03a5708f1mr2019992137.15.1793261663187; Thu, 29 Oct 2026
 01:14:23 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027-submit-serial-8250-dma-cancel-v1-v7-0-985a023ba4b4@gmail.com>
 <20261027-submit-serial-8250-dma-cancel-v1-v7-4-985a023ba4b4@gmail.com> <20261028204847.3471382-2-rrangel@chromium.org>
In-Reply-To: <20261028204847.3471382-2-rrangel@chromium.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 02:14:10 -0600
X-Gm-Features: AclHuK92fmKJThZ29uPEx3r2hwaWsXISrLYNiraGYBJq2R2TpOOpVIz5KsrBhR8
Message-ID: <CADvTj4pEo3uj2bLbP6RwD=P+hW2omQ9x_sn_ag_FHzxUknX-nQ@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] serial: 8250: drain canceled TX DMA before reusing
 its buffer
To: Raul E Rangel <rrangel@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
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
X-CRM114-CacheID: sfid-20261029_011425_179980_AE946546 
X-CRM114-Status: GOOD (  24.75  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 28, 2026 at 2:48=E2=80=AFPM Raul E Rangel <rrangel@chromium.org=
> wrote:
>
> Hi James,
>
> > @@ -37,26 +40,35 @@ static void __dma_tx_complete(void *param)
> >       struct uart_8250_port *p =3D param;
> >       struct uart_8250_dma *dma =3D p->dma;
> >
> >       guard(uart_port_lock_irqsave)(&p->port);
> >
> > -     if (dma->shutting_down)
> > +     if (serial8250_tx_dma_blocked(dma))
> >               return;
> > -
> > -     if (!dma->tx_running)
> > -             return;
> > -
> >       serial8250_tx_dma_complete(p);
> >  }
>
> Removing `if (!dma->tx_running) return;` and relying solely on
> dmaengine_synchronize(dma->txchan) to drain completion callbacks breaks o=
n
> DMAengine drivers used with 8250 UARTs that do not implement
> .device_synchronize (where dmaengine_synchronize() is a no-op), including=
:
> - drivers/dma/sun6i-dma.c (Allwinner H616, cited in the commit message)
> - drivers/dma/dw/core.c (dw_dmac)
> - drivers/dma/pl330.c
> - drivers/dma/mediatek/mtk-uart-apdma.c

The provider-side fixes are posted separately for DesignWare [0],
sun6i [1] and MediaTek [2]. The v8 consumer changes require those
callback-drain guarantees on the affected controllers; they cannot
compensate for a missing provider synchronization implementation.

>
> On those controllers, if Transfer #1's completion tasklet (vchan_complete=
,
> dw_dma_tasklet, or pl330_tasklet) has already dequeued the completed desc=
riptor
> on another CPU, dropped the channel lock, and is waiting on port->lock at=
 the
> start of __dma_tx_complete() when uart_flush_buffer() ->
> serial8250_tx_dma_flush() runs:
> 1. serial8250_tx_dma_flush_work() calls dmaengine_synchronize() (which re=
turns
>    immediately because .device_synchronize is NULL), acquires port->lock,
>    clears dma->tx_terminating =3D false, and calls serial8250_tx_dma_comp=
lete(p)
>    -> uart_xmit_unblock(&p->port).
> 2. If no new transfer has started yet (dma->tx_running =3D=3D 0), Transfe=
r #1's
>    in-flight callback acquires port->lock, sees !serial8250_tx_dma_blocke=
d(dma),
>    and runs serial8250_tx_dma_complete(p) a second time even though
>    dma->tx_running is 0.
> 3. If a writer has already started Transfer #2 (dma->tx_running =3D=3D 1,
>    dma->tx_flushed =3D=3D false), Transfer #1's stale callback runs
>    serial8250_tx_dma_complete(p) while Transfer #2 is still active in har=
dware,
>    syncing tx_addr for CPU, advancing xmit_fifo by Transfer #2's tx_size,=
 and
>    submitting Transfer #3 concurrently with Transfer #2.
>
> In addition to implementing .device_synchronize in the affected DMAengine
> drivers, __dma_tx_complete() (and omap_8250_dma_tx_complete() for symmetr=
y)
> should keep `if (!dma->tx_running) return;` and check
> `dmaengine_tx_status(dma->txchan, dma->tx_cookie, NULL) =3D=3D DMA_COMPLE=
TE`
> (matching dma_rx_complete()).

I have not added this check. It could reject some stale callbacks, but
dma->tx_cookie may already identify a replacement transfer, rather
than the transfer whose callback is executing. It therefore cannot
replace draining old callbacks before releasing or reusing storage.

There is also a complication with the existing classic DW provider:
its status path can scan descriptors and invoke completion callbacks.
Calling it from the callback with the UART port lock held therefore
risks re-entry. The DW series [0] removes that behavior, but callback
draining is still required independently of a status check.

The intended guarantee is that termination and callback draining
finish before a replacement transfer can reuse the canceled
transfer's storage.

[0] https://lore.kernel.org/r/20261023-submit-dw-dma-synchronize-v1-v3-0-c6=
2bf048f5ce@gmail.com/
[1] https://lore.kernel.org/r/20261023-submit-sun6i-dma-lifetime-next-v1-v3=
-8-ef1acb0be768@gmail.com/
[2] https://lore.kernel.org/r/20261027-submit-mtk-uart-dma-synchronize-v1-v=
3-0-aad7a6b3c62e@gmail.com/

> We modeled the v7 TX and RX DMA cancellation state machines in TLA+ to ve=
rify
> both the counterexample traces above and the fix:
> https://github.com/ismell/linux-8250-dma-tla

I extended this a bit as well:
https://github.com/ismell/linux-8250-dma-tla/pull/1

One issue in general I'm frequently running into is that there's such a
large amount of correctness issues with this driver that it's tricky to fin=
d
good boundaries to split fixes up into.

>
> Thanks,
> Raul

