Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446AE606A329
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 18:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xDa1/I5M;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VwNcd9xe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZiExINcBxtPR/Qkmd5Xw5xLQgpBI2Y90lv+3jQt1oog=; b=xDa1/I5Mxwa8j4
	838Bi1bfLtkVnMRokApzVbTAuFmyfL6WrckbEw8yDFdDmzNUuRUlWySlWkt6LWpfX2VD/nDcStxVH
	YmZioZ1cRUN4S0pqYfUJCtSTwDa5RD4NwbKsLFi3hJYGtH3rB2lmCRKvf5d80MaUVgUxz++iDDABA
	6FncmP4g8Vp+VdfTkTw51d8/QjJmmllF+ruldoEsJQhmwQY5+wB+63TFLjcrR8qHuOQi0xxIC59dp
	mqWLPhmkX0/v4NPUhe4Q9WKX1lfKp5fpzvBwUGf/y3wSVGsWpFShPVVCAJTobu0Qh0CzCaLik2AFC
	hjOOxwM/xjxDGWyWE7mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVAD-0000000AAAs-2tZ8;
	Thu, 29 Oct 2026 18:47:49 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVA4-0000000AA5V-3zZy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 18:47:42 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-843b6f8e2c7so2775252a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 11:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793299659; x=1793904459; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZiExINcBxtPR/Qkmd5Xw5xLQgpBI2Y90lv+3jQt1oog=;
        b=VwNcd9xe9qy1h7JjglD5QEK9uXFFxGJCXNNcocK9+2zemnmq4mzU9lVVWndnDVyWrn
         9gAC+V9FipdMWcOzqcaOZuKmjQ4p+wuRxS0WknyH0+YkU8+B2lAaFk16Q2200diPaIl3
         xy/r6p5CDEMi/WoN+RnvOSdFCfqg17oh4ovsHPMAbCrv6thQZTIQucBykB1RgBBgyt40
         nK7Kon7KW3A/efMtrQQodgeBv8AztMJ257aCIr8pLjR9mT3dgDryqYmL6DaCpRXOfIsh
         iaeyjy9rds2XSJevorj5OQ4LlOiXoddJVLHOuQ4SQqFuH6sClthkOTr5hoN5gIdGB7Z4
         KVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299659; x=1793904459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZiExINcBxtPR/Qkmd5Xw5xLQgpBI2Y90lv+3jQt1oog=;
        b=JTzjZDcQ7NkttQGedBviQRta+1lBQEWVYt+X+8nXRXgdIetVWwiQcYAdGKCXfB9bCA
         64Y8xQ5JyZ77bf+z/8NqiZKmYQc8Vp8g6FYpLR+xTcU6ViDURqujQQczYSXtDRMiZEa5
         8os27JT6eTzhweL82qicMf13dd1c3lbHIWrD+zDS8rm4Z9iajBKjwv0TcOwWASg/livy
         jU4OjOFp4Z82bjYEVHqzSjsg9IudKeg0JAiI+Lz4DDg2epJ00RqSfhm4qxNb12HdY7H/
         NdqngIRty0VAz/ZHp8oX+5UV5s1Npj0cBADuIcvREe0CGiIcCDPdO52bmkmEY+bEtvS5
         zLPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkI0l5GCXws5Yk71YUVD/mELs1l00hGIwBK8RX7XCNu+gS1pwfIgiGpqPf0Phy0NYsoBrv3i44O+ag2nft7VGt@lists.infradead.org
X-Gm-Message-State: AFq9FYKPayn6e0yIv0GbTbbb+dJJQSqy2hfBQzxObkeLp1zW77OjB9Qq
	QJYrJFVczvGHCfi1foj2j5eRS3qx8SnfJrOc6sre8Wztdr7E9mRot1O5
X-Gm-Gg: AYBFou1t93iL+dopLMMTXUyYNof9ATdbzHtJn2z5py8fPtwfAdXFMGCQJhnPxOaOwBC
	wq/alFt0wwQMEBoOH0YP64eB4xGsDnBdM/hGghxA5Yq7Ul3mEC+5LDWGMWwSEvgPzpROFUQ2L2E
	IlyMPMf2xlL4TrM2P2i3mTcao1QPvZGLlqgjbqBvttEyJoZmRPKO+tMnJm7aoUjPpzCw2qAB8Xy
	La85CdmSBLgTtxMFSBmymS1HIms8Jfw7Btt1tFx4j52lnS08oiVvxUiyJfI9ggV218FUHsVunkq
	H2lGytZKYbLxT6UoicG2ETZ+HkXz8Edrais5A32EvUOQqDHHnWKhDQTKYQoO4Wh9qaz0sVWeiZQ
	emJauJ8epAgdpG90HgOyhTZm/WxlJq0YIVcHnS5jLySsgV4QjSqHFxLSuN7mREQQLQ2ht9v9kS5
	84ZU6r5xJcgL9InHQVrJc8P3PoeMTHaPAqLpcjfEfc0uvV3RX7fa0wecr1wodNi4DmfAQ9taazb
	mDAVjEdUF3xILu0Ir5h7yPXg8KYuCSQhgZE82kZCMy9vGs0UByFrHWgPGjXjinRWrtLTXuuhSbl
	RbDPOR5ioQt44eDbLPArXlHqompKR8GBC2C1lf8b204I7dZoN97BythuOGOl74G6gSfJHCST6YX
	pjF39BrzzhC9oPyGVaRQFHJ2aW9CxBPUPUo1T9mmrQhIR4Xu5mV/mBpbdflR7Jtk+8DkBK9d1Ik
	EUPJf1fjAMRBA14S1HEveW7t+FAUigB7AO0CNoMuECmSkbUqv0JCo=
X-Received: by 2002:a05:6830:3153:b0:830:43b8:72db with SMTP id 46e09a7af769-85d365ca9a6mr29214a34.24.1793299659371;
        Thu, 29 Oct 2026 11:47:39 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm221871a34.14.2026.10.29.11.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:47:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 12:47:27 -0600
Subject: [PATCH v5 6/8] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner A523
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-submit-h616-uart-fifo-v1-v5-6-53b433aebbf8@gmail.com>
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
X-CRM114-CacheID: sfid-20261029_114740_997580_CDF90C79 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
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

The A523 UART integration has different FIFO depths across its controllers
and reports each controller's depth in the FIFO Clock Control register.
Its receive thresholds are fractions of that depth, and its optional
register layout differs from the generic DesignWare integration.

Add a compatible for this integration, also used by A527 and T527, with
snps,dw-apb-uart as a fallback.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index fc1289073241..ea6ce99178e3 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -61,6 +61,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun50i-h616-uart
+              - allwinner,sun55i-a523-uart
               - anlogic,dr1v90-uart
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart

-- 
2.53.0


