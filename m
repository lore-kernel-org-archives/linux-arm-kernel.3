Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1121C5DF86
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 09:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6h0iP47hxJiFX0M4Y3bh38tt/2SOm7+bK6VAzYbbRwY=; b=wS3aR3pSCx0brQVL/O3SpFeWH4
	nySMW/b+9XfdoFfbZMV8VBW3skx5lpS4FPDr4fPXVLkjMBeFbbHOLytB8ECP2/Fe9t9XP39uj79DB
	KmY9JVKyNAPrkUmTSWXpiaAwc3G9msCQCU+k6aWpQONkfGxM7eJo4e7ezaFfSBRMYDwstGwXINCp5
	Ijb2oWvbBgVJ5FiSiZfhrA8QiXZIGSRVKyHjsTgFPg+8YNeG/KHKOuYp8aUof/9pm0W/xBJwjPMXq
	7w5jRo9iTjvUv6gbYDT2a8e4BYRwkmh4cdv3UwtHLgNTGlgMfwMWgH/ViYNnOp+jx/sUsw6WKIEvx
	2bKX7ZJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyu6-0000000BF8p-065N;
	Thu, 20 Aug 2026 09:17:42 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwytu-0000000BEzi-2agq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 09:17:31 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so18419605e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 02:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1787217449; x=1787822249; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6h0iP47hxJiFX0M4Y3bh38tt/2SOm7+bK6VAzYbbRwY=;
        b=kq59Bfn8IZkrll0pyJRQ7zNdyAAWsSvFenJCdZkXE5/cHnCCJC5/pqjTDCchKrIem/
         k+4dntpf6Lh3sZTEF5CbleABhlwVHvzOL9HUqcsigL3hwHa882it8i6vtU6ijxGbEQJx
         vMUk706zWRcVztskZcwq5n3QDhXhrpQxI5Lwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217449; x=1787822249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6h0iP47hxJiFX0M4Y3bh38tt/2SOm7+bK6VAzYbbRwY=;
        b=m52DqDa2fbA0k7rF/51KzBNhY19KYIt1LOuP5UBXPJ3lEbLZeSqBOZMHF5rSk8oQep
         d9H59r/PIM8ZKsoCfjs9DLRwojm7tJvevoYoTD8AeKa0vhstCmD47vAr65xfCF48hemY
         pGADmW8BZnG+D6wUum6pMK7wioMYB3O8U/xrFWnI7z+O7eurVLBglUdr8FGu0p0Ia/eD
         /tonXzidsVf6r716oqFIWFO+rYNCdl0SdDijsAs1MwVZMhCdZOM63jlRuZMbPRxbaIh1
         Q+z4HvACwP6/qbw3AotTziMhapAuJLGec3HiywZ30xnO3xjfBeESln9DQzUmlapc7mfM
         LoIQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr8JbDhXiVxrYb5Eay+5ClMlM4LdxIEye+/8Kv9LAs9yOVHRdUH3fiZVUpkEuiVCrljYdEAAm4AFyxex7KJbBSm@lists.infradead.org
X-Gm-Message-State: AOJu0YxI5jwG1pdDcwv//O8c8zvsQcR0HLqbBQfAE7XrHg+RjGekJ2CJ
	ttuOYGsaEHnXAi4yzAvFzVYuxJ7u53SP2zsNlyzBKMFJ8yU/cMyrXQ7caPHPlcnOjC8=
X-Gm-Gg: AR+sD10Pj2bnabwoWUt3VSr8Ou8aW4Tl180/7/+lWsXPC+Kga5waAGE/xJXYJcP2iXq
	BG91mwf7BpYaoUKaCNTshg7b2tC2MNA1o7y/znUUwH+zoBqUq0Xv2ekFMLqqTZiy0rWH8IzZrv7
	ZnjZyuyVnmrbJtnLN27X8JxzdO1YKO4xm3jTlTItM5uJaGFTEW11Oplk04MjqLhnSRJu5IbhS/Z
	3K9Y3PfNZ1Q3kpENk+7bqUOTZWc5TtsBPJRo61hAL3VBGde8fcoFtqqlbFsZS6oPKHgWhNJLzx7
	ZqbEAGZjui/BNteWmSjv9StS188q9I5cXMhihkq7BMXhdnkfYjV3tlgcDrZtVFv+M/lC9WrM7t7
	MWSbVyhiCM4ByUGPLPVokCxDVmPORhqAADf+2IOp89DN5RRmepuUyRO42/aSEZff/4u+nwy6onU
	JtRsEKBNF0DRopwqrhZU/aveahAbbIUsoW235pWU2NvheMBWUNtTye7E8IgN6b7FWWE45W8Ogyg
	64HwYmLDFhGuUs6q74y4Mbewkj5OHPu9TgMZoz9YcRzoGWENJcrEriLgt/TF3FG1Zu7DXCG/0Js
	H05AWifRrZ9Vl9fH5i7P/wHAbnq7zCEqYMGkcejtM9xYHDRld3uSAfwe5zPCCQ==
X-Received: by 2002:a05:600c:34d1:b0:499:49f3:77b1 with SMTP id 5b1f17b1804b1-499aa14a6a6mr194346575e9.3.1787217448818;
        Thu, 20 Aug 2026 02:17:28 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-54-86-139.retail.telecomitalia.it. [79.54.86.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c3775sm10021606f8f.26.2026.08.20.02.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:17:28 -0700 (PDT)
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
Subject: [PATCH v8 09/16] arm64: dts: st: add pwm2/pwm4 pins for stm32mp25
Date: Thu, 20 Aug 2026 11:12:17 +0200
Message-ID: <20260820091652.43541-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
References: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_021730_678561_467AB415 
X-CRM114-Status: GOOD (  10.77  )
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

Add the pwm2 and pwm4 pins used on MicroGEA-STM32MP257D-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 6482dd47e977..695c9d771853 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -433,6 +433,23 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	pwm2_pins_a: pwm2-0 {
+		pins {
+			pinmux = <STM32_PINMUX('I', 7, AF7)>; /* TIM2_CH1 */
+			bias-pull-down;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm2_sleep_pins_a: pwm2-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('I', 7, ANALOG)>; /* TIM2_CH1 */
+		};
+	};
+
 	/omit-if-no-ref/
 	pwm3_pins_a: pwm3-0 {
 		pins {
@@ -450,6 +467,23 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	pwm4_pins_a: pwm4-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 12, AF7)>; /* TIM4_CH1 */
+			bias-pull-down;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm4_sleep_pins_a: pwm4-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 12, ANALOG)>; /* TIM4_CH1 */
+		};
+	};
+
 	/omit-if-no-ref/
 	pwm8_pins_a: pwm8-0 {
 		pins {
-- 
2.43.0


