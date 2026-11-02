Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0628F606D80F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zKzI19CS;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VRrggB58
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=37idryY/a/htHBbpIdMpV4QXCrwUTlQBCm2nQ8PKPDc=; b=zKzI19CSJNDr02
	Nm8E4zBpBZi5GG+hUUl7Z4RHRy2D+jXQyooJxcOqElNtrRmHNpUfw009u4VHjjgLmbkJKpiC2iYOc
	Vvzg8mndMFGkbol7mQdulybB2A/8Ve6LRPMgoy+oC2IGO6Foh6YXK8L3RpRoXqbpeuUW6O/5CJmZp
	g0fG6BX2aFdpXJ2/jrdknJI1drNrgidyZIg8LRcM0YkKe3HIkNmpdgz+witu2CAYPVdBgDqI2b+bn
	uRUkLsSP8WDPZpBX3HqOJ30XLT+0pAcq3rEvRzU8YPS/KfHBJx5etxhIl6a6mWMD3RUQ5c8nAMVu5
	kKypwP2rYXtky2XNwcZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNy7x-00000000ELy-3zAA;
	Mon, 02 Nov 2026 19:55:33 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNy7u-00000000EHb-1BHx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 19:55:31 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-490d838b425so2072000fac.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 11:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649329; x=1794254129; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=37idryY/a/htHBbpIdMpV4QXCrwUTlQBCm2nQ8PKPDc=;
        b=VRrggB588wIhj3LNkg0q4og0o1wANz8OtofgZ+ddxYiF+wPYADMhupM1HL4xiQHxfc
         XVmF0L0hxvdJVY0IPRNosybFbygw0RQHcn799XWY843BHq7Su82Lj3KTqWPouhXoXhNl
         ywtJyFEXWgGVNGUQkj9YdfpK2pxCJGXFh08j99GOd6vXCi464PjL57u+fXuZ2axbjvah
         nS1qUUZ6y3Yg8wi1785VJVwPxFlcBgk8QhB30/oRPfAqBH0BUDemXOyP9hJ7BwMarYxv
         gSVNO8Ye/8CBqtzMAWUo6XK4XPfiw2aWKRz2XrDOyMSDNlf5AhWd9UDSLkFAnePUxMOA
         O55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649329; x=1794254129;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=37idryY/a/htHBbpIdMpV4QXCrwUTlQBCm2nQ8PKPDc=;
        b=M1ZcUDWUpcOUr9ejvwuqqt4lkoNOTA/JnwTL/DcPgWn69Y9CHgKqmOjtB+M0Bjuw9j
         0P8YkulOqNnbS2PqyblDMpo+IOQmRUeAEobaJUTwymnYnDd2LOunxbRMPdx+oi1HfOU7
         lDTPf/G2tGmqdkcgUu84v6Fl4lX8eQnVBsXbpwJjniCZD89UIr7rKFXzJih01TYtIssw
         WP6EZ1JCFwX/znO6q1yD2wb5IBwRhK/ujEDdFxkazzY83NkEAABF2K8XgDyV7ajtNi8a
         0QG8tfj9UDrVGDisUo9RVHA3/H58FdrAikrjYzYYE7YQDBBS/ntTGdkj4uIY7wbrhMbJ
         EhuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgPzbdTpQR/LDu7buxzv08a+lsAOITtKJ8jN2caIJ30Hv3pUTVa0UNCbQG5MoniGFZKinyFgXTn9NpSrAYGz8K@lists.infradead.org
X-Gm-Message-State: AFq9FYJwBFX4pG4tDnO2MQkx7mFw40Djj3HVmOxD0gPF7luC4tHUjGg2
	jjIFL2AYAdA3zIXhTLpXB18Zdnh+Q2CHgMYBVBWgxQkjxFTV3Hj6EY23
X-Gm-Gg: AYBFou1bhwuEKz08GYYXCOrqmX00CPPtX8w6itPshxX874H3FUO+jvdD2m5D6wQmCEG
	WoYVTNX+RStj741ATc3SkpzPYXvHE3R73IncdalLUxAUuJP3LYfg7piQ025CW27CiWnKw9DSLhn
	OgVTiamo3UIFOlak/EFbneAFScEnp1YPnc+yjeQTIQirLkDuycu8yOcTaCg9Nc9itazlKFDy00n
	yjqxjKaJAxNs/Lw5PuX95poBcYwQWaXM1AHCksmb4DAGnknUd6p1FG5LG4sxOGFkse+Vws0pueP
	HnCYHDrvJ+5KQBwLhfj0aJaqqKqXv0nR7fgv+7/9Ug0tDc5x2gVexERuacxEB3rel7SqGIHF/FV
	UW9FAU55X+mkAfFNtcLAUlwdj0h87ND+tVQKWYp/h6A5Mt0vNHqk5kfSK9FfUvCSEnB9BasQSro
	a2NlEW22oHczAGsCYBDM68CtxZUlmLrIOtXEBbmVscfmtO6HY/HrcJHDfUoW8NQIfimWfYJuSfA
	qyi+pULAg8Zehri8ctDkffukoTG/hjjofru1ktI/Ra7X/6Vy2yi9B6OYhilquooi1GruYuh6G1r
	fJ/LCvarBaL+TxkmRDvFvWdrZkxsuRpsl2aeePNWoaUQOOWyTKp7nLEyGgAdjhrjkDfXdigHKT9
	GyEfK1cOqj85nroMDREN6AEIu2rSOFvcHk70kOCVDcgZcsJLXJD1jfn7fylTkq7eccsL6LRxQlT
	UnuleSi7IlsVrYrcHgRY/X0UzAbs0wtV5OyEpVSroRC6a5hnSOryMn
