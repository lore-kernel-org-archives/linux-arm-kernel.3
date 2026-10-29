Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0E5606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 18:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TQmzYmmZ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wQauPP4S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gJAfXaHluwvTpQW+2Z7MBdS0PgqOTRFcNQYFPdMFZbU=; b=TQmzYmmZnTAite
	LU8CX/9W8a0VMKyktvgprG6w27kk53WbpdWxQaGwrdoiioInYO94dUgLFlHFRzwANlyRgbV/if2o9
	wegiigfENK/nOwTYjk76GWNQXJFY7hxiI0eaa6wXQ6VJGe/64FZILmNMRBeWBzDNn2PVKRDnzfW5w
	smg5wX5j2/++m+Y7+0kfP5YTTCHsLuFb2ARKXbf0s17s7vcSBuQKtlcLXAWhD20owVZsFAq6U7FCK
	IDQyQc7mmbL3fzfhCnfkRfqSEYq+hmq25yYVu647tqbD74gwoPeSbWt5/w2DrK79WE3pz/ZIOeGpG
	TF9yBa/rLYmlDyman2Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVAD-0000000AAA4-1jK6;
	Thu, 29 Oct 2026 18:47:49 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVA2-0000000AA4P-2hhU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 18:47:40 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-85c1135c286so861230a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 11:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793299657; x=1793904457; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gJAfXaHluwvTpQW+2Z7MBdS0PgqOTRFcNQYFPdMFZbU=;
        b=wQauPP4Ss3omapgFTOMKjnfO8zvP38nQ9gxZ5A/Kzf3hiEDE2vvk/pJPlpqVbYg3Y+
         4B4vyGKXHyygve6dhp3K5Hvy+m36LwwkC3L0IRbHV7KLbF7+4I4ufXldTizBBQNqrRIl
         3E/o1gapcazVkSJeC+g4u/H3i2ppiwxjlM/tltDNSggbhdpBIW3N7q06AIeRDo7m/TKq
         8GKg9fHF7QAYs1wmdt9ei6GY+TaWAGZfmBUy+3izpD/coqETMn6ud9dn1F+3w4vX95Wp
         faY8xTzDAaKNKuxla/c0fAZY7HynU4zz3gTXeFhifycJ1SjAj2RfhmD66wbUSd170pim
         wQGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299657; x=1793904457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gJAfXaHluwvTpQW+2Z7MBdS0PgqOTRFcNQYFPdMFZbU=;
        b=Cj2Xnbz+0vEyfXq+T//GR/T3ev0W+MNzlkYiITwUa2OQaNxQrThO3t6WjpIcQ4SJOC
         ur1PwKDA/WWrpDJqABX0DN+/JdfVR2+HvM61jsUrIYrjB5LcTvECXG1wqKTZbICiKCOy
         J9FqcFd6SPr+W+GapTCaZrP4JHAyKz331XbyShBmaNvYiwtr+1esBs6f6eABF3No+47S
         aVf+iNzR+mrsHcUGxKgQCQahB/iZdZLUbx7Kei06LmZsLnlmkJiD3ecNo1TCyZaXIBAN
         mUVtlBuePtPi8iQRr+cX6XX7fz0cPWKJnUoItjjpr191XOFE6YGaYjlLVHVcNvMTYOJi
         qI7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxhs6dCZC16eqhXeorrBH6uHk8gHKKFYKy6DoQ2A7n8Xkmdhe9zYkbFy94LyAqVUwjio/e/o+oNHHWZEIZKcqPC@lists.infradead.org
X-Gm-Message-State: AFq9FYKK6H2LIFlVl0bRC6C7IIwVQTZLS2dUIzDjgV4KxPZ2Qec/aeJE
	XXEARUU5VWkk9Ivi6HIxeIldF6cCNwm72QbYlSjwr6+Yc3KzoYoCu04K
