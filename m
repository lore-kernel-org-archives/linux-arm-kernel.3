Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627C2606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 12:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J7ehnn0x;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y8g3U/bn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hF93A2swUvHoNDKG9XcYGoRrUhQY3sGOfHMmfcGcHo0=; b=J7ehnn0xQfZFLW
	cGW2ntusFTZdEOGAcnNtySA+KO86/+21+kiRbwUF3gi4MUrVVGHHjqiaXEKCwB2Z1cPjPLB766tkH
	SNFby4bdImEdKzCwWlYccTSANyczUx0wlVr5CQdMW3IxcKx+acoRwR3OLQ2eQykuk/jYQ4+vgB2PP
	RJv8YrmtcyK2125aDHi+OlsRdvVyyrHHh6bPEOe/wMZo0d3IJaSQnJ29GpZ3bnJ1vLvp+9X2qlhXd
	jWLUfd2TxM67gpZJHz7Ih6doZdNTMdWY4A5Ppon8wnysWDohkOav3xCGE+mbMmYlE0qpSeyz0L0aF
	9zo+h0U7G0W/XzBZC4Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN8LX-0000000DJZf-1FhO;
	Sat, 31 Oct 2026 12:38:07 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN8LR-0000000DJXi-29XF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 12:38:03 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-14fc585291cso1370099c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 05:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793450280; x=1794055080; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hF93A2swUvHoNDKG9XcYGoRrUhQY3sGOfHMmfcGcHo0=;
        b=y8g3U/bnE99QKRU0IcFzVBYIc9BFd1h0ZDPvY5b576GxdLDVWh1poK0b6vNh+W8GCv
         VvXVDJU5ssp3SzRjge9/iED7/guvGDFmdw8g40O9Na6/vYKODMhZQHPMnH78IuJMX9Hr
         WQ7cTz5dynIisEQld+cJutGrwe8sKpajxrKwh+mupg2VcgmW1au1pW5MNAsBqKivRj00
         e8Tapvr/SNqIGHIbIaQsn84UV3iYI3Czpcsfn5oCrrgsbLtNJV+sds5n91M+hIbD2uh/
         Cn2/mS1GRvmfCaTNbhUPjvtmAAVaa7C+2/+gzpRCxopwoV+oMtYdFIfmHn7+RtoMFKZ1
         ERwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793450280; x=1794055080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hF93A2swUvHoNDKG9XcYGoRrUhQY3sGOfHMmfcGcHo0=;
        b=bwJlWxKqw5CvvBZ0WBNQZGX9u/P4dt/PR7fRUYv7QWcxf/jGhaA4bBerWto8FSOXqe
         yDR1Sk6YLfPbP88MQSMYEJ23MYC8+O/Av6NBW9sCQdSF7gSn+4f4kyCMcfMCDkdhDuAR
         rmERiIU/T5zxZGvq+A6Is0CJkcppN4W5LUtsJulssMHW7phGOJbpwL5gae0TyfWThuaH
         ISYWLT593oLIvnPYEFHHFMxEdSIzLNqzN/8OQ1aTJix/kHma1zqV8WQBmU5yMk8UoAIh
         LXqLXo7R7OBKTqxdd80rJD9Xu0murCJQdOMSU/V/1X5jQZhj/wajgSFt+L9NFpafClfC
         ncIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQ10taxq7lwAy9ignbYpYL+jRfH6QmOAZzYtS5tBMV0O6XyObWnzrL3Xrr0ygzCgh93a80xG34Fzm2azjr1uod@lists.infradead.org
X-Gm-Message-State: AFq9FYI3Laj0aRSS5mZwIsdI5mVfZ5ObVuaEqtVLKEJ3frzmidZITtAn
	iY5NI7q6C+gis81faHTKzrVqBUwKFXTruqkG4NryQIcmUus0V0BS3GVr