X-Received: by 2002:a05:6870:8242:b0:456:5d8b:5681 with SMTP id 586e51a60fabf-4a9072d45b8mr7344269fac.1.1793649329174;
        Mon, 02 Nov 2026 11:55:29 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a921353dcfsm7809249fac.0.2026.11.02.11.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:55:28 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 12:55:19 -0700
Subject: [PATCH v6 4/8] serial: 8250_dw: configure the Allwinner H616 UART
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-submit-h616-uart-fifo-v1-v6-4-25afcb346b0c@gmail.com>
References: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
In-Reply-To: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
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
X-CRM114-CacheID: sfid-20261102_115530_345657_EBC8AD97 
X-CRM114-Status: GOOD (  25.08  )
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

Keep PORT_16550A and supply H616's fixed FIFO depth through platform data.
The 8250 core derives the transmit load from that depth.

Allwinner encodes receive thresholds relative to the FIFO depth: one byte,
quarter-full, half-full and depth minus two. Construct the RX trigger
threshold array on the fly so other FIFO sizes can reuse the same mapping.
For H616 the thresholds are 1, 64, 128 and 254 bytes, with the normal
half-full FCR setting selecting 128 bytes. Use this array for both RX
trigger callbacks and the shared bytes-to-FCR conversion.

Serialize trigger changes with termios through the port mutex. Hold a
runtime PM reference for the register access and the UART port lock while
updating the FCR shadow and hardware. Changing only the trigger field
preserves the FIFO contents; a runtime resume failure leaves both the
shadow and hardware unchanged.

Advertise automatic flow control so CRTSCTS enables MCR.AFCE, matching the
DesignWare termios path's hardware CTS handling.

Select this configuration through the platform setup callback. H616's
debug-divisor and RS485 control registers overlap offsets used to detect
generic DesignWare features. Use the fixed configuration with BUSY-safe
integer divisor programming and software RS485 handling.

Keep the UART clock enabled during termios changes with SKIP_SET_RATE.
Its clock is a gate on the shared APB2 source rather than an independent
baud-rate generator.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 104 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index a546cf2de7b6..0b0156464af6 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -9,6 +9,7 @@
  * LCR is written whilst busy.  If it is, then a busy detect interrupt is
  * raised, the LCR needs to be rewritten and the uart status register read.
  */
+#include <linux/array_size.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/cleanup.h>
@@ -19,6 +20,7 @@
 #include <linux/io.h>
 #include <linux/lockdep.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
@@ -44,6 +46,11 @@
 #define RZN1_UART_xDMACR_8_WORD_BURST	(2 << 1)
 #define RZN1_UART_xDMACR_BLK_SZ(x)	((x) << 3)
 
+/* Allwinner FIFO-relative receive thresholds */
+#define SUNXI_UART_RXTRIG_QUARTER_DIV	4
+#define SUNXI_UART_RXTRIG_HALF_DIV	2
+#define SUNXI_UART_RXTRIG_FULL_MARGIN	2
+
 /* Quirks */
 #define DW_UART_QUIRK_OCTEON		BIT(0)
 #define DW_UART_QUIRK_ARMADA_38X	BIT(1)
@@ -63,6 +70,7 @@
 struct dw8250_platform_data {
 	u8 usr_reg;
 	u32 cpr_value;
+	unsigned int fifo_size;
 	unsigned int quirks;
 	int (*setup)(struct uart_port *p);
 };
@@ -81,6 +89,7 @@ struct dw8250_data {
 	unsigned int		in_idle:1;
 
 	u8			no_int_count;
+	u8			rxtrig_bytes[UART_FCR_R_TRIG_MAX_STATE];
 };
 
 static inline struct dw8250_data *to_dw8250_data(struct dw8250_port_data *data)
@@ -652,6 +661,93 @@ static int dw8250_setup(struct uart_port *p)
 	return dw8250_setup_dma(p);
 }
 
+/* The trigger is the masked FCR receive trigger field, in register position */
+static unsigned int dw8250_sunxi_rxtrig_bytes(struct uart_port *p, unsigned int trigger)
+{
+	switch (trigger) {
+	case UART_FCR_TRIGGER_1:
+		return 1;
+	case UART_FCR_TRIGGER_4:
+		return p->fifosize / SUNXI_UART_RXTRIG_QUARTER_DIV;
+	case UART_FCR_TRIGGER_8:
+		return p->fifosize / SUNXI_UART_RXTRIG_HALF_DIV;
+	default:
+		return p->fifosize - SUNXI_UART_RXTRIG_FULL_MARGIN;
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
@@ -875,6 +971,13 @@ static const struct dw8250_platform_data dw8250_dw_apb = {
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
@@ -926,6 +1029,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
+	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },

-- 
2.53.0


