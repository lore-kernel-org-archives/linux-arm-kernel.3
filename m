Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A4CCD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 12:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vE7RdfFrv3z5SE91ZG6pmeFTFDF5vNPcNpZ+sQ+T1TI=; b=G7bKiVhyr/in04PPkzb3gieIQd
	NGMizgi0LZO79hLj2pcvkdIHJlIw5pvjBokgbGzQ87FX6Ns8feuGGR/8h1Gu9HsRWbcGcwvJCRJpV
	21ANSSO14BzFsmEeZq4cmyL2diW597lao6bLK5BGRYS7kWWpKaVHu7soWf/YOgwokhAg6KB0Qgjhn
	LkHZj8AsrWcLD/dG2hrmij1YsrvKJenSDTEDvwrJeSYhTpC4kOXU4CcTykOj+ZxLmgsKZh62LwDw/
	h7mw4L7TTHalBrTMqbGnoxF9745n6689OOLXFdfByjk+QZV1XQ5cUivt/2u2iqlT0kbJ4NwPrpHdA
	38iyJ6aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKbAk-00000000jJq-00La;
	Wed, 06 May 2026 12:16:14 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKbAh-00000000jIr-3c9p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 12:16:12 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1778069768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vE7RdfFrv3z5SE91ZG6pmeFTFDF5vNPcNpZ+sQ+T1TI=;
	b=xFWnkskhPGgbQOkrcHPHBsstkhAM00sSjLFAeRB7VzAGCrQd59JlHjM9TCgWEEmGIKRJ7/
	k2bYdKFleAMOKjMHNIcEOl/uTVR6/5zhe5UfT+ah4SV/9UC470291f5Cy/OCazslWDWX3V
	xI6AOJHY9Vb5Z2Lp18gttQNdO12+m3FCXz6EmHkgsFQUYkycZ8y3QKUZ5oZcfRs2vDSzmj
	YmuN2wQMvqAVxj4MMcrOqjRtJ2ArZt9u3FxssTpjJjUKGlc5XPAzpreqPcNTFrUBhU7jHQ
	YG0pjdXUpioFaEKxBXJ8HfUjc7XqkwLCAtnbUgsUvojn6RE1WMGAdJ0N6g3NbA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1778069768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vE7RdfFrv3z5SE91ZG6pmeFTFDF5vNPcNpZ+sQ+T1TI=;
	b=gbuMKKHK9iOhMyI9k4nDA6P3GImdUXN5z+ClLWkNQ4asJJ6vbp9KZQCLfDC7BZWxClqLI0
	b8SM7ivQMkIu1fDQ==
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	"David S. Miller" <davem@davemloft.net>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Thomas Fourier <fourier.thomas@gmail.com>,
	Kees Cook <kees@kernel.org>,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH tty v4 2/6] serial: Replace driver usage of UPF_CONS_FLOW