X-Gm-Gg: AYBFou2ar+DDbDK/vgJU0Wj0e7w8+RyFS49TVNQUl5KU0fOpKb4seL2JtwwyTJqyS8O
	oYQBgn5VIYM0dQEiYfF0eHrzP7THjyIK6HuESDWdvkrZdYRxHgfsVJ/kAT3wphlA/beOJlymLp8
	ijLfaQW7BpskyK//Be0ULNAKuiZw+iD8ZO669QfwlIuMdp5Hn/lXekPGeR4opLVuXOso87HlRgm
	SwEu+5jhWmjY0Y0lXQw8FiF1nTabyzIZj/wt0a1crNWEx4Ha9bTx5x9F1YznqvciQoW/F0P6hY2
	NuWaA1om8pdO4GSTGGkfUsSkj1agOojEsZgzrH+kmUesNZ6FqNdEUUPhSsqb1tWtce32QTF5YH8
	AMGKZYFAtFYq4AY0C0c8ppuWe5Epjkem2emx02mAjvbcWLNQn1PO3w2pasXYJDlSrHT7UNhuonR
	TDe93KTUdw/QAWek9zOWbMTiPT5KxowMTtf41l5LeIALN9f5LisN8idvXjZCAHWHW4AHqkMWX/Q
	HAWoXxogBlPZr6Qh244wpUSa3lYeGq3wJdjCX6XZUe2X1pn0jK/bzGW4WkCHjQ8QRX5evi9hOiT
	x+cOTMUuif336lwwzWlOzfxeCEmnHFKs+bnjJ/MTivDz9PPjApypY6WApoQ4rL3xbub1t//LvIZ
	ehEKQKzKCo03t3nN5LupmNf3tX4jZwAuZyaZ9j6A7XWolAPdKMeEDxWInV1UE7O4foX9JEOrm20
	dY4UbB3ckVNcY9DA==
X-Received: by 2002:a05:7022:5f15:b0:1af:d691:1b4f with SMTP id a92af1059eb24-1afd6911cf7mr850231c88.42.1793450280250;
        Sat, 31 Oct 2026 05:38:00 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1a13652csm17300763c88.17.2026.10.31.05.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:37:59 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Samarth Narang <samarth.colleges@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-serial@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] serial: amba-pl011: keep the flushed TX buffer mapped until DMA stops
Date: Sat, 31 Oct 2026 12:37:48 +0000
Message-Id: <20261031123749.3783352-2-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261031123749.3783352-1-samarth.colleges@gmail.com>
References: <20261031005425.3351240-1-samarth.colleges@gmail.com>
 <20261031123749.3783352-1-samarth.colleges@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_053801_937922_35D18B11 
X-CRM114-Status: GOOD (  20.79  )
X-Spam-Score: -2.1 (--)
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

