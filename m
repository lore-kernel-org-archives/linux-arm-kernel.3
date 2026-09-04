Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE215C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 11:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Xe6EwabIXBD1fwJZlA9EYarG/RJHgSOSX9nc22lp4dc=; b=bmO5qlESBONCc2W4JzBGyHIdSt
	1x+dmMclcB5rTUP3UifB5CciFr7Op9OXKWoH6FgCrlHwzU3VMXVJVejnKJ8cg7wHprAKQ729mFBOf
	MnYEpd763iBfEdfsMOttU1HxZuQHtnGhNH+Q9gqs6G0ap3ZBjcKkhdAer5DSYL5MmTJfrKu42wuxU
	6Fwedo26YNnAdvianbBy/Z+kyW39rQK1iyP5DNM5a7WSu5C51LvIBSDwE5IPseTi5myEdwRP8CEa1
	i9ov4DFE9cDu7ip3TAdU/D4Tg0CISIClG6SkLY51ql3YVxigGB7TSIc2OMo6XJwLEyMSzAlSTtHCY
	UNfWHI9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2SGz-00000001rXf-0GqK;
	Fri, 04 Sep 2026 11:39:57 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2SGv-00000001rWG-23YV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 11:39:55 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2d5335cf904so8425155ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 04:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788521992; x=1789126792; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xe6EwabIXBD1fwJZlA9EYarG/RJHgSOSX9nc22lp4dc=;
        b=WRcrYsiy3SCOlaidLpiMeFG/atO+r/qFIwYaMLMUGmpbZZ7l7bgOLt0706HObN1ZpM
         5JEKanQVlHZe17zfBM0h8AmU3uv2M0JKveK0pUka3mfUrl9Sofy234Sz6Ei4MyJT1e0S
         N7J+yNd02CQTG9CH5jy5sVQe1nSnFGmtlPRV6C37BHRQUOMZVM94+DOsUFZ1niw/Ef1l
         Hp21vgVmnRNWtRs+KN4hIyuUbPiIy21e2rBxBMjSY1Eub8zKrAT20XD0hIV/fzo5DWGA
         YXHwp+AHWTogv0RiGbPINg9jBx4AM6oxS0ayzx1pr9/tQ8aMjuX4H5NE+8Hp4/qIEUMo
         Jpxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788521992; x=1789126792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xe6EwabIXBD1fwJZlA9EYarG/RJHgSOSX9nc22lp4dc=;
        b=dhhjX6DHlNs/8vOviWk70GVph6cM3Nlniqu30298RqoVWnnx6rxZa9Jn13OJIFEI34
         ucYPyv5IQ3FMBOAt3BiI7afOCOCL8H0hmFgFG890cgPVWjoZ9/vaGZuiviaIHpxs+MYp
         XANrUPAdXpzpmTk35u8F1JrsR62lzm3G1zgsZuWah0dHYYZai2UsTxFdju2uTCIv4a6o
         vBUUX+Igb4es+Ms3svSU7GAfwAkBx+LEhzKDQ6PxlCDimftSNo9fx26eqBrtrdPF4LIH
         2aK7ArbLRWRRpOgazAn20J6b8rcGvUMsthGBffFGprFIKA+HCiDciojobkfDkf+QTAUW
         ZbFw==
X-Forwarded-Encrypted: i=1; AKwUvBwoR7buTtKtB27TkegCcOTU+Rd6YyV9BAuWLGgU0cUjlY3FPII1LMULuXq1ns6ZwgbhpoFbSD1tx22JjvWQk91q@lists.infradead.org
X-Gm-Message-State: AFuF++nMlZ4Vcq2UrVKzlXaV7w9tSVYT0g0ZYLCZPAaSBB78kk6fOht7
	5XQUMdplo7baWTeIf5syeKO/Nc8mtnKBZnUAGhi59Us7CPLMSTyUcR+l
