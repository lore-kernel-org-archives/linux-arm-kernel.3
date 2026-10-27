Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE3C606A320
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 23:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zCIUHFjX;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MlXD1/Cd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NibLrfxDRIfDtcYggv4vzVM4Oy227j/MGOoa1wBvs8c=; b=zCIUHFjXyOnTWv
	1hnTELx0CG5PCwR3/e1gJ2ozai9mz0huzkhUrU3GQ2UWCweeVY6s+s3FUZMWJ3ryE3fEqv5Fk1sjK
	EuA5XtTc5TphGrkDtlEP71hqjRiFTe99H5u0CEbtMIJ+LeClwRzorX4L8BXatH/e5pIDF9ekcLi/m
	RMSSQWGfxbqriaqH3qCfi2g16Ed2Zd4Q+mQ6Swtqnk7o3uw5nWNPCPg4NzzdobgdLLQ6Tvgto2jxv
	BS68Wrj4RnHqIn7Oy7Q/Wq0KS868Cgx+keBzrRAsoYzaF5BWAevF1Jp1bOAMKf6fonlC0JlwMmcBI
	ED1TzeifiI86NUdWwJvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLqEs-00000005tWH-2yA3;
	Tue, 27 Oct 2026 23:05:54 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLqEp-00000005tTa-0sDN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 23:05:52 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-823e4047037so283238a34.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 16:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793142350; x=1793747150; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NibLrfxDRIfDtcYggv4vzVM4Oy227j/MGOoa1wBvs8c=;
        b=MlXD1/Cddj2OKHjcIGlsqWOmOTXBRxtPYJrcVAnKy2z8X02kU+6Z0iaA3en1twmZhw
         3Xjlw8ULo3XK09L6JH1DYWOYJhd9ikK2fvoMBWv9yA6AxON20I3M0HD452P3MR4oMnW3
         w71iShyKq3wxfjfReUFAU/NFRTVy+LHr4d2vnMqIWZ7AHq7hOrn04VTSJUxP6Sn93iEj
         KHpCqmGtS3fEucrVWM43RyCWO4QqA3TD6HCRYr0x5bLEfhdPYzSiwtL0m55IX1OdnB8G
         WtUh/PjWAkArRN8aF1UTjAZLBTWs2kkNWDwr6s/bKCouaQAL3z12x5lZxqZG64pCooEs
         Etsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142350; x=1793747150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NibLrfxDRIfDtcYggv4vzVM4Oy227j/MGOoa1wBvs8c=;
        b=ZpVmvT4ix6QA/FTGyw75wOH5UF0ZWeVRAIJ6Hl38yqFe8ylKvD6MawSgXHI5L6F5wz
         WhKvZaGYXNiobHvFVkznHnbZPG1dSdOK6EXKXR8m6mLymy5F0xWlNTc93Giaw6/oHAgP
         hSSyx84pFLOlgV3pF4iNLVA7eNz66i4+W6QSlEdY5kgfbqhWtpDQyXaBxQlfP3AZw5qp
         pKVzAf2S3N33ThJzMDp83e4P8L4QN2AyCoSvc0NbdezmZ8MA5zaXmG7I64x6mKCfqY40
         r6zwE0bs6jAydNvp3gJ/1Bt1DerICy/LpIIcnfWZB/62igrlthi6YsovLIXrOP+xwQxR
         8bfQ==
X-Forwarded-Encrypted: i=1; AKwUvByGZevJ1GU3LVQFdIp/sy20TRTCq+zxAMw9vnoXfMDKsyfMsOYDti4FzkothcpEkmXAPN6tUmfmf9PWR6gvDhDp@lists.infradead.org
X-Gm-Message-State: AFq9FYJ2wmNvYs6lNnUyoH+Mjfpdnwgwu1ng+CZLqnWfByNnWR6ZDpyE
	2UXvrdmu0Kro6JLaaphU5YnlfAPWJbpymvwtcESYqE1ZxCGENclku919
