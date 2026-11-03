Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518C9606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 18:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h9WTmafF;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oAx/X0Av
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KNbjwm4E9DcWTobQLF+oFd4MAgDdWhobdyNW4zlZws4=; b=h9WTmafF5lcXcL
	jfItj7M4vn2qBVz7jPtiz70O5p4DpD0oQ35A2kqDk46IUWSvI/MUyRlVHnFNhAnJzfXv6DERcVWYB
	pZWF+pl/y7l3h0MNOtLv0Xe7i9ThX7nHmEubnM6OyzcdEj3OfeWlXo3nRnPHG7XqFaxMhLURnPaNz
	41V9x7uOylAqwQzsQDEE6lMB1jC0RaVasxcBU/0ydOxbI6cyB8CA35fVJJarWKwTZgKzby7ODs6Mm
	DXDA/lCTd+c6anMkhrme6Op2uNfYEDH+QTVR2uoQ3RxOQAK+7BuypFYPRcH0rBCdstGFS/piooH4o
	Ncpsf4Ub8QD8VeqMweHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOItT-00000003MJ2-2668;
	Tue, 03 Nov 2026 18:05:59 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOItR-00000003MI2-1Eml
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 18:05:58 +0000
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-7cc91ddf447so1607307137.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 10:05:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793729156; cv=none;
        d=google.com; s=arc-20260327;
        b=SqH2390m8nM+RQZv0PE7n/pUDrHA07Pty6IFuuNEF7BocOdz4lm7s220XVHSzpH1LV
         +J/lr9CEqdunRs18eOq33YRbK0+oxfPOwgbPqi6K+UgT8tV2xsBGaj5Xf5pI4TEdNA7K
         //41l4fAVUiB7aOEVFBasyd+IUgxfYZIzGJvCidwI/vbK2+f9/DVHgBCs/gnMjg2mO/o
         iq8HeEzmu5Y9RPry6t57TAkBG4PccxchagGuvjHSnUSOLOD2NLI1Jq76TqyBvMUu+uVJ
         PwP2cIu/zeKkMZuAhhQCvcxXjW1EEpXoyyIFuvBEee7UFwwQNxxXc57Eju3+JDaEY6+E
         lzIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KNbjwm4E9DcWTobQLF+oFd4MAgDdWhobdyNW4zlZws4=;
        fh=k/zwiwafzxPiQKoxJdfXZi9vlJzzj7+zWVeaHlNZBqg=;
        b=ANN9LqdCiFdgp6Hcs7SN8erRf1oFDs9znuxanle+ffZ3sTSsuGGNJ0dmeo2Ty+0R73
         s+unfxyE67+U8SEcD5JfhN9sx8hA5v69NGibbBpQNAqvDAaIuJbt1czrmg3SkxfjE3WB
         7ziWyrnS7LpIa7aBg6S4nnyE7V+Aey0tnnOC7fJgwi6PEcuizlGv06WtOIFDUjF5OaB7
         eOCqLt3o1L3Vnx+L554yBYEt6pWLiqHPDaTAf3p7DznzZPXvb/LQoN9CWtIG7z2+ol2q
         F1Lz0Lc+rrXeUQTHNwruaAcmb6toMtaKbx/XChR7GJ3/5P9FgBEpPNOfZFJxHCE/Xz+S
         /gSQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793729156; x=1794333956; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KNbjwm4E9DcWTobQLF+oFd4MAgDdWhobdyNW4zlZws4=;
        b=oAx/X0Av14A0XuUkBr7j4kxVGLaXvJhjIdlDNCsVWP5UeYE8xstl2pxV3zruRzHBFS
         jlAvbPTrrZ1AER6S4KmZoeE3rTZAOAJ0eU1lytrmE5y2wBpEWvbeFk/IWmLfg3dHvpTz
         ZRAx9jlkglOV1bcCzQ11SeRKd/WAEJtMANN8+6TDoueTbKJKWZliq5YsUlnUSglWG+kG
         KiWw6ZG7Rvq1HrhApVSkMf6GQEAhQPg4JEhXcYfn1i59cHUFeNW3ofuXwRfRJIddedMb
         WnfxBdZzaI20PxJA0y/m9VV73Gs6mc/NY5RIy/6OeL+o16HH0QKk2E7OH792/ljoKyMd
         B2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793729156; x=1794333956;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KNbjwm4E9DcWTobQLF+oFd4MAgDdWhobdyNW4zlZws4=;
        b=E0d5u0inF8E6U+CdYf7V0l4nCMBuQDEhYaQ/pZL3qAhqwWdOczLGbc+cQ641LcAJtH
         XXDkykZ1fodoBqszV7Ur5PCfQ3jYVM1zR2uQQu93jX1Pb0gpbS8FgiOFHYu4QDwLpb67
         BLLaWVnrI5f73HEUz4ncunuExBxG7t0294TxIuwGCIluMOQrq93b5TUC3JOzDDhiY4Cj
         iv21uPoX8lRd4Pb0d7yMkpWv68NVoNVXBcmeZQbQ58aVMnL/DKmyIqVEpRm1x1/jSve1
         WaEFpvpp+xrILb3mPu74nHtEKbOcZVzpGZp+0AbAQoUmqFWiCnY1gywEQ3qT679KwXn8
         5aLQ==
