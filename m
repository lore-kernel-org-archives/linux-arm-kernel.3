Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404A0CD6E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 14:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p6RQlMNeIE75J/aKW5bH4o7BGOBdS+5uo3qC0b6eFZs=; b=i1EJdurfud+epI8yQ/jucGqKe9
	1C4V+hhMIGBO3noxlBzN7EJcqhjeBZeadTVLHKy0UmguSeaa06mQgSj/4f0MU/DjM7KRBuXvTO7Mm
	7oAv7EebnXZVOrzcgxSzLVxoqYmrkHxKANiFBLybxnQJZu97rt5z6n27gQYzal8IH2K7KTHBL1URb
	e1LmHJiWmW7iLxGl/fO0ILYripjex+CqQrO04DMytza6I7emEKo4HZfvIpM9ubmUxTXPCalUvYser
	DvVsz9h9SouGL64iCVYpvZhuKCmGq7wLilN2reFMOCG30t4T1jHxTiNLO782kj6AkHwTjVntIT3kS
	AudaXkxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyUp-00000007YVe-0vUz;
	Fri, 29 May 2026 14:47:35 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyUe-00000007YQ1-3uoT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 14:47:26 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-490426d72f7so71607115e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 07:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780066043; x=1780670843; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6RQlMNeIE75J/aKW5bH4o7BGOBdS+5uo3qC0b6eFZs=;
        b=pw+oSxmSazFvaiJL6v4kLkkUSZWgIQIneRUbMtF1/8MaBfntM7YH/7YZCni4hbcbkn
         z3qOB0yWBUvH39gzjvPzA2BCoHyJWb0JRRHy313QjRUu6qEjZGkDBA9YDeV8vA7fgKk8
         +MnXN7W2MFr765KSX0favc6C9OnvxL8Z4n+OE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066043; x=1780670843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p6RQlMNeIE75J/aKW5bH4o7BGOBdS+5uo3qC0b6eFZs=;
        b=fP9o+etdOeSJu7g7WJZg/FD8Ly4TE817/LaipYD2fcw0wYQIVn4/qVx8Alu4OC0Wkc
         F/4N1i3hRHzd1l1gs0s8kGPqrPONgsLxVgtpiEZZmIW93+HQOMb5ZhcgGzfRSxiOdmv7
         TNzcL3TncJ5cpP34YCzuKzVkwOVGMDnkx+SAPE58qy0sQCOj4nogyhhvEtOlgN9kP9Dv
         OKARR1rb0Xc9l1+tY/DlfHXM/EKjeomAt+jeU1jDYm4At4YIHRXncqXsY9+5qSJEsU9v
         8yqgmZiI/WMo9d/sPd4N0Kepkh8sAKHG9vuD89vQ8nz2kdV305ZlfMcLMOy9sX9xJIJC
         bbcA==
X-Forwarded-Encrypted: i=1; AFNElJ/Mst6TGG8sWNVq6gqKPCkrMSS0Gc1oTVOWdY1p3XctdkditFfF6hmHGJTXqqt5kthp54mb0At2E2bL7+sY/PAF@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3LTDDU6NpbYbciyUG5mPnKx0fNzuWeG9Hh3dfY8wC8mH2KiS6
	zp4UlAbi9Xm5TLlge03wM+lXAaMq6WPt+VGENQGJQ0sQwU+HWAAG5eNn54lwdJeZviY=
X-Gm-Gg: Acq92OHV6bh+xw6BrSpQ6LtUkS8F6MRvhmrEAQYG/8arKmK8jtmMsVtr/i01hDBNYZX
	h1FW3ZKciOwPwGqRPjz1uXZ2a/StqgxlXBK8mQ97Fn7zgcGGCIZXprE4i+F3n+lZYvqS+fzSLiU
	x8NI2iqmauw+/v/Hucd7x8MoX7g8NVhQbIutKnwDq13NMBUu3m3kvTlZPkYwkSEvsFDx+PHpBmo
	4b0KauPZVNQzFiBoxhfhHXaaZLJlimiPA+vz0uZ5SfKCrdA4bcws4zOH9CQPb811LA+ZNuDitaz
	OZUo4Xw/vVt77rWmoq1CY+8alD4dRS59MDHPna2i3jEqPZpa6WCU2ZQD9MI27WVA49xfbDviMIM
	xDQvxrm34eLyLVxye9M7OS4BvnH1iDXW4y3JFCTxb6LAOvDC+mz/8TQ1iS0h4aYTdL7HH+SgA5W
	afnPA3G1ga3g07qrLdtHlwGfRXcvTOw8gxY1ewZCAv67ujlFNZHFMZDWLXKBCble4FRkB7UFU1W
	Fvk4zwOn6xWvMw9b8wU2OeNTo2LMyKMemLUghA6meZ1zzDobiY8AJloK2EtASRRloVqrg==
X-Received: by 2002:a05:600d:6414:20b0:48f:e245:394e with SMTP id 5b1f17b1804b1-4909c0c8cc0mr44542145e9.27.1780066042883;
        Fri, 29 May 2026 07:47:22 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6eb470sm38694785e9.10.2026.05.29.07.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:47:22 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v2 04/15] arm64: dts: st: add i2c1 pins for stm32mp25
Date: Fri, 29 May 2026 16:46:18 +0200
Message-ID: <20260529144707.3931919-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
References: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_074725_009353_C16ABC50 
X-CRM114-Status: GOOD (  10.35  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add the i2c1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 456ece7f8ebc..db485b9ed904 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -203,6 +203,25 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	i2c1_pins_a: i2c1-0 {
+		pins {
+			pinmux = <STM32_PINMUX('G', 13, AF9)>, /* I2C1_SCL */
+				 <STM32_PINMUX('A', 2, AF10)>; /* I2C1_SDA */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	i2c1_sleep_pins_a: i2c1-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('G', 13, ANALOG)>, /* I2C1_SCL */
+				 <STM32_PINMUX('A', 2, ANALOG)>; /* I2C1_SDA */
+		};
+	};
+
 	/omit-if-no-ref/
 	i2c2_pins_a: i2c2-0 {
 		pins {
-- 
2.43.0


