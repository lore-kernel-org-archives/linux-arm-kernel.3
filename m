Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C96B606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 06:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CpL5gK4S;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lh5/qO6G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=edz22Fq6n7hqO7w64D56fVejxYtfF3v+LcW93z688tQ=; b=CpL5gK4SRVd4YlriBjxW51pDdw
	4RgB2W8OQMMvBOR/hratY2bdc5+vQdngXjdSlkUoZvImIp+vhiton5qQRF7lzuS5PqiScTV4wqicL
	AkBYnWqnZXMF7RBGjoufAkcV6jtfx9jaA8H8jigyDK14/AIE4Bqn4VON0ztHZPVn0o/9xZGWIXIRm
	AACUAcSAe3GXZbsZrr9Si0Odm/j90/fvndDeQ12v0X3FwoZETrAeGGQZrYBcs2cDYWJYUAIVFXAbb
	/h06gffJLT8dE03rWHNboizfW6HANhjPXUVQVBT5TqX7yUiBImct3djLbcQPj1gzaoaLyeckctMny
	6RW3QjAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKVQz-0000000HV66-2mtY;
	Sat, 24 Oct 2026 06:40:53 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKVQw-0000000HV5A-1RV1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 06:40:52 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-4a451915d8aso1181625b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 23:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792824049; x=1793428849; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=edz22Fq6n7hqO7w64D56fVejxYtfF3v+LcW93z688tQ=;
        b=lh5/qO6GmyuLO0cna448OjGgBjBBMk3lTI0CHVMXEgfPF1CeOiG5H041EHFtHUanKe
         UsNlAGXofpgoRgUg6RL+R7umgey5VVW13DOAezfR9cVPjigh3ZB4Keeq70dN0p/+2xqr
         BmM9YJzslqmjx0O7qiDhRCJf2OgSCbiKitCEdbLuTnjS2bD0MIRyx7BV/16G7hgIsy7C
         ig9Yu/jaS6EJ5Zz0Wx2Fe+eLNOzgESqwO2eNkVoLuq5T+QTRmxeXw7G+XCDUF9zyim/y
         /taHk+6TDWGDQA+AD3vtunuLXlEDNexHTS0wXVpXP+ciL0FWpLXmjYthkyaTX8Jv/QU1
         gxtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792824049; x=1793428849;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=edz22Fq6n7hqO7w64D56fVejxYtfF3v+LcW93z688tQ=;
        b=jIs/nCTXT7PsRPMeKL4LEtWvZSF4m4dzIFwIE/qLtYfaqom/Xb9xCpzmQPntvqjjnZ
         kAOL6knKQdRXTkUlsEI3Eu3HeN8nI5IYClO0eLyjgYD23S7hb76qvATivvur+mWEc5G8
         AXYS4xRA8wSvadMsESTHXMYh7fxwgRguUPXwWjW54aCjsw8xsxINnk8d3NzAzKu/KGTs
         i4qx/tUOTjXrI3//8rhqxrcYt9qTBuHsL5i8jQ524BdQtEnwK71cDqD8O7ahVfepVo7v
         mw1XO0Xhr3CxJc6uKcRUizjjDsH5fK6vbrBX6Y69XSg0OcSfzMEeXnXCTzRlO8FMBDpC
         6I6A==
X-Forwarded-Encrypted: i=1; AKwUvByVUDsoSw+//JurRT/mqsZHqLFgthx6b2dC+WwTBtw0mpQmx9F8Q00R4WAeorVX7HeqleTYQSj/EB/vz6lm1rWU@lists.infradead.org
X-Gm-Message-State: AFq9FYISW+zDMBndQUWjOuNybyr5tVI8KKi3aPzwO8E/S96Gr5eFRRpV
	sFNhJCPTii+vlwtuRO+vhHgpKPg78MCLBGcbmAyD/O7koUzgSz1zURA7