X-Forwarded-Encrypted: i=1; AKwUvByJ++8xQXwUz1K82Av0kjNnw9CU4oHW8ufyF0643wON+c2dUZzzHpKGN4GSluqV0jPeA8ckgIV4mcZTDTvcUouD@lists.infradead.org
X-Gm-Message-State: APuU4Z8nWZKe4ee8BnzjUAJjWUu/ou7Y1nNUeCSR3vBCjpkoeBPpy+go
	814QoyJBSkNE/n/oJv0E3x++5o7YC4DmEUE55TjgcPGYysguv1PSvrHnLqRxHRbDsJJDK9T7TDi
	Fm4kDEadB7QMKtHRNeiTXKYJovkGMHdk=
X-Gm-Gg: AYBFou3zCxC0VtkeBFmnARhS1JfNR2OXNsHMo0fObgB7zg7pRrff296/nbtHiVc9Iv8
	3ICCXrvjmvxmlcQ+RBbOtiDh3vHhBkDsjMi9j7+c20tmFfx1wehFp0shEyJLj87wEwePk+OBytG
	QdReziuZBIskZhaRQx7XBPEOPQz16mQwuCZGlK7alIt/dQ1prY6RhZHTVngc3gUX9PbUXvAqF8d
	cOiWXSQ07UpeFc5XG0suQxtd1alJlO2kZjyHgyv3wfnfR7yEaTmqb6Co1WmwRsEpUu7rnqshh/W
	dKoD/8KD4+qMVCILHmvA/iWFXch5jTw6RwQAAMoPgn8K3JMuLAUfOy2kg2hmK0gMdPm6BcY2tC8
	lCrH0qOeBQnCfPJh7DMGoW/NQxe9pXmT/1Czq3QQkxcd4qfKbJOSJ9w3faJ/WPXNHjnEyrJznz6
	JNxg4WzrndyzAjzQtJTdFojy43zgjiNIAD+sd8ADaceOOLX/WZJyRlPIO/OEpHwy2olJ252ao2H
	Axi6H6ZhTqguLgcl2UhllA/lmT9yQ==
X-Received: by 2002:a05:6102:5121:b0:7cc:5c9d:7e07 with SMTP id
 ada2fe7eead31-7d072635de3mr4255291137.11.1793729155740; Tue, 03 Nov 2026
 10:05:55 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com>
 <20261102-submit-serial-8250-dma-cancel-v1-v9-7-9159caade148@gmail.com> <20261103161104.2449407-7-rrangel@chromium.org>
In-Reply-To: <20261103161104.2449407-7-rrangel@chromium.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 3 Nov 2026 11:05:42 -0700
X-Gm-Features: AclHuK8ExVfXbcYLwfHHnCvMLw6HMi1Pim5AHzKRXmfuq3AFPdi8A4knMcfIqjI
Message-ID: <CADvTj4qXcOqS-wDrrN-x3sXUQr5BtFBeGzz_wqpW8WJ1DMPg+g@mail.gmail.com>
Subject: Re: [PATCH v9 7/8] serial: 8250: retire canceled RX DMA before
 reusing the receive buffer
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
	Peter Ujfalusi <peter.ujfalusi@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_100557_362171_945104CC 
