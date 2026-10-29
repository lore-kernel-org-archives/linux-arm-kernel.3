Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC48860A261A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 18:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Myi4prne;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F1+p8jC7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LR/0qFuwxt+mPuiN/gLTEtrR/SgllBRn6v2o0ijhbhk=; b=Myi4prneS+yY8o
	BvSb29vPyNfHeT6p7E+1qYuiVG4p9k5Vyz9PkTsQ8M2GpUzprkxrTDr0qi6enHaY5/FNDB6N+Mb8H
	cBUuPmLdDkbyOqIpgLC8mYL8/6uR/AcIho0zn+d5Jovgj1SVl84w4/b9dCOsaRZMdAQWe8Zsr5mzJ
	kGppk+yyoAhweSqaYPPIrCA5A5tEA7rQk+8QwR8WS5s1KIOpZQBVRZcdcOOHEhIotXPwovPb80edP
	5J/vxxdgvg3dupX3RFplr9RDWOm2HDZHAWBeqcg0i/hpkhKteEewCRH1aJh0Kf+nHTOg2DgVLlCU4
	Rhfn2p77u1cy9ySadqgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVA1-0000000AA3i-01pS;
	Thu, 29 Oct 2026 18:47:37 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMV9z-0000000AA2C-0qY0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 18:47:36 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-84d5e56f876so1750645a34.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 11:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793299653; x=1793904453; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LR/0qFuwxt+mPuiN/gLTEtrR/SgllBRn6v2o0ijhbhk=;
        b=F1+p8jC7mmj3DNl7fkuhgJdPtz2YBJnxv65cxQre8cq/PBAlTjF9P+V3losneLrBMG
         Ky6SsXVNvdsuhR98TfpAUR0qLjDrTHxrtk2EybTZ1E1ZyYSLJOFa7bOfEykfbj1si6cA
         2dP3lX/Dfi8rXlbyXzVwPuC8QD1vkdaUPbV+VSND0mDqVWcO8ppWeF9LnoGyVvW4RCGQ
         FGxs7sD02EYLVaW+b1leyiX6HgGEELtJ7VXqnpJ8pex8CIpmZIlFA7rUGwm8H97S3FSU
         ufLGAiohVftcx+WMJpYkn2uM0pHYWmnk003uxGjLNOMpphkzxnEsfIZqFjrEjRZ3o++V
         SooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299653; x=1793904453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LR/0qFuwxt+mPuiN/gLTEtrR/SgllBRn6v2o0ijhbhk=;
        b=AJ71uLW+NkggEc0ZInq+mvVVvUu42wlEcYupC/W0AHsq2fQB+vk/2gGWjvyzvZsLnY
         k3YiSc6aebkugmyBKBMJ31OiCwm/eN9UAPpI4BsWRfV2umjoZyMTj9vyvwtePzw31MlN
         BjkYcoJs7dSNcuoCzG6zprJdfaIQY7Fas2Y4OMqMELiRaWWcfv+6snUL1RVaekb2GhZh
         ZR5wlNuYIpmRaSdCG6SzEJ2wWDY0Yt+KCrfEovw5UVhm3Z+dQ6rwW0MGRocrfMtC+WcJ
         4J5GputUc1vaX0sjGe3W9muxVs/6mCk49mS+nItymaUfShAbrUxtU61jlORSZ4FZDXhj
         IBHw==
X-Forwarded-Encrypted: i=1; AKwUvBxO89N9GXCB38mIlJVGFga+58ihi6frz1qWiYRMIaoR+uA0buBYzWOkG3lqZ+abXmqK/5WMQhfSxKqmPhBrUlgN@lists.infradead.org
X-Gm-Message-State: AFq9FYJN15CpaD+l2QSMhergy16TsvPwVOLCdhRg1MG0AkacbCNxHwo/
	yJii+Az5ZEsfoxUm61AZnYRCs0bxRjoK2k0C3QoIRuRyiHSw0ilJZMXt
X-Gm-Gg: AYBFou0qqSXBeegQ6CNLv8fqmShY/8c7x9mtHij7rzeK2kXEh9xWS+Vc4Rz0JPQcUU9
	5iY8zQMwqg8u/LHZnqoqwS2ixPqpCpIkeWsDxzyPU63vsdpt+9SUUZjS8CNF9jP39il3DysENXE
	C7X22Lr8gdyOfwpmRAGtxLxQex24/nlSeexPf6VHYmXm3d3Z9j+C9XVJzXq/Ss0pv/tDQFXccai
	alUeMJwF0VHwms3HsW8wf5FtoA8p0/uzaDXjjo40mR8ntVNeY62TyRFfHvIs+5Z28vBgM82JlYp
	DtU7z4vfPio5jxb5RaLkkG2SNueAXpk++//JhipCZsfMK0Hb+dhEM1XlCAimvevrNUfZU/rN4rv
	ywEPC0fZOZNs03120Kx+7p42M+ojX02laKD1iT64gdrCcSGqDkGPPzVKN7NtCLqjMkpWTTziYY2
	0TaqWRJAiCNiAeuQMzYA+udHkN/ycUJUW7ty3Dijif3bcb/CkHS+lTOYCo91VtN5742ifD23tGY
	zfp4P/xUq3rBTQLCo0ht9HlE3+R/bp2UszXGRLBt7XhJ+869WKpAdzsbdZDIsUAhjsCF6CNwDN1
	utI/Hw31i2mEi4a3VijdDHIzLOtuLvGBqWDX/GLD70ZqVKI5XZDvNc1ZUohZutuTMAXBqtkxWsK
	C8QCDGiZWQaoqbclncEbE1KLGPW3m8RfQHCPBibvaqOpPN3ecQBTvIyL8lNt8lFQWOh3lp5Bn/u
	CL48Wd8WcGT1Yspgx0xFaKlH3JUa6m6kBsUfZKryXe/Wuzkya8bnE=
