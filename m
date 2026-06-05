Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC8FCD6E7B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 06:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Cmtnz5uL0NhcEWKME+3YqiQ1Tn3C+OdDm6ovZMriaw=; b=TrLFHdf5kCoCqmJjWl3IcOavZw
	FaU1ybNM1806WbExRuCcbX+oFApmo2UalwdDEgGZIObXzd7JyvIUhuRfRiSYM/pEbe5s6u0v0b5H2
	KyHmqxQ5cV1ILqdArpEYCrUhmwdjOoFYETBd1xv8t7uASZkF80nIxQLbCG+DFBXNNvhRmK/VeYIcI
	tSBj+FZML/OPMUJ4IyxD0u3MEUWM/TnqAtuWw+DmYzCvOvcpsjNnJMVm8Fd6gBTuo7Qq42Zch4O4D
	aNE5RIhJMdQ+anK0TI/+ZOMKJuSGtyne41VgW0B0U9x6XOik9gdpqHg0bZGiKm2H3gt6muK3GUK05
	0fq80l0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVO3h-000000009pu-1ZKo;
	Fri, 05 Jun 2026 06:29:33 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVO3c-000000009iQ-3S1t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 06:29:30 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-45efa80e0afso1209150f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 23:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780640967; x=1781245767; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Cmtnz5uL0NhcEWKME+3YqiQ1Tn3C+OdDm6ovZMriaw=;
        b=XxyzyXaKRF6pnERTAiqgY9Vz82buE4nW+KHAwfCMZ29dhFYRhIIyqTrekNfRUW9CUo
         x28YtOHnr8Dta2efxu36kL9OOe73NlQpmxIPCj3BjP/RCd1+2aa+0epQTnSrsTfj01Gb
         +/ITo4FOaPYW/0HDNj+ulGwSvPM5wDlHs4Jmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780640967; x=1781245767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Cmtnz5uL0NhcEWKME+3YqiQ1Tn3C+OdDm6ovZMriaw=;
        b=lGnaYo92e2JOneGqJZwE+6vwdcvj0Tl8Xy5/GBgmsdVywKKugtSxYF456fekTI7UTU
         niS5wGhVEvQcLnykjnbYT0X321lLrvnsKU+RM7ty88x4XiXHzPNNyOudZTGT0Es0vO9t
         VnZbAas72Bl2wPAc++9VJJkjbeeKj8Drw84UeHxC0v+oZ9Vj5YhYvhXMyEsNzbqp+Dmm
         pDYUbwz8wS3qAC7bDNeRJFafxXO90GkBHZg5QdKsiMh8h58k6wobUjtfJwH6+lyfPwjz
         T7+Ycqbwx2ta4BZHvJBZ8d64uq//9E/1QcVKekZIAopOrrgtozEV7COeWiHVV6XOX7Wu
         vYgw==
X-Forwarded-Encrypted: i=1; AFNElJ8mJGXW3lLG6iNBRgTepH+pMYu7pG33r4eVZ8Z2w75DS7oy5htlPL67uNYzyorJpfUZUUfYt0foPIj5Hala98Tk@lists.infradead.org
X-Gm-Message-State: AOJu0Yze3B/b4m96kSN5xG6RSX2LU6tlMne2H0g9TWWQkQnm9l2rQoka
	qjBOAJ90wvRvyyoOHxyd+lWjYxwuV2XXhak6smjY5L485GfxMc6eSYy+8Nuu1wx+nNI=
X-Gm-Gg: Acq92OGQUeCAzhxVyF35c8H+WAnmUxgoaT3zDYhgvWi+3qTP7iGhTxbKeZaZ90Jlirh
	+O/2yTeli59tOfHlusU/ZnYezLpl8A69XDPq83Q8dvsPWmFqm5gQLrQw4iQXotPTfXZEw0pD9Bz
	+yIFCCsHOJyR0K3dWJfw6YDLqcXhVEZY3cXfRRXjMYPu06mZ0f82OoEY47hw2u43wHj6+hs0PFp
	BUsRej7bfhTmsyrez2AOOR1FD9oqlBr0vu8diLpBkLd2QENc8URgDursw3/mAAqLj70GKHC4IoB
	0q76t7fD6CQEF1i0D1cRpTwcc3jKjXs2cpdg0SxlzKpDsbPnSbUcoTeUE+PgQikxvRq08ih7S9H
	8+3I+O7mOTyFquWfx/64+ZNCoTJEgFmncFsQgW8P5Ey3DmcxM8Gs7C6DXMuHQly+TSyi5A756o1
	QFDW/Iyxla7kKonCWLn4sweboV7odrs2dxlkAPQ1UYEjr4niqUtU3/pxK3cHp/7oLZ5KYpvfDzH
	5tNLLjVdVfiU2wkYIp8jV2uL+odsxzHznxL0T+3Vmz57MyIiT9CI+laMFPTRMgiciiSai1ovWno
	ARYHQtnhaoGMSGmO6CeUZVphcjjkKexxQc8W9P+kU8BGUQ==
X-Received: by 2002:a05:600c:818c:b0:490:b0e1:2161 with SMTP id 5b1f17b1804b1-490c25b39fdmr31776185e9.2.1780640967237;
        Thu, 04 Jun 2026 23:29:27 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm23022648f8f.19.2026.06.04.23.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 23:29:26 -0700 (PDT)
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
Subject: [PATCH v3 11/14] arm64: dts: st: add usart1 pins for stm32mp25
Date: Fri,  5 Jun 2026 08:27:39 +0200
Message-ID: <20260605062900.368376-12-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605062900.368376-1-dario.binacchi@amarulasolutions.com>
References: <20260605062900.368376-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_232929_218761_A7A10E52 
X-CRM114-Status: GOOD (  10.27  )
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

Add the usart1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 46c5197dcd63..a72c458b2c6e 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -766,6 +766,39 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	usart1_pins_b: usart1-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 8, AF6)>; /* USART1_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 10, AF6)>; /* USART1_RX */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	usart1_idle_pins_b: usart1-idle-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 8, ANALOG)>; /* USART1_TX */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 10, AF6)>; /* USART1_RX */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	usart1_sleep_pins_b: usart1-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 8, ANALOG)>, /* USART1_TX */
+				 <STM32_PINMUX('B', 10, ANALOG)>; /* USART1_RX */
+		};
+	};
+
 	/omit-if-no-ref/
 	usart2_pins_a: usart2-0 {
 		pins1 {
-- 
2.43.0


