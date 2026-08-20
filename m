Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B264C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 09:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t7LWSb8qWivuTBFZOTkhMvIYG3C3K+jwZJ32iqKW5og=; b=v4uCcySyDzCENUJyzgkLdqzc4N
	yqSlkk2PajyLFK1/YvpttDDqXJR6SGYFMjGMfnoF8yuMDOZFqF4YP1Ie18jMU/EY8Y3XN876zPB28
	KRTNYNuRjr1YiqsUOzqtdJokUpp6/HuFcicfXjzC+PIIHv582104P0pPff7H4EpJeZOtZN3HKIbk1
	vvl8HEYJu8+mcGVsP1KmmZ3IQFIS0eC2GjvCHjrEup5kz9NHXLR9pWMT/Z8JRfEXVECIr5Eml1wEh
	zwwYmsStnaMJMS7CMrG/MOy1/9EriSUDWXg/XxW7JyfULmLMMsFQ3N0KfjMt1EyG0RcvhPACZK9O7
	2yz5mlVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyu6-0000000BF9k-3ACA;
	Thu, 20 Aug 2026 09:17:42 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyu1-0000000BF4j-1OIS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 09:17:38 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4954dff6536so16941515e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 02:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1787217456; x=1787822256; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t7LWSb8qWivuTBFZOTkhMvIYG3C3K+jwZJ32iqKW5og=;
        b=VhM/TDd1txwIEqUzEGFzQJ5wigXHNukZsHEUt42Xl0bY0YRuPEsjAqf9Hs/P1v+kR/
         g09oZ0gC7V3CHUk9jbgS4EyprmWnPbcjisEU1GduLLdJk22Qr2Srsz0ACiYCf92ArsCV
         fRredTKec88tus6et3TBDeE0RtOGBjIBgrEm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217456; x=1787822256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t7LWSb8qWivuTBFZOTkhMvIYG3C3K+jwZJ32iqKW5og=;
        b=cOCrUGAa+NbTNGhllJjrVrzeCdHlqMj1aZbrWOlo7ZyuYYLQ5mPki2R/ChCH8r6M56
         eCi8hrkTEzoCYbH8fU5WB8odBn0DRooKlh4+aEC7qS5EeWhpz8bQAPg7Hqg+MKecZnf2
         i1vV9O+8N1AB9Ouq7OCu90iRYsK5+vC6MpPQyBfKt0aKQCkZGKEBUVaiXgVfFwtsK91k
         i7QNNAal7WzjYfGi6RfNcc/7jkDVlXNeFxlbv0u8/TKr1yoFOsRVeqd3Ax2n/96MQ4AM
         upk2+z1ABhNuiRXxh7ZErmBy348ODXON/iRyp1c83nKPhR9Bh0a04WTGpTClgDRaR/Fz
         aegA==
X-Forwarded-Encrypted: i=1; AHgh+RrsmmsTqBkV2siLGJRQJjRQE/ii7gqYxwhN/Cane/RWfXDujfgxRiUm1Ac3GCt6dlKZrdATs0G2Md1O+6/xfr23@lists.infradead.org
X-Gm-Message-State: AOJu0YzR6mz6Og7cENJoY7tFfdKuUHgd06ACVCk1jKhsbaSENE9wvvJk
	uyfWioPyMatRquN8kCxn7aeTAVK96wNwpnr+Lh3gxGXiAbo3IRmov5pM8NWi0oJqB3PUbVXfQas
	S88Ez4h8=
X-Gm-Gg: AR+sD10snWy2h3byUIYhhWrDyUpBKGwCKgB7vVaxuXpYWunXseArNdufHf16grbrY6D
	O14QUzZgSqv8nCiwPKUN8J2trYOTiFXCfzOgq9eyp3KaB62/49lSP/auhKR5atj0QUbTifGsHHi
	1Q/j6bRo4i6Retw5YqHvcyXXG55oJiTwiiq0SdxD+3VjfCsoQB/WoVOScE6z0VFpih/y0uGu1pS
	AlFunXzgwAVwvZKIRSCijYyWw9zppjnf1FvxDYYBXL4YziwO8ym3A3heszMD+Yw0gF6lWppMdUV
	RPmd6aJgQPMfWOuhQKMrNCSRBuvPWPxr3KzYRhT4u/qlVZNROcuYeUcOVC4HoEUDBCpNccd5p8B
	wqg189KlrLQmOdtB5Nfz1YV4Q76kaYqlXrarg4IFGx1pRwhyyNxGaCfgTzc1OQJE75bOvb6UlIQ
	/zqOJqNZubxpvNzL0NcRLODqntWQBOTeu+FmUDOJTqsvRXcBNeiqyRd+nUlPTCG6pVZ13FOM8Mx
	6LkdTrjZ8GbVyPtORHJmVhKgWwsSCYERt1P08Q0xfXcYEPwRZMkaNFjzF8oL7vtfNhIZmBnsVqn
	pXJgNXqnb5IXOtYSsohKS934njL/sXLDMSOVqgvR3X1sATXeYDerKeU20UwLvg==