X-Received: by 2002:a05:6830:43a6:b0:821:a0a4:5016 with SMTP id 46e09a7af769-85d364068famr49875a34.18.1793299653520;
        Thu, 29 Oct 2026 11:47:33 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm221871a34.14.2026.10.29.11.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:47:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 12:47:22 -0600
Subject: [PATCH v5 1/8] serial: 8250_dw: select port setup through platform
 data
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-submit-h616-uart-fifo-v1-v5-1-53b433aebbf8@gmail.com>
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
X-CRM114-CacheID: sfid-20261029_114735_257842_E52A35E9 
X-CRM114-Status: GOOD (  19.46  )
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

Select feature discovery and DMA attachment through a platform-data setup
callback. The generic callback probes the optional registers and attaches
DMA when a FIFO size is available. Integrations with a fixed configuration
can supply their own setup before the port is registered. Allow setup to
return an error so integrations can reject invalid configuration before
registration.

Replace skip_autocfg with the Octeon setup selection. Octeon is a 64-bit
platform and continues to skip optional-register probing while retaining
its DMA setup. Select the DMA setup helper directly for this integration.
Keep generic setup for devices without matched platform data as well.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 41 ++++++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 11 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 9cbe076463e0..a546cf2de7b6 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -64,6 +64,7 @@ struct dw8250_platform_data {
 	u8 usr_reg;
 	u32 cpr_value;
 	unsigned int quirks;
+	int (*setup)(struct uart_port *p);
 };
 
 struct dw8250_data {
@@ -76,7 +77,6 @@ struct dw8250_data {
 	struct clk		*pclk;
 	struct reset_control	*rst;
 
-	unsigned int		skip_autocfg:1;
 	unsigned int		uart_16550_compatible:1;
 	unsigned int		in_idle:1;
 
@@ -596,7 +596,6 @@ static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
 		p->serial_out = dw8250_serial_outq;
 		p->flags = UPF_SKIP_TEST | UPF_SHARE_IRQ | UPF_FIXED_TYPE;
 		p->type = PORT_OCTEON;
-		data->skip_autocfg = true;
 	}
 #endif
 
@@ -631,6 +630,28 @@ static void dw8250_shutdown(struct uart_port *port)
 	d->no_int_count = 0;
 }
 
+static int dw8250_setup_dma(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+	struct uart_8250_port *up = up_to_u8250p(p);
+
+	/* DMA setup requires a FIFO */
+	if (!p->fifosize)
+		return 0;
+
+	data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
+	data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
+	up->dma = &data->data.dma;
+
+	return 0;
+}
+
+static int dw8250_setup(struct uart_port *p)
+{
+	dw8250_setup_port(p);
+	return dw8250_setup_dma(p);
+}
+
 static int dw8250_probe(struct platform_device *pdev)
 {
 	struct uart_8250_port uart = {}, *up = &uart;
@@ -765,19 +786,16 @@ static int dw8250_probe(struct platform_device *pdev)
 
 	dw8250_setup_dma_filter(p, data);
 
-	if (!data->skip_autocfg)
-		dw8250_setup_port(p);
+	if (data->pdata && data->pdata->setup)
+		err = data->pdata->setup(p);
+	else
+		err = dw8250_setup(p);
+	if (err)
+		return err;
 
 	/* Use the BUSY-safe sequence for both integer and fractional divisors. */
 	p->set_divisor = dw8250_set_divisor;
 
-	/* If we have a valid fifosize, try hooking up DMA */
-	if (p->fifosize) {
-		data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
-		data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
-		up->dma = &data->data.dma;
-	}
-
 	data->data.uport = serial8250_register_8250_port(up);
 	if (IS_ERR(data->data.uport))
 		return PTR_ERR(data->data.uport);
@@ -860,6 +878,7 @@ static const struct dw8250_platform_data dw8250_dw_apb = {
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
 	.quirks = DW_UART_QUIRK_OCTEON,
+	.setup = dw8250_setup_dma,
 };
 
 static const struct dw8250_platform_data dw8250_armada_38x_data = {

-- 
2.53.0


