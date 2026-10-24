Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D99F606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 20:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oDEhPyLF;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OX+DZWao
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=quBdTCWmyLOutiiqlKg+zE0eUur6E5vFRS0ZQQJBF/Y=; b=oDEhPyLFdkUlLI
	FULu+AGf/mws3Re2QBNC0zlp1GaQAM4MiVnSxome0c8SWFa94PycdzRM+gbB5NaCKLueM4ogvNEhb
	RNk7CYgS1pOgxkfopd3IGklEB6WH0xkV94zuhKRAsdtpmV00DychgNLCwKmZgSySWdvEsZA5zeSeE
	fp1nopXsdlxtNtgXqZ6Phq1RNprUVuU/y93WIw241wTBkS6eJ/ZNz88ZLJ/uyyWyHP4QwflwySeuk
	0Ap7dCTfG3tfoQ3Y/HbERxJwM8ggoYTNTQeTe1OBDfuFhTygrx63KQD9zazmU3dEFbwHWW8GIhDJh
	mXw+kR+g6RjLcG9Hn65g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKiGK-00000000V5W-39iX;
	Sat, 24 Oct 2026 20:22:44 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKiGF-00000000V3G-1T2P
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 20:22:40 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-81ba09a5d23so2339261a34.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 13:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792873358; x=1793478158; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=quBdTCWmyLOutiiqlKg+zE0eUur6E5vFRS0ZQQJBF/Y=;
        b=OX+DZWaoH3VkxfJv8UgZ3LGqqSe59JXF6giiFx/KhaPbXCFynkv7hjG3JY8tnjhGoY
         bfExkawbGOKmF70y3o6I0QA9ni9WSaK2yAdwVeptFSbDUIAtW+3B8cFidLXEjQrMWepw
         T/VdLmXNRenzehtm5fUN6uth4hUicmRljj9ICy97ys8exyc79JGvlUOTGckX/Pqk2nhO
         CD8vnWgrvmDCJeY0iK5xhot0LWeygaoC06M4t9/PrfA3KszssA9WTiBGBW9kEq8HjEcj
         d4tky/T/HYRfnbnnTgvfXehTkH6HTZANqhhMEjVJBS3r+U8+4z+E+enwdZi5rExMe9uY
         pYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792873358; x=1793478158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=quBdTCWmyLOutiiqlKg+zE0eUur6E5vFRS0ZQQJBF/Y=;
        b=beRlA13qIQPuPVexgeRYnF2ZgL83TChJnMDGfF7p7Qb4q4wMe9ncrbzoWJjiyeYS9x
         mznVxdoYK70gcnwYBK3dMypgbO07GihH0Hlqks6CbMWUVCmN1/J3TstxUvng3JBNCcz8
         GRhx0eOuXpCtTsy+c1wGJcWUl/PYqlKckatNwZo+3ZnaTKbfm+cGrZ2tWwk+ep3icWk2
         Kj28qNYTC/B+D92ZKwLDv/gX9/7ojHsgcDRlOleiMXNqDLOnkvWfg7JAcAPEjgWhjcTD
         lLGBcv0IbKFXNkQMJqDpeiIiyl0ityoY+EABzZzMR+f6XNfk2i2rlmx8Xv58IdA2uxJP
         Jbrw==
X-Forwarded-Encrypted: i=1; AKwUvBzev+gHq+NtWB5wmLzbmdZpTpCWIfJS2soUbY70LqiWxQRbKt3G7WHFCkPlY6VtkymsVlgVuWM7jMAAADndXOMM@lists.infradead.org
X-Gm-Message-State: AFq9FYKW4Im6fHriDZXbZZSOzOO8pbknZtQUX3FyND6nb+mYP5wjLTiR
	8xUZi1uuGO5h2MPjc7LlrhO75kacAKt9twnxOo0YnMcYAjRx+N6P7piv93X+Mz4d
X-Gm-Gg: AYBFou3Lc71dxYWrPYBM6a/FJQeuPNAoGDQjUSmVMeoIOIFnNNpnB6hAJrC0Gt2tB7k
	V/gTA34twdizmICBvHB2Q7i+DpGffcA+i9rh4bFkB58GC7uNjGs2tMJ4XaF0ydvFuMqQsZGJ92/
	4Rd9jvCBnr5txTHD3VnLzW1dDemauEDEoSRJQMGUJMgil30gbiEmP7MnMFe1U5516lU5I0P8nhA
	7ZuGhza5dha+TKQZD24cBzI4JGHlhliF/RpQ6kwNxNahFgpzeiajQ2GM/XL2JuuiLfzG4ttLXKy
	6s8d2mymr4tTVia5rdaB+V89PGeUyNIwv0rG99Ouzlycl5GHe18epS/qFPLebt37ucFyHwgc0lT
	UrIygoT2UnlsVFW9j97Clr6bXYZFroRfwOIuVpjd6Pkk7ETiJXgA+lZr6sRghJqwZ2VMKH6OiSr
	sqIveCYDgJ/Vi4RGwuPRexU0wcFFuU7/GVKqzdiHb8yWK5pTjqh2q50TFeLthOmyaxkoTfcq6Wh
	YqGu2cVWBcXpary+bXvRKCHnoR9nkxlGAGfITtinxvRN5ISTT4zOIY5+y+LVx/WbNes469EECoi
	S+lOZ29ounVZ8ubZsDOW8W9mhLYzC2NlTfAbSk6GHrILLdWpJOAzOB6BiNyPNy58V3JF8wQAWRV
	wX7I50EVunNocRyxIucv5cbA0fIwl48hNkAzK/p4XoAOuDozCOh34r8DezA+YUSBz7DMkrsa8gM
	MOCi5DZX63vRxbONegggCtO5b2