pl011_dma_flush_buffer() is called with the port lock held and currently
unmaps the TX buffer immediately after requesting termination with
dmaengine_terminate_async(). Since asynchronous termination does not
guarantee that the transfer or its completion callback has finished, the
DMA controller may continue reading from the buffer after its mapping
has been released. Commit f6a196477184 ("serial: pl011: Fix DMA
->flush_buffer()") introduced asynchronous termination under the port
lock, but did not add the required synchronization before unmapping.

On systems using an IOMMU or SWIOTLB, outstanding DMA reads may access
an IOVA or bounce buffer that has already been reused, potentially
transmitting data from another mapping. On systems without either, the
outstanding transfer may instead race with the next refill of dmatx.buf.
This can be triggered by flushing the TTY while TX DMA is active.

Since flush_buffer() cannot sleep, defer the unmap to a work item that
calls dmaengine_synchronize() before releasing the mapping. Keep
dmatx.queued set to prevent buffer reuse, disable TX DMA requests, and
let the work item restart transmission if data remains pending. The
completion callback leaves flushed transfers for deferred cleanup, while
shutdown waits for the work to finish before tearing down TX DMA.

Fixes: f6a196477184 ("serial: pl011: Fix DMA ->flush_buffer()")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
 drivers/tty/serial/amba-pl011.c | 54 +++++++++++++++++++++++++++++++--
 1 file changed, 51 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
index e6f652905ca6..863a050cf654 100644
--- a/drivers/tty/serial/amba-pl011.c
+++ b/drivers/tty/serial/amba-pl011.c
@@ -41,6 +41,7 @@
 #include <linux/sizes.h>
 #include <linux/io.h>
 #include <linux/acpi.h>
+#include <linux/workqueue.h>
 
 #define UART_NR			14
 
@@ -302,6 +303,8 @@ struct pl011_dmatx_data {
 	size_t			len;
 	char			*buf;
 	bool			queued;
+	bool			flushing;
+	struct work_struct	flush_work;
 };
 
 enum pl011_rs485_tx_state {
@@ -609,6 +612,12 @@ static void pl011_dma_tx_callback(void *data)
 	u16 dmacr;
 
 	uart_port_lock_irqsave(&uap->port, &flags);
+	if (uap->dmatx.flushing) {
+		/* pl011_dma_tx_flush_work() retires the flushed buffer */
+		uart_port_unlock_irqrestore(&uap->port, flags);
+		return;
+	}
+
 	if (uap->dmatx.queued)
 		dma_unmap_single(dmaengine_get_dma_device(dmatx->chan), dmatx->dma,
 				 dmatx->len, DMA_TO_DEVICE);
@@ -867,13 +876,47 @@ __acquires(&uap->port.lock)
 
 	dmaengine_terminate_async(uap->dmatx.chan);
 
-	if (uap->dmatx.queued) {
-		dma_unmap_single(dmaengine_get_dma_device(uap->dmatx.chan), uap->dmatx.dma,
-				 uap->dmatx.len, DMA_TO_DEVICE);
+	/*
+	 * The terminated transfer may still be reading dmatx.buf: keep it
+	 * mapped, and queued set so that nothing refills it, until
+	 * pl011_dma_tx_flush_work() has synchronized the channel.
+	 */
+	if (uap->dmatx.queued && !uap->dmatx.flushing) {
+		uap->dmatx.flushing = true;
+		uap->dmacr &= ~UART011_TXDMAE;
+		pl011_write(uap->dmacr, uap, REG_DMACR);
+		schedule_work(&uap->dmatx.flush_work);
+	}
+}
+
+/*
+ * flush_buffer runs under the port lock and can only request termination.
+ * Unmap the flushed TX buffer here, once the terminated transfer and its
+ * completion callback are known to have finished, then restart TX.
+ */
+static void pl011_dma_tx_flush_work(struct work_struct *work)
+{
+	struct uart_amba_port *uap =
+	    container_of(work, struct uart_amba_port, dmatx.flush_work);
+	struct tty_port *tport = &uap->port.state->port;
+	unsigned long flags;
+
+	dmaengine_synchronize(uap->dmatx.chan);
+
+	uart_port_lock_irqsave(&uap->port, &flags);
+	if (uap->dmatx.flushing) {
+		dma_unmap_single(dmaengine_get_dma_device(uap->dmatx.chan),
+				 uap->dmatx.dma, uap->dmatx.len, DMA_TO_DEVICE);
+		uap->dmatx.flushing = false;
 		uap->dmatx.queued = false;
 		uap->dmacr &= ~UART011_TXDMAE;
 		pl011_write(uap->dmacr, uap, REG_DMACR);
+		if (!uart_tx_stopped(&uap->port) &&
+		    !kfifo_is_empty(&tport->xmit_fifo) &&
+		    pl011_dma_tx_refill(uap) <= 0)
+			pl011_start_tx_pio(uap);
 	}
+	uart_port_unlock_irqrestore(&uap->port, flags);
 }
 
 static void pl011_dma_rx_callback(void *data);
@@ -1177,6 +1220,8 @@ static void pl011_dma_startup(struct uart_amba_port *uap)
 
 	/* The DMA buffer is now the FIFO the TTY subsystem can use */
 	uap->port.fifosize = PL011_DMA_BUFFER_SIZE;
+	uap->dmatx.flushing = false;
+	INIT_WORK(&uap->dmatx.flush_work, pl011_dma_tx_flush_work);
 	uap->using_tx_dma = true;
 
 	if (!uap->dmarx.chan)
@@ -1236,6 +1281,9 @@ static void pl011_dma_shutdown(struct uart_amba_port *uap)
 	if (!(uap->using_tx_dma || uap->using_rx_dma))
 		return;
 
+	if (uap->using_tx_dma)
+		flush_work(&uap->dmatx.flush_work);
+
 	/* Disable RX and TX DMA */
 	while (pl011_read(uap, REG_FR) & uap->vendor->fr_busy)
 		cpu_relax();
-- 
2.34.1


