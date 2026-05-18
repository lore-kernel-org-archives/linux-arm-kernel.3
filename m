Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757E6CD4F57
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 14:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iWi70U0jso89vNkeTSGJm/hmh+o8WPBNV6P94K1wY9M=; b=UQNFkfn0BIrE9+EdisJh6JfuLt
	WiNldp/QstMysm3Hm/YS3LrsSw6QCFw5re8ltmfRhQbROeFcsTOc1tBMHwVKEe/XRSjJDlSux7jus
	wZUvTtBm/VdSXnSFqiWfjlq3/0WVui3xns5+VpGGn9LedzXV2ml8+qH2sn06IDv5GkXfZKDqsOgM6
	JNtSJwDxdsiu4/T5f83CbMCz8YzsQ0f5E1Wgh2Z7V1ivciqqzEcRDF43vzvdb9ws12PhP+Omghvy+
	IzQSwzPfXAbMNsyWFpuHk9EbHeLwKJAFCXuKiweya7IVU+BLaqPglXtuJoXMtuui8/ugL/pyccOzr
	EOyPJHFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOz15-0000000FzKX-4Ade;
	Mon, 18 May 2026 14:32:23 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOz10-0000000FzEc-0MDz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 14:32:20 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso22916255e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 07:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1779114736; x=1779719536; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iWi70U0jso89vNkeTSGJm/hmh+o8WPBNV6P94K1wY9M=;
        b=MOqhRgvS/CuUKDoOczI/DvLSJBvoZFg8WsjJXUw6vP051wcenJHOVxuj4PiR9Yc19z
         F4ZAMDMWwEtX9c/W9i/Rp9M9fzHWxC73TkjulfD6SqnwkmJccTt5odfQX+KJi4GWKb2d
         q6KXvqN03KQdGGNU2tvt+1ePVmS8xrU+5S/JE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114736; x=1779719536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iWi70U0jso89vNkeTSGJm/hmh+o8WPBNV6P94K1wY9M=;
        b=QwdzIkI7lvg9i7HBCFYCZ4rB3uL9q3sHkD9xsqPfg1Lme94+Fv3XhCjvT68BtYWYAd
         HUCKH99B9outdMk2SYRDy01R0bfVHTiZqOsUpjsN3UKD8j5pRbjqfwAukNFcGa6Qytp0
         abP/kQka+bi2mygewBVIqQBRiVHtC7l25zQa2WbsoegbfVaq3sz72H6ukzqvzOGe81p+
         mWct1h2SmUB4UU1eMvdXI8TXfefmiJox2k+pOQAqqpRMSEssOdQsWkpnhYDL55c90adM
         OttnwULc01etO7UWo7JoX3lgnDNIbe18MZttFu6Um7Yzt8uqF6R/ZIRYKvbQqpM6GcqY
         JjZQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Stz6rcjiYR+7wJlzX7sMvuKHH6LQdJuwSyYn0T66HiDWhaCyHK49ds8HT0oJZh+pLPz/JgEDVZ7m2iJqVNSXb@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4Zm8T1qsuwU+UT7ZbUiQRWldLWEuO5c5ep0vv+rNE7ThtnWzz
	zuJMorVu5TA+OkewRUZEmnt0gbzohlkUwV47OzAFbXKSxdbHsh0qeDOptPbRAOI0AEE=
X-Gm-Gg: Acq92OFbJc3ey3oQy5ZPGr1s+A4I1BBPcij+WO62WWf2W92Nn9gvp/rO+76gteTtBtX
	bAJQfD4g48SN5K/blqtl67Et1WKM0dy+oSZBvIkCRGxohBL0fmvXmw4JbAo3JEgrKqn7gG9+TvD
	eJHQtkJuJbUUMw+qEqtODOEGN5ekR5zv1alfb46uP0heXUrbrU2O/fa5lUjPxhmDwTi6mbHKzQx
	d7X6E7FCfrV5W5AcK+NMdANXQ4pJEu+M+8rYPEsDzMTgqE3nUZLqbOGz1kwhPUauDe5HEsvLNnV
	zdA8KCe5SBewEXi4QHkjs9RUT5RqgPc/rsh6xohOABbrXWnsMoer8vQ9LZvEYrtr+/tNkoPE5/B
	HE12A2UT8zNbsJwyK2UUcvDVioy/FdOatcKjvPEoY+0pDi+C1BsH6Eu/nF0W9EwU0Ms9XCGRnjz
	FNuXshes4mdnY4CZ9cvcJAAXvxyeDAddqRuqKaG3aC9a+wmBc4ZcgMI6ZbpdsBsm+Lt1DeVlt+a
	QECKdiRDfvLqiEfukRR1hQ1+aYhukGGgqM4Og3/8fvmExDJlM+pTafN9Z8=
X-Received: by 2002:a05:600c:8184:b0:485:46fd:7887 with SMTP id 5b1f17b1804b1-48fe60edcefmr232164425e9.13.1779114736213;
        Mon, 18 May 2026 07:32:16 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm39564572f8f.23.2026.05.18.07.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:32:15 -0700 (PDT)
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
Subject: [PATCH 09/15] arm64: dts: st: add sdmmc2 pins for stm32mp25
Date: Mon, 18 May 2026 16:31:24 +0200
Message-ID: <20260518143150.3138712-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
References: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_073218_139492_05087FED 
X-CRM114-Status: GOOD (  10.40  )
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

Add the sdmmc2 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index ab1e62cf2bfc..62f898a55d45 100644
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
+			bias-pull-up;
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
+			bias-pull-up;
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


