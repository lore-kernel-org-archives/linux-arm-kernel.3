Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679E8606A328
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 21:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=soGyFmiU;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fwKaZ3Em
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KZvQCXE2w8xm1bldONxZAIDkTdJiEoBhQ1VJO1GJj1o=; b=soGyFmiUOwQCRK
	rjZnDAoFAAZVnvxfRhNzrXOrsHaRwJCgE0tKcUKoO7uqtsSCipjdtyCFNF+YRSOAcDCt3Dkq+ZQSE
	gUvROQbMEr5Tj8nWBjDIbVwSEFzLI9km++KHkJGbRjRCmuR8PJIR7obgil/Z2FyWRbi5xkUJMvHls
	mBCme21fv2jXy/1uQvH5+Viw2X1+IZt9wWtUh+AP5Bk7vTdexkxZeCIeduW0wnyhkfDkJ7yDSeOpr
	yfWPMDRXigu4MsAkdTsPt020XtlT0i1kWG78ZkRpPdSKvWleBlnXvCY0pOArG9wsXZPBm1kg5ypUa
	VbBSvGB9RMWRRwnJeBow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKMfr-0000000Gypl-3ldq;
	Fri, 23 Oct 2026 21:19:39 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKMfn-0000000Gynr-06FW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 21:19:36 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-84a248254f4so828213a34.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 14:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792790374; x=1793395174; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KZvQCXE2w8xm1bldONxZAIDkTdJiEoBhQ1VJO1GJj1o=;
        b=fwKaZ3EminBNdTNcUqZ5r8UTpZlO8WvbTbiqP2FbPHTbhZtuzn4etz7uidNeXig7ad
         cUmcpvGJ+dzicWffCV46eGKZJcJX4B1PjKbv0ruoxTOkdR0oN1NCNdCxXVZhJ2FgcDvO
         qBzbuuinecXbsiHe9i4bsL2bWiw9I0awOtbv/O7lyDB5nZ1M9R5OUMUyrUilt+YjPMgP
         xqBFepJubjedaNGtW+qd5cFlrHcqbOi3mrH1MmBmk2GLSbA3cdAsaPZvLsWgA9Tc5r/n
         JFfFtmkp5ZbMEXBr+qXtvnp+EjQmCqB5lb2oLAO+5an1Icahe/zUccrDKdhwK03EiOBv
         Ko/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792790374; x=1793395174;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KZvQCXE2w8xm1bldONxZAIDkTdJiEoBhQ1VJO1GJj1o=;
        b=zW6MTawVAQpeTmBjEtdUVfoWXIsz82yr0xOgwuSJfvsroqfbEtfh2Kgg5EqmgCjHQp
         Q3CJGBPh0wrMQ5BuMpmAe18eAXiN6FFDcBTMj/9Of4bB/Bl+3deB1mRrns6IDwkxo2Z0
         M6U0q673pU02Ue7oXsE4hJDY4cHmG6x6dn+v2crIJglMsnpy0cZnWQY3E9O9E8+mErWr
         TYiHC6Or7W5AErdpzQdE4svGPvTKNmF1hfFsOKWec12W1z4hACVH3iIHdZg5MXVBQRRF
         5W6+qBr7NuE3o0HUlVvlbosbSambvkJwtXmMe8mfdakoLuweVlTd6Rm0JbmYsHaoW8F8
         EYIw==
X-Forwarded-Encrypted: i=1; AKwUvBzHzaWi1AWwhsVmJlZb86nDsXJJ+qcIGp3n2mBxe1S5L72nVNrmVjo47AEWNJ/k8O/NyUj4ioQg+4IReIesuU6A@lists.infradead.org
X-Gm-Message-State: AFq9FYL1U9LStV8TVAcFLvKTV6tmJKZtf0kziEA7rcZwfbGjDz1W9sZD
	dqPwqWV8DYxk8k5rylj5LHMXtg6DH/eKPR3zW5fng+f8H2Gd5AIiCmeOYw9XRulG