X-CRM114-Status: GOOD (  27.06  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 3, 2026 at 9:11=E2=80=AFAM Raul E Rangel <rrangel@chromium.org>=
 wrote:
>
> Hi James,
>
> Thanks for v9 =E2=80=94 fixing asc_startup() locking in Patch 2/8, waking
> tty->write_wait for drain waiters in Patch 5/8, splitting OMAP RX locking
> and IRQ quiescing into Patches 3/8 and 4/8, and adding rx_pause_wait with
> immediate wakeups from dma_rx_complete() and serial8250_do_shutdown() all
> look good. Waking rx_pause_wait under port->lock cleanly avoids delaying
> normal completion or cancel_work_sync(&dma->rx_flush_work) during shutdow=
n.
>
> Two remaining comments on Patch 7/8:
>
> 1. Escalating to serial8250_rx_dma_recover() after a bounded pause-stall
>    window on partial RX transfers:
>
>    The commit message notes:
>    > A provider which never pauses or completes retains RX ownership unti=
l
>    > an error or shutdown; a timeout alone cannot establish that discardi=
ng
>    > the buffer is safe.
>
>    I completely agree that a timeout alone cannot establish that *reusing=
*
>    or *freeing* dma->rx_buf is safe while the channel is still running.
>    However, calling serial8250_rx_dma_recover(p) under p->port.lock once
>    the retry budget expires does *not* reuse or free dma->rx_buf without
>    stopping the channel:

Successful dmaengine_terminate_sync() establishes the required stop and
callback-draining guarantees. The concern is not that the buffer remains
unsafe after successful termination, but that this recovery path discards
the pending receive data and disables RX DMA until reopen.

A failed pause followed by an incomplete status can be temporary, including
when completion has not yet been published. Retrying preserves the chance
to deliver that transfer without switching to PIO. Memory safety after
termination and the decision to discard the transfer are separate issues.

>    - Calling serial8250_rx_dma_recover(p) under p->port.lock inside the
>      worker's retry block sets dma->rx_err =3D true and
>      dma->rx_terminating =3D true (and keeps RX masked in UART_IER), whic=
h
>      causes serial8250_rx_dma_flush_work() to exit the for (;;) loop
>      (retry =3D false, recover =3D true) and call
>      dmaengine_terminate_sync(dma->rxchan) outside p->port.lock in proces=
s
>      context (8250_dma.c:233-239).
>    - If dmaengine_terminate_sync(dma->rxchan) succeeds (ret =3D=3D 0), th=
e
>      channel is stopped and its callbacks are drained, so clearing
>      rx_pause_pending/rx_terminating and restoring p->ier safely falls ba=
ck
>      to PIO ("RX DMA failed, using PIO\n").
>    - If dmaengine_terminate_sync(dma->rxchan) also fails (ret !=3D 0),
>      lines 235-239 already retain dma->rx_buf and return early with RX
>      interrupts masked.
>
>    Why does this matter in practice?
>    Look at drivers/dma/tegra186-gpc-dma.c:
>    - Line 1521 unconditionally assigns .device_pause =3D tegra_dma_device=
_pause,
>      so dma_get_slave_caps() (drivers/dma/dmaengine.c:614) sets
>      caps.cmd_pause =3D true and serial8250_request_dma() enables RX DMA.
>    - On Tegra186, tegra186_dma_chip_data sets .hw_support_pause =3D false
>      (line 1351), so tegra_dma_device_pause() (lines 420-423) uncondition=
ally
>      returns -ENOSYS. (On Tegra194/234/264, tegra_dma_pause() at lines
>      389-414 polls TEGRA_GPCDMA_STATUS_BUSY after setting
>      TEGRA_GPCDMA_CHAN_CSRE_PAUSE for 20 us and returns -ETIMEDOUT if the
>      channel does not pause.)

The Tegra186 case is a permanent capability mismatch. dma_get_slave_caps()
derives cmd_pause from the presence of device_pause, but this provider
installs that callback even when hw_support_pause is false.

serial8250_request_dma() already rejects RX channels without cmd_pause.
Correcting the provider's capability reporting would prevent this
unsupported configuration from being enabled in the first place, rather
than discovering it after receiving data. That is different from a pause
timeout on hardware which supports the operation.

>    When an RX timeout interrupt (UART_IIR_RX_TIMEOUT) fires on a partial
>    transfer (e.g. a few bytes typed at an interactive console or a short
>    command waiting for a reply, count < 4096), hardware transfer completi=
on
>    will never occur while the remote peer is waiting for our response. Wi=
th
>    an unbounded for (;;) loop:
>    - Those partial bytes in dma->rx_buf are never delivered anyway (even =
if
>      we wait forever until the user closes the port, serial8250_release_d=
ma()
>      terminates the channel without copying dma->rx_buf).

For a provider which never pauses or completes, retries cannot restore
reception. A request/response peer can indeed leave the descriptor
incomplete indefinitely, and closing the port then loses those bytes.
Backoff and diagnostics limit the retry cost and expose the stall; they do
not solve that liveness problem.

For pause-capable hardware, a recovery timeout does not have to prove
that the failure is permanent. The concern is what happens after that
timeout: the current recovery path discards the pending transfer and
leaves RX on PIO until reopen.

Is there a recovery approach that avoids an indefinite RX stall without
turning a potentially temporary pause failure into loss of DMA for the
rest of the open session?

>    - UART RX remains permanently dead with RLSI/RDI masked and never fall=
s
>      back to PIO.
>    - serial8250_rx_dma_flush_work() holds a runtime PM reference
>      (guard(serial8250_rpm)(p)) for the lifetime of the open port.
>    - On 8250_dw, dw8250_idle_enter() (8250_dw.c:151) sees
>      serial8250_rx_dma_flush(up) =3D=3D -EAGAIN and silently aborts
>      dw8250_set_divisor() and dw8250_check_lcr(), breaking baud-rate and
>      LCR updates while rx_pause_pending is stuck.
>
>    If serial8250_rx_dma_flush_work() escalates to serial8250_rx_dma_recov=
er(p)
>    under p->port.lock once the stall threshold is reached (or immediately=
 when
>    dmaengine_pause() returns -ENOSYS / -EOPNOTSUPP), dmaengine_terminate_=
sync()
>    safely stops the channel before any buffer state is released and the U=
ART
>    recovers on PIO instead of wedging until close().
>
> 2. Minor nit in drivers/tty/serial/8250/8250_omap.c:783-784:
>    In omap_8250_shutdown():
>      WRITE_ONCE(up->dma->rx_pause_wakeup, true);
>      wake_up(&up->dma->rx_pause_wait);
>    8250_omap uses its own synchronous omap_8250_rx_dma_flush() and never
>    schedules rx_flush_work or sleeps on rx_pause_wait, so those two lines
>    in omap_8250_shutdown() can be dropped.
>
> Thanks,
> Raul

