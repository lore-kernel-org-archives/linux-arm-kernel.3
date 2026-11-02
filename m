Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C735B606EE8C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bKfUpl5Y;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O7/64jV9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NCqbgiCveDVRhli2P2PmmtvKmmMz/nrumey9OJpxfP4=; b=bKfUpl5Y22ctTI
	se+qRwJQkUHg9ND8etedIDCyRunxFlO7Bdm4odg0kv7ZrNHqTwkHJYkax8LwbpWWIFAk+RC+cHTzM
	mMXAiJbWtovAENK8MJhfVqAp89rAYFvpBu8vWLlX5hcp2zvyAvNkpRwIQ7kf7dqudbV9q9UdJ4oMz
	qxSqhQesNCHCE5XimKmt+qnH7J2lxLzOOV8gJdU0dUHAtt3WlTYQ36kBdNh/Er00tG+XGZwmHr3MI
	0q5nfwzQwgqpNljMzSOTyRb8qS0SAu9Ng4QgHEhlghXY8RgHngax8uzJl8peM/Lyw75DqAM/i51m3
	xSWZHoAFvm03c+NKNZGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNy84-00000000ESN-0gRe;
	Mon, 02 Nov 2026 19:55:40 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNy7y-00000000EMo-42Uw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 19:55:38 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-49429181ce9so2132684fac.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 11:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649334; x=1794254134; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NCqbgiCveDVRhli2P2PmmtvKmmMz/nrumey9OJpxfP4=;
        b=O7/64jV9dr2xz7J39eDRvXXv/H6Ikyk+3a/hr5lC47fdgyasQbAOORgrcRkUByMB9w
         IAWS0+1piUP2qJm/a/fph7kFoo7hVS6qzJFT9MTwNGuXc7TMRpJcA2GFcz0dVA7AJ+ra
         tbHdreVclcaB7UfhQZAWU51TL3UYaVkPTykCSp3D8Wyw9RR0JDFvEKMr35mil7cJrHfk
         5FGlly8Ugq9NPwjZEcOSx1dolS5nup32abpr2iuE8gqjsOeFFUHYAeiZPaIRojgLV4yK
         131CncpyMrVG7PT1hi7zV5+BCxpMiX2swVSr/R8q75zwrtFl5oNZV76uZNamnoWgpHNN
         lcmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649334; x=1794254134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NCqbgiCveDVRhli2P2PmmtvKmmMz/nrumey9OJpxfP4=;
        b=2dzK7xomYfoov5zCBXCSWdgxDnt0vDPXTkwmTH4Fv5kkA0l6rv74ylLrUQ+gdfwm2u
         lZbJY0L39l71gIVMTKHS0RkGuFVgZCfkk5Y/tcZIsSuunHe95dzPcXWr4FcpTfNOFHPR
         l7OFcjWWyWJ0gKvkwTjhiHRsTNfOtjAmvtKWvoVTPGjFyQe2MmG88YTuC8aIZsjEIYVx
         20aJOq2UyHM3xFiK89e4CbHFZCyzi8lqRX+T58u2NiM4AdtLGslBqV6c+a1CLS/XNU6N
         QcNgge9d7Bi1juv7DDposdBml8D0+TuJaokZ3r2fKZi5Oy1eGMCrfRnMegYCH/rApHdC
         3X0w==
X-Forwarded-Encrypted: i=1; AKwUvBx1i5EPkEUYrkyZJtORrdJfTL5a2v2UCLSk4+/R/0oC7goelZARROHmbLG08tUC2kd+AmSwrry7VNQNCZNAgm4Q@lists.infradead.org
X-Gm-Message-State: APuU4Z/47wBaKOA7wfKTZ/qpsVnhQd7gqEPM1GxlI8u8qt4/pS49U0e3
	AVhtbLCo9CMYYK4/ZhvsGLacC2t7Mxq3MQfo+GCvPowFytjdSuKMZOuC
