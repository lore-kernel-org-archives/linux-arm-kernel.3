Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3897C606A329
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 18:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x2AIs4+9;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gCKBpEyY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XiQ0h5RUDVFXY9TV9nlMQOKan7K7h2eTMSJt9GdccNU=; b=x2AIs4+9VsRj4P
	BCvApK/DeGoUDDglNVSknfpWIJC3BERKdMAW3ob83qJNV5CWi2iMxDcca8rj0gnhAMIa63HO/iI4I
	EBQafGCyGlMVXqcQKMS5gTxqOjVU886oupwgH39xtzIuz0oZsDQ7WswxEILZqpM1SrwIS85ceray8
	nppAckgb8ra4xpQsMdfMud2LXf7VRIbmLnNR8Lop0+D5z/OKfJWChSKURwDy9aD4IkXudvIaTbUNr
	07c1QYglxeLhm71PuO7RfWj4QiSPlvyG3xfOGJL/Ocy/VCh9awOjHc7PMVuyJbKgiTZp+jowrIf6+
	BPxyEb2flDDs6f5ES5Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVAE-0000000AAC1-08zR;
	Thu, 29 Oct 2026 18:47:50 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVA5-0000000AA68-438n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 18:47:43 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-6df5e315bd1so1815841eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 11:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793299660; x=1793904460; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XiQ0h5RUDVFXY9TV9nlMQOKan7K7h2eTMSJt9GdccNU=;
        b=gCKBpEyYNbX2YWDo3AnnZEloNrYoHStZylyO70cxt2a5nwWm/BkZSuZpeOitZJGNxN
         LVVdXk2Ysnc9rd0GlVBck+XaUhoHDtMZCiJAjYxb/79CfoBixNumbUYkG5v0xnyPURWi
         tbVJ2Jy0R+Rg+izgbs8tIxtFB56frjBTjOKMgMIvoHQOexx1TPUmmuoJa3o2NXOV+ulN
         JojeAmlt5Ob621TT+EkgSyNBPnuiPByPo8rx8MdqqT4AamUTCdDraloVxy0fE1xZcmoN
         lFb1gL/qEs8XMW7wFJDBegf119dc7iyzoP8D+cIFoZhGEVjUIwqWI91I7w5gAnfEPdky
         GMzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299660; x=1793904460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XiQ0h5RUDVFXY9TV9nlMQOKan7K7h2eTMSJt9GdccNU=;
        b=sazzs065O0nB/rOWdDt2vMd8/5gWFezr2p+6F1vw7GOW8p5rYZIVo/024RGrOHD9Jm
         jSxbQ90nAeuXzbNBWftAt1DVQjajgOH5EHVbzRSZpmB6HqeUoUL8vw5Zgco7v6ekizxy
         Mbxl/WYEi/WAP/q2+sqooOtVraLjDxhJOD6g+MkYNBuSnRl+nI4jXfEKEFeJcYimhSey
         Du9vitacS88Cvhgdbb/s05DVlRxjVpOTIc1W0AKFLd7/bWQtCw/wEOHObCQ6MH5EwEhM
         3LbBiDvbXMccexHrJoRqjh+nlnPo0W71mTc82TEwg3XFmQuQdH9xs5nzbPOUuyK/qf2f
         Z1og==
X-Forwarded-Encrypted: i=1; AKwUvBzZRNZ8fSRoi4wsl2Z68aLeIMlda+4ZFNwgk3mji3051HSopKzcrLhXtXoupex+OlQ3QNIFJDKhA9GRHoposWh1@lists.infradead.org
X-Gm-Message-State: AFq9FYIkjI+zdHltJ1pX+J278hPLTFWX8iDyPnmzsxfM3XK2CI2wS+UT
	KozeQ/yTTCxmJhb9mAC1ADQaA7W7KoHAUPMuZNVNLC/Vx3TMr4sZGLMe
X-Gm-Gg: AYBFou00loctd4EvBb710o3undMhndtRmsrOGdAhMTdtBImseJoJieQ570rxYT0UmWL
	3tlCKDgZlGGvT3jsFLIF1Brn9LTGlJ0XpoQCUc33KqYo/QS2hxiUXXtx5pSPbpaf05R7dHXt/AW
	d2/ZvyHguWb2sw7e3UUUr/qHrAQ6uriv5ryQfQAljZ2nUiFFKKG7EVMByqijDWn0Q/Kk7lmA8D4
	ttdC5jf5nfiPKhRTcODlzfKhAETMHn2YD0n74QN/HJJr1xd3eS1VvdjNBXGGqB8GEtKKi/M9VXN
	UNtipZSV0xNJ9jF7MQjl//RWFbzbgCoXm2zM1iq/3cefGcpTbkl4dOdBtmFzlTttQWy7TG9E366
	xrPRlOIwrQvj7Ekoa9HQwJHaWf358ViXYkYjqM5zxmBZ++lUm9HjWGksv1WaThPM5kX+QH4BDf0
	cxtCmJ6H7Zq+An+LLDAW3Dr9CbKzCPuins18xSI73y2+c6t0NuXs2tQILYFkz5AlTuKfotJrU1a
	4zliiWLpp3ZCYB0TVGBhtC8zxxgB2fDZoFRDQfRyDZdzEAvS+MzxX4tL9aI/KKb0rpe0gCX+g8d
	qy2NkID5Kdd+22DhiT0BUTzHA15s1ZH6TwWSnFzGoXOwnmX3fghs9K4TK92AREngYefsmj28X56
	niRRRAO/MDSjIM2MpVHIaldWyurzUkJ/tUUsSdSgjeDbbcY8w3oaeg0zEwu187jXzgiIm3Hz5Uw
	CRLpZXTLussPVKKopow0ypcDvLibO7MLS0ryGAN5XGUFfP7KegKo8=