X-Gm-Gg: AYBFou32clrN9ljCnoelAHVxHI1hHAJZ3qKptu0WfqBhAQwjhKfhgG44rDLqgBqoRVh
	44nPhdYHvuGXQKluFx4TN4e7lHssnow8T8BWDQ5YoQH51jwGDsGVcPke40tdhpIO0Lbby3oSrkh
	DhOo7/hDR5I8XG+8uOKvgE2YLvwCHptOPUUNF6r40DL9bYq7PgzTLNgm1BxnkSksjhyS/EE+ZcL
	sTCAHEbR2E7Q0i8xPdAtklQkqRL3gNhKMtNZnGN/IHpgQfesinS0gaUYuxcns9TUEeOSivWAWRY
	tSYXfiopF22M6yErLbOK0lA9cmqL/4i+eKQ8rwKgM1plcfZkdOdmDRSzBfbBWiAPTqcHbKExlWX
	nq3TgUaSVlLWoSJjoxVPCdSqmQnZzve3ij6pgaaAa2mHR8hX/2vr7yfHHb2oDfuDw72c2DY6m1l
	fDT3PoWWcJBYRS3vAHAQn6+ZA1oN6pkpoXaM3zAIL/S1+yBzz2yhSMstNka3BqwJ4Jzdfu44V4H
	z5ebWMaZa+IP6W2gSsZPxt4gCy+zeazAFI6wWJvON6JhjcIlyXLe/QQJeLTWKHESuvw6PP8d3tP
	N83D/BeNDDJSFeF6uP/ptkxtbxH2OI2YMP+TSVGNlWkwfSZf5t6Y2kK1Z7ZzV7ddnB3FOc2boLx
	cY9HLMmia8KPa6HS+TKYF8xV0OJFs6y7BF1e59fbNVnDfvAaTuqOlUef+zoBoCiZlBnnVX+P9Bj
	gHgA==
X-Received: by 2002:a05:6808:1798:b0:525:184c:7952 with SMTP id 5614622812f47-55c0026231bmr837705b6e.16.1792824048956;
        Fri, 23 Oct 2026 23:40:48 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c0429c56asm864633b6e.9.2026.10.23.23.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 23:40:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v5 0/5] serial: 8250: serialize DMA cancellation with
 buffer reuse
Date: Sat, 24 Oct 2026 00:40:39 -0600
Message-Id: <20261024-submit-serial-8250-dma-cancel-v1-v5-0-9e52968928d2@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WS3WobQQyFX8Xsdbcdaf6kXPU9Si80M1K8JXZS2
 zEtIe9erdOL2FBIYVnQovMdHa1epqMeFj1Od5uX6aDn5bg87r3InzZT38r+XudleD1hwAIBYT4
 +t91ymleZPMyEOcxjJ3OXfdeH+Qxzw0BGSYk7TI55Oqgtvy4W376/1c74of20cteOJked28EJ2
 /WTNxz055d/OeS/UO959nFPb+Q3SH/c+XB3GwBKRlWxclAS46YRoFgJNFCptFQZRx0XlJz61lP
 ebWIJqZlIFOgIibkOBQMXYiOQlBOIZWnXqspjBI5mLWbFnNQ9h1dEVM37oZVknOq1ioLkUGBQ6
 iFnKanX4ism06YDKvdCtTHbjddoLfmQYmBUgAm7FUmt5jwid9OeEyHGa1UKRO4EgrV5NvEkGKK
 7gKf0vIbAtRa6UaVctFWjEHrLIwepoROTlpFXglQLrUu6ViHVIkCBNZsi+xYws2uj/4oiaj4H5
 ZBvVIlKdoVatOx7rHUEzwQWKIYehqbCjAX7tB7QdjmeHg+/Lyd7hsvP//h1+hNm9dEasWEM8ev
 9TpaHz345F/gZ3wPxA0B0oC9YJYNGYrgFxvfA+AFgdOCoZKypJ454C0z/C0xr5JrZr5miv98DX
 19f/wCQKuFMBAQAAA==
X-Change-ID: 20261021-submit-serial-8250-dma-cancel-v1-b208f84e89c1
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Raul E Rangel <rrangel@chromium.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Tony Lindgren <tony@atomide.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>, 
 Timur Tabi <timur@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linuxppc-dev@lists.ozlabs.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_234050_417644_28D0D385 
