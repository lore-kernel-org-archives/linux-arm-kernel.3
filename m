Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BBC606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 12:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jxnXR4Op;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d+Y+TwVt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XmGfQWvcvFmnjKr+xP8taKEHDJYND7b+j1Gc4pD7Vlg=; b=jxnXR4OpR+iUCd
	tArwbfRZr6cFEL1MR39iM8eoHF71z1dkcoNQCVVv8zYXMS13t2HlGp8AQ3NzWv8q8izypzG+X9zXh
	4TwoFGkI3xxHm+/HSIKeFmEQilq2Y/Bmk8wKbec+IAk7oSJE4QfmAtucbMtZsJasCKERcNP10xyCS
	AMmo1/jCbRZzvl8HCUCbVr64AIHLrkOzqCSoIqIY0zIHz8z3ZJr/6m6wt0+O9fbLqFAduzLVlz+we
	L4gtPUhqUBqTKkRUhL2PFMMLJjTjIVsFohqFB1zIOEwJo11Mn53TKkhWf2sGvfaxMyS1knDHNHjqq
	xjSLbTxfPpLgbjBTNojg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN8NK-0000000DK7M-26pH;
	Sat, 31 Oct 2026 12:39:58 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN8NC-0000000DK1S-3MML
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 12:39:52 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-1a2761c69fbso1363321c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 05:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793450390; x=1794055190; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XmGfQWvcvFmnjKr+xP8taKEHDJYND7b+j1Gc4pD7Vlg=;
        b=d+Y+TwVtqP+B+nF/uvq3G1W8LSIyPFdHP2fp3Asw9UAwzhSnTJFG5slrBhkxH8n801
         ieslbS7oxpwE0LhiKBlIWHOd5z4yzA1HKkKHH6apIlZUe4dqqJ3916ytX/AVRjbkcm/M
         055xS8+irbKbpq+Z+v6Q1MhjqTyiheVBTePrLXBP3VzHZTG3H2/06wel47A5tFd9on2y
         IQJUVQdZvWQvYS+CI/I9HNcsCvC8tNNxBiSY2UmpXUTpxGSSk58vA4fZjypJnKidZflo
         PoBRhHEju/p+0yUu1m8/Kmw0kfUopphSTIFcbZEAt/RUi4c7dtsqzLRAqQVA9oOInfrw
         SbUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793450390; x=1794055190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XmGfQWvcvFmnjKr+xP8taKEHDJYND7b+j1Gc4pD7Vlg=;
        b=AZK/upLAvrOIijBGaVcLX6gtR+i6sDtL+c0Og46GRIl9v2WqtPrK/LuP2YXZz79IQ4
         x7x7kIJDYZdAQB8XMUSAx+CPzH11h4q+pEmypeEbkY/Rw0vjf6b+Ekn1vTP7DtWExOCm
         61SYvKGr9eqRa+eAJOBYWHBoTvDOib0IjB5ISANSjQqsri7F9RXBgK8ucG6VXvQ/00TA
         ms6x6Cqv02cw9rJgMvrAH4wQJ05MVWRwkCQTzk4fcGBjkFj0U4OCgiRkE+KAgvpgLj4i
         abRzu3oFCGffOya8iZacBiPQ/QRcyJvjFF0ERQ8Tnyb2E05SUD2mf1VkoWG7A1OVXYTW
         a+Zg==
X-Forwarded-Encrypted: i=1; AKwUvBzLmw2F840EuYmbqclA7/Q937ES85ybFdt8GhSZVi6dyucLi3TALnUJKyoi1/hVHGMzgGfDmq9zvkpkbUnQD1Ah@lists.infradead.org
X-Gm-Message-State: AFq9FYJgae6rKMOnRWYp0hpr5fD4/TyugMHneZuH4aaI80nScz7639o5
	Qg8G7DOVuD/irGNARLfrBoiutCDaaKWutdvMMkRW4wOdoNRV9r6DPUI6
X-Gm-Gg: AYBFou2yrqhUjvKPCwidNbEQ2c4sRlSVqmliS7Am40JAjRqkuADWszIhCpdDqQGW3nR
	5bM4OyezNnRbG0GmQBMjriZ4mof7h7KBMeJxDk/8OThs9gXAayNu1LJyk5VxELWt2T//Cov1jap
	+HDmbCMVTUFGsbw0+h3h/66xVF2CrUXZdP8EJcnicOSmmBjDjABfCIQRZ5jCSx0FvC1QNxE8LuP
	Pvdv6+Ca/x7/EeedA1M0oWGGhmX+TZifPioSNN3/akaBQAxvs0tsngPi7c2juY4wM/DpVxDFD+j
	gWsUMTVXIOdbbFZ68bfFlKFQYheOA+qTSxjyWlocoHcxQ98JplZLMZic4/lIPLx+HDvO2RcEl5v
	Xxhb3GWIgtYDHX2j2FGcLDRzFQzZulDsuoBeAIp0Je2Hi9a6Um/8ve7paQg2+lcGN/FVeAJ0GM+
	FVyh88J3PTK95EZcjBp9Ds328IoLjQerl0EYygg2nZxbN+c++bLpZOTdr9qnBPEcNE9isrvHkVU
	wmRAntHBnkh0LNm9AgzXSWbF1Gu08dD7iU15psUQED0tjtec1Z7jH4yaSq/KbOOKSBU+5KrDnd+
	P0IoJah545XKWw0Q6lnmYe7poK0ErxaExIpOesVNut2JzzhQTvMY2dMlaM8pyJx9+5Fe/Ajw32E
	/V3k8dhS8UVEpOjz/nFy1+DMYdEDnKcs0z6PvPA8CSSd/g8H/MchKhBnuDnaTTyFvKUDgDXmHzo
	Fln97TrvTa330ey7w=
