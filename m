Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB175C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 11:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p6RQlMNeIE75J/aKW5bH4o7BGOBdS+5uo3qC0b6eFZs=; b=zI7+/MBCQCVD0XSj8cAWS1Fc4X
	IAIg+RdHI1vIHeOx8cvav2r/hCp06y1576i+X5fLS2vqb9+LDZHcVd3BlUeXc9cnlOsaB87SNnwKM
	/FcbKDCLHu3Vplq1x5FuDhrviJPdNICLXub/JJy3ySrVb+1R/PR0i3/6RKG5HhklOaZll27xp8CYL
	A8sB6QFQmbEYWHqCEm9aQVaGnTqhnplhzJ48Ff3DNYRCsl8X4jaxuwXevx9PsPzJZkyeu3LEyzQkh
	td03B4qos8TgcSM0b4yV+ICjz0/2sR9An6HWWs1vHJB2YFRyf9yVtoaTzJTfERWCjM/iZCK6HW3US
	QUv/iOig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUk9-0000000GPjJ-0b1J;
	Tue, 30 Jun 2026 09:27:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUjz-0000000GPXm-1oOT
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 30 Jun 2026 09:26:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=p6RQlMNeIE75J/aKW5bH4o7BGOBdS+5uo3qC0b6eFZs=; b=fTULp2v4fDos1pHihthFyTfquB
	h02aCKO8Ol6XyNvB/ymLVL6pjecNxiO4kb10gnxBWk0mrULMQSApN5mf212qIkI+zrvE0zGTdSz7G
	aXwUX2q/FoRRjESlQMumtvbL/kpWJzHeoUQmtRlcZsHvHqR9wrCSV80g+gqAPqqOW/RM9WXikPL8k
	MRbRZ/LJFAKJHwEUpTW28OZp63BlE270QzYvyoeaQGQ4stRUgUmXMAk2EnRheUR9TQTrZcUpNlgCS
	fzxJXQ1bcliStPvgZrhg9/SJ/xyu9/6b/yr5/f5VjX6ybcTSL9XBV+3n/ZuBFLWrmSjcYKVX6oJCD
	Ku/TVOGw==;
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUjw-00000004i4G-1dMv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 09:26:50 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-472055b0efaso2089033f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 02:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1782811606; x=1783416406; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6RQlMNeIE75J/aKW5bH4o7BGOBdS+5uo3qC0b6eFZs=;
        b=XkScsO2QRbjDtvl66qNeh0akSjcaumT9gu+eZvJFGwePELOy7bVxQqJKczQfJuSAeD
         BY65Mvt5txABIKAwDg0f/winuYihL7m6xWzcreZuaaDCJpVuzwsRovfhVEi9K1lBcS/L
         NTJSLUlX0FvqG9n5ijDjuT61+eDnJ0A8I3lg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811606; x=1783416406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p6RQlMNeIE75J/aKW5bH4o7BGOBdS+5uo3qC0b6eFZs=;
        b=BWseGiw0UAaqC4lcP4q+xq4prGpKFln/ozM/3qyL3s11IU6B/jrvqWwaki5g/vtVUx
         g2XbJNGHVMJU0WKfy8LzsbmH+WOKxuhWw3JC9IKkkBY6AVM0Fcg67+XvIEEhI9ylAvm4
         IWRT1sAYjAh0sEuiSkr151sC7nuf4OZ0Fklyj6bY6v7YTzkdM2jEDgIQKjme0kkQzMDh
         36qv0uKJ39//ew5neHdbF/kQnoELPSxdESuX5EzQq/03ALgaSZo3L+O40T6DSRsGx/pJ
         ylsy+KuTekUPjVE3Dr5+ZE+j0bhoul3eavi/vXCXEZfls6yVptPKIZfiy/2g/sQNUCSK
         iKxg==
X-Forwarded-Encrypted: i=1; AHgh+RqJ7OjOs63khmOOW+/fe5Qd+t5IwGx511JnBahRCN59GlshRg7h5fCNDdG/+HwoVOwUaB4UNeeIZXarEC3LZXRp@lists.infradead.org
X-Gm-Message-State: AOJu0YwqTqy4xX1FblSJ5gyP9eaunlevqMXO+mbrl8Iar21B8QkM2TlY
	k7gmmN21zdZobcXLCxwwWAOpo0D0aWe2ewjgQ5sYF1rzWTRDUQeIwD01AJySc2uloRY=
X-Gm-Gg: AfdE7cnlglUzBh2LD0gAdYgiMoKLB9x/nGURrneEQECAGY5FkRFLpKXHn4iazmWroW1
	0vrEL7FDNXnEDQsr+6eXVnCH/EHyQ2+nspWJo3aKzi4CfYMKbvFvyOYgGxjBFQw/J5C6MiDupgv
	2P1nLMtFqT7G8sHJ2LM1zAvF3op7XzjMdRA4EFD3MGMAqtIiiKLlgrIQhRPbHyFdShcvQsgnME4
	Cp39kL7LIu8I2x6aXWmVnFO3Ky6vNELoB/KP0GALJ2MvY5lKinJXgyWcUhKwKCBItNYN0PNqXez
	EfIV/G5cc9o2+L+1VkfzYSgj4uPQs5B+5pYRalq1qB3EVWmDhjVDWjQOv5Jv7bRY7yO8GabYM4c
	oAtNHm53hIvnvrCARXXtOBjh/3YDR07aQCy/uRixf1BisAEKKV9/AFk2+MFF9zOArMg1GgGFbgU
	P4z9fH/FqHqb0MMxmp2tvGaOXkLQQmdT2Hx8NjQMtVm1/beNKK3ZuUyA3tz3Rv0lhN6q2M7ErEk
	sfKSCCycqaaFwAwI7ioD9PYeh3fxBJ2i7eMG6hlbXaV+ZgieLuhVJzOaWUz8ECwChXRYouCzrqk
	nY2hNNrNpIgOUFWmlRShvmOe
X-Received: by 2002:a05:6000:3107:b0:475:f100:360e with SMTP id ffacd0b85a97d-475f10037aamr1473953f8f.61.1782811606455;
        Tue, 30 Jun 2026 02:26:46 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47567a6f0ddsm5669083f8f.37.2026.06.30.02.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:26:46 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
	domenico.acri@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v6 06/16] arm64: dts: st: add i2c1 pins for stm32mp25
Date: Tue, 30 Jun 2026 11:24:35 +0200
Message-ID: <20260630092628.1695560-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
References: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_102648_631793_0D683085 
X-CRM114-Status: GOOD (  10.13  )
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


