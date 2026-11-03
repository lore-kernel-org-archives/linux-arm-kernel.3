Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0C4606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 21:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v/s22E5y;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=esw4YJqI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JhZegKXTLoM0aFpusHdkE4137WJUIfV1PRTu3QP4cf8=; b=v/s22E5yPuwdQP
	D9l1Zi4v2jBGjPmsEmHGqCCukpquzVl/b3AeqZ+Hd8xUa8XFuqF/j2SlNmq+x0lBuvBIiLllehUVl
	fNh0rYfTswadyFE60PKjxj2ndqmSb7fPrSY/sQgNh4YAkFZJ514gKOhIIbbHyakQJBkrfxEPDIG2f
	REnBY9fUHG6z+PNcUpxbTN39wFna8JZdMK/nBVr//hduh3DpcKFbTndLbrVpEulXXm/vCdXDg5g2c
	EnOzdgkDDeWXaRyclzVAdke22lfzXgbAyMwVi7e2r2HzGecWEfEkzG8KIvH8bTMF6ao9/VIc86Dyg
	ZegqLiDapvK7J9dmt16A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMEp-00000003jVL-3zVz;
	Tue, 03 Nov 2026 21:40:15 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMEn-00000003jRL-2Ht9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 21:40:14 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-483d290f398so83233fac.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 13:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742012; x=1794346812; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JhZegKXTLoM0aFpusHdkE4137WJUIfV1PRTu3QP4cf8=;
        b=esw4YJqIJoHS97UnLg6eYtqnpoogiScY4nuRlJjBcxmxtnaMcHJU0yfj9PoMQm0syp
         +/X8hSJVBrhYfaQzoVF45scefrMG6yUgnbgQM7QN3JJa71Zmumea5RgBFqteX7RG4maY
         ZI+XjXMxl8rcDE6OtPRY8OCPGP05nWIXYtSjTrGWx3XiLeimbV6FI7MXJ/XTobc1mXps
         wn0k/EzOhx0pmR8TmTFvWV7XUscxOeIQzpG8xUea0LI8hfEWDjZgAyAXwzaCD50D95yq
         ZCqyHzFKJMwpCysu99f1TimII8Jzganr1Tabbj4l95lvs2CuZxmCAXNDMzT0AexUWpc0
         S3mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742012; x=1794346812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JhZegKXTLoM0aFpusHdkE4137WJUIfV1PRTu3QP4cf8=;
        b=HkZtuW94YJbD6qt9y4NVpfKwmn9uVUie4kaMjyh5VQNktdbSF4pegN4r+Z85luOwMg
         rqTkIynoegixDk6EttuKJtciIbJZrCV/fe2T9mKYbLEMy90c+oSxoNcEmBM7fQ2Vbzyu
         AY+CO6taLMFy5nY4b8ZFV/Dcp7bHqhDU/TDymt21DIaEE/JiODwq+COTclOl61PdlTc3
         WxXsoDkWP2FYBEwRsMtJh4o5y9XwErSl9tiYevuqNkrItgKcrgg5YOPzGodoSXwnCb0h
         SDrXokFuxC43haXORm8Yf/zRH73MycQ/fdVolN2dEJw8rOT7YSTMk5SfOKaG98h0Vnp+
         DKlg==
X-Forwarded-Encrypted: i=1; AKwUvBysm9FFL4zBzKII8tKMH4PbMb8O60/FQdEdnoIzfMBl3xiuKp/jTltBtNqc3l7RcBoCUbM4eMMNAHfR7jVPUKn2@lists.infradead.org
X-Gm-Message-State: APuU4Z9rRCDs/4volzSXe0DJzX5shuvrTzka2yO9znXk543Ng4e4LlZq
	4peEgVENYxxKaSbs53jbWQSJkwI8zi0nI7Db9bR7IYtItpfxxMTgHOf5
