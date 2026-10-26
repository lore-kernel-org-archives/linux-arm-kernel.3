Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85546606A90F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 11:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0quZLLoV;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NqOuZUZM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LAzq4cyS54q1OMpA3stV0scLcFCff1wzup/apzkv5TY=; b=0quZLLoVG72tWyNcOL/+9P6Dm7
	DEbPl/BF16mDwYojEmC8faDbPLVPXCOWJwmBXA5VChZQHX09gwDqgAHToln/MjRpyP+aKnfX83mkw
	dBMJhLgy3AU90ixi218mnwgcp8T5PD+W3rByWXVFO0bULUdFJrk8T0K4F7Xd8sAd3sv1EKyQb83t4
	GNn8r+S/cu8uifobcKB7V2t78vqqOtsSve6Votgy5lPtaTrdTNMjCzFFU70CinEjp1ZlbF/qdG8a6
	lwVLfiVWKbvjdk+Qui5+7FkAqTCjyjpwig9wZg4zlRyU+Sj4s0bMpKGRPQ7is3jMNCo3px8HBXk7c
	qMDv0e9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLIgX-00000002M7f-2rTR;
	Mon, 26 Oct 2026 11:16:13 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLIgU-00000002M6w-3IzY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 11:16:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793013370; x=1824549370;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=AphQK58+g81EWzAi3VXX0VFnAVqOX1dQuy1qI7BOKMg=;
  b=NqOuZUZMap4aL6iZ+Yr5jRGisERiX5MV2gZuupr0rQiWQPuvXpqO+GJz
   sgnAckoB5aDwjR4Yg0lEwfYQ3BLny2RZYBXO9vDAqQdK7p4ssjypdCsJ6
   KYpTi2xXO1WGbQRiAbUmqZ5cZKo/6UGGuW4V6e0gyhUv7YtKkYbibDqL1
   iKGTAGdkxV03G2nxWB5YEwEvlt7jSEZnYLriXOGnfr3WtczCd+ULQD/bn
   LaC+dllaoPrpebXyUF0t4xrmUFuQiez1V/HaeqI18y9v2qLtMMTaDQ2Kd
   cWyN9wTXDH3+eLdoptkYFD4VT9j6uNnq2Ma2daND/HGanstQu8n6wHK2+
   g==;
X-CSE-ConnectionGUID: yGTGSo3cTVmzq9/zp0mhEQ==
X-CSE-MsgGUID: pB33HUvvQ/iT9d9/XRP9pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1670451"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1670451"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 04:16:08 -0700
X-CSE-ConnectionGUID: iiWYMFKDTuWiIPMIP/jZVw==
X-CSE-MsgGUID: +sweVC7nS1K/YdC9OecmNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4635828"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.109])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 04:16:00 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 26 Oct 2026 13:15:55 +0200 (EET)
To: James Hilliard <james.hilliard1@gmail.com>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, Raul E Rangel <rrangel@chromium.org>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
    Tony Lindgren <tony@atomide.com>, 
    Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
    Richard Genoud <richard.genoud@bootlin.com>, 
    Nicolas Ferre <nicolas.ferre@microchip.com>, 
    Alexandre Belloni <alexandre.belloni@bootlin.com>, 
    Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
    Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
    =?ISO-8859-15?Q?Pali_Roh=E1r?= <pali@kernel.org>, 
    Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
    Pengutronix Kernel Team <kernel@pengutronix.de>, 
    Fabio Estevam <festevam@gmail.com>, 
    "Maciej W. Rozycki" <macro@orcam.me.uk>, Timur Tabi <timur@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, 
    linux-serial <linux-serial@vger.kernel.org>, 
    linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
    linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v6 0/5] serial: 8250: serialize DMA cancellation with
 buffer reuse
In-Reply-To: <20261024-submit-serial-8250-dma-cancel-v1-v6-0-6f366591f566@gmail.com>
Message-ID: <a011174b-d64c-305b-7dab-62017fc885fa@linux.intel.com>
References: <20261024-submit-serial-8250-dma-cancel-v1-v6-0-6f366591f566@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_041610_855303_102D8A38 
X-CRM114-Status: GOOD (  31.68  )
X-Spam-Score: -4.5 (----)
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, 24 Oct 2026, James Hilliard wrote:

