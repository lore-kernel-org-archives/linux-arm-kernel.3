Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C539606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 12:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UBjpETCg;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PHitLY/l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cnXM6OEqfvGVRy4AJACjTgyVnlWSquVpMq023G3i6Do=; b=UBjpETCgJg2+6X
	2c8KXG67uRXZWVbV6xr508SiZZYBiGlvbt5w2t3ESsZV+e3RN2N7WFELnkGNnPQeSo1TTGxs5jzio
	yh8rHP/t3kMyGK2PPRQ8ox6nqQlgR4sk8uzWgvIyL9jnys/V0C2lgyLpiDcKm7Lvt4AfdZf0ktRqD
	FKKneP+DII1/eoKJRsbKbUwzsGEVI6EQc2lzWOxG6+pBphdjx2mYd/l3+V39uHsHHHnqf534z3aE5
	rWLw4k8CmNkz2oXvrfoFlrEJkYu1upDB5zbhY0DxACaF3RRpPfMcgr/kRGGEIc0gxkt9nbMZYfzQG
	SzZreCkl8mLUwruR3VfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN8N6-0000000DJxi-0hTC;
	Sat, 31 Oct 2026 12:39:44 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN8N1-0000000DJvL-0R0P
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 12:39:41 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-35829219da8so3139768eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 05:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793450378; x=1794055178; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cnXM6OEqfvGVRy4AJACjTgyVnlWSquVpMq023G3i6Do=;
        b=PHitLY/ldYYuI8p9NKmk0TdNsiModJ5jW+Fwq4LC3y75sf6F0bzcHmwBtM39Skf5nG
         REiWiVBVPuN8vYKdjCPtvwU1BTzAWGJcgEitLDqMHeCEnPmspMDrqVVC8JrP9eCfDJ3J
         QVBEYZqx/2ZfoOn4+F9PcTxGc6ifj6nbD5BwXkKXBwYAP76lGuT1S0NjSehqBzpa63v6
         Q1jASoXZs3+bo8Z8QF02toZwfRkoEOqNa3n7BzaZSray8n9CZBcB+An/aKX7yhC0SHCJ
         c46cgAwWs1+gpcIoB/Al5iSX9buWhU2gIPTnvlmXhylwUZrTaJsXfGCnFCa+OV4k98xW
         FPzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793450378; x=1794055178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cnXM6OEqfvGVRy4AJACjTgyVnlWSquVpMq023G3i6Do=;
        b=XZ/MfgyA+/bbAHLh3x/FPY0yQGTMobboQeCWJC6JdsMqazeVHjn3HzTXITLjhGqfUy
         JHPZscnbrlL+AHeueq44z27TNkn6a6XjF/DH3Jqtldv4bJN3wPe6VeV+d0G++jcQRHHT
         P0Y/cKx6N9xDSPFIVaH17KdW3/jjFR+VlR2ZjYYdKbxP5EKlp1AjE2RGIwfSaKjrDnyF
         iLM8OMyP82iByuT8pvEyUFZCX3bwnarPoGib3M8ICPNygn5tyEc4GOfBXcTkMrp5riBk
         GPxvgK0/48hrQ0cUg8EdDGpFTWpcsmEu5WpKjutLHO+3oR/7Qqy1SIpnsgBuLMF/6Df9
         RBvQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBn0h4M8yZSJTljc1Vyfx6zpSG7W2QPqNccFk9cn3FKli1oFmvxON8AzIymjerx95F6dd3GQjgde+3lXs2elSG@lists.infradead.org
X-Gm-Message-State: AFq9FYISBOCanlubiToj6NpcwiQdTJh20aydP62/2HBLmYdTvJCiof2q
	uDrxdegWrsQqVJJvcbNil340xktYy6U9MmEeY5EYlNljmz2fXwPfWi2G
X-Gm-Gg: AYBFou0MpDuobwDD4WIA6LF7DyfFGnCpu48o0EFh8YmCANUT2H/K/7ezKNS6gU6/jnr
	Gql78B5m7a0z6YINlwFmK1IPN2aeQlJcH+6fi7C5My1TB3irNwgmWWFZSXukfV51rQsRywGQc0V
	mf4JeFZ1hTx3H6N2v+xTucRnmyne1CHfG7Jql7MyehkrVJqVSHUdpU8am+zJ8I/+miSljwb9wXr
	dhOeh1EN0J2GRiYUNtVE59my8slZzMpmahkJY40JEFQDsXVBjS/am+kZ1WbEoVMIDmlFH1wriXX
	S5latS3hM+xJ2sjs2X/gebRXSDvORzwtlxnicgDOXEftRv/ie2O04O+MfSoss0BjqH83tM6lEMN
	jbfo/u3vKZ4huu4IqnNCxI6N29aony1Df3toMUvbgFq+0frCscCwZhX6ntNEm6QlFsLeEPAnO+k
	8FzaMWfqCK88vd2kOtATDCkKNuVbovPslTj/M5cwk7W1xyD2Exnf/pHcTGoc5iaRv5vINJwlWRZ
	LFi8hCceT6CCei4op0IaE8g/VvtRiOG/UNIcBKL6t92fpvqJfe/8qEXun3YBrK5A4ezqUP127Iu
	xoyFgKtVBewJjQ0U+sMiA3SIqa5V94Ez628NUasjnPaKCO2zBkycJWOrRSXIBOdc23y+4P7MM47
	tI41X+bjsS8P5GOzcNpe63SnJM65zecz5h7Vf7vr1PtXWunSz3iCGCpyeJ0M8GVxlDFpJ74oto5
	5/C/69W0kEBgwc2A==
