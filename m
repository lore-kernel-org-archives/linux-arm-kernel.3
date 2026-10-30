Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5C6606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 00:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G9Ymf1gy;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eK34X/5W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vCXebNkndm9LBXsG81Q2mOpTPDq3UCuJ8oTq7IQkTYU=; b=G9Ymf1gyjYWAQ8
	mmR2V+3M37unKSuUO3mcQWKbRVtnIw2/jUxtGnpzjN5q+XUslioCJWRAF9m9PgdejJEhcGWjD4fwc
	snrmQkMTGvrWjfNT+0+aS1kdUXGwROC9E06T92ncMhB0uQ9pQfxmGkrLBpQUnfO0dLd26W2acSV+E
	deKgDk8bds+UZ7Skji3uKUGjBSyEasshYZOorw7xN2lsS/yzB/MW4+qC5hup83wrA5l3ctZq3Lr1X
	vS9NaiP1j/WcN48psQE3i2+wJq+EQBEuujeBSg0LjIsbxc18ZXCwWGZ1p7fxWxUKzrj05nwxbLZkK
	zDL2K824WLwHGl/M741A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMaar-0000000Aa3M-0ZIX;
	Fri, 30 Oct 2026 00:35:41 +0000
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMaaj-0000000Aa2i-072m
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 00:35:38 +0000
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-9908346255fso731466241.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 17:35:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793320531; cv=none;
        d=google.com; s=arc-20260327;
        b=KIsUgZ3w/qLIC1uO3kvKD1TY5JuPQKf8VZoeyi0yHy04CuBTxm1EaS76lKShSM84yj
         UBioQbUgh7GBMbBeavguNPn+CLcz0SPJqAcJDnCo7SgZg2Vq4al1aTwOfx9vK4hHfVc5
         CkyuSKFN8frWA/wrOBxRfO+pcbN9Vlonf+3cwZ2tfIzrU499yDFH86ICXg0vaqXsVyie
         QUXrD0vDxBBlvI7bI6JyuTo8O9z71ko7hmldQKzxiqHn5c/dxkW3fY0y8dWTku8FtNgd
         Q1lb3z/HzQROJUAvoJBMnfzsNvlcaul1KQb3vKQ/GYd2/fybjwYBsT8JU+oIJAbmIClW
         LNMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vCXebNkndm9LBXsG81Q2mOpTPDq3UCuJ8oTq7IQkTYU=;
        fh=6zUI6DX4eZ6IiTW9Z+A8l1zFruwRhuPuorN/aSGP398=;
        b=TA6juZyYpduMf8tFzSb/rtXUAoReJRIGPyr71IXIn6oRUe4lfM34d37MkM4BTVEZbL
         6qyLDKA9CzJycwuzb+LwYpMsc+6iGRGeDwipPcEPd2D6Iofx+IT0DTzbTeCY43LA4c43
         QbtYyktzOqx6KORMsZ46GpYmg43rm2AE8qgKBEcExDVMhu/klctor8YfZCdmiZA1NHRD
         E21IG+XJmtA0jK8kQ9OjCwYY6sm+phMaVIQP5ZkhEPWo0e5PZCSZit0NepaDITqjy187
         q+sNECuAXrUjS/RDVPQTgbK2s9gCvHh5KVI7MazU09s+erOuWw4Tbq6S9zy+M2erVeK7
         tveA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793320531; x=1793925331; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vCXebNkndm9LBXsG81Q2mOpTPDq3UCuJ8oTq7IQkTYU=;
        b=eK34X/5WwNBhqhWCojVd0QTvlauaIEcXRVSii/NtSYPedfOWjpnFns3Z+K41O9tUz/
         uSDNgEX6J0uvSDjfmmJvqKgIMmPJ5vxElGiLJ9RPQrkqGwa+hCC1jZ0TZoKd/QGOfB8S
         1CzTVOlq9cqy9AXEXOPl+NLCOEGjBzTwYVQVQMB+Ju8me21VCb4DeaFJTfJYTleq9iel
         aENbqP/OCxQtdgOQzmIxIgA57hjfcCWuv5/VynG7HvMdFxaTfU4T4iSd1+GuDd7RMsbX
         CDqJd9KS6ZBGM+tLc1BDiRr/g3gAIvkORucdzvtaqpKbViv7jzf4UWB01SEwP25j3v8m
         X5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793320531; x=1793925331;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vCXebNkndm9LBXsG81Q2mOpTPDq3UCuJ8oTq7IQkTYU=;
        b=cynztirsIYetU5RuAK8JmY3rugW++4vD++pBPZo8sDDmv22RYa1GIPNlihIxtakCNA
         17FCVR0eKA/H55b5KKOa8nMJTkTuwwx0xOakgeLt7zV2PaK6dNUEIsaQKHIWur/eoqbB
         MjRetBkpWGANqOhIUqiMdO6WwYXl4ANqcLXsKUi6VyFhjLL29gcmV+7K6Zva6o6vldLS
         rqLIuwHrF4bnM/lENDP90+t6A/gIIfmMW067Rt3TWIfCgxF4bvjvU3spgBNZqppVIvj2
         vlygy+/jvsWiRMWTKII6RBJZYBI2a34oU5ZJPo7d7zb/sDgMJMI3th49C5NyLoLXgdkp
         wc7g==