X-Gm-Gg: AYBFou3PNAqt97j5s9iSJcRoigpFowrq+3lpxFqfzBE0fB3HkdWlzj9lmQgqP8bI3Bo
	HzYHYbrt4mqqNuBeTQ6Hm2CO6ojLRjneU/HR9/1HYlPukEAWG8RrpZq2lSA+ndcCto/3s1etSu3
	Wel/afh52irVFJO5e+jdqnOudbu3xODo7iWHrDnQDfHOcvMLWSQ22KTWquyxxWI1d1DKjq4w2U5
	emRN9idkgmp2VnG0nkKsl3LUGLa/gkMm/lqYClSbWSCSvYJyzVzdeDJ6E8Cl97YCnVgCfON8zfH
	AuYQU69Ud+eEQ7sOn6edu/1SznIbwmoKdcJhDtV/TBfJrHus1SK25goRYT02J+CaApZYgbK/aUF
	0M5FIP2WT5mTcaV1Ub27jVpgw5fuSUD4goalajLvjlSOet1QMojHE9RTY8CXq9xZgPDX1xq/OVC
	1vrH8ulF13v5Cdu4f6M3dKzMerck0jO2PhaZ5Y/ge1qWkqEBJYXnGdBsaO9rLNS1pCqCgtOh7bI
	I/r0WbtrIazlWGTIwPUDJdp0dZf1TNZIzHmuvAsrgMPlW7yQYmGwuKdMYFtjhNxp/7yK51VAzYh
	qTQWOIRBnyAWBq934dO2kcWzB1oXb9VXS/rCe1gYn/4BKyuGLUswiaQYE5nma2mdr2+JsyBwvWM
	3pRSRPzcgJZdQZn4pD9RxeRldJvpPuh4wCNLRxefYNz8ICCKOjdYpUwKMrs4yVNgOzA9vL1+dcv
	Wf3mYRByi2Oatf85cCzVtOZL2I7y7wXBe1Wpw+xfYojUOt2qtKNVZoklSx6dKNAdrl9h3T8a3D
X-Received: by 2002:a05:6871:6687:b0:439:a524:a29d with SMTP id 586e51a60fabf-4a9072ccffamr6663890fac.1.1793649333719;
        Mon, 02 Nov 2026 11:55:33 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a921353dcfsm7809249fac.0.2026.11.02.11.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:55:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 12:55:23 -0700
Subject: [PATCH v6 8/8] arm64: dts: allwinner: a523: describe the UART
 integration
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-submit-h616-uart-fifo-v1-v6-8-25afcb346b0c@gmail.com>
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
X-CRM114-CacheID: sfid-20261102_115537_052501_3F5CEDB7 
X-CRM114-Status: GOOD (  10.72  )
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

Identify the Allwinner UART integration on all eight CPUX controllers.
The specific compatible selects FIFO-depth discovery through FCC and the
Allwinner receive-trigger mapping. Each controller supplies its own depth,
so the same compatible covers the different FIFO capacities.

Retain snps,dw-apb-uart as a fallback. The common SoC description supplies
these UART nodes to the A527 and T527 boards as well.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ffeae..23340b9f58cb 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -390,7 +390,7 @@ wdt: watchdog@2050000 {
 		};
 
 		uart0: serial@2500000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02500000 0x400>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -403,7 +403,7 @@ uart0: serial@2500000 {
 		};
 
 		uart1: serial@2500400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02500400 0x400>;
 			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -416,7 +416,7 @@ uart1: serial@2500400 {
 		};
 
 		uart2: serial@2500800 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02500800 0x400>;
 			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -429,7 +429,7 @@ uart2: serial@2500800 {
 		};
 
 		uart3: serial@2500c00 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02500c00 0x400>;
 			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -442,7 +442,7 @@ uart3: serial@2500c00 {
 		};
 
 		uart4: serial@2501000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02501000 0x400>;
 			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -455,7 +455,7 @@ uart4: serial@2501000 {
 		};
 
 		uart5: serial@2501400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02501400 0x400>;
 			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -468,7 +468,7 @@ uart5: serial@2501400 {
 		};
 
 		uart6: serial@2501800 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02501800 0x400>;
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -481,7 +481,7 @@ uart6: serial@2501800 {
 		};
 
 		uart7: serial@2501c00 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02501c00 0x400>;
 			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;

-- 
2.53.0


