Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30626CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T9Lo43FKv0UzNv+DqheKNJ0v2vJAyWuHFwECjygzQOw=; b=wDAY+Fnx1hlIqY1ask1yXtMsmO
	NtZyfCzALRXW47NgfV9uNHi+HIcbPKJhtJ4/CP8lFTtINlfMo9g1Qefln5FpJ1qwHaDuWujucDfHq
	thPdRdxC2k+nbH7DM8dtTtk2QAAIOWx8OxcUckXRIUrvK+aMb8ALzUQ5j/E3w2ZZfMHvoVgWJlOSx
	x9WERBpERqCVSEyuvGAkY9olK6Q5+B+zdPfRjH0J3nuVpKakHWMbMRRxKJpm4Cdsa/E9a3X7ISV06
	H7mQkFjYvM8h4N0Qa1GZLzD4Y1A1BCvEE4Eitds2YyKx1miY5sQ0s/q8r5BzrQ4lrGEWrZD2fUDMJ
	inw+CF6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWasN-00000003jgs-1ZRN;
	Mon, 08 Jun 2026 14:22:51 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWasI-00000003jZ1-3XY6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:22:48 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-68d234218bcso8520800a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780928565; x=1781533365; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T9Lo43FKv0UzNv+DqheKNJ0v2vJAyWuHFwECjygzQOw=;
        b=r2Q3ZblUkyoak3gKLVYKBfFo1DTDNX2eneigo957iivIR1wY89JxRFEVYbUCTkE3YQ
         RxgKx23MxXbno/H/o/LXbMZr1wD2jcCuWUqRqAnhFL+JyjhfAkhcamgpLFxC/d1cgnUP
         y5tuHd/yKD8fzyEK+fP7rE+EldUqVr0UuYBqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780928565; x=1781533365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T9Lo43FKv0UzNv+DqheKNJ0v2vJAyWuHFwECjygzQOw=;
        b=L73uAA7scdJyAFUSWrD3BIoRBtTqf7+cRJBlErbA6V3Z7ROuCz/e+Lzh3aE5lXs5J8
         FwDDeCGh1U4Iq0aOYJ7YyQlfelLVOLuvSwdozTLxAyZi+Njc34ZKPTqd1IO5eZW1TtPq
         GlneARMMOmW2j3rCOasgezYb/YKRpGo5Ef/IYMLmzo7vS06mvc6iG5tTkeyYtRlyiQU1
         1UugTyHARnsYz+qG8cD/yYGodB/yvyD5MWwghM6JHuT6Tk+6k5KU3qwgJDiZ4IJJrgrV
         jZ4IzFdiEYdnTMkAvjt2XB33sMlWDBhTHjhKTkh03xUxPXp0OOYYdZFZezgY2z9U6z7Q
         3dCA==
X-Forwarded-Encrypted: i=1; AFNElJ/3YCm3wBloADnybQ/POTr/QxhayzqUPJ5cwlPnpjDgQWVlnV8Ng4DD8qFUKNznq+sN10ETcMznyFTp0r3yT2mf@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/9I9oiV4RAGxQc3wOwNbQhFNLas8BaPBPxl/Lphs5iIWCIZGh
	GXZZcNoHs8+5CKnGJelUyMhd/FwCadeTAe8Hpa3R2wCuAr9UcT/IGwjqUUjEsrtWCSc=
X-Gm-Gg: Acq92OGL7ugXYpvOWpmP+m4bkfxhGr2vCcPaCG1oX9QtFbl7PiTtbvWvhstwOYpeXD2
	xouWeJwgkgt8+RnP12+T1vZQdAQdT4Rbp7CtKTJxzzZRotz6R79J0i/5gSFDCpVQ51k/Oq2bCTw
	Bo4nDX9yOn6JqHay6FnnOxh8MmRgUlwReztP0u0fkOIzCrAwoUnjjJQAoCgESwEN8U7UZ0HB9L5
	ouclddwpJ3W5MlyvNiKi2/B/rIb/SsbOX10RC1KgOUMbMCsBJl1hbZLpg+nU7oRU4JRee1q16Wl
	Is/0/pdQKqZLOCDk6pU7MEuxzZHFkP8TEIIjxKzdqH+oG3JPOAxkx0tOWmkPz3bW1bzdGZcrBoS
	ibRKI65ewc3ZF+Gi+Dma7QYLHS1KZmVKS3fNQS57pRuXnwRiRsdHuzsxW3wEmu9efgzqNAwKc0R
	RvOr+hRIwQ0exZqDYiSktGuxtMSCXAij5HsaE7vg0GhET29iwzGIXLNkx/aOWT85J5OOAjP1ulp
	btwPVWGY+xsEU8KdBv3kDbqHJXI8IY9YxypA84okClnGlO4mYVbvp6oYCg=
X-Received: by 2002:a17:907:3fa8:b0:beb:3783:ac7f with SMTP id a640c23a62f3a-bf373fece0dmr837923166b.46.1780928564745;
        Mon, 08 Jun 2026 07:22:44 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307a35sm881847066b.52.2026.06.08.07.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:22:44 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
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
Subject: [PATCH v5 10/16] arm64: dts: st: add sai1 pins for stm32mp25
Date: Mon,  8 Jun 2026 16:20:27 +0200
Message-ID: <20260608142221.952245-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
References: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_072246_918015_CBD52AB4 
X-CRM114-Status: GOOD (  10.26  )
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

Add the sai1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 695c9d771853..002fbc724b9d 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -520,6 +520,51 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	sai1a_pins_a: sai1a-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('D', 9, AF3)>, /* SAI1_SD_A */
+				 <STM32_PINMUX('D', 8, AF3)>, /* SAI1_FS_A */
+				 <STM32_PINMUX('D', 10, AF3)>; /* SAI1_SCK_A */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('D', 11, AF3)>; /* SAI1_MCLK_A */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <2>;
+		};
+	};
+
+	/omit-if-no-ref/
+	sai1a_sleep_pins_a: sai1a-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 9, ANALOG)>, /* SAI1_SD_A */
+				 <STM32_PINMUX('D', 8, ANALOG)>, /* SAI1_FS_A */
+				 <STM32_PINMUX('D', 10, ANALOG)>, /* SAI1_SCK_A */
+				 <STM32_PINMUX('D', 11, ANALOG)>; /* SAI1_MCLK_A */
+		};
+	};
+
+	/omit-if-no-ref/
+	sai1b_pins_a: sai1b-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 4, AF4)>; /* SAI1_SD_B */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	sai1b_sleep_pins_a: sai1b-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 4, ANALOG)>; /* SAI1_SD_B */
+		};
+	};
+
 	/omit-if-no-ref/
 	sdmmc1_b4_pins_a: sdmmc1-b4-0 {
 		pins1 {
-- 
2.43.0


