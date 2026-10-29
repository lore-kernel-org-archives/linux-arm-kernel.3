Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FBD606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 18:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=31BcETS0;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uVbHZ+xZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=79xjx57HjwzmaHLw3TFo6BlyGst5sDPWB7FQ91YNv84=; b=31BcETS0H0DbsD
	/15qhOWgT5jJlfBMNzPV/M5xsEiz88vfXnwVDpyPXYCExhueVJ5p6haeMCvv2W3uXAwY/8Ymbf9Bn
	PI3JqWXnIgT0OlMw8ujJCKEjpxUGmSyOtZPkOOFe4mCm+gYhrhupf74xGCpV98d1YwLVBveSntGcZ
	higu+woprt7XXEbvFQC3r91fnzs9KE4DhG8HEdO7wh2m9gk3Q7YwY7FOvUct6trYYNrvtfzRzG2aE
	ABAsCctEUlyGHqElYeFdWA202mvCZMJujmgseEcaaDHxtkkRO1SncKG5UyfaGSXp9fOMG3Bf7ouBs
	k63255TkLsubrtIRaAoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVAD-0000000AA9D-0n4T;
	Thu, 29 Oct 2026 18:47:49 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMV9z-0000000AA2Y-1zMv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 18:47:36 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-844a8bf7e25so1694331a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 11:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793299655; x=1793904455; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=79xjx57HjwzmaHLw3TFo6BlyGst5sDPWB7FQ91YNv84=;
        b=uVbHZ+xZlqgcZTpTthsX5uNLkfG+29V1kQ6GuVvD6Gptr+SQ2iV88iyLzH/EvxjHa/
         teX06p285yMWdSlqSNQqO+RxdXG96j7jROHQyhP8XUD1kZK2HG7iSRJ1TkCKTjm92e5D
         M6N7n/qiwrpFGuUdCHQKYdp9iAiSWO4FeGh14eM8xpQN2ocP5mEBPT+iwAidEcO4XzHB
         Ejep+5QaKL94KJ2jiiLncCIQ8r2bu7SNo8Povlv8RH543uGIUZsyR2jvE5RKgviXn1D+
         3HqdQfksUKmqETyREbgt0j94F53EY4w99CesmY+Gx5RW5Kciv4hZZVB6hbuDqgwOgbkh
         f8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299655; x=1793904455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=79xjx57HjwzmaHLw3TFo6BlyGst5sDPWB7FQ91YNv84=;
        b=2zqIKKotqUYXYv6S7e8KLDwLW7TD/Rn0nhA9lc18bsjN/A/eNZ16v1LcgIvtH6y6NM
         amVzQ0CxsJp14ziRCzmtBT99KBPKV0jkAqdFUIsggcD94R52PSsdM324wUjO4dyCiYL0
         ictE7KRqHX3ScEShquQtg+zrtd0gt2BVJjmCYG6b+ukN1Lbi+NXAdXcUnjFzLPblwsRG
         kOhlUlQQT9ECVB6ChFFXSwN+i6nzZ+I9qVPdyFsRRzZVBwFFV+8W6zkRv+K8N8X9eOqa
         VqaEEbVkXk+evThjCdTLv88y0Sqy0MBmsPSBjB6EIN3yxe/hNRqpGyZL8FL08YaoFa/b
         vDvA==
X-Forwarded-Encrypted: i=1; AKwUvBwzpDDzs3dUJi8Qp8sU3GPce2CsQidRjnqDVcrnkCVIVEroLoGIrE19t+11bMU0N4J/J66Qvywsym5bG415B19n@lists.infradead.org
X-Gm-Message-State: AFq9FYIZIYvRuKnyffOshIvxOadQBCdZ8CSEyb39F6DsKLcRGUPnHKaW
	5kfC8AQ83+zhKMZP00lbhDpNffJm2ktqKGwZwJyeNc5mKk52sSEzdyFk
X-Gm-Gg: AYBFou3ZbO5hLsAXisj3RsrJTpcUvO1LGmD6m+dRVH1NV/WMsnDHnbek5M8t4qTHtbO
	sVPR5awO1c/i5jBkqRIIlSIiJGLGDZUp2vD+WKq5xJ02lkEpCOnhalCWGzVZEgvizrEerCVWVPX
	63gmmQjy+7F4ci9bZink2vIJh+AYFQ2gKx5k/dRuoA2nLvN5VHgEjCnCPk+k0KsnS7O4zgV01a0
	BSC80/UdqibgOW7iomz1wRVEVLpzZYTOOI/90QXh4vuOcU7V8NXXdC3wsD67wOr5HrRxMXdkW3M
	yL6LfjHfzCA+7lhwSrZSfmPV7TFguVSfmVwjdJj3H30aKGHIkeKeTsiTZofMrQ6xVvP8yMYN4zS
	TG3ihBZHE+9Stm/GD6uMtaoPvm29JCRfAtIe88hw2NpCZhgMffEip4wzRAnyqpWeMYYpSpZCVqH
	wwac1skRcCOFta5h1XIrUFMJEpi5gOGVtbnh5N6/KRASbEnRzKJS+EF5NIe+xdm03psgMdwVhtc
	Vpe+in1s0I38rRWkNv6EHCmz+wRbifeFECDwwlddLzrIOVJMs1Yy1iaDIYIugT4vG0bbEJI7njn
	Cn92zqikDO5/fa6yQlEu/gOfV5voW4oxs7a7cTEG7EcDJCKcjoNH2+bIdO8t0X0PGcg54S819UL
	LQ5eFFrqKXKKmlHBs9Vjy99+32pJCPJdyMhElnHKhcQN/xAweO2F2xJYTo3UB6YIvhfDIrojgji
	jARghNOFEyo+fd/xIs6AvJFl0vB3FqpEyEywqNmu+ByJ1a0ZjEo5riIpNnGlr7PFolL2u1lFx0
X-Received: by 2002:a05:6830:913:b0:7f6:ec23:7956 with SMTP id 46e09a7af769-85d361417afmr94378a34.2.1793299654718;
        Thu, 29 Oct 2026 11:47:34 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm221871a34.14.2026.10.29.11.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:47:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 12:47:23 -0600
Subject: [PATCH v5 2/8] serial: 8250: share the RX trigger conversion
 helper
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-submit-h616-uart-fifo-v1-v5-2-53b433aebbf8@gmail.com>
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
X-CRM114-CacheID: sfid-20261029_114735_520828_283144E4 
X-CRM114-Status: GOOD (  15.86  )
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
the generic 8250 implementation. Keep the implementation in 8250_port.c and
export it for subdrivers.

Include the unsupported-table check in the helper and preserve the existing
nearest-lower selection and highest-encoding fallback.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
index 36b2b0a2c05c..fc3987b5a70c 100644
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
+EXPORT_SYMBOL_GPL(serial8250_bytes_to_fcr);
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