> Reserve canceled transmit and receive storage until DMA and its completion
> callbacks have retired. Serial-core write backpressure protects a flushed
> TX FIFO while normal transfers continue to DMA directly from that FIFO.
> 
> The series separates OMAP's locked completion processing and serializes
> asynchronous write wakeups with the port lock before adding the serial-core
> reservation helpers and applying them to 8250 TX. Flushing
> empties the logical queue immediately. While the old transfer owns its
> storage, write_room() reports zero and write-ready notifications wait for
> retirement. Failed termination retains the reservation until normal
> completion, without advancing the reset FIFO. DMA retirement releases the
> reservation independently of port readiness. Serial core keeps writes and
> wakeups gated during shutdown until successful startup or resume.
> 
> RX delivers paused data before the PIO fallback and retires callbacks in
> process context. Track FIFO access separately from buffer retirement so
> PIO and the DesignWare empty-FIFO timeout handling can run once DMA has
> released the FIFO. On failure, retain the requested interrupt enables in
> the existing IER shadow and mask receive interrupts in hardware until DMA
> has stopped. Recovery then leaves RX on PIO until reopen. Shutdown excludes
> new retirement work before releasing the channels.
> 
> Based on tty-next with the posted shutdown guard [0], channel
> configuration error handling [1], RX TTY accounting fix [2], RZ/N1
> transfer-length fix [3], transmit-PM shutdown fix [4], serport
> write-wakeup deferral [5], DesignWare BUSY-safe fractional-divisor
> programming [6], and Intel MID RX DMA timeout locking [7]. The serport fix
> is needed before serializing the remaining write-wakeup callers with the
> port lock.
> 
> [0] https://lore.kernel.org/r/20261021-submit-serial-8250-dma-shutdown-v1-v1-1-3d3ce383c614@gmail.com
> [1] https://lore.kernel.org/r/20261021-submit-serial-8250-dma-config-errors-v1-v1-1-c067587d1ef2@gmail.com
> [2] https://lore.kernel.org/r/20261021-submit-serial-8250-dma-rx-accounting-v1-v1-1-c11795914ab4@gmail.com
> [3] https://lore.kernel.org/r/20261023-submit-serial-8250-dma-tx-length-v1-v2-1-c3106ef4d2df@gmail.com
> [4] https://lore.kernel.org/r/20261022-submit-serial-8250-tx-pm-shutdown-v1-v1-1-0e894afa3bb8@gmail.com
> [5] https://lore.kernel.org/r/20261023-submit-serport-write-wakeup-v1-v1-1-74e7311638a2@gmail.com
> [6] https://lore.kernel.org/r/20261024-submit-serial-8250-dw-divisor-v1-v2-1-032ca5338359@gmail.com
> [7] https://lore.kernel.org/r/20261024-submit-serial-8250-mid-rx-lock-v1-v1-1-2b9afdf869d7@gmail.com
>
> Assisted-by: Codex:gpt-6-astra
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes in v6:

Hi,

This series is moving way too fast with new versions. Please slow down.

We're not aiming to who manages to produce highest version counter for a 
series. ;-)

You're making non-trivial changes so please do expect human review to 
take time. Cranking new versions almost back to back (or even every other 
day) will just fill up inboxes.

--
 i.


