Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B77606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 23:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kDWwgtNL;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tRkNzm9t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AhsVd9Fsi+UcY/XjunpIc7bQ1eO+aEtcrlfgyGAcjFk=; b=kDWwgtNLPopjOt
	QO7GJniiKLc2uXl47nPsYWA8PkfxRY2yxV/9oqQ81oRbmrvH4aSx5gD/UdQPDyPGHlkrBkiM0D1dt
	x61JlL48SkjswOVVEYyzoIZ6q1zfbYvyqJEDR/lqaaO4S36PTEsoc3IXORmGaA4bwdm2sAzenMdXD
	Ap67t8afYjtYumo+NHGitAooaKr5dj22fU4D3rg2rQIeyOZxxEERvpXdFN1KRDbSVuob18oKc2YLf
	W9bOtcXpR5nyjdKOlosxw/D/ZFyvQUQ0OJDNEKojtt4APeOlArB9csFZenITTK933Q5NQemVaFYfN
	3L1yMJgEzZzOnm7UZOKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLqEs-00000005tVQ-22pN;
	Tue, 27 Oct 2026 23:05:54 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLqEm-00000005tSX-00nV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 23:05:49 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-847ac7ccd85so245881a34.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 16:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793142347; x=1793747147; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AhsVd9Fsi+UcY/XjunpIc7bQ1eO+aEtcrlfgyGAcjFk=;
        b=tRkNzm9t06n18nzAF9UwRfUEDEnEaX5ZEXnORlDwwhxu9dJnXheyH3Szf1rIlUB4wO
         8eASgxstlu8MP+7kTGQUzLbHrXrGh2r5NOeVPd08u487LvPntP7Xld+MM7a7ps2rEVhQ
         7evpnMYv+kqBQKRh+X62+cGihUUR8a6RwCGZgzKxO83OcuezfQ/QlK6Wu7K90DLIIZap
         dufus+FZ4f54VzXEY2ioXRPT/S/HXOtwFh/rTb42Ak6vp4mzbjro/1nox+6HcgQVGFwB
         U1ZA4PQWDCQzED0L0cjYaBpKEyskBZVxvBUiY0wTFOGp9wC5kZcs0uVPWO2im696nyle
         PUOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142347; x=1793747147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AhsVd9Fsi+UcY/XjunpIc7bQ1eO+aEtcrlfgyGAcjFk=;
        b=wL646iC7SwRyE3UdIlcq1DORMWCrTJFvkQSKYsKhCvaI980MdaxSlHnqExZsoqM6VE
         c6L1TWEGt8qMsNcWr+R0Ua9WioBcP/L4m186b3usQSWmtw06MIBb8SOj+EoL+l0oxFpd
         0yWb0A/XczraYYvIW0tfeEkkmED+yjSyflx/x970nVugUuJidS1b5XKkOcyPAWbTuvQ/
         hE1InYh7HLhZzmGwQz7MK9rMIuKNMZgOCa8Ac8R2aHKWfZJ+ILOHycOZULKK2c106pAq
         fmY2/XvP3djG5MJktadQF8MZi9BQY5v/lzRQC/nKz6yEwVy6xImQHeIizjJfebF/ZArt
         CO5A==
X-Forwarded-Encrypted: i=1; AKwUvBzLTKDpoCQG+muc7ErRa2YfOnaCYaswmCfhiZlL3Yw+ST4eXO/I7qQgy3Pfhwiq4Q5e59ZDPAvTi0/rinW3I0R2@lists.infradead.org
X-Gm-Message-State: AFq9FYIj7tiAhFfagh/aERbSaFMsoVKDJ6BhfFwYxkxJ4nuqjeqRO9GK
	xW9Z4KdYq1TDsVSN5XkJwVxm7ZFvkGXy+dTZSDb5KR3NNiRSxFBSzb/4