X-Gm-Gg: AYBFou2pzpFrO+3xIqa/C3ILF4xrUAherLDIFJl2Vc+KghrTIXMcGM+dV0wKihJX+i9
	b3FMOmkQlCZSUgFhobWy6EMrVbpBI9eywfB7kRKnAfGNC0p1sDzj/rEhmx88UDaiqH3RRcxCcR2
	JRz0cTiWkSumo9gmXu6R1XRxIfKO2UJFCVxri2xMQ0OnoyTlMGnitykrqvnklSweaLaGiB27HgV
	tHHjzqp1bkcR5CxLJ3S/Fw0jklq/GybPh/hHUe8HZ4HAzkJwNIG0CQv+68Zgxj24Nt5tEQGPL2C
	OZE4Gh6duDOi45y2r/obOUSH+GZop2jaFhMS0zI/KOqKbcQN247cv8aF3I59etQIdLDcAYPRZIy
	JEOecsmNUq+3lQ2K/ZrImP+x9iEA7L0YijFS4gfkpak2Ir5xJ8ibA/9TtLO3541Y9RRifGZ908a
	niUu+RNPjlt7BfbBLN1+/o0za/hIxyRmMXAdKy+IpflNnEkiXepKEa3kDvzxT/hi2F1DwXXFSBS
	XPn+wg27bbyuIQU+9Y0ru5gKUyUL4tjPWxuOAqmIP9klT6V3UJIC9CakVo6NGGORq7nq2jJXiQZ
	XfVYhvy0OSqHbSpUmFP6Oi/c72Bb+I/CQMeoQa1V24Ew9D+ctq32ADGgwVfJNw1ztQnm4zO1CGU
	XwD2yrHDyUSsP6Dd+zSHRNH6E1STkDcdupAa2NaPdhlcdwvjkiOcy05fXZ+y6ogFAlTCwSSrrSN
	IEVNl+beaPXJA1LrZhKsxP5Sk=
X-Received: by 2002:a05:6830:6412:b0:845:8d86:9f88 with SMTP id 46e09a7af769-85abd032c43mr884141a34.15.1793142350443;
        Tue, 27 Oct 2026 16:05:50 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb0741c9sm12093328a34.10.2026.10.27.16.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:05:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 Oct 2026 17:05:32 -0600
Subject: [PATCH v4 4/5] serial: 8250_dw: configure the Allwinner H616 UART
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-submit-h616-uart-fifo-v1-v4-4-d37e018fd0a6@gmail.com>
References: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
In-Reply-To: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
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
X-CRM114-CacheID: sfid-20261027_160551_270544_1A580830 
X-CRM114-Status: GOOD (  22.46  )
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

Keep PORT_16550A and describe H616's fixed 256-byte FIFO depth in platform
data. Use common Allwinner setup helpers to configure the transmit load
and receive trigger table from that depth.

Derive the receive thresholds from the documented 1-byte, quarter-full,
half-full and FIFO-depth-minus-two mapping. On H616 these are 1, 64, 128
and 254 bytes; the normal 16550A half-full FCR setting selects 128 bytes.

Build the threshold table during setup and use the shared 8250 conversion
helper to select the nearest lower threshold for sysfs writes.

Serialize trigger changes with termios and hold a runtime PM reference
while programming FCR, preserving the FIFO contents. Propagate runtime
resume errors before changing either the FCR shadow or the hardware.

Advertise automatic flow control so CRTSCTS enables MCR.AFCE. The
DesignWare termios path selects hardware CTS handling, so the capability
must be present for the corresponding hardware control to be enabled.

Select the fixed configuration through the platform setup callback.
H616 has debug-divisor and RS485 control registers at the offsets used to
detect DesignWare hardware RS485 and fractional-divisor support. Avoid
those probes and retain the BUSY-safe integer divisor hook and software
RS485 handling.

Use the existing SKIP_SET_RATE quirk to keep the UART clock enabled during
termios changes. Its clock is a gate on the shared APB2 source, rather than
an independent baud-rate generator.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 94 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 1351523f0c47..2f156c01c5a1 100644
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
@@ -63,6 +64,7 @@
 struct dw8250_platform_data {
 	u8 usr_reg;
 	u32 cpr_value;
+	unsigned int fifo_size;
 	unsigned int quirks;
 	void (*setup)(struct uart_port *p);
 };