X-Gm-Gg: AYBFou1ZPGS0UQlhYH3GGn2b6k8nFFJpFFxzXwT5UGXDmGFcW20lgUN52/9vmn6i1Tl
	qHWQEvigwPehv8zKpXM3iIv2xPLgRse9eQy4tg2fiEXcL0M2xAF0RXK+SB7L0cSBtC8MgkUuTeA
	6+pTzGkVa/MmeM9RBrNaQhjyUr+IVmG0u0JR/MPfV29Mh8VZWTGeb3GJqEXGabqv9wf/vTyzpIn
	ooQTJ0VMd7IWNqp0UM3g4NUFZ3ieCXeMdP6tjQ03vNoPVtsKhC7QChCy1HAq3P+z9FSZGu0WH5z
	ooMQCavfg5xcgr+CtDZsfKkkSoxPZw6i12DFrDjfpk2DD0pCmVnd13Krc/Fs67y8bqVQYGhLEQX
	g4hSYHOXcWr+abr3KAAgVpzg6gKw/YGtIkmf8axqI4mJL+fqH8iXHD4GdVy7aJ/xDkvD0Jo6OVf
	tbB8/4z8/zobJVoIrkZ/x9vGVW/2q9DUDnqWgPpQE+aZwMhMGYPW4d0l1nw6xq2txxuHwktWby5
	btIzyi579PPT4ZHIYBrGfInFF9czvEyVWe0Rw==
X-Received: by 2002:a17:90b:3b88:b0:398:dcfe:968e with SMTP id 98e67ed59e1d1-39b261da746mr7361746a91.20.1788521992489;
        Fri, 04 Sep 2026 04:39:52 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339ac24d7esm9124215eec.15.2026.09.04.04.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:39:52 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Peter Korsgaard <jacmet@sunsite.dk>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH] tty: fix typos in comments
Date: Fri,  4 Sep 2026 17:09:35 +0530
Message-ID: <20260904113942.22785-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_043953_562662_21F45883 
X-CRM114-Status: GOOD (  29.42  )
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

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/tty/serial/8250/8250_exar.c | 2 +-
 drivers/tty/serial/ar933x_uart.c    | 4 ++--
 drivers/tty/serial/atmel_serial.c   | 2 +-
 drivers/tty/serial/imx.c            | 2 +-
 drivers/tty/serial/men_z135_uart.c  | 2 +-
 drivers/tty/serial/mvebu-uart.c     | 2 +-
 drivers/tty/serial/mxs-auart.c      | 2 +-
 drivers/tty/serial/pic32_uart.c     | 2 +-
 drivers/tty/serial/pmac_zilog.c     | 4 ++--
 drivers/tty/serial/pmac_zilog.h     | 2 +-
 drivers/tty/serial/serial-tegra.c   | 2 +-
 drivers/tty/serial/st-asc.c         | 4 ++--
 drivers/tty/serial/uartlite.c       | 4 ++--
 drivers/tty/serial/xilinx_uartps.c  | 2 +-
 drivers/tty/vt/vt.c                 | 2 +-
 include/linux/tty_driver.h          | 2 +-
 16 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_exar.c b/drivers/tty/serial/8250/8250_exar.c
index 836792e861bf..1e37e3e5d319 100644
--- a/drivers/tty/serial/8250/8250_exar.c
+++ b/drivers/tty/serial/8250/8250_exar.c
@@ -587,7 +587,7 @@ pci_fastcom335_setup(struct exar8250 *priv, struct pci_dev *pcidev,
 }
 
 /**
- * cti_tristate_disable() - Disable RS485 transciever tristate
+ * cti_tristate_disable() - Disable RS485 transceiver tristate
  * @priv: Device's private structure
  * @port_num: Port number to set tristate off
  *
diff --git a/drivers/tty/serial/ar933x_uart.c b/drivers/tty/serial/ar933x_uart.c
index 5b491db9d2fc..118fa8b1e44b 100644
--- a/drivers/tty/serial/ar933x_uart.c
+++ b/drivers/tty/serial/ar933x_uart.c
@@ -343,7 +343,7 @@ static void ar933x_uart_set_termios(struct uart_port *port,
 	ar933x_uart_rmw_set(up, AR933X_UART_CS_REG,
 			    AR933X_UART_CS_HOST_INT_EN);
 
-	/* enable RX and TX ready overide */
+	/* enable RX and TX ready override */
 	ar933x_uart_rmw_set(up, AR933X_UART_CS_REG,
 		AR933X_UART_CS_TX_READY_ORIDE | AR933X_UART_CS_RX_READY_ORIDE);
 