X-Forwarded-Encrypted: i=1; AKwUvBwd9burF1KRdbPRsxL9+GNyjhshgiR+TA1Qu47ljBpQUPnQJhytgS7Mfe1iPOKYDgivtWapUgx8x4M3NijW2v7e@lists.infradead.org
X-Gm-Message-State: AFq9FYLr+AHdKyHNmJ0DNpm6l8vsfU5sMcdBmGS3qem8icd8LDqxP8x+
	HA9H0REijhJrUl3n/hT5a/5NRf6Mtmg+m9FGhVbpUVxZ7AYdTHA8Juv817Vj6ABd2jkGeTRQnvf
	pHgkFqzL5oDnfSysBpC/sGto8tTKbyiQ=
X-Gm-Gg: AYBFou04SgNs8O8uyZeZ7FDxFv8QXSywLFaNBpOi7v5RapFsktoh4kq3XX0jkS0G4Na
	AwQlk8ZTHAybVnxluhnZtUO0YuxoVvYu52VxCh87pdO/FExGF92yTBW4+nZDo7QshnhUb+EBi1N
	vdf5u00hzbYtwVAG3WRTRmj40S9nr64o+9SrNYWyQuvRC1L7roMssS+7gtdOn1SlUDDFfI78hs+
	c/2bSOeH0p2229l/SZrLHnI5fSfErYCToQbzXSPUrICFCahIgXT8H2aWiEqTYZV1TpqFJHt87Nc
	ijV+Xq/6J8343YL9PkxjThMUns6xttC1aG+c+VxESpE4RVzTT93s1Q4cG6XSwYSaXvTlReL9knE
	zyE7iKAWN769wbT0WI4OJmMdx1aBDRtzMkVuc3hS3NYxFAlvI/Tx2XQFogfpOPJ7TdJt2ky/KjN
	9jAx7jDMHeMPdi3xug7dyIKn+SgtEEngfPYezSBaEDDWVrUlodrRKfMdIFbzu/i62YUwWi4ifnq
	h8P/wvq60dowErrGDo37nvCq6GFaQ==
X-Received: by 2002:a05:6102:50a5:b0:7bb:64cc:1362 with SMTP id
 ada2fe7eead31-7d072c2b96amr253188137.6.1793320531134; Thu, 29 Oct 2026
 17:35:31 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com>
 <20261029-submit-serial-8250-dma-cancel-v1-v8-6-3fd56ba352ed@gmail.com>
 <auNW_Oc-Ao5Iw-Gw@ashevche-desk.local> <CADvTj4pOg4w5LpFW_E3qzP7FZDnDgpB8LyR9xxhT_mZre21vFw@mail.gmail.com>
 <20261029222734.3086943-2-rrangel@chromium.org>
In-Reply-To: <20261029222734.3086943-2-rrangel@chromium.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 18:35:19 -0600
X-Gm-Features: AclHuK9fwQEf1FE2SE005DWVvtH9Aa6gi9TWL3-I0d1O0Zk2jQvC0qB4u35B3dg
Message-ID: <CADvTj4rRtKyq_7yhpfwGQrbOA=k_jxQymTpZSvdVBB0A-xR-Rw@mail.gmail.com>
Subject: Re: [PATCH v8 6/6] serial: 8250: retain DMA resources when
 termination fails
To: Raul E Rangel <rrangel@chromium.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
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
X-CRM114-CacheID: sfid-20261029_173534_324183_1C239951 
X-CRM114-Status: GOOD (  25.32  )
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