X-Gm-Gg: AYBFou3noOB5Io/6WVZlpcES9PlRW5vFcTi6l3mjBX29p2mbH2SqVRjU37Ti8z0zVNH
	uA7+TVQ4H5Tj+wZBynGox7yJbKjej1jJp1urc6N7cK19B4YGQNgiwnGTtDNItXONQgqTuIBzn+r
	qyw9+oNgRjORXOoOmgF9icL3Nks4x0codCcoBkS39EGCdtoTFKlpBUCpWozy4PswL04z0IIdgUn
	2jNdhZwGTxpuz5E85mqXl9VRPUUn+M//Xv/ganjooWLcGiXJOw8CtwD6sXifdZAHearQFJ2NhtV
	Tpo1z64JNLSjp6ydp6V1PJxii7H5KdHfsAmLimQP807dr/6U20cgmCF/+VTME0fwdNayLP6visC
	iV5XAAX8je5kkoD4uUn5lKwg2PBDASXOT4gAPbf/KH3Mre/4f4/pkUuVvXVDq7NJtDAkBLr5fDj
	WRgG3ZzMtWCXN8EbRvyMo+Wm/KToNq2xBGyFfT1KjwE80ABIZ6zJVDvktH6RnPPXrKgR469Zvr3
	Ul0Eq0wioztCJRE055wEmpfIG7AqCIkLw68yIc8RZJGlrj2DxMQAqY5q8J/OheGo4X+bXGuV4vu
	U+GPSTwexsR3HyMY7Sm5tOnk4Fs2qZHCXZjcSTYBxOIdCb6QPXVGobw/Kv2GaM64f6R8Csb6hrN
	FU0JIskqKl88uauEXbhoslNkVzDhaasiMYu5I1LHqE3tdeUY+BfJZp72B6eiObr73F1KIGfpLqN
	eyYOsE7q4hEN9fM41meB/Tp1+ruJlF+mHPFaBAv0jrTN53BaF73K8=
X-Received: by 2002:a05:6830:719f:b0:7f6:705b:ffe7 with SMTP id 46e09a7af769-85d3652e99fmr29175a34.14.1793299656954;
        Thu, 29 Oct 2026 11:47:36 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm221871a34.14.2026.10.29.11.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:47:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 12:47:25 -0600
Subject: [PATCH v5 4/8] serial: 8250_dw: configure the Allwinner H616 UART
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-submit-h616-uart-fifo-v1-v5-4-53b433aebbf8@gmail.com>
References: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
In-Reply-To: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_114738_705435_E453B88A 
X-CRM114-Status: GOOD (  22.06  )
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

Allwinner encodes these thresholds as fractions of the FIFO depth rather
than fixed byte counts. Building a per-port table from that depth keeps
the mapping in one place for integrations with different FIFO sizes,
including those that report their depth through FCC. It also lets the
shared 8250 conversion helper select the nearest lower threshold for sysfs
writes using the same table as the read callback.

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
 drivers/tty/serial/8250/8250_dw.c | 98 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index a546cf2de7b6..3bc6735fc253 100644
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
 	int (*setup)(struct uart_port *p);
 };
@@ -81,6 +83,7 @@ struct dw8250_data {
 	unsigned int		in_idle:1;
 
 	u8			no_int_count;
+	u8			rxtrig_bytes[UART_FCR_R_TRIG_MAX_STATE];
 };
 
 static inline struct dw8250_data *to_dw8250_data(struct dw8250_port_data *data)
@@ -652,6 +655,93 @@ static int dw8250_setup(struct uart_port *p)
 	return dw8250_setup_dma(p);
 }
 
+/* The trigger is the masked FCR receive trigger field, in register position */
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
+	/* Changing the trigger alone preserves the FIFO contents */
+	serial_port_out(p, UART_FCR, up->fcr);
+
+	return 0;
+}
+
+static void dw8250_sunxi_setup_rxtrig(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+
+	/* Allwinner RX thresholds differ from the standard 16550A table */
+	for (unsigned int i = 0; i < ARRAY_SIZE(data->rxtrig_bytes); i++) {
+		unsigned int trigger = FIELD_PREP(UART_FCR_TRIGGER_MASK, i);
+
+		data->rxtrig_bytes[i] = dw8250_sunxi_rxtrig_bytes(p, trigger);
+	}
+	p->get_rxtrig = dw8250_sunxi_get_rxtrig;
+	p->set_rxtrig = dw8250_sunxi_set_rxtrig;
+}
+
+static int dw8250_sunxi_setup(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+	struct uart_8250_port *up = up_to_u8250p(p);
+
+	p->type = PORT_16550A;
+	p->flags |= UPF_FIXED_TYPE;
+	p->fifosize = data->pdata->fifo_size;
+	up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_AFE;
+
+	dw8250_sunxi_setup_rxtrig(p);
+
+	/* Use software RS485 with the Allwinner register layout */
+	p->rs485_config = serial8250_em485_config;
+	p->rs485_supported = serial8250_em485_supported;
+	up->rs485_start_tx = serial8250_em485_start_tx;
+	up->rs485_stop_tx = serial8250_em485_stop_tx;
+
+	return 0;
+}
+
 static int dw8250_probe(struct platform_device *pdev)
 {
 	struct uart_8250_port uart = {}, *up = &uart;
@@ -875,6 +965,13 @@ static const struct dw8250_platform_data dw8250_dw_apb = {
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
@@ -926,6 +1023,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
+	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },

-- 
2.53.0


