Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EFEC55175
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 07:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y9eicy7qFkVmMZW611/qMDh6GaEBG59Bdrl7IT5yIvE=; b=XPpSasrxfdni+7vHop6bOL7lPX
	ZnS/QqeeVSaDPVSXGwA0G4VRL++V2vfEGMd5z4dukMSfl/TYy8ylNSRzKbPSe9dKAr8lmtftISccd
	3t/cieNNUUX51rKAnIcfIG6jDxSvycimfyFOz41pLUt6Sx/TPY4pawB8uLSt8iAbqChj1GmBNrgnr
	fU9Bv+Rx4t9mgTG3mBm619MRzMOLNnxitxuhbeIlFRISLz2S1fzd/MtsUTWzCER4WzBSL+BvVGptK
	oqByAYmU6A7kFimFK02oTq+zUeF/unWMv056Yja+p4F1PvIftjULGgoKEj4KJQaMp/zulqTKCaAOJ
	X3U6VIvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnKG-0000000GXbJ-2U1v;
	Mon, 03 Aug 2026 07:43:08 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnKD-0000000GXYV-4A7k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 07:43:07 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so16288225e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 00:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1785742984; x=1786347784; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y9eicy7qFkVmMZW611/qMDh6GaEBG59Bdrl7IT5yIvE=;
        b=bORNmZKTmiSlV2nqIk/HX/2gcV0xMMLUFNzy5s+dVXmhtEIoHeUdmy9eDKJjkR0goN
         BK3HCiimdFovyLZr0TM9my+AQowzllyJ3lFg8aNBCo6k6XrA9oqOhbKtD0RD67WDik0N
         s89PW5FSkmaM4auFDcQjEE3tLIpysc33/H8aY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785742984; x=1786347784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y9eicy7qFkVmMZW611/qMDh6GaEBG59Bdrl7IT5yIvE=;
        b=iOrCyZAzGxcJFWZ92Ck79kzcUOt9HK0GsUjrkxi/m/9I3a6jZlrzEKNbFRruEgAwzP
         HetPuFNKE2u+b5Ml5H8wqrQqH7O1Nre0h3uWa1jtfJe88fyZC4n71ZcJ1xxGrKpkEYlG
         haFZdkl67ljmT7X9rt06DCbQm5lOx8FE3Hn5pRmqQEnACVHIdcPX5UBBdIN4w2EW/NPp
         RtA9diAFyZS1GNSHaHclEyVdOa7fE0LD7LRbuKp+5wghAZ1SKtfb9DO6YbD4BRmOV7CG
         tIRyB7Gx5O+HiUol9judltfq+XHAn2i4I/vZM2gmJXcNi4f4TCJtJAd87bHIIVfvz94z
         mg1A==
X-Forwarded-Encrypted: i=1; AHgh+Ro2YykaRUoXtk2zHUsKBPYdWO2h6C13M44ZUJWlfiXKadZYCslMCqyxk/a7EEVsGe8prsCvBkpVOW55G78E0aWF@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1ae4LcvppTQ7xYXyHbdQkjYT+SsgH9ExjczMhZWtCJPcLxQge
	QZ0xDoZCjxeStmBMmHu7cT2LWrKhpBbWmQmfeHI8m6cxwA+JbAzoQopzW7FU1K/AxIw=
X-Gm-Gg: AR+sD10BWKd2oMwxiu1QnDDhxMSPwMdV+I66g1ydtRxCQXNfdZyMqFzxMkxMZG+05LZ
	R0hM9TbrceYEJ3+9e0PQC0J4YEwvRVk7tu7f9HGUwZVrIN4BcwQ/mpe/wCXIYAN3NSbKdHUsOPp
	XewPHmxu74qg9HhsrExhDXoX2nQ4/+xVwcr2fhk40C3QQV6S+pSFAA3jSowne2hI9IQYJq8FDlS
	a9YpAUgt8ozXypbpJTJwB+2em/k3reDOgGLZrTqOfAHgpjtlAmZGFXD2fIyigv4HKXIaDp6JEhD
	SAwOK8t9rYuR4HtFhoGcgnGhIdQAEDBIQ3gkuYXuqpK/mK37cOYPKZpNisfpMmE9TZojQiosZP2
	H2aOwMan81tvv1VLpCwdLpnaO+5k6qZDbTnI8avSD1Q81j1BAgPvwu59s0U1BOncnT7JlWu5U7y
	QvK0UXKC2TiEOGC5VSPRe/s2tgzdd7cwV5ZsUGsexYwy+dIQvxV+ooMhnJ7ITg/CNXyR7nnClCU
	cfzbbSu1K+5Aij3fY7Z7YTuYoDDLKnXjl6QsbFsV91KIGI8gltE94tB2or7lzH4NYAQBS4FWv9r
	M9BOmULkTi0vvzbWbq+ihRMCAg1kRyqSVna3NAQiu+CbUQpKcCb//YgvfEN8am00
X-Received: by 2002:a05:600c:4514:b0:496:bbce:f3 with SMTP id 5b1f17b1804b1-4980eb4e952mr186840285e9.6.1785742984105;
        Mon, 03 Aug 2026 00:43:04 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1a58sm30370503f8f.7.2026.08.03.00.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:43:03 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RESEND PATCH v7 09/16] arm64: dts: st: add pwm2/pwm4 pins for stm32mp25
Date: Mon,  3 Aug 2026 09:26:04 +0200
Message-ID: <20260803074224.3821911-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
References: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_004306_047876_B90680A2 
X-CRM114-Status: GOOD (  10.92  )
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

Add the pwm2 and pwm4 pins used on MicroGEA-STM32MP257-RMM board.

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