@@ -490,7 +490,7 @@ static int ar933x_uart_startup(struct uart_port *port)
 	ar933x_uart_rmw_set(up, AR933X_UART_CS_REG,
 			    AR933X_UART_CS_HOST_INT_EN);
 
-	/* enable RX and TX ready overide */
+	/* enable RX and TX ready override */
 	ar933x_uart_rmw_set(up, AR933X_UART_CS_REG,
 		AR933X_UART_CS_TX_READY_ORIDE | AR933X_UART_CS_RX_READY_ORIDE);
 
diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_serial.c
index 5d8c1cfc1c60..c4b465f6a69f 100644
--- a/drivers/tty/serial/atmel_serial.c
+++ b/drivers/tty/serial/atmel_serial.c
@@ -40,7 +40,7 @@
 /* Revisit: We should calculate this based on the actual port settings */
 #define PDC_RX_TIMEOUT		(3 * 10)		/* 3 bytes */
 
-/* The minium number of data FIFOs should be able to contain */
+/* The minimum number of data FIFOs should be able to contain */
 #define ATMEL_MIN_FIFO_SIZE	8
 /*
  * These two offsets are substracted from the RX FIFO size to define the RTS
diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index 513dbe95f7e9..0eac2fd2ed37 100644
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@ -137,7 +137,7 @@
 #define USR1_DTRD	(1<<7)	 /* DTR Delta */
 #define USR1_RXDS	 (1<<6)	 /* Receiver idle interrupt flag */
 #define USR1_AIRINT	 (1<<5)	 /* Async IR wake interrupt flag */
-#define USR1_AWAKE	 (1<<4)	 /* Aysnc wake interrupt flag */
+#define USR1_AWAKE	 (1<<4)	 /* Async wake interrupt flag */
 #define USR2_ADET	 (1<<15) /* Auto baud rate detect complete */
 #define USR2_TXFE	 (1<<14) /* Transmit buffer FIFO empty */
 #define USR2_DTRF	 (1<<13) /* DTR edge interrupt flag */
diff --git a/drivers/tty/serial/men_z135_uart.c b/drivers/tty/serial/men_z135_uart.c
index 9138fa29d301..41dd7059e367 100644
--- a/drivers/tty/serial/men_z135_uart.c
+++ b/drivers/tty/serial/men_z135_uart.c
@@ -532,7 +532,7 @@ static unsigned int men_z135_get_mctrl(struct uart_port *port)
  * men_z135_stop_tx() - Stop transmitting characters
  * @port: The UART port
  *
- * Stop transmitting characters. This might be due to CTS line becomming
+ * Stop transmitting characters. This might be due to CTS line becoming
  * inactive or the tty layer indicating we want to stop transmission due to
  * an XOFF character.
  */