X-CRM114-Status: GOOD (  18.92  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reserve canceled transmit and receive storage until DMA and its completion
callbacks have retired. Serial-core write backpressure protects a flushed
TX FIFO while normal transfers continue to DMA directly from that FIFO.

The series separates OMAP's locked completion processing and serializes
asynchronous write wakeups with the port lock before adding the serial-core
reservation helpers and applying them to 8250 TX. Flushing
empties the logical queue immediately. While the old transfer owns its
storage, write_room() reports zero and write-ready notifications wait for
retirement. Failed termination retains the reservation until normal
completion, without advancing the reset FIFO. DMA retirement releases the
reservation independently of port readiness. Serial core keeps writes and
wakeups gated during shutdown until successful startup or resume.

RX delivers paused data before the PIO fallback and retires callbacks in
process context. Track FIFO access separately from buffer retirement so
PIO and the DesignWare empty-FIFO timeout handling can run once DMA has
released the FIFO. On failure, retain the requested interrupt enables in
the existing IER shadow and mask receive interrupts in hardware until DMA
has stopped. Recovery then leaves RX on PIO until reopen. Shutdown excludes
new retirement work before releasing the channels.

Based on tty-next with the posted shutdown guard [0], channel
configuration error handling [1], RX TTY accounting fix [2], RZ/N1
transfer-length fix [3], transmit-PM shutdown fix [4], serport
write-wakeup deferral [5], DesignWare BUSY-safe fractional-divisor
programming [6], and Intel MID RX DMA timeout locking [7]. The serport fix
is needed before serializing the remaining write-wakeup callers with the
port lock.

[0] https://lore.kernel.org/r/20261021-submit-serial-8250-dma-shutdown-v1-v1-1-3d3ce383c614@gmail.com
[1] https://lore.kernel.org/r/20261021-submit-serial-8250-dma-config-errors-v1-v1-1-c067587d1ef2@gmail.com
[2] https://lore.kernel.org/r/20261021-submit-serial-8250-dma-rx-accounting-v1-v1-1-c11795914ab4@gmail.com
[3] https://lore.kernel.org/r/20261023-submit-serial-8250-dma-tx-length-v1-v2-1-c3106ef4d2df@gmail.com
[4] https://lore.kernel.org/r/20261022-submit-serial-8250-tx-pm-shutdown-v1-v1-1-0e894afa3bb8@gmail.com
[5] https://lore.kernel.org/r/20261023-submit-serport-write-wakeup-v1-v1-1-74e7311638a2@gmail.com
[6] https://lore.kernel.org/r/20261023-submit-serial-8250-dw-divisor-v1-v1-1-f452d4bb1b1f@gmail.com
[7] https://lore.kernel.org/r/20261024-submit-serial-8250-mid-rx-lock-v1-v1-1-2b9afdf869d7@gmail.com

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v5:
- Add the posted serport write-wakeup deferral as a prerequisite for the
  caller-locking preparation.
- Add a preparatory patch serializing asynchronous write-wakeup callers
  with the port lock, including indirect CTS and transmit-helper calls.
  Keep sleeping register accesses outside the lock and defer SCCNXP
  notifications until its controller lock is released.
- Use the separately posted DesignWare BUSY-safe fractional-divisor fix
  and Intel MID RX DMA timeout locking fix as prerequisites, leaving five
  patches in this series.
- Separate serial-core write readiness from DMA storage reservations. Record
  retirement during startup and shutdown while keeping writes and wakeups
  gated until the port is ready.
- Wake deferred writers after successful startup or resume, including when
  reopening with a retained FIFO, and restart any retained queued output.
- Keep the write-ready notification pending while retained output is at or
  above the normal wakeup threshold, until TX completion drains it.
- Publish resume readiness under the TX restart lock without releasing a
  reservation that may belong to a newly flushed transfer.
- Release 8250's TX reservation after shutdown has stopped DMA and unmapped
  the source; serial core retains control of write readiness.
- Link to v4: https://patch.msgid.link/20261023-submit-serial-8250-dma-cancel-v1-v4-0-e759de1839de@gmail.com

Changes in v4:
- Retain flushed TX reservations through shutdown and failed resume. Release
  them after successful resume, or when allocating a new FIFO on reopen,
  so retirement cannot wake writers into a closing port.
- Treat RX flush as complete once the channel is inactive, and clear the
  shutdown guard before startup configures the UART and tests interrupts.
- Check completion after a failed pause so a transfer that finished before
  its callback acquired the port lock is delivered and retired normally.
- Keep DesignWare's BUSY-safe divisor setter after fractional-divisor
  discovery, writing DLF and DLL/DLH only after confirming DLAB.
- Link to v3: https://patch.msgid.link/20261023-submit-serial-8250-dma-cancel-v1-v3-0-d78f9e4c4932@gmail.com

Changes in v3:
- Defer write-ready wakeups while flushed TX storage is reserved, and
  serialize the flush wakeup with the reservation under the port lock.
- Suppress ordinary TX starts during the reservation while preserving
  high-priority flow-control characters, which use separate storage.
- Separate RX FIFO access from callback retirement, allowing PIO and the
  DesignWare empty-FIFO timeout workaround after a successful pause and
  termination while keeping the receive buffer reserved.
- Use the existing IER shadow for requested enables and a shared register
  writer to keep receive interrupts masked throughout DMA error recovery,
  including termios, RS485, modem-status and overrun-backoff updates.
- Preserve the timeout-enable bit across stop_rx(), exclude late shutdown
  interrupts from PIO, and avoid FIFO resets during RX DMA recovery.
- Preserve the completion-path LSR read after stop_rx(), while gating DMA
  resubmission on the receive interrupt enable.
- Pack the cancellation flags after moving all their accesses under the
  port lock, including the recovery worker's snapshot and initialization.
- Apply the early-return, shared-helper and line-wrapping cleanups.
- Link to v2: https://patch.msgid.link/20261022-submit-serial-8250-dma-cancel-v1-v2-0-088ea51e3891@gmail.com

Changes in v2:
- Add serial-core helpers to reserve flushed transmit storage until DMA
  retirement. Apply write backpressure during that interval and keep normal
  TX using the FIFO directly, replacing the private transmit buffer in v1.
- Document the flush callback's reservation, writer backpressure and
  retirement requirements, including release before shutdown returns.
- Split the OMAP completion refactor into a preparatory patch and move
  the RZ/N1 preparation-order and shutdown PM fixes to independent
  submissions, keeping four patches in this series.
- Take runtime PM references around worker UART accesses, and leave normal
  RX retirement to release ownership without reading LSR or restarting DMA.
- Synchronize the queued TX ranges before preparing the descriptor and
  return the mapping to CPU ownership before releasing the reservation.
- Keep the TX transfer length separate from FIFO cancellation, so a failed
  termination can account completion without advancing the reset FIFO.
- Exclude late RX flush work during shutdown, including Intel MID DMA
  timeout interrupts which are independent of UART_IER.
- Accept DMA_IN_PROGRESS after successful pause, and recover from failed
  pause, termination or DMA_ERROR before handing the receiver to PIO.
- Preserve stop_rx() and shutdown across recovery, and retain the
  DesignWare empty-FIFO timeout workaround when receiving through PIO.
- Apply the requested guard spacing and container_of() formatting.
- Link to v1: https://patch.msgid.link/20261021-submit-serial-8250-dma-cancel-v1-v1-0-efe2b89f2303@gmail.com

---
James Hilliard (5):
      serial: 8250_omap: separate locked TX DMA completion processing
      serial: serialize asynchronous write wakeups with the port lock
      serial: core: allow drivers to reserve flushed transmit storage
      serial: 8250: drain canceled TX DMA before reusing its buffer
      serial: 8250: retire canceled RX DMA before reusing the receive buffer

 drivers/tty/serial/21285.c          |   2 +
 drivers/tty/serial/8250/8250.h      |  59 +++++++-
 drivers/tty/serial/8250/8250_core.c |   2 +-
 drivers/tty/serial/8250/8250_dma.c  | 284 +++++++++++++++++++++++++++---------
 drivers/tty/serial/8250/8250_dw.c   |  27 +++-
 drivers/tty/serial/8250/8250_omap.c |  38 +++--
 drivers/tty/serial/8250/8250_port.c |  31 ++--
 drivers/tty/serial/atmel_serial.c   |   2 +
 drivers/tty/serial/clps711x.c       |   6 +-
 drivers/tty/serial/cpm_uart.c       |   2 +
 drivers/tty/serial/fsl_lpuart.c     |   2 +-
 drivers/tty/serial/jsm/jsm_cls.c    |   3 +-
 drivers/tty/serial/jsm/jsm_neo.c    |   9 +-
 drivers/tty/serial/lantiq.c         |   3 +-
 drivers/tty/serial/ma35d1_serial.c  |   6 +-
 drivers/tty/serial/max3100.c        |   6 +-
 drivers/tty/serial/max310x.c        |   9 +-
 drivers/tty/serial/mux.c            |  13 +-
 drivers/tty/serial/mvebu-uart.c     |   2 +
 drivers/tty/serial/mxs-auart.c      |   2 +
 drivers/tty/serial/sb1250-duart.c   |  10 +-
 drivers/tty/serial/sccnxp.c         |  45 ++++--
 drivers/tty/serial/serial_core.c    | 100 +++++++++++--
 drivers/tty/serial/ucc_uart.c       |   6 +-
 include/linux/serial_core.h         |  18 ++-
 25 files changed, 532 insertions(+), 155 deletions(-)
---
base-commit: 1184f87e2790e8af9be3116f608d2e86b4792d7d
change-id: 20261021-submit-serial-8250-dma-cancel-v1-b208f84e89c1
prerequisite-patch-id: 3604bfaa3a1c214997de1f11162b81a4541af5ab
prerequisite-patch-id: 79dd093ffb35e254e790dffb8887faf51b64f947
prerequisite-patch-id: 80a5061d84c055a64c760268febed179c687b99f
prerequisite-patch-id: 7dbb404baf1f861982cf6a4b755d39cfec548223
prerequisite-patch-id: 40881d81a27b3a1aa45203d171214faaf2197768
prerequisite-patch-id: 4456eb7f800cb5d50a70c898e6d5a452a7f0bca4
prerequisite-patch-id: 2876a1809e5fe29b8825950a32796aef1d885054
prerequisite-patch-id: 48659e5ef3f5fb377d0b751f0830c0de4699262c

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