X-Received: by 2002:a05:7022:5f0b:b0:1ab:de8b:5f0f with SMTP id a92af1059eb24-1ac5cb18717mr6418421c88.40.1793450389793;
        Sat, 31 Oct 2026 05:39:49 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854da78sm21566039c88.6.2026.10.31.05.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:39:49 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Samarth Narang <samarth.colleges@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	linux-serial@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] serial: pch_uart: fix TX kfifo underflow on flush
Date: Sat, 31 Oct 2026 12:39:11 +0000
Message-Id: <20261031123911.3784690-6-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261031123911.3784690-1-samarth.colleges@gmail.com>
References: <20261031004733.3345841-1-samarth.colleges@gmail.com>
 <20261031123911.3784690-1-samarth.colleges@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_053950_850908_38A6102B 
X-CRM114-Status: GOOD (  21.62  )
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

uart_flush_buffer() resets the transmit kfifo under the port lock before
calling the driver's flush_buffer() hook. Since pch_uart does not
implement this hook, an outstanding TX DMA transfer may complete after
the flush and call uart_xmit_advance() for each entry of the flushed
transfer's scatterlist. This can advance the kfifo tail past its head,
causing kfifo_len() to wrap and the driver to transmit stale buffer
contents. The completion callback also updates the kfifo without holding
the port lock, allowing it to race with the flush itself. The same issue
was fixed in 8250 by commit 9e512eaaf8f4 ("serial: 8250: Fix fifo
underflow on flush").

Since the TX buffer is mapped separately for each transfer and the flush
hook runs under the port lock, the driver cannot synchronously terminate
DMA and safely unmap the buffer from that context. Instead, leave the
outstanding transfer running and mark it as flushed, allowing the
completion callback to unmap the buffer without advancing the kfifo.
Take the port lock in the completion callback to synchronize access to
the flush flag and kfifo state. This prevents the underflow, although
the data already queued for DMA before the flush may still be
transmitted.

Fixes: 3c6a483275f4 ("Serial: EG20T: add PCH_UART driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
 drivers/tty/serial/pch_uart.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/pch_uart.c b/drivers/tty/serial/pch_uart.c
index 9505d255f09c..122025c4a0a6 100644
--- a/drivers/tty/serial/pch_uart.c
+++ b/drivers/tty/serial/pch_uart.c
@@ -230,6 +230,7 @@ struct eg20t_port {
 	struct scatterlist		*sg_tx_p;
 	int				nent;
 	int				orig_nent;
+	bool				tx_dma_flushed;
 	struct scatterlist		sg_rx;
 	int				tx_dma_use;
 	void				*rx_buf_virt;
@@ -750,18 +751,23 @@ static void pch_dma_tx_complete(void *arg)
 	struct eg20t_port *priv = arg;
 	struct uart_port *port = &priv->port;
 	struct scatterlist *sg = priv->sg_tx_p;
+	unsigned long flags;
 	int i;
 
-	for (i = 0; i < priv->nent; i++, sg++)
-		uart_xmit_advance(port, sg_dma_len(sg));
+	uart_port_lock_irqsave(port, &flags);
+	if (!priv->tx_dma_flushed)
+		for (i = 0; i < priv->nent; i++, sg++)
+			uart_xmit_advance(port, sg_dma_len(sg));
 
 	async_tx_ack(priv->desc_tx);
 	dma_unmap_sg(port->dev, priv->sg_tx_p, priv->orig_nent, DMA_TO_DEVICE);
 	priv->tx_dma_use = 0;
+	priv->tx_dma_flushed = false;
 	priv->nent = 0;
 	priv->orig_nent = 0;
 	kfree(priv->sg_tx_p);
 	pch_uart_hal_enable_interrupt(priv, PCH_UART_HAL_TX_INT);
+	uart_port_unlock_irqrestore(port, flags);
 }
 
 static int handle_rx_to(struct eg20t_port *priv)
@@ -947,6 +953,7 @@ static unsigned int dma_handle_tx(struct eg20t_port *priv)
 	}
 	priv->orig_nent = num;
 	priv->nent = nent;
+	priv->tx_dma_flushed = false;
 
 	for (i = 0; i < nent; i++, sg++) {
 		sg->offset = tail + fifo_size * i;
@@ -1150,6 +1157,21 @@ static void pch_uart_stop_tx(struct uart_port *port)
 	priv->tx_dma_use = 0;
 }
 
+static void pch_uart_flush_buffer(struct uart_port *port)
+{
+	struct eg20t_port *priv;
+
+	priv = container_of(port, struct eg20t_port, port);
+
+	/*
+	 * The kfifo has been reset. Let the running transfer finish, so that
+	 * its buffer is unmapped only once it has stopped, but do not advance
+	 * the kfifo for it.
+	 */
+	if (priv->nent)
+		priv->tx_dma_flushed = true;
+}
+
 static void pch_uart_start_tx(struct uart_port *port)
 {
 	struct eg20t_port *priv;
@@ -1520,6 +1542,7 @@ static const struct uart_ops pch_uart_ops = {
 	.set_mctrl = pch_uart_set_mctrl,
 	.get_mctrl = pch_uart_get_mctrl,
 	.stop_tx = pch_uart_stop_tx,
+	.flush_buffer = pch_uart_flush_buffer,
 	.start_tx = pch_uart_start_tx,
 	.stop_rx = pch_uart_stop_rx,
 	.enable_ms = pch_uart_enable_ms,
-- 
2.34.1