X-Received: by 2002:a05:6808:1982:b0:4f4:3790:65fd with SMTP id 5614622812f47-55c002b7e97mr1918256b6e.29.1792873358250;
        Sat, 24 Oct 2026 13:22:38 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c0424775dsm1815063b6e.5.2026.10.24.13.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:22:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 24 Oct 2026 14:22:25 -0600
Subject: [PATCH v3 3/4] serial: 8250_dw: configure the Allwinner H616 UART
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-submit-h616-uart-fifo-v1-v3-3-286fc1b8c3c1@gmail.com>
References: <20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com>
In-Reply-To: <20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com>
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
X-CRM114-CacheID: sfid-20261024_132239_408892_AB5C1A4F 
X-CRM114-Status: GOOD (  19.70  )
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

Keep PORT_16550A and preserve the FIFO size read from firmware by
uart_read_port_properties(). Use it for the transmit load and derive the
receive thresholds from the documented 1-byte, quarter-full, half-full
and FIFO-depth-minus-two mapping. On H616 these are 1, 64, 128 and 254
bytes; the normal 16550A half-full FCR setting selects 128 bytes.

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
 drivers/tty/serial/8250/8250_dw.c | 75 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 9c171c5775a6..557832254c37 100644
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
@@ -648,6 +649,73 @@ static void dw8250_setup(struct uart_port *p)
 	dw8250_setup_dma(p);
 }
 
+static unsigned int dw8250_sunxi_rxtrig_bytes(struct uart_port *p, unsigned int trigger)
+{
+	switch (trigger) {
+	case 0:
+		return 1;
+	case 1:
+		return p->fifosize / 4;
+	case 2:
+		return p->fifosize / 2;
+	default:
+		return p->fifosize - 2;
+	}
+}
+
+static int dw8250_sunxi_get_rxtrig(struct uart_port *p)
+{
+	struct uart_8250_port *up = up_to_u8250p(p);
+
+	guard(uart_port_lock_irqsave)(p);
+
+	return dw8250_sunxi_rxtrig_bytes(p, UART_FCR_R_TRIG_BITS(up->fcr));
+}
+
+static int dw8250_sunxi_set_rxtrig(struct uart_port *p, unsigned char bytes)
+{
+	struct uart_8250_port *up = up_to_u8250p(p);
+	unsigned int i;
+	int ret;
+
+	/* Use the nearest lower threshold, as the generic 8250 implementation does. */
+	for (i = 1; i < UART_FCR_R_TRIG_MAX_STATE; i++)
+		if (bytes < dw8250_sunxi_rxtrig_bytes(p, i))
+			break;
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
+	up->fcr |= (i - 1) << UART_FCR_R_TRIG_SHIFT;
+	/* Changing the trigger alone preserves the FIFO contents. */
+	serial_port_out(p, UART_FCR, up->fcr);
+
+	return 0;
+}
+
+static void dw8250_h616_setup(struct uart_port *p)
+{
+	struct uart_8250_port *up = up_to_u8250p(p);
+
+	p->type = PORT_16550A;
+	p->flags |= UPF_FIXED_TYPE;
+	up->tx_loadsz = p->fifosize;
+	up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_AFE;
+	p->get_rxtrig = dw8250_sunxi_get_rxtrig;
+	p->set_rxtrig = dw8250_sunxi_set_rxtrig;
+	p->rs485_config = serial8250_em485_config;
+	p->rs485_supported = serial8250_em485_supported;
+	up->rs485_start_tx = serial8250_em485_start_tx;
+	up->rs485_stop_tx = serial8250_em485_stop_tx;
+}
+
 static int dw8250_probe(struct platform_device *pdev)
 {
 	struct uart_8250_port uart = {}, *up = &uart;
@@ -870,6 +938,12 @@ static const struct dw8250_platform_data dw8250_dw_apb = {
 	.setup = dw8250_setup,
 };
 
+static const struct dw8250_platform_data dw8250_h616_data = {
+	.usr_reg = DW_UART_USR,
+	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
+	.setup = dw8250_h616_setup,
+};
+
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
 	.quirks = DW_UART_QUIRK_OCTEON,
@@ -931,6 +1005,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
+	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },

-- 
2.53.0