X-Received: by 2002:a05:701b:271b:b0:148:ece:8cc3 with SMTP id a92af1059eb24-1a94adc93b7mr10542506c88.24.1793450377950;
        Sat, 31 Oct 2026 05:39:37 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854da78sm21566039c88.6.2026.10.31.05.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:39:37 -0700 (PDT)
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
Subject: [PATCH 3/5] serial: sprd: fix TX kfifo underflow on flush
Date: Sat, 31 Oct 2026 12:39:09 +0000
Message-Id: <20261031123911.3784690-4-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261031123911.3784690-1-samarth.colleges@gmail.com>
References: <20261031004733.3345841-1-samarth.colleges@gmail.com>
 <20261031123911.3784690-1-samarth.colleges@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_053939_146136_E27DC8EA 
X-CRM114-Status: GOOD (  20.29  )
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
calling the driver's flush_buffer() hook. Since sprd_serial does not
implement this hook, an outstanding TX DMA transfer may complete after
the flush and call uart_xmit_advance() using the flushed transfer's
tx_dma.trans_len. This can advance the kfifo tail past its head, causing
kfifo_len() to wrap and the driver to transmit stale buffer contents.
The same issue was fixed in 8250 by commit 9e512eaaf8f4 ("serial: 8250:
Fix fifo underflow on flush").

Since the TX buffer is mapped separately for each transfer and the flush
hook runs under the port lock, DMA cannot be terminated and its mapping
safely released synchronously from the hook. Instead, leave the
outstanding transfer running and mark it as flushed, allowing the
completion callback to unmap the buffer without advancing the kfifo.
Apply the same check in sprd_stop_tx_dma() if the transfer is stopped
before completion. With this approach, the data already queued for DMA
before the flush may still be transmitted.

Fixes: f4487db58eb7 ("serial: sprd: Add DMA mode support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
 drivers/tty/serial/sprd_serial.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/sprd_serial.c b/drivers/tty/serial/sprd_serial.c
index 3fdf5939a62c..718732b683f1 100644
--- a/drivers/tty/serial/sprd_serial.c
+++ b/drivers/tty/serial/sprd_serial.c
@@ -133,6 +133,7 @@ struct sprd_uart_port {
 	struct clk *clk;
 	struct sprd_uart_dma tx_dma;
 	struct sprd_uart_dma rx_dma;
+	bool tx_flushed;
 	dma_addr_t pos;
 	unsigned char *rx_buf_tail;
 	const struct sprd_uart_data *pdata;
@@ -236,13 +237,15 @@ static void sprd_stop_tx_dma(struct uart_port *port)
 	dmaengine_tx_status(sp->tx_dma.chn, sp->tx_dma.cookie, &state);
 	if (state.residue) {
 		trans_len = state.residue - sp->tx_dma.phys_addr;
-		uart_xmit_advance(port, trans_len);
+		if (!sp->tx_flushed)
+			uart_xmit_advance(port, trans_len);
 		dma_unmap_single(port->dev, sp->tx_dma.phys_addr,
 				 sp->tx_dma.trans_len, DMA_TO_DEVICE);
 	}
 
 	dmaengine_terminate_all(sp->tx_dma.chn);
 	sp->tx_dma.trans_len = 0;
+	sp->tx_flushed = false;
 }
 
 static int sprd_tx_buf_remap(struct uart_port *port)
@@ -273,7 +276,9 @@ static void sprd_complete_tx_dma(void *data)
 	dma_unmap_single(port->dev, sp->tx_dma.phys_addr,
 			 sp->tx_dma.trans_len, DMA_TO_DEVICE);
 
-	uart_xmit_advance(port, sp->tx_dma.trans_len);
+	if (!sp->tx_flushed)
+		uart_xmit_advance(port, sp->tx_dma.trans_len);
+	sp->tx_flushed = false;
 
 	if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
 		uart_write_wakeup(port);
@@ -555,6 +560,20 @@ static void sprd_stop_tx(struct uart_port *port)
 	serial_out(port, SPRD_ICLR, iclr);
 }
 
+static void sprd_flush_buffer(struct uart_port *port)
+{
+	struct sprd_uart_port *sp = container_of(port, struct sprd_uart_port,
+						 port);
+
+	/*
+	 * The kfifo has been reset. Let the running transfer finish, so that
+	 * its buffer is unmapped only once it has stopped, but do not advance
+	 * the kfifo for it.
+	 */
+	if (sp->tx_dma.trans_len)
+		sp->tx_flushed = true;
+}
+
 static void sprd_start_tx(struct uart_port *port)
 {
 	struct sprd_uart_port *sp = container_of(port, struct sprd_uart_port,
@@ -946,6 +965,7 @@ static const struct uart_ops serial_sprd_ops = {
 	.get_mctrl = sprd_get_mctrl,
 	.set_mctrl = sprd_set_mctrl,
 	.stop_tx = sprd_stop_tx,
+	.flush_buffer = sprd_flush_buffer,
 	.start_tx = sprd_start_tx,
 	.stop_rx = sprd_stop_rx,
 	.break_ctl = sprd_break_ctl,
-- 
2.34.1