X-Received: by 2002:a05:600c:3f19:b0:499:51f0:a9b2 with SMTP id 5b1f17b1804b1-499aa1499ecmr217324705e9.1.1787217455710;
        Thu, 20 Aug 2026 02:17:35 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-54-86-139.retail.telecomitalia.it. [79.54.86.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c3775sm10021606f8f.26.2026.08.20.02.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:17:35 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: alexandre.torgue@foss.st.com,
	francesco.utel@engicam.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	domenico.acri@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v8 11/16] arm64: dts: st: add sdmmc2 pins for stm32mp25
Date: Thu, 20 Aug 2026 11:12:19 +0200
Message-ID: <20260820091652.43541-12-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
References: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_021737_388716_CC73B744 
X-CRM114-Status: GOOD (  10.88  )
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

Add the sdmmc2 pins used on MicroGEA-STM32MP257D-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v5)

Changes in v5:
- Change SDMMC2_CK pin bias from pull-up to bias-disable to
  avoid signal integrity issues on the clock line. Suggested by Sashiko

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 002fbc724b9d..c816a6aece47 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -622,6 +622,86 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	sdmmc2_b4_pins_a: sdmmc2-b4-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('E', 13, AF12)>, /* SDMMC2_D0 */
+				 <STM32_PINMUX('E', 11, AF12)>, /* SDMMC2_D1 */
+				 <STM32_PINMUX('E', 8, AF12)>, /* SDMMC2_D2 */
+				 <STM32_PINMUX('E', 12, AF12)>, /* SDMMC2_D3 */
+				 <STM32_PINMUX('E', 15, AF12)>; /* SDMMC2_CMD */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 14, AF12)>; /* SDMMC2_CK */
+			slew-rate = <2>;
+			drive-push-pull;
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	sdmmc2_b4_od_pins_a: sdmmc2-b4-od-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('E', 13, AF12)>, /* SDMMC2_D0 */
+				 <STM32_PINMUX('E', 11, AF12)>, /* SDMMC2_D1 */
+				 <STM32_PINMUX('E', 8, AF12)>, /* SDMMC2_D2 */
+				 <STM32_PINMUX('E', 12, AF12)>; /* SDMMC2_D3 */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 14, AF12)>; /* SDMMC2_CK */
+			slew-rate = <2>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins3 {
+			pinmux = <STM32_PINMUX('E', 15, AF12)>; /* SDMMC2_CMD */
+			slew-rate = <1>;
+			drive-open-drain;
+			bias-pull-up;
+		};
+	};
+
+	/omit-if-no-ref/
+	sdmmc2_b4_sleep_pins_a: sdmmc2-b4-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 13, ANALOG)>, /* SDMMC2_D0 */
+				 <STM32_PINMUX('E', 11, ANALOG)>, /* SDMMC2_D1 */
+				 <STM32_PINMUX('E', 8, ANALOG)>, /* SDMMC2_D2 */
+				 <STM32_PINMUX('E', 12, ANALOG)>, /* SDMMC2_D3 */
+				 <STM32_PINMUX('E', 14, ANALOG)>, /* SDMMC2_CK */
+				 <STM32_PINMUX('E', 15, ANALOG)>; /* SDMMC2_CMD */
+		};
+	};
+
+	/omit-if-no-ref/
+	sdmmc2_d47_pins_a: sdmmc2-d47-0 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 10, AF12)>, /* SDMMC2_D4 */
+				 <STM32_PINMUX('E', 9, AF12)>, /* SDMMC2_D5 */
+				 <STM32_PINMUX('E', 6, AF12)>, /* SDMMC2_D6 */
+				 <STM32_PINMUX('E', 7, AF12)>; /* SDMMC2_D7 */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+	};
+
+	/omit-if-no-ref/
+	sdmmc2_d47_sleep_pins_a: sdmmc2-d47-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 10, ANALOG)>, /* SDMMC2_D4 */
+				 <STM32_PINMUX('E', 9, ANALOG)>, /* SDMMC2_D5 */
+				 <STM32_PINMUX('E', 6, ANALOG)>, /* SDMMC2_D6 */
+				 <STM32_PINMUX('E', 7, ANALOG)>; /* SDMMC2_D7 */
+		};
+	};
+
 	/omit-if-no-ref/
 	spi3_pins_a: spi3-0 {
 		pins1 {
-- 
2.43.0