@@ -81,6 +83,7 @@ struct dw8250_data {
 	unsigned int		in_idle:1;
 
 	u8			no_int_count;
+	u8			rxtrig_bytes[UART_FCR_R_TRIG_MAX_STATE];
 };
 
 static inline struct dw8250_data *to_dw8250_data(struct dw8250_port_data *data)
@@ -657,6 +660,89 @@ static void dw8250_octeon_setup(struct uart_port *p)
 	dw8250_setup_dma(p);
 }
 
+/* The trigger is the masked, unshifted FCR receive trigger field. */
+static unsigned int dw8250_sunxi_rxtrig_bytes(struct uart_port *p, unsigned int trigger)
+{
+	switch (trigger) {
+	case UART_FCR_TRIGGER_1:
+		return 1;
+	case UART_FCR_TRIGGER_4:
+		return p->fifosize / 4;
+	case UART_FCR_TRIGGER_8:
+		return p->fifosize / 2;
+	default:
+		return p->fifosize - 2;
+	}
+}
+
+static int dw8250_sunxi_get_rxtrig(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+	struct uart_8250_port *up = up_to_u8250p(p);
+
+	guard(uart_port_lock_irqsave)(p);
+
+	return data->rxtrig_bytes[UART_FCR_R_TRIG_BITS(up->fcr)];
+}
+
+static int dw8250_sunxi_set_rxtrig(struct uart_port *p, unsigned char bytes)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+	struct uart_8250_port *up = up_to_u8250p(p);
+	int fcr, ret;
+
+	fcr = serial8250_bytes_to_fcr(data->rxtrig_bytes, bytes);
+	if (fcr < 0)
+		return fcr;
+
+	guard(mutex)(&p->state->port.mutex);
+
+	PM_RUNTIME_ACQUIRE_IF_ENABLED(p->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
+	guard(uart_port_lock_irqsave)(p);
+
+	up->fcr &= ~UART_FCR_TRIGGER_MASK;
+	up->fcr |= fcr;
+	/* Changing the trigger alone preserves the FIFO contents. */
+	serial_port_out(p, UART_FCR, up->fcr);
+
+	return 0;
+}
+
+static void dw8250_sunxi_setup_rxtrig(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+
+	/* Allwinner RX thresholds differ from the standard 16550A table. */
+	for (unsigned int i = 0; i < ARRAY_SIZE(data->rxtrig_bytes); i++)
+		data->rxtrig_bytes[i] = dw8250_sunxi_rxtrig_bytes(p, i << UART_FCR_R_TRIG_SHIFT);
+	p->get_rxtrig = dw8250_sunxi_get_rxtrig;
+	p->set_rxtrig = dw8250_sunxi_set_rxtrig;
+}
+
+static void dw8250_sunxi_setup(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+	struct uart_8250_port *up = up_to_u8250p(p);
+
+	p->type = PORT_16550A;
+	p->flags |= UPF_FIXED_TYPE;
+	p->fifosize = data->pdata->fifo_size;
+	up->tx_loadsz = p->fifosize;
+	up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_AFE;
+
+	dw8250_sunxi_setup_rxtrig(p);
+
+	/* Use software RS485 with the Allwinner register layout. */
+	p->rs485_config = serial8250_em485_config;
+	p->rs485_supported = serial8250_em485_supported;
+	up->rs485_start_tx = serial8250_em485_start_tx;
+	up->rs485_stop_tx = serial8250_em485_stop_tx;
+}
+
 static int dw8250_probe(struct platform_device *pdev)
 {
 	struct uart_8250_port uart = {}, *up = &uart;
@@ -878,6 +964,13 @@ static const struct dw8250_platform_data dw8250_dw_apb = {
 	.usr_reg = DW_UART_USR,
 };
 
+static const struct dw8250_platform_data dw8250_h616_data = {
+	.usr_reg = DW_UART_USR,
+	.fifo_size = 256,
+	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
+	.setup = dw8250_sunxi_setup,
+};
+
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
 	.quirks = DW_UART_QUIRK_OCTEON,
@@ -929,6 +1022,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
+	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },

-- 
2.53.0