On Thu, Oct 29, 2026 at 4:27=E2=80=AFPM Raul E Rangel <rrangel@chromium.org=
> wrote:
>
> On Thu, Oct 29, 2026 at 11:19 AM James Hilliard <james.hilliard1@gmail.co=
m> wrote:
> > On Thu, Oct 29, 2026 at 8:24 AM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > > + while (rx_ret || tx_ret) {
> > > > +         dev_err_ratelimited(p->port.dev,
> > > > > +                                   "DMA termination failed: RX %=
d, TX %d; retrying\n",
> > > > > +                                   rx_ret, tx_ret);
> > > > > +               msleep(100);
> > > > > +               if (rx_ret)
> > > > > +                       rx_ret =3D dmaengine_terminate_sync(dma->=
rxchan);
> > > > > +               if (tx_ret)
> > > > > +                       tx_ret =3D dmaengine_terminate_sync(dma->=
txchan);
> > > > > +       }
> > > >
> > > > Huh?!
> > > >
> > > > This is unacceptable. Sleeping is okay, but value should really mat=
ch the
> > > > baudspeed and other parameters of the transfer.
> > ...
> > Regardless of the retry interval, shutdown cannot release the buffers
> > until the provider establishes that DMA and its callbacks have stopped.
>
> Agreed that if dmaengine_terminate_sync() fails, shutdown must not free
> dma->rx_buf, unmap dma->tx_addr, or kfree(port->xmit_buf) while hardware
> or a detached callback may still touch them.
>
> However, because serial8250_release_dma() runs under port->mutex in
> uart_shutdown(), uart_tty_port_shutdown(), and uart_suspend_port(), an
> unbounded `while (rx_ret || tx_ret) { msleep(100); ... }` loop means that
> if a DMA provider returns a persistent error from dmaengine_terminate_syn=
c()
> (-ENOSYS, -EINVAL, -ENODEV, -ENXIO, -ETIMEDOUT, or a wedged controller),
> close(), hangup(), and system suspend will hang forever in
> TASK_UNINTERRUPTIBLE while holding port->mutex (triggering hung_task_pani=
c
> after 120 seconds).

That is the current behavior. Returning from shutdown allows serial
core to free the TX buffer and removal to release the callback
context. The retry loop prevents those releases, but a permanent
termination failure blocks teardown indefinitely

>
> Would it make sense to satisfy both constraints (no UAF on buffers/callba=
cks,
> and no infinite sleep in close()/suspend()) by quarantining/leaking only =
the
> failed channel's resources instead of looping forever?

Retaining the buffers and channels does not preserve the complete
callback context.

The callbacks carry a uart_8250_port pointer. For DW, the DMA state is
embedded in devm-managed private data, which can be freed after
unbind. The registered 8250 port slot can also be reused. Retaining
the DMA channel does not prevent either operation.

> Specifically:
> 1. Bound the retry loop in serial8250_terminate_dma() (or do not loop on
>    non-transient errors, checking `if (dma->rxchan)` / `if (dma->txchan)`=
).
> 2. If rx_ret or tx_ret is still non-zero, warn once (`dev_err` / `WARN_ON=
_ONCE`)
>    and intentionally quarantine/leak only the failed channel's resources:
>    - If rx_ret !=3D 0, leave dma->rxchan non-NULL, keep dma->shutting_dow=
n =3D true,
>      and skip dma_free_coherent() / dma_release_channel(dma->rxchan).
>    - If tx_ret !=3D 0, leave dma->txchan non-NULL, keep dma->shutting_dow=
n =3D true
>      and state->xmit_blocked =3D true, skip dma_unmap_single() /
>      uart_xmit_unblock() / dma_release_channel(dma->txchan), and in
>      serial_core.c:uart_free_xmit_buf(), skip `kfree(xmit_buf)` if
>      `state->xmit_blocked` is still set.
> 3. For a subsequent port reopen after a quarantined failure:
>    - Remove the redundant `up->dma->shutting_down =3D false;` in
>      serial8250_do_startup() before serial8250_request_dma(up) (which alr=
eady
>      clears shutting_down under port->lock), and have serial8250_request_=
dma()
>      return -EBUSY if `dma->rxchan || dma->txchan` is still non-NULL so
>      reopen falls back cleanly to PIO (`up->dma =3D NULL`).

Clearing up->dma does not stop hardware accesses. After unsuccessful
termination, the channel may still access the UART FIFO, so reopening
with PIO can introduce concurrent FIFO access.

A hardware-specific stop/reset sequence could establish quiescence,
but its implementation and effects on other channels depend on the
controller. If the channel cannot be stopped, quarantine also needs
to preserve callback-context lifetimes and prevent unsafe port reuse.

>    - Guard the DMA completion callbacks (`__dma_tx_complete`, `dma_rx_com=
plete`,
>      `omap_8250_dma_tx_complete`, `__dma_rx_complete`) with `if (!dma || =
...)`
>      so a late callback after `up->dma =3D NULL` is ignored safely.

The current callbacks fetch p->dma before acquiring the port lock.
A callback can therefore retain the old non-NULL pointer across the
assignment of NULL. Checking that cached pointer does not protect
its backing allocation from being freed.

When termination returns an error, dmaengine_terminate_sync() also
returns without calling dmaengine_synchronize(), so callback draining
has not been established.

>
> That way, neither hardware nor a detached callback can ever UAF rx_buf or
> xmit_buf, while close(), system suspend, and subsequent PIO reopen all
> complete cleanly without an unbounded msleep() loop.
>
> Thanks,
> Raul