X-Gm-Gg: AYBFou3FpsAbjlZMwEO2OZtqb/Jp0zrWgxYXlo9wE9ri2m9pWyPA03GoFvEGpNik6Dh
	nRANVHhe53psSrSJiDg/m26nsbUshxAsNqL6mTX+CV4zTmGIKG9c8DkuPBWfi2GL+Ge6Oxcv2+M
	8ZybQr5G/XCbj8u6W4mcB9InTwI78pI3LImon4TJnwickvTW0zWPcha02GyIfvwj1JEOf81dvev
	bGFSUJWdj8DP45d8WkvGfl/iYGgdskqpUB7EMPTLcZINQxbjnWuzdOUH2jA1vWlJo+DgjyNkneZ
	WVL4eVaVQY87rww3h/VK6qjG+NhEciKp+4oJ6WnLkGzvYaLFt57/CDz89bYXG6N0b7N+hIjKGfQ
	f4NAJdZCJNG3IEXlwdir0gwimXm2fxUnWMILZBB+XX+xOQNn0oRBHijbjLWO8gvXeWYVrKlPrx/
	Hm6GgXhTAiba8n/oUHKslsn0+v1jtAXlMHnysS5yfzhEp7q7XqxGsBxQQTuvjWyhXsxCk4SCMvQ
	QtYYt2COpYxMFpliXwLQdcaJ1zBlaOb0c8P8FkvZWswKEFNum88Q1knmBOVUS9sJGj+Gdi4p7ye
	MX2YJpPst77QqKqJ52FDFZThF+mp4LnCZU7+OGASgGbd1+tvFMCluI4ntPGC+zUs+NSF+BGBk/7
	4p315ssoJurtNWvEIaHlOVoGNw3VjcNNW/GxXXT8ZEC3TZxV9TRkPk6w2oklr7ia6P+qE2EcO40
	RDOQ==
X-Received: by 2002:a05:6830:927:b0:7f8:4ebe:2854 with SMTP id 46e09a7af769-850fb0769c4mr573277a34.4.1792790373894;
        Fri, 23 Oct 2026 14:19:33 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850f8458d8esm565721a34.1.2026.10.23.14.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 14:19:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 15:19:28 -0600
Subject: [PATCH v2 2/3] serial: 8250_dw: configure the Allwinner H616 UART
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-submit-h616-uart-fifo-v1-v2-2-af0593504635@gmail.com>
References: <20261023-submit-h616-uart-fifo-v1-v2-0-af0593504635@gmail.com>
In-Reply-To: <20261023-submit-h616-uart-fifo-v1-v2-0-af0593504635@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_141935_109068_43A279FD 
X-CRM114-Status: GOOD (  24.81  )
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

H616 has 256-byte transmit and receive FIFOs, but its optional DesignWare
component parameter register reads as zero. Generic 16550 probing leaves
the port using the 16-byte FIFO configuration and its trigger-level table.
DMA attachment also depends on a FIFO size being available during probe,
so these ports do not reach the existing 8250 DMA path.

Keep PORT_16550A and supply the FIFO size, transmit load and capabilities
when matching the H616 platform data. Provide receive-trigger callbacks
for the documented thresholds of 1, 64, 128 and 254 bytes. The normal
16550A half-full trigger selects 128 bytes on this integration. Serialize
trigger changes with termios and hold a runtime PM reference while
programming FCR, preserving the FIFO contents.

Advertise automatic flow control so CRTSCTS enables MCR.AFCE. The
DesignWare termios path selects hardware CTS handling, so the capability
must be present for the corresponding hardware control to be enabled.

Skip optional-register probing for this fixed configuration. H616 has
debug-divisor and RS485 control registers at the offsets used to detect
DesignWare hardware RS485 and fractional-divisor support. Probing these
offsets writes unrelated registers and can select incompatible callbacks.
Keep the BUSY-safe integer divisor hook and software RS485 handling.

Use the existing SKIP_SET_RATE quirk to keep the UART clock enabled during
termios changes. Its clock is a gate on the shared APB2 source, rather than
an independent baud-rate generator.

Attach DMA from the fixed configuration before registering the port.
Configure single-byte RX and TX bursts because the peripheral request can
correspond to just one character. The existing startup path requests the
firmware-described channels and falls back to PIO when they are unavailable
or the port is a kernel console.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 87 +++++++++++++++++++++++++++++++++++----
 1 file changed, 79 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index eca02e8bd6d1..b9f5cb61f2b6 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -19,6 +19,7 @@
 #include <linux/io.h>
 #include <linux/lockdep.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
