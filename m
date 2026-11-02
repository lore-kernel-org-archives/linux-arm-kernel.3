Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B628360850A3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n9d/q5H2;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GK9NmytC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=N6NaCr2YqwIe/GreNxQyGPwW88t11Y+r+IlcKQCQW48=; b=n9d/q5H2dvoMft
	g7nqY/OLJW50GXtqCseRU+UxqakqS9tXiYeIOEq234GPLn6rN4TPN4oZBuWRr+aTmpufsnx8nBFrD
	VEiFDPGD4poKRuOONpBVrvkV3g62nHOZb6y4VULH7W6HODo65Tj0Q7HFZ96PXYn4IGiEeYmjJ7cwe
	K/K/mxX3NZFq+Fw9OTWY3H49nJHIBOXJzSfhqGN4pLmfVRjERClOQEN1bxR4oNxg+YyK+ox0dqXql
	W+f0SooElHAXHS34OvLJASGduUdAZO/4AZDTgxI/pe3fJ2U/GaTSuf+vgHKXdIFaTb93JW9msZJ7N
	p2eCSXQR81VDYk/C7Yfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNy7v-00000000EIr-2ywu;
	Mon, 02 Nov 2026 19:55:31 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNy7s-00000000EGv-3ZVq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 19:55:30 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-4911df1e196so2172759fac.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 11:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649328; x=1794254128; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N6NaCr2YqwIe/GreNxQyGPwW88t11Y+r+IlcKQCQW48=;
        b=GK9NmytCcRJ3PNqYYk/sCs+fbDGjgcO9599h5a8L8407uOQzbZymB8jeZpuSBvX1jf
         IhBHBIFQDNz8DakrRCxXUGpUq8T4CCbxajjkg98btyCbdFF44BBRPxeWKngte9gYJJwh
         yo4uGc5dFYDv4IcUiLsIPpTV/4YypI9Zkw/jxJeoahoDMBnaP62Ez3YHdHC4xNM6WFyu
         RouRYj/egtAq+zwxD3GR9KYTHt6AJRSAbp2GS6hfSaJ0mpTIbfYojyvck3+CoImdqLhj
         qEs4V7VNOkEqrcnwO/3kXiqXKHQNuEQ5CUyA4i3BVh10tNwgIpA8DijCERj99SsZybn4
         jbFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649328; x=1794254128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N6NaCr2YqwIe/GreNxQyGPwW88t11Y+r+IlcKQCQW48=;
        b=LuLr5LjVaTFWK3ysbFbJVkGeDJpqSUZWrgudH4UUuhXBL8iEmEL9MFgsyLRCMcmC6A
         UpadEQnQ5mn7giXugve5ReUN5oC5NclJE6wtn4VYlJ43Rk9mwu929ENcj2jpDgm6dPq5
         gfC04wqxPD0zRHNX/oXZXh3ro3HDhELXtj1gn92Z4gESfjmYRi9LQJcb+mAy0kwLOuNT
         uKz3jbS7bDAeEN6bXf9EtMCA2MmaGqfZ9Nx6Z2UQdthuiZpYOXYjpBfzewOeXgyXdmkc
         rozXy/CNnudHXyG05Qa9dCxn1XkS91eElADW6CW0y4wfRrGTqtNb7rJJ/6w07hQfg5nr
         lb/w==
X-Forwarded-Encrypted: i=1; AKwUvBxInY+1Smfv2VrbEnAmrghS6MMnx+vx56KI1/iwkmg4ITOF36qo5jo7PCC3f5vKcA4R04f6zcfQcCROk9gYBbjR@lists.infradead.org
X-Gm-Message-State: AFq9FYKBYgqv/9X2VNV1A4D9d/6V++vhB1+DUXJJRPIsU2HayqgK4PZJ
	V5Tt8E4YGIgHiHG1ldwdWth7SKg6vRsQfrRWiI65kehuei/Bz6R3anHH