> - Use v2 of the DesignWare BUSY-safe fractional-divisor prerequisite.
> - Serialize CLPS711x TX servicing and interrupt-enable state with the
>   port lock. Use non-waiting IRQ disable in stop_tx(), skip queued TX
>   interrupts after stopping, and drain the handler outside the lock
>   during shutdown.
> - Make the Atmel RX/TX tasklets and SB1250 termios locking IRQ-safe
>   alongside their interrupt-handler locking, preserving the caller's
>   interrupt state when releasing the port lock.
> - Report RX DMA recovery after releasing the port lock, keeping the
>   state changes and interrupt-enable restoration serialized.
> - Link to v5: https://patch.msgid.link/20261024-submit-serial-8250-dma-cancel-v1-v5-0-9e52968928d2@gmail.com
> 
> Changes in v5:
> - Add the posted serport write-wakeup deferral as a prerequisite for the
>   caller-locking preparation.
> - Add a preparatory patch serializing asynchronous write-wakeup callers
>   with the port lock, including indirect CTS and transmit-helper calls.
>   Keep sleeping register accesses outside the lock and defer SCCNXP
>   notifications until its controller lock is released.
> - Use the separately posted DesignWare BUSY-safe fractional-divisor fix
>   and Intel MID RX DMA timeout locking fix as prerequisites, leaving five
>   patches in this series.
> - Separate serial-core write readiness from DMA storage reservations. Record
>   retirement during startup and shutdown while keeping writes and wakeups
>   gated until the port is ready.
> - Wake deferred writers after successful startup or resume, including when
>   reopening with a retained FIFO, and restart any retained queued output.
> - Keep the write-ready notification pending while retained output is at or
>   above the normal wakeup threshold, until TX completion drains it.
> - Publish resume readiness under the TX restart lock without releasing a
>   reservation that may belong to a newly flushed transfer.
> - Release 8250's TX reservation after shutdown has stopped DMA and unmapped
>   the source; serial core retains control of write readiness.
> - Link to v4: https://patch.msgid.link/20261023-submit-serial-8250-dma-cancel-v1-v4-0-e759de1839de@gmail.com
> 
> Changes in v4:
> - Retain flushed TX reservations through shutdown and failed resume. Release
>   them after successful resume, or when allocating a new FIFO on reopen,
>   so retirement cannot wake writers into a closing port.
> - Treat RX flush as complete once the channel is inactive, and clear the
>   shutdown guard before startup configures the UART and tests interrupts.
> - Check completion after a failed pause so a transfer that finished before
>   its callback acquired the port lock is delivered and retired normally.
> - Keep DesignWare's BUSY-safe divisor setter after fractional-divisor
>   discovery, writing DLF and DLL/DLH only after confirming DLAB.
> - Link to v3: https://patch.msgid.link/20261023-submit-serial-8250-dma-cancel-v1-v3-0-d78f9e4c4932@gmail.com
> 
> Changes in v3:
> - Defer write-ready wakeups while flushed TX storage is reserved, and
>   serialize the flush wakeup with the reservation under the port lock.
> - Suppress ordinary TX starts during the reservation while preserving
>   high-priority flow-control characters, which use separate storage.
> - Separate RX FIFO access from callback retirement, allowing PIO and the
>   DesignWare empty-FIFO timeout workaround after a successful pause and
>   termination while keeping the receive buffer reserved.
> - Use the existing IER shadow for requested enables and a shared register
>   writer to keep receive interrupts masked throughout DMA error recovery,
>   including termios, RS485, modem-status and overrun-backoff updates.
> - Preserve the timeout-enable bit across stop_rx(), exclude late shutdown
>   interrupts from PIO, and avoid FIFO resets during RX DMA recovery.
> - Preserve the completion-path LSR read after stop_rx(), while gating DMA
>   resubmission on the receive interrupt enable.
> - Pack the cancellation flags after moving all their accesses under the
>   port lock, including the recovery worker's snapshot and initialization.
> - Apply the early-return, shared-helper and line-wrapping cleanups.
> - Link to v2: https://patch.msgid.link/20261022-submit-serial-8250-dma-cancel-v1-v2-0-088ea51e3891@gmail.com
> 
> Changes in v2:
> - Add serial-core helpers to reserve flushed transmit storage until DMA
>   retirement. Apply write backpressure during that interval and keep normal
>   TX using the FIFO directly, replacing the private transmit buffer in v1.
> - Document the flush callback's reservation, writer backpressure and
>   retirement requirements, including release before shutdown returns.
> - Split the OMAP completion refactor into a preparatory patch and move
>   the RZ/N1 preparation-order and shutdown PM fixes to independent
>   submissions, keeping four patches in this series.
> - Take runtime PM references around worker UART accesses, and leave normal
>   RX retirement to release ownership without reading LSR or restarting DMA.
> - Synchronize the queued TX ranges before preparing the descriptor and
>   return the mapping to CPU ownership before releasing the reservation.
> - Keep the TX transfer length separate from FIFO cancellation, so a failed
>   termination can account completion without advancing the reset FIFO.
> - Exclude late RX flush work during shutdown, including Intel MID DMA
>   timeout interrupts which are independent of UART_IER.
> - Accept DMA_IN_PROGRESS after successful pause, and recover from failed
>   pause, termination or DMA_ERROR before handing the receiver to PIO.
> - Preserve stop_rx() and shutdown across recovery, and retain the
>   DesignWare empty-FIFO timeout workaround when receiving through PIO.
> - Apply the requested guard spacing and container_of() formatting.
> - Link to v1: https://patch.msgid.link/20261021-submit-serial-8250-dma-cancel-v1-v1-0-efe2b89f2303@gmail.com
> 
> ---
> James Hilliard (5):
>       serial: 8250_omap: separate locked TX DMA completion processing
>       serial: serialize asynchronous write wakeups with the port lock
>       serial: core: allow drivers to reserve flushed transmit storage
>       serial: 8250: drain canceled TX DMA before reusing its buffer
>       serial: 8250: retire canceled RX DMA before reusing the receive buffer
> 
>  drivers/tty/serial/21285.c          |   2 +
>  drivers/tty/serial/8250/8250.h      |  59 +++++++-
>  drivers/tty/serial/8250/8250_core.c |   2 +-
>  drivers/tty/serial/8250/8250_dma.c  | 286 +++++++++++++++++++++++++++---------
>  drivers/tty/serial/8250/8250_dw.c   |  27 +++-
>  drivers/tty/serial/8250/8250_omap.c |  38 +++--
>  drivers/tty/serial/8250/8250_port.c |  31 ++--
>  drivers/tty/serial/atmel_serial.c   |  12 +-
>  drivers/tty/serial/clps711x.c       |  23 ++-
>  drivers/tty/serial/cpm_uart.c       |   2 +
>  drivers/tty/serial/fsl_lpuart.c     |   2 +-
>  drivers/tty/serial/jsm/jsm_cls.c    |   3 +-
>  drivers/tty/serial/jsm/jsm_neo.c    |   9 +-
>  drivers/tty/serial/lantiq.c         |   3 +-
>  drivers/tty/serial/ma35d1_serial.c  |   6 +-
>  drivers/tty/serial/max3100.c        |   6 +-
>  drivers/tty/serial/max310x.c        |   9 +-
>  drivers/tty/serial/mux.c            |  13 +-
>  drivers/tty/serial/mvebu-uart.c     |   2 +
>  drivers/tty/serial/mxs-auart.c      |   2 +
>  drivers/tty/serial/sb1250-duart.c   |  14 +-
>  drivers/tty/serial/sccnxp.c         |  45 ++++--
>  drivers/tty/serial/serial_core.c    | 100 +++++++++++--
>  drivers/tty/serial/ucc_uart.c       |   6 +-
>  include/linux/serial_core.h         |  18 ++-
>  25 files changed, 551 insertions(+), 169 deletions(-)
> ---
> base-commit: 1184f87e2790e8af9be3116f608d2e86b4792d7d
> change-id: 20261021-submit-serial-8250-dma-cancel-v1-b208f84e89c1
> prerequisite-patch-id: 3604bfaa3a1c214997de1f11162b81a4541af5ab
> prerequisite-patch-id: 79dd093ffb35e254e790dffb8887faf51b64f947
> prerequisite-patch-id: 80a5061d84c055a64c760268febed179c687b99f
> prerequisite-patch-id: 7dbb404baf1f861982cf6a4b755d39cfec548223
> prerequisite-patch-id: 40881d81a27b3a1aa45203d171214faaf2197768
> prerequisite-patch-id: 4456eb7f800cb5d50a70c898e6d5a452a7f0bca4
> prerequisite-patch-id: c3d8ac0d54d1bfe43657964c517cfa4c7fde11af
> prerequisite-patch-id: 48659e5ef3f5fb377d0b751f0830c0de4699262c
> 
> Best regards,
> --  
> James Hilliard <james.hilliard1@gmail.com>
> 

-- 
 i.