X-Received: by 2002:a05:6820:a65c:10b0:6e2:3d8b:a01c with SMTP id 006d021491bc7-714f24006f7mr112598eaf.19.1793299660372;
        Thu, 29 Oct 2026 11:47:40 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm221871a34.14.2026.10.29.11.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:47:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 12:47:28 -0600
Subject: [PATCH v5 7/8] serial: 8250_dw: discover Allwinner A523 FIFO
 depths through FCC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-submit-h616-uart-fifo-v1-v5-7-53b433aebbf8@gmail.com>
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
X-CRM114-CacheID: sfid-20261029_114742_022501_89A0B047 
X-CRM114-Status: GOOD (  17.67  )
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

The A523 UART integration, also used by A527 and T527, has 64-byte FIFOs
on UART0 and 128-byte FIFOs on UART1 through UART7. Each controller reports
its TX/RX FIFO depth in bits 31:8 of the FIFO Clock Control register at
offset 0xf0. The field holds a byte count, not a logarithmic encoding.

Read this field in the sunxi setup callback when platform data does not
provide a fixed FIFO size. A fixed size takes precedence, so H616 retains
its 256-byte configuration without accessing FCC. The probe has already
enabled the clocks and deasserted reset before invoking the callback.
Leave the FIFO clock-control bits untouched.

Validate the depth before generating the RX trigger table or setting the
transmit load. The quarter-full threshold must be positive and the
FIFO-depth-minus-two threshold must fit in the byte-sized table and RX
trigger API. Report an invalid depth and fail probe instead of generating
zero or truncated thresholds.

Select this setup for the A523 compatible. Derive the transmit load and
RX threshold table from the discovered depth using the common sunxi
helpers. This handles the different FIFO sizes with one compatible and
one receive-trigger mapping.

Like H616, this integration has Allwinner-specific debug-divisor and
RS485 registers overlapping the generic DesignWare feature probes. Use
the common sunxi PIO setup, BUSY-safe integer divisor programming and
software RS485 handling. Keep the APB clock gate enabled during termios
updates with SKIP_SET_RATE.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 3bc6735fc253..2ab91f479fc6 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -17,6 +17,7 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/io.h>
+#include <linux/limits.h>
 #include <linux/lockdep.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -45,6 +46,10 @@
 #define RZN1_UART_xDMACR_8_WORD_BURST	(2 << 1)
 #define RZN1_UART_xDMACR_BLK_SZ(x)	((x) << 3)
 
+/* Allwinner FIFO Clock Control register */
+#define SUNXI_UART_FCC			0xf0
+#define SUNXI_UART_FCC_FIFO_DEPTH		GENMASK(31, 8)
+
 /* Quirks */
 #define DW_UART_QUIRK_OCTEON		BIT(0)
 #define DW_UART_QUIRK_ARMADA_38X	BIT(1)
@@ -64,6 +69,7 @@
 struct dw8250_platform_data {
 	u8 usr_reg;
 	u32 cpr_value;
+	/* Fixed sunxi FIFO depth; zero selects discovery through FCC */
 	unsigned int fifo_size;
 	unsigned int quirks;
 	int (*setup)(struct uart_port *p);
@@ -729,6 +735,16 @@ static int dw8250_sunxi_setup(struct uart_port *p)
 	p->type = PORT_16550A;
 	p->flags |= UPF_FIXED_TYPE;
 	p->fifosize = data->pdata->fifo_size;
+	if (!p->fifosize) {
+		u32 fcc = dw8250_readl_ext(p, SUNXI_UART_FCC);
+
+		p->fifosize = FIELD_GET(SUNXI_UART_FCC_FIFO_DEPTH, fcc);
+	}
+	/* The RX trigger table must contain positive, byte-sized thresholds */
+	if (p->fifosize < 4 || p->fifosize - 2 > U8_MAX)
+		return dev_err_probe(p->dev, -EINVAL,
+				     "invalid FIFO size %u\n", p->fifosize);
+
 	up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_AFE;
 
 	dw8250_sunxi_setup_rxtrig(p);
@@ -972,6 +988,12 @@ static const struct dw8250_platform_data dw8250_h616_data = {
 	.setup = dw8250_sunxi_setup,
 };
 
+static const struct dw8250_platform_data dw8250_a523_data = {
+	.usr_reg = DW_UART_USR,
+	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
+	.setup = dw8250_sunxi_setup,
+};
+
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
 	.quirks = DW_UART_QUIRK_OCTEON,
@@ -1024,6 +1046,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
 	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
+	{ .compatible = "allwinner,sun55i-a523-uart", .data = &dw8250_a523_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },

-- 
2.53.0