@@ -66,6 +67,11 @@ struct dw8250_platform_data {
 	unsigned int quirks;
 };
 
+static const struct dw8250_platform_data dw8250_h616_data = {
+	.usr_reg = DW_UART_USR,
+	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
+};
+
 struct dw8250_data {
 	struct dw8250_port_data	data;
 	const struct dw8250_platform_data *pdata;
@@ -630,6 +636,66 @@ static void dw8250_shutdown(struct uart_port *port)
 	d->no_int_count = 0;
 }
 
+static const u8 dw8250_h616_rxtrig_bytes[] = { 1, 64, 128, 254 };
+
+static int dw8250_h616_get_rxtrig(struct uart_port *p)
+{
+	struct uart_8250_port *up = up_to_u8250p(p);
+
+	guard(uart_port_lock_irqsave)(p);
+
+	return dw8250_h616_rxtrig_bytes[UART_FCR_R_TRIG_BITS(up->fcr)];
+}
+
+static int dw8250_h616_set_rxtrig(struct uart_port *p, unsigned char bytes)
+{
+	struct uart_8250_port *up = up_to_u8250p(p);
+	int i, ret;
+
+	/* Use the nearest lower threshold, as the generic 8250 implementation does. */
+	for (i = 1; i < ARRAY_SIZE(dw8250_h616_rxtrig_bytes); i++)
+		if (bytes < dw8250_h616_rxtrig_bytes[i])
+			break;
+
+	guard(mutex)(&p->state->port.mutex);
+
+	ret = pm_runtime_resume_and_get(p->dev);
+	if (ret < 0)
+		return ret;
+
+	scoped_guard(uart_port_lock_irqsave, p) {
+		up->fcr &= ~UART_FCR_TRIGGER_MASK;
+		up->fcr |= (i - 1) << UART_FCR_R_TRIG_SHIFT;
+		/* Changing the trigger alone preserves the FIFO contents. */
+		serial_port_out(p, UART_FCR, up->fcr);
+	}
+	pm_runtime_put(p->dev);
+
+	return 0;
+}
+
+static void dw8250_h616_setup(struct uart_8250_port *up, struct dw8250_data *data)
+{
+	struct uart_port *p = &up->port;
+
+	p->type = PORT_16550A;
+	p->flags |= UPF_FIXED_TYPE;
+	p->fifosize = 256;
+	up->tx_loadsz = 256;
+	up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_AFE;
+	p->get_rxtrig = dw8250_h616_get_rxtrig;
+	p->set_rxtrig = dw8250_h616_set_rxtrig;
+	p->rs485_config = serial8250_em485_config;
+	p->rs485_supported = serial8250_em485_supported;
+	up->rs485_start_tx = serial8250_em485_start_tx;
+	up->rs485_stop_tx = serial8250_em485_stop_tx;
+
+	/* A peripheral request can correspond to just one character. */
+	data->data.dma.rxconf.src_maxburst = 1;
+	data->data.dma.txconf.dst_maxburst = 1;
+	up->dma = &data->data.dma;
+}
+
 static int dw8250_probe(struct platform_device *pdev)
 {
 	struct uart_8250_port uart = {}, *up = &uart;
@@ -765,14 +831,18 @@ static int dw8250_probe(struct platform_device *pdev)
 
 	dw8250_setup_dma_filter(p, data);
 
-	if (!data->skip_autocfg)
-		dw8250_setup_port(p);
-
-	/* If we have a valid fifosize, try hooking up DMA */
-	if (p->fifosize) {
-		data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
-		data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
-		up->dma = &data->data.dma;
+	if (data->pdata == &dw8250_h616_data) {
+		dw8250_h616_setup(up, data);
+	} else {
+		if (!data->skip_autocfg)
+			dw8250_setup_port(p);
+
+		/* If we have a valid fifosize, try hooking up DMA */
+		if (p->fifosize) {
+			data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
+			data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
+			up->dma = &data->data.dma;
+		}
 	}
 
 	data->data.uport = serial8250_register_8250_port(up);
@@ -904,6 +974,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
+	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },

-- 
2.53.0