X-Gm-Gg: AYBFou2rkLgMHqU0XAiBpadjYjOalKyCkM3fFPU843lsadCsvBcccZJ6JDQ8ufRNSab
	J7nAL8wJo/96nfhAWJX0FpXqYFVrLqauesX/Jhc3ItRlQfy35JWUwkj5GHCZ5TAtLtGsNBfpsry
	nyGtHLqm9F01CGaC6sNfR1pK0kdC/IXahwd9mRZvZsihIGryDOsFXXabEZ2/TIUzmKV3eeX+Blk
	QzUXH8BR9wCDikCtYPV/fBrr40krjB14ang7NKrlUrQX2kmP+O/1XdrDfXQgWf9R+zqX5Ram5nL
	fcEenxBk7A4IyBbn4+Wc7cRszgRjOGVY+3A4qIjL0p7WXrKkd5E6v9NlKV9B11UtQcYnLH2vzvi
	e0uLmyxEIH0xlSx4im5ILrKGuJK6rLquZIemchDqysdrBnOzCdDBKiqz81F882iBCrljZkmvErz
	fbEF08lyRm5Hzv7gbsspeXaTYFxWIxqIVX/gCMb3Uc9iaSHljjqYLY2DoclXJwTxXGgepmlxADo
	p9kWXcvNCxfUy8lAGmiRpq5ABJX9ITP8QcddkiuCG4fmbonKcOYNhKpztncQ6/uhoq+E4pbcaff
	7jBPZaXlf0K3iuGnf+ZwZOmSv4PDje27LacPj7GF/FrQ7HVdxLTCdrY05hYwKdSKLWuI7lB1YH0
	G1UFvuXYibN2bLhoiQBh6joxdWv9j+v0DBaBENskeNlgeS7KJCM/2SUMdTBiEzENtB2/9+KE0RB
	pvrHZdA86pHAHPODxNL0xhITemUAAKTZ46uOx2cQRceRApS69LpZA=
X-Received: by 2002:a05:6871:e41b:b0:4a6:f610:87eb with SMTP id 586e51a60fabf-4a90729a753mr6897453fac.3.1793649326753;
        Mon, 02 Nov 2026 11:55:26 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a921353dcfsm7809249fac.0.2026.11.02.11.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:55:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 12:55:17 -0700
Subject: [PATCH v6 2/8] serial: 8250: share the RX trigger conversion
 helper
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261102-submit-h616-uart-fifo-v1-v6-2-25afcb346b0c@gmail.com>
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
X-CRM114-CacheID: sfid-20261102_115528_896532_F527C132 
X-CRM114-Status: GOOD (  16.42  )
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

Drivers can supply receive-trigger thresholds through the RX trigger
callbacks without adding a legacy port type to uart_config[]. Extract the
threshold search into serial8250_bytes_to_fcr() so those drivers can use
the same conversion as the generic 8250 implementation.

Keep the implementation in 8250_port.c and export it in the SERIAL_8250
namespace. Include the unsupported-table check and preserve the existing
nearest-lower selection and highest-encoding fallback.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250.h      |  2 ++
 drivers/tty/serial/8250/8250_port.c | 21 +++++++++++++--------
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index 21ed9c41b751..1600f2e45d76 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -73,6 +73,8 @@ struct serial8250_config {
 	unsigned int	flags;
 };
 
+int serial8250_bytes_to_fcr(const unsigned char *rxtrig_bytes, unsigned char bytes);
+
 enum uart_port_type {
 	/* Internal 8250 only */
 	UART_PORT_AIROHA		= 124,
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 36b2b0a2c05c..4a25badad3c5 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -3015,22 +3015,27 @@ static int fcr_get_rxtrig_bytes(struct uart_8250_port *up)
 	return bytes ? bytes : -EOPNOTSUPP;
 }
 
-static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, unsigned char bytes)
+int serial8250_bytes_to_fcr(const unsigned char *rxtrig_bytes, unsigned char bytes)
 {
-	const struct serial8250_config *conf_type = &uart_config[up->port.type];
-	int i;
-
-	if (!conf_type->rxtrig_bytes[UART_FCR_R_TRIG_BITS(UART_FCR_R_TRIG_00)])
+	if (!rxtrig_bytes[UART_FCR_R_TRIG_BITS(UART_FCR_R_TRIG_00)])
 		return -EOPNOTSUPP;
 
-	for (i = 1; i < UART_FCR_R_TRIG_MAX_STATE; i++) {
-		if (bytes < conf_type->rxtrig_bytes[i])
+	for (unsigned int i = 1; i < UART_FCR_R_TRIG_MAX_STATE; i++) {
+		if (bytes < rxtrig_bytes[i])
 			/* Use the nearest lower value */
-			return (--i) << UART_FCR_R_TRIG_SHIFT;
+			return (i - 1) << UART_FCR_R_TRIG_SHIFT;
 	}
 
 	return UART_FCR_R_TRIG_11;
 }
+EXPORT_SYMBOL_NS_GPL(serial8250_bytes_to_fcr, "SERIAL_8250");
+
+static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, unsigned char bytes)
+{
+	const struct serial8250_config *conf_type = &uart_config[up->port.type];
+
+	return serial8250_bytes_to_fcr(conf_type->rxtrig_bytes, bytes);
+}
 
 static int do_get_rxtrig(struct tty_port *port)
 {

-- 
2.53.0


