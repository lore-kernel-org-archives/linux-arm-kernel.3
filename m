Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD599C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 09:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W4P3RDq+QoFIrungFJ6qmguRlrjE9G4sn4ESNQyuys8=; b=gEhipjt8FihpLX1/1wypZ5aWB1
	jecOrIIel18CqRPDvcsjm/cbSIzBQWAsfpBxFazFzmCmKRx3aq8fym0IEPbtnWHe+62/CMhjAPF2g
	hX5hAJC4bJTtI7Goz4CXvDgEbOWwCxQ+0fhafxZXePQuPLMMx4vCxKl0PVFVKFl7qAqzre2bgNDQv
	dFxfzIBvMIQa8z0V+GqvJJ6imy57e7i8puG6df0QXeztVjABAuKCsYTgdyulYccqwaI30W+k+ke1Y
	W3G98SSi6S7wdNXKYE0udgCmFYAvLLCUBk2MsFLZeZDmMJ8EojT0hWrYoVnTbFulyzcokW9Tn11aJ
	gPGySGpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUkv-0000000GQVv-1NR3;
	Tue, 30 Jun 2026 09:27:49 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUk9-0000000GPiG-0Iu6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 09:27:02 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-4703bc0a99aso1737889f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 02:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1782811619; x=1783416419; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4P3RDq+QoFIrungFJ6qmguRlrjE9G4sn4ESNQyuys8=;
        b=gC3hnJaXJaNK8u3TEHlDfLVhh8iiG9ZKT6y8c1iVvjAB2oYU2hCoE3NbKNNrAQpv+O
         4kdplkGRBM5n05LQ9+i+WnhIu8tixRDJVUl9zGO2ATLiuDcy5yhUxh8YRQ0sVm0l6HA7
         0OQ985gRWwe2Pt7SJsyzcD6URJU4woli12Hu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811619; x=1783416419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W4P3RDq+QoFIrungFJ6qmguRlrjE9G4sn4ESNQyuys8=;
        b=gShfzqUGuStVukbGaEsiaMdv1W1LowGRZw/q89T+x2195NJ9fSn6rM8cIQSB5qln1g
         OQpKlIBdAivoNHGZ39uh1nPegl/XF2/ZTN/MzGsRngDWf8jfdyJ3hY2C+DNAFnHgc1XB
         UKtDdvHT/be8nof5BckA4ipOfS3sWx8ToMUO2TGzdOydjze5gk5KvXQ3JvV4SSikxt3R
         +lbMay1AXzrBW43wUE7O+9WOAM6GXTioZlYGmLDMnYGcplMHYTgG+ZDYJ+3R5wA6dpNH
         2SoPpT/0vAQB7/nN95otQTMifskI7L+0VRlWxm67xoBGwKqoklUvErSrsY/6zjpRuvig
         Zp7Q==
X-Forwarded-Encrypted: i=1; AHgh+RqRXcZKwivSuIW0UPvlhMqfZo2IwjNoG8aRNk2DoxrZcXIWYzz9FUAspVpXj4Zm/7g31O9HXqWJGkfnFBkzOqlm@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3REF5O5dGkVdRT75DBxiCb5+Sek1FL4cHdaNNhwbZEhZv6wcR
	PG+jhRuaVSEDQOY1VJXSBoGzym74bseBTWoODIM0MIeYrisqrMC2c8rNYN1o3NnHsX8=
X-Gm-Gg: AfdE7cnvE/geVgLyvJKAypIRbvksGAO6nDkWRDThuSnzsG488fDXk3+2mBzLcqZzTeZ
	ZctF7fpaaePbSnWWND/BhtMcKiH178KPjFkCoGRO33xEExrmdSK1sds9Tz0HH3dbqWiskGJCfku
	2X8b8S31R+q7/lWblSC1l+wVlm5s3G/nW1nidot1HEfXL9e8H5w1P+OmJf8uMbex+Z0j7FBM1zJ
	xxFRpDgjfHWR7mwdt2YcVqmkMLdd47xyi+JLT/c3GZkQ5SmnG+u6QGAkZv8WAAm8dXdLYtdTAw5
	HTUNGl0hEoE1ZeCBBEgyNNf0syxfjRWG/fi/G95GkdX8LwAf0XX88eBl45b+Cmeu6w/TVVwPxg+
	f26yhotjY0myrCd845qWZ01EIEwlOpiq3bgNvKHvVUXjBaSTlYLK81VhmmRvkd5w4oDaYUmgm6M
	T8pAASut1TpB7ewHhHuAjsgPRbVah+IyJZJkzlRv7/uzQ51JKkxAdwXaDp/9gj2w6r7XjUziPMC
	4ZJ+1qOwFoDPM+Bn67XzHp+P5bzvrGIKtJxUDLCI5bnSNSaUzyZMjPhrbTdO04NnCuavsw7XmR7
	qLEa9hA3KUgGxw==
X-Received: by 2002:adf:e195:0:b0:475:f0f0:9efc with SMTP id ffacd0b85a97d-475f0f0a10dmr1512953f8f.51.1782811619467;
        Tue, 30 Jun 2026 02:26:59 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47567a6f0ddsm5669083f8f.37.2026.06.30.02.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:26:59 -0700 (PDT)
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
Subject: [PATCH v6 13/16] arm64: dts: st: add usart1 pins for stm32mp25
Date: Tue, 30 Jun 2026 11:24:42 +0200
Message-ID: <20260630092628.1695560-14-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
References: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_022701_148569_B6AC2110 
X-CRM114-Status: GOOD (  10.34  )
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
index 4e570e2e5157..d515e44832d7 100644
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