diff --git a/drivers/tty/serial/mvebu-uart.c b/drivers/tty/serial/mvebu-uart.c
index 33ea496c93b2..0306f219feb0 100644
--- a/drivers/tty/serial/mvebu-uart.c
+++ b/drivers/tty/serial/mvebu-uart.c
@@ -942,7 +942,7 @@ static int mvebu_uart_probe(struct platform_device *pdev)
 
 	/* Manage interrupts */
 	if (platform_irq_count(pdev) == 1) {
-		/* Old bindings: no name on the single unamed UART0 IRQ */
+		/* Old bindings: no name on the single unnamed UART0 IRQ */
 		irq = platform_get_irq(pdev, 0);
 		if (irq < 0)
 			return irq;
diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
index 697318dbb146..5355409134da 100644
--- a/drivers/tty/serial/mxs-auart.c
+++ b/drivers/tty/serial/mxs-auart.c
@@ -1009,7 +1009,7 @@ static void mxs_auart_settermios(struct uart_port *u,
 		if (is_imx28_auart(s)
 				&& test_bit(MXS_AUART_RTSCTS, &s->flags)) {
 			if (!mxs_auart_dma_init(s))
-				/* enable DMA tranfer */
+				/* enable DMA transfer */
 				ctrl2 |= AUART_CTRL2_TXDMAE | AUART_CTRL2_RXDMAE
 				       | AUART_CTRL2_DMAONERR;
 		}
diff --git a/drivers/tty/serial/pic32_uart.c b/drivers/tty/serial/pic32_uart.c
index 8407f85776c0..1d4adb5c7d88 100644
--- a/drivers/tty/serial/pic32_uart.c
+++ b/drivers/tty/serial/pic32_uart.c
@@ -547,7 +547,7 @@ static int pic32_uart_startup(struct uart_port *port)
 	pic32_uart_writel(sport, PIC32_CLR(PIC32_UART_STA),
 			PIC32_UART_STA_UTXISEL1);
 
-	/* enable all interrupts and eanable uart */
+	/* enable all interrupts and enable uart */
 	pic32_uart_en_and_unmask(port);
 
 	local_irq_restore(flags);
diff --git a/drivers/tty/serial/pmac_zilog.c b/drivers/tty/serial/pmac_zilog.c
index e3a919328695..31cb2cde3116 100644
--- a/drivers/tty/serial/pmac_zilog.c
+++ b/drivers/tty/serial/pmac_zilog.c
@@ -368,7 +368,7 @@ static void pmz_transmit_chars(struct uart_pmac_port *uap)
 	 * R3 still signals the interrupts and we see them when taking
 	 * an interrupt for the other channel (this could be a qemu
 	 * bug but since the ESCC doc doesn't specify precsiely whether
-	 * R3 interrup status bits are masked by R1 interrupt enable
+	 * R3 interrupt status bits are masked by R1 interrupt enable
 	 * bits, better safe than sorry). --BenH.
 	 */
 	if (!ZS_IS_OPEN(uap))
@@ -1929,7 +1929,7 @@ static int __init pmz_console_setup(struct console *co, char *options)
 	port = &uap->port;
 
 	/*
-	 * Mark port as beeing a console
+	 * Mark port as being a console
 	 */
 	uap->flags |= PMACZILOG_FLAG_IS_CONS;
 
diff --git a/drivers/tty/serial/pmac_zilog.h b/drivers/tty/serial/pmac_zilog.h
index 837b97ca0a90..40f47b389b55 100644
--- a/drivers/tty/serial/pmac_zilog.h
+++ b/drivers/tty/serial/pmac_zilog.h
@@ -21,7 +21,7 @@ struct uart_pmac_port {
 	 * early inited port)
 	 */
 	struct macio_dev		*dev;
-	/* device node to this port, this points to one of 2 childs
+	/* device node to this port, this points to one of 2 children
 	 * of "escc" node (ie. ch-a or ch-b)
 	 */
 	struct device_node		*node;
diff --git a/drivers/tty/serial/serial-tegra.c b/drivers/tty/serial/serial-tegra.c
index 8004fc00fb9c..2eb49bcc766d 100644
--- a/drivers/tty/serial/serial-tegra.c
+++ b/drivers/tty/serial/serial-tegra.c
@@ -1096,7 +1096,7 @@ static int tegra_uart_hw_init(struct tegra_uart_port *tup)
 	 * EORD is different interrupt than RX_TIMEOUT - RX_TIMEOUT occurs when
 	 * the DATA is sitting in the FIFO and couldn't be transferred to the
 	 * DMA as the DMA size alignment (4 bytes) is not met. EORD will be
-	 * triggered when there is a pause of the incomming data stream for 4
+	 * triggered when there is a pause of the incoming data stream for 4
 	 * characters long.
 	 *
 	 * For pauses in the data which is not aligned to 4 bytes, we get
diff --git a/drivers/tty/serial/st-asc.c b/drivers/tty/serial/st-asc.c
index 6ed9a327702b..f065b300ac09 100644
--- a/drivers/tty/serial/st-asc.c
+++ b/drivers/tty/serial/st-asc.c
@@ -378,7 +378,7 @@ static void asc_set_mctrl(struct uart_port *port, unsigned int mctrl)
 static unsigned int asc_get_mctrl(struct uart_port *port)
 {
 	/*
-	 * This routine is used for geting signals of: DTR, DCD, DSR, RI,
+	 * This routine is used for getting signals of: DTR, DCD, DSR, RI,
 	 * and CTS/RTS
 	 */
 	return TIOCM_CAR | TIOCM_DSR | TIOCM_CTS;
@@ -829,7 +829,7 @@ static void asc_console_putchar(struct uart_port *port, unsigned char ch)
 {
 	unsigned int timeout = 1000000;
 
-	/* Wait for upto 1 second in case flow control is stopping us. */
+	/* Wait for up to 1 second in case flow control is stopping us. */
 	while (--timeout && !asc_txfifo_is_half_empty(port))
 		udelay(1);
 
diff --git a/drivers/tty/serial/uartlite.c b/drivers/tty/serial/uartlite.c
index 6240c3d4dfd7..153233fe4347 100644
--- a/drivers/tty/serial/uartlite.c
+++ b/drivers/tty/serial/uartlite.c
@@ -163,7 +163,7 @@ static int ulite_receive(struct uart_port *port, int stat)
 		port->icount.frame++;
 
 
-	/* drop byte with parity error if IGNPAR specificed */
+	/* drop byte with parity error if IGNPAR specified */
 	if (stat & port->ignore_status_mask & ULITE_STATUS_PARITY)
 		stat &= ~ULITE_STATUS_RXVALID;
 
@@ -393,7 +393,7 @@ static int ulite_request_port(struct uart_port *port)
 	ret = uart_in32(ULITE_CONTROL, port);
 	uart_out32(ULITE_CONTROL_RST_TX, ULITE_CONTROL, port);
 	ret = uart_in32(ULITE_STATUS, port);
-	/* Endianess detection */
+	/* Endianness detection */
 	if ((ret & ULITE_STATUS_TXEMPTY) != ULITE_STATUS_TXEMPTY)
 		pdata->reg_ops = &uartlite_le;
 
diff --git a/drivers/tty/serial/xilinx_uartps.c b/drivers/tty/serial/xilinx_uartps.c
index a072b75dbaf2..7eaf70614f9c 100644
--- a/drivers/tty/serial/xilinx_uartps.c
+++ b/drivers/tty/serial/xilinx_uartps.c
@@ -1476,7 +1476,7 @@ static int cdns_uart_suspend(struct device *device)
 			readl(port->membase + CDNS_UART_FIFO);
 		/* set RX trigger level to 1 */
 		writel(1, port->membase + CDNS_UART_RXWM);
-		/* disable RX timeout interrups */
+		/* disable RX timeout interrupts */
 		writel(CDNS_UART_IXR_TOUT, port->membase + CDNS_UART_IDR);
 		uart_port_unlock_irqrestore(port, flags);
 	}
diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index 8f467b22b799..494749282041 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -1142,7 +1142,7 @@ int vc_allocate(unsigned int currcons)	/* return 0 on success */
 static inline int resize_screen(struct vc_data *vc, int width, int height,
 				bool from_user)
 {
-	/* Resizes the resolution of the display adapater */
+	/* Resizes the resolution of the display adapter */
 	int err = 0;
 
 	if (vc->vc_sw->con_resize)
diff --git a/include/linux/tty_driver.h b/include/linux/tty_driver.h
index 1f2896e56e77..626e0692c97a 100644
--- a/include/linux/tty_driver.h
+++ b/include/linux/tty_driver.h
@@ -22,7 +22,7 @@ struct serial_struct;
  * These are flags passed to tty_alloc_driver().
  *
  * @TTY_DRIVER_INSTALLED:
- *	Whether this driver was succesfully installed. This is a tty internal
+ *	Whether this driver was successfully installed. This is a tty internal
  *	flag. Do not touch.
  *
  * @TTY_DRIVER_RESET_TERMIOS:
-- 
2.48.1