X-Gm-Gg: AYBFou0Eb1NE/iUHwAEro+qzjRyTtdBM19Rj5uJrfDfIRYNUBHoPyp4scDk04v/kBMW
	oU3ymRTAyJVitXlObkUyEj89EOyoG/KmKnEBw/gfv2vkBwJh/dI9ozifO3+L+byRKmwqj03sf7B
	r5yK3R85GPM6pxcNoyH4D2eyl6WvdbPwSkiq9IsDSqEUS07+s4ZR1PNNtlkBNS2iH0LmmzZ5NoJ
	ZCpqqruODrU5654UV4shLRZ0cCT1KpvPT7ymp9oORoOThXdh0C6T9DDJjUvH3BkkB+cDYAELu6r
	JT7Gf0U+DJ55iz7e6gWWil+sCvCh6nln1GMkh1JkhvzZxT4++Zh58+E3bBYdwzKUhcIgAwPrI2b
	IMdshoqvSLXsd+9BB7BsYE4vajYaSvtK9DDymNEZOmnx4RtEElwp9BhsIv9GNopAzBuh8XLRRd5
	7/bxTveDn+w5xwp6JcFXcIUHG1S1dwpjRrUKGuBB2zlA7H3uxyW5OWOdGC7Ww7QLPHlP6g2kbAu
	Un8nK0wySp9v+rPs2bloXu29B+eQ2gMLM2RcMx+wSGVDiAj+7vrfxGOnlCt80MgF4bwbuO5ah/Z
	CQ9H/JxADMmA+DOdxZjkCxGuw5MUEBOFxqhjcsL7j5enN35BKA1YnAEoDMowDsGmyqYSVcjExAH
	haEfEZeNPiWfxSs6tIo1KREDMJ2AHi80R27lregl2vQfRXsckkLe1WyicQLdJY/gbCSdxvCLYtF
	E61e9SOD2hhyQ7cfsHA4N8kag8Ug5WCUJDTI7dOMfmdKd0qIBZXk4X
X-Received: by 2002:a05:6808:191f:b0:4f4:3790:6615 with SMTP id 5614622812f47-5640deea416mr11125036b6e.11.1793742012357;
        Tue, 03 Nov 2026 13:40:12 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm27060b6e.11.2026.11.03.13.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:40:11 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 14:40:00 -0700
Subject: [PATCH v7 07/12] serial: 8250_dw: configure the Allwinner H616
 UART
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-submit-h616-uart-fifo-v1-v7-7-c9e248d685c1@gmail.com>
References: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
In-Reply-To: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
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
X-CRM114-CacheID: sfid-20261103_134013_611878_87BEA6F2 
X-CRM114-Status: GOOD (  17.10  )
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

Keep PORT_16550A and supply the fixed FIFO depth through platform data.
The 8250 core derives the transmit load from that depth. Use the shared
DesignWare receive-trigger setup to describe the 1, 64, 128 and 254-byte
thresholds, with the normal half-full FCR setting selecting 128 bytes.

Advertise automatic flow control so CRTSCTS enables MCR.AFCE, matching the
DesignWare termios path for hardware CTS handling.

Select this configuration through the platform setup callback. H616
has debug-divisor and RS485 control registers overlapping the optional
DesignWare feature probes. Use the fixed configuration with BUSY-safe
integer divisor programming and software RS485 handling.

Keep the UART clock enabled during termios changes with SKIP_SET_RATE.
Its clock is a gate on the shared APB2 source rather than an independent
baud-rate generator.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 613907b8a40f..0e7367ba872e 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -63,6 +63,7 @@
 struct dw8250_platform_data {
 	u8 usr_reg;
 	u32 cpr_value;
+	unsigned int fifo_size;
 	unsigned int quirks;
 	int (*setup)(struct uart_port *p);
 };
@@ -657,6 +658,30 @@ static int dw8250_setup(struct uart_port *p)
 	return dw8250_setup_dma(p);
 }
 
+static int dw8250_sunxi_setup(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+	struct uart_8250_port *up = up_to_u8250p(p);
+	int ret;
+
+	p->type = PORT_16550A;
+	p->flags |= UPF_FIXED_TYPE;
+	p->fifosize = data->pdata->fifo_size;
+	up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_AFE;
+
+	ret = dw8250_setup_rxtrig(p);
+	if (ret)
+		return ret;
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
@@ -880,6 +905,13 @@ static const struct dw8250_platform_data dw8250_dw_apb = {
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
@@ -931,6 +963,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
+	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },

-- 
2.53.0


