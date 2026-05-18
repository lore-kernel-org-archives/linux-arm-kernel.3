Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E45CD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 14:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0slYHxwHAzBwt+7yChfYMvMF5XK5noAXmNpRW6A4alI=; b=FBKfYJC6Pw/gkwqwHKEbgtu8yY
	QR3H3mklaDZM7IF3vCwEBm5BiVNmVa3TVUs3VoLuHR/OsxEj/o80Y5HKC66fWbUAtbo8YIMvyS+In
	8qjoCIaJguswrV+K/mlGmMZr4+e8WCvTqtMPFIC4r+Z+AaIVuBEKCbE49Sbn3XTrRsR6MOPmLkL4S
	VL5ANahMImTH6kdbuBLXAcyP5Js8tO0eSF9fLCcNCmCNWEoQKubff75hfuQu+VP7tzjBr0jmvsUrg
	9840dLXHpAwNZdwHmjWoY5FhywhWmokt8Yz5+gTp8XsdME+9WzirJBzhNq7pcr0NUEAKtbwH8aCav
	5xKvBqPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOz15-0000000FzJG-1vMe;
	Mon, 18 May 2026 14:32:23 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOz0v-0000000FzBb-3UNl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 14:32:14 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-44a5174670eso1270940f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 07:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1779114732; x=1779719532; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0slYHxwHAzBwt+7yChfYMvMF5XK5noAXmNpRW6A4alI=;
        b=HdkU8euUip0Exncmnxvb7IQcRjb0ZhhrnzBVgAjWhZ6zyK5r5MEuSiZx3/T7UPTpei
         5uBpFA5eUSLm/yJSCjVgC+7x4R/1V9NCFTpdSFaEwL4QDNIvR1dIFRvjYzonaAw3670u
         Qhg7tPhx/2X6mqotZ/9Mz3Wr9b8QHhIZiCUKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114732; x=1779719532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0slYHxwHAzBwt+7yChfYMvMF5XK5noAXmNpRW6A4alI=;
        b=cEWnbu0pmdIfFNJrkKOszTZxoEtKPYuIOkSulcMZrNPqLCOwLrdFHjdhzQ9DelmD1+
         8uBSRjR6uYHLxSKiScEjpjlYRmw6NgeKJ37cCy8Rf5XC0wC++IohPaw4/8f/bYFDF0GR
         BFgoLnRTi7dGyzQfxKFWYtoPMNEmb3gLNVmq1R83lNhLiqVSXrPATHKF7eeYevn74Tc7
         cGnNRBVBGS2HtCke2uGLvKjEx7FgRaDfVbptgfOJaY3MofMgJvnpyjrRdZ0Fb8X9urlu
         PqQbOUkOCNeBrLL/wcyX87rqnLLZHY1qRDcMriFZc3Yd43SYYVBoSaDGfXpAal3/3xwt
         on6Q==
X-Forwarded-Encrypted: i=1; AFNElJ8h0XcjiNfqKXGyv5yDULPBVh7ss5fn6ZQo+ysNoFWCkmsbYmsvsfkCuJncs6mCKoWMJBXLpQVBEQMhZqOB3W/H@lists.infradead.org
X-Gm-Message-State: AOJu0YzNHEw/g6VXZM2tXyFcx15/FWzI3ZVE2v5IFRDeKSol9t1BRZuV
	wt7QUJgdLtG6I5qRqfQ1q6OrbwWnQpB3MlUCfPljvQf07TmtihUFe4qF++66DUCyk/Y=
X-Gm-Gg: Acq92OFzJg+lP+7Yea0Hnwrf8BhRWP/kcE01YTlev481if50N23iYFtpsYJs2nPAa8I
	4Q2lh2fYSwMwupb/CTWWHElYlIevHK9YdFHe4HbsdUiKCI+ikSe/xRllwN0kaYwSlbAykoeNGfV
	QrkzpXExUcEi1HSs/7RNB2lAPqGSAutub2bRcqq8orqjMB5M8AQi3Vcw1bbBSY2etfkF3ORDlib
	Evt16xMj2xTOQ4zzLYfGoElCDtGp0xGq9oqkviIR6FrrIHNy50u3L6e+/1cY67UaKMAYFmup3KM
	BtaONB8hNgE5WHY//lWY2Ep1Cuw6P7yxo0pO5I7AfttHURjuP8Ck0MvDaGrFmfLnRAn91FFvCb0
	EEd/Kgt7aswdOkz9Q518htnGGezIr1muL2feOqdLYjNEsptrRtLGnn74Q0kMgydh0b6bjXnDgHl
	2Y+kLN+jcIud9xrs0bdQBvMJ0ZSJ2WuOIjOxOaAIKKYjrtbRsjDk+Zt2uUu6rJVQZtTofJFqsk9
	wVAD3lJ/3YZldUsOQDI0OvzGnDS1acMwP4l0wfuoRqaUYM3
X-Received: by 2002:a05:6000:24c9:b0:43c:ffee:ee94 with SMTP id ffacd0b85a97d-45e5c5a0198mr25817515f8f.11.1779114732101;
        Mon, 18 May 2026 07:32:12 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm39564572f8f.23.2026.05.18.07.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:32:11 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
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
Subject: [PATCH 07/15] arm64: dts: st: add pwm2/pwm4 pins for stm32mp25
Date: Mon, 18 May 2026 16:31:22 +0200
Message-ID: <20260518143150.3138712-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
References: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_073213_890583_8F518B12 
X-CRM114-Status: GOOD (  11.03  )
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

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 4be01a6574c7..eab8ebe71660 100644
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