X-Gm-Gg: AYBFou197IQuSEf3RvXd5otsD0fMFQnpeKYLf24B80Raz5e/rqiqgrdB9yX6HQA2Hom
	JGQSWrvcwoUeRx4FZCM04cOQlCplyi+7tg5/jy+TSkli/ty/49vRLrR5sBRVvINRcbaFam1a7i3
	eKepGxZU2OIVv5J6AX4RkUTmrWCX1ZUb/yrQqumKOA/lMSjgQ7sxblAg3sKq4kz3aCsPe+1TXs1
	2yoeFwdFpnGEoTw9eZ98W77QEjJuodlHeW6R8KknXVHD5+mCQZg/LF2FgpCos+VgtMPnDa2IL2h
	8n4mT2iP6zg7SQ1omrH2A2sTh/FWuk93wGy+IsdOtmXHY3/L83XsovssqYECIHkwJO00Q61ihOT
	poq+3NSc+/j2wgOnnn3meylyV+hl9W8rRb+g+sCp4SFqhE66capixIN1BCe0LmJcbN97pCleuV4
	LSLKpsKFGPuLaB33gBO+zH7EkxVuOoU2wrF+gBcuOwqD0GsWYh/GUfBK1+Hhx4oipbZ0UCO7X/O
	RQRhn+kLKU11r9YMgQvArmbHxqlL6aOWafiDfSefAkMALGCnI0aXBJHFHsyehONMijdjnaW6oQi
	hDPSmOJytwqUx+ZsvoU1s3zUBgV4ziX8EOq9pVzIGtWMLF3i3nc0RinkdBRAnwJY/lifzC+XyMi
	rjQuKN88TbU1kgGhOTY+oc5YWDFZ6C3IgJ9LucA0wb75GD2EO33h55NoKUUfrRe7n5CXz7sE448
	YlrQ==
X-Received: by 2002:a05:6820:3385:20b0:713:da3b:901d with SMTP id 006d021491bc7-713f21629bfmr243308eaf.79.1793142346826;
        Tue, 27 Oct 2026 16:05:46 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb0741c9sm12093328a34.10.2026.10.27.16.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:05:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 Oct 2026 17:05:30 -0600
Subject: [PATCH v4 2/5] serial: 8250: share the RX trigger conversion
 helper
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-submit-h616-uart-fifo-v1-v4-2-d37e018fd0a6@gmail.com>
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
X-CRM114-CacheID: sfid-20261027_160548_051526_970E7966 
X-CRM114-Status: GOOD (  17.23  )
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

Extract the receive-trigger threshold search into serial8250_bytes_to_fcr()
so drivers with per-port threshold tables can use the same conversion as
the generic 8250 implementation.

Include the unsupported-table check in the helper and preserve the existing
nearest-lower selection and highest-encoding fallback.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250.h      | 16 ++++++++++++++++
 drivers/tty/serial/8250/8250_port.c | 12 +-----------
 2 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index 21ed9c41b751..195ed58a2231 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -8,6 +8,7 @@
  */
 
 #include <linux/bits.h>
+#include <linux/errno.h>
 #include <linux/serial_8250.h>
 #include <linux/serial_core.h>
 #include <linux/dmaengine.h>
@@ -73,6 +74,21 @@ struct serial8250_config {
 	unsigned int	flags;
 };
 
+static inline int serial8250_bytes_to_fcr(const unsigned char *rxtrig_bytes,
+					  unsigned char bytes)
+{
+	if (!rxtrig_bytes[UART_FCR_R_TRIG_BITS(UART_FCR_R_TRIG_00)])
+		return -EOPNOTSUPP;
+
+	for (unsigned int i = 1; i < UART_FCR_R_TRIG_MAX_STATE; i++) {
+		if (bytes < rxtrig_bytes[i])
+			/* Use the nearest lower value */
+			return (i - 1) << UART_FCR_R_TRIG_SHIFT;
+	}
+
+	return UART_FCR_R_TRIG_11;
+}
+
 enum uart_port_type {
 	/* Internal 8250 only */
 	UART_PORT_AIROHA		= 124,
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 36b2b0a2c05c..c332963dc2ed 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -3018,18 +3018,8 @@ static int fcr_get_rxtrig_bytes(struct uart_8250_port *up)
 static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, unsigned char bytes)
 {
 	const struct serial8250_config *conf_type = &uart_config[up->port.type];
-	int i;
 
-	if (!conf_type->rxtrig_bytes[UART_FCR_R_TRIG_BITS(UART_FCR_R_TRIG_00)])
-		return -EOPNOTSUPP;
-
-	for (i = 1; i < UART_FCR_R_TRIG_MAX_STATE; i++) {
-		if (bytes < conf_type->rxtrig_bytes[i])
-			/* Use the nearest lower value */
-			return (--i) << UART_FCR_R_TRIG_SHIFT;
-	}
-
-	return UART_FCR_R_TRIG_11;
+	return serial8250_bytes_to_fcr(conf_type->rxtrig_bytes, bytes);
 }
 
 static int do_get_rxtrig(struct tty_port *port)

-- 
2.53.0