Date: Wed,  6 May 2026 14:21:57 +0206
Message-ID: <20260506121606.5805-3-john.ogness@linutronix.de>
In-Reply-To: <20260506121606.5805-1-john.ogness@linutronix.de>
References: <20260506121606.5805-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_051612_044383_EA34C9B8 
X-CRM114-Status: GOOD (  16.70  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Rather than using the UPF_CONS_FLOW bit of uart_port.flags to track
the user configuration of console flow control, use the newly added
uart_port.cons_flow (via its getter/setter functions).

A coccinelle script was used to perform the search/replace.

Note1: The sh-sci driver is blindly copying platform data configuration
       flags to uart_port.flags. Thus UPF_CONS_FLOW could get set for
       uart_port.flags. A follow-up commit will address this.

Note2: The samsung_tty driver is using UPF_CONS_FLOW as a platform data
       configuration flag. However, the driver explicitly checks for
       this configuration flag and thus setting UPF_CONS_FLOW in
       uart_port.flags is avoided.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 drivers/tty/serial/8250/8250_port.c | 4 ++--
 drivers/tty/serial/bcm63xx_uart.c   | 2 +-
 drivers/tty/serial/omap-serial.c    | 2 +-
 drivers/tty/serial/pch_uart.c       | 2 +-
 drivers/tty/serial/pxa.c            | 2 +-
 drivers/tty/serial/samsung_tty.c    | 8 ++++----
 drivers/tty/serial/serial_txx9.c    | 4 ++--
 drivers/tty/serial/sunsu.c          | 2 +-
 8 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index af78cc02f38e7..dbed5e5767541 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -1988,7 +1988,7 @@ static void wait_for_xmitr(struct uart_8250_port *up, int bits)
 	wait_for_lsr(up, bits);
 
 	/* Wait up to 1s for flow control if necessary */
-	if (up->port.flags & UPF_CONS_FLOW) {
+	if (uart_cons_flow_enabled(&up->port)) {
 		for (tmout = 1000000; tmout; tmout--) {
 			unsigned int msr = serial_in(up, UART_MSR);
 			up->msr_saved_flags |= msr & MSR_SAVE_FLAGS;
@@ -3351,7 +3351,7 @@ void serial8250_console_write(struct uart_8250_port *up, const char *s,
 		 * it regardless of the CTS state. Therefore, only use fifo
 		 * if we don't use control flow.
 		 */
-		!(up->port.flags & UPF_CONS_FLOW);
+		!uart_cons_flow_enabled(&up->port);
 
 	if (likely(use_fifo))
 		serial8250_console_fifo_write(up, s, count);
diff --git a/drivers/tty/serial/bcm63xx_uart.c b/drivers/tty/serial/bcm63xx_uart.c
index 51df9d2d8bfc5..544695cb184c3 100644
--- a/drivers/tty/serial/bcm63xx_uart.c
+++ b/drivers/tty/serial/bcm63xx_uart.c
@@ -675,7 +675,7 @@ static void wait_for_xmitr(struct uart_port *port)
 	}
 
 	/* Wait up to 1s for flow control if necessary */
-	if (port->flags & UPF_CONS_FLOW) {
+	if (uart_cons_flow_enabled(port)) {
 		tmout = 1000000;
 		while (--tmout) {
 			unsigned int val;
diff --git a/drivers/tty/serial/omap-serial.c b/drivers/tty/serial/omap-serial.c
index 0b85f47ff19e0..a689d190940cf 100644
--- a/drivers/tty/serial/omap-serial.c
+++ b/drivers/tty/serial/omap-serial.c
@@ -1092,7 +1092,7 @@ static void __maybe_unused wait_for_xmitr(struct uart_omap_port *up)
 	} while (!uart_lsr_tx_empty(status));
 
 	/* Wait up to 1s for flow control if necessary */
-	if (up->port.flags & UPF_CONS_FLOW) {
+	if (uart_cons_flow_enabled(&up->port)) {
 		for (tmout = 1000000; tmout; tmout--) {
 			unsigned int msr = serial_in(up, UART_MSR);
 
diff --git a/drivers/tty/serial/pch_uart.c b/drivers/tty/serial/pch_uart.c
index 6729d8e83c3c5..2f72cd62e2488 100644
--- a/drivers/tty/serial/pch_uart.c
+++ b/drivers/tty/serial/pch_uart.c
@@ -1444,7 +1444,7 @@ static void wait_for_xmitr(struct eg20t_port *up, int bits)
 	}
 
 	/* Wait up to 1s for flow control if necessary */
-	if (up->port.flags & UPF_CONS_FLOW) {
+	if (uart_cons_flow_enabled(&up->port)) {
 		unsigned int tmout;
 		for (tmout = 1000000; tmout; tmout--) {
 			unsigned int msr = ioread8(up->membase + UART_MSR);
diff --git a/drivers/tty/serial/pxa.c b/drivers/tty/serial/pxa.c
index fea0255067ccd..10fc8990579b5 100644
--- a/drivers/tty/serial/pxa.c
+++ b/drivers/tty/serial/pxa.c
@@ -573,7 +573,7 @@ static void wait_for_xmitr(struct uart_pxa_port *up)
 	} while (!uart_lsr_tx_empty(status));
 
 	/* Wait up to 1s for flow control if necessary */
-	if (up->port.flags & UPF_CONS_FLOW) {
+	if (uart_cons_flow_enabled(&up->port)) {
 		tmout = 1000000;
 		while (--tmout &&
 		       ((serial_in(up, UART_MSR) & UART_MSR_CTS) == 0))
diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index e27806bf2cf3e..2f94fc798cffb 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -319,7 +319,7 @@ static void s3c24xx_serial_stop_tx(struct uart_port *port)
 	ourport->tx_enabled = 0;
 	ourport->tx_in_progress = 0;
 
-	if (port->flags & UPF_CONS_FLOW)
+	if (uart_cons_flow_enabled(port))
 		s3c24xx_serial_rx_enable(port);
 
 	ourport->tx_mode = 0;
@@ -493,7 +493,7 @@ static void s3c24xx_serial_start_tx(struct uart_port *port)
 	struct tty_port *tport = &port->state->port;
 
 	if (!ourport->tx_enabled) {
-		if (port->flags & UPF_CONS_FLOW)
+		if (uart_cons_flow_enabled(port))
 			s3c24xx_serial_rx_disable(port);
 
 		ourport->tx_enabled = 1;
@@ -781,7 +781,7 @@ static void s3c24xx_serial_rx_drain_fifo(struct s3c24xx_uart_port *ourport)
 		uerstat = rd_regl(port, S3C2410_UERSTAT);
 		ch = rd_reg(port, S3C2410_URXH);
 
-		if (port->flags & UPF_CONS_FLOW) {
+		if (uart_cons_flow_enabled(port)) {
 			bool txe = s3c24xx_serial_txempty_nofifo(port);
 
 			if (ourport->rx_enabled) {
@@ -1830,7 +1830,7 @@ static int s3c24xx_serial_init_port(struct s3c24xx_uart_port *ourport,
 
 	if (cfg->uart_flags & UPF_CONS_FLOW) {
 		dev_dbg(port->dev, "enabling flow control\n");
-		port->flags |= UPF_CONS_FLOW;
+		uart_set_cons_flow_enabled(port, true);
 	}
 
 	/* sort our the physical and virtual addresses for each UART */
diff --git a/drivers/tty/serial/serial_txx9.c b/drivers/tty/serial/serial_txx9.c
index 436a559234dfe..4ae9a45c8e3a3 100644
--- a/drivers/tty/serial/serial_txx9.c
+++ b/drivers/tty/serial/serial_txx9.c
@@ -422,7 +422,7 @@ static void wait_for_xmitr(struct uart_port *up)
 		udelay(1);
 
 	/* Wait up to 1s for flow control if necessary */
-	if (up->flags & UPF_CONS_FLOW) {
+	if (uart_cons_flow_enabled(up)) {
 		tmout = 1000000;
 		while (--tmout &&
 		       (sio_in(up, TXX9_SICISR) & TXX9_SICISR_CTSS))
@@ -857,7 +857,7 @@ serial_txx9_console_write(struct console *co, const char *s, unsigned int count)
 	 *	Disable flow-control if enabled (and unnecessary)
 	 */
 	flcr = sio_in(up, TXX9_SIFLCR);
-	if (!(up->flags & UPF_CONS_FLOW) && (flcr & TXX9_SIFLCR_TES))
+	if (!uart_cons_flow_enabled(up) && (flcr & TXX9_SIFLCR_TES))
 		sio_out(up, TXX9_SIFLCR, flcr & ~TXX9_SIFLCR_TES);
 
 	uart_console_write(up, s, count, serial_txx9_console_putchar);
diff --git a/drivers/tty/serial/sunsu.c b/drivers/tty/serial/sunsu.c
index 6505a1930da9a..4ff3e5c41dab9 100644
--- a/drivers/tty/serial/sunsu.c
+++ b/drivers/tty/serial/sunsu.c
@@ -1245,7 +1245,7 @@ static void wait_for_xmitr(struct uart_sunsu_port *up)
 	} while (!uart_lsr_tx_empty(status));
 
 	/* Wait up to 1s for flow control if necessary */
-	if (up->port.flags & UPF_CONS_FLOW) {
+	if (uart_cons_flow_enabled(&up->port)) {
 		tmout = 1000000;
 		while (--tmout &&
 		       ((serial_in(up, UART_MSR) & UART_MSR_CTS) == 0))
-- 
2.47.3


