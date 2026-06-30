Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7C8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 09:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q8e2F85Jk42cknJBTKAisusI5iJFywDQWX2RRkkLus4=; b=d+LM0hJ612CYi+F5rkHruCGIbO
	LaibuhbxA+ozX/eP0lkbZSZf5ckeDky+ROgUdLYf9CQ5RfeX2Wcaxt6zfWU59FYnTaj6sL6Z8MEGT
	O4AVuk3A5WL0+5QYEAKYIgIOnL0vWHfGZIynQ4IyYUf8RuEdVOga38V7ID8jIQ5qO+p9qhCFTRgub
	AN/O7nLI4r3lUH21P8IBr2xduuTKfw2siHv2pcDnbuIGIWkTZQUnHCKOcPKvT7sRXf7qe3uvvG/TG
	8/LyhOGojrb3Ns8FmkMQ20fTh5HBmsdW4woeq08nsTl3jvo2z0KIOZO+jI4e9l9p7v9GXoy3EjM/J
	ZfQwiAww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUl0-0000000GQaa-0SYW;
	Tue, 30 Jun 2026 09:27:54 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUk7-0000000GPgU-3cR8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 09:27:01 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-4720d22c94aso2151490f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 02:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1782811618; x=1783416418; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q8e2F85Jk42cknJBTKAisusI5iJFywDQWX2RRkkLus4=;
        b=DYJiC5lNfrNBzL5ZTvvqaKULU5IrDHBD+etSZNYsq/+l5k3ZgdNNwSA6gF+LZwTDWH
         IrzIBsULJ7i6E7jdLPSu3BKBvn4sGhl5lGol4p0dFlIh13E5R3dEbhkmwlbQj4KH0gNv
         GW56LF9kIVSe5TntjdncNzJQSvjaQqnnDOIvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811618; x=1783416418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q8e2F85Jk42cknJBTKAisusI5iJFywDQWX2RRkkLus4=;
        b=YaK6lZS+AqIMi3IzBRCQu7ZET+gAh80EBb/5Ggl98w1N5vw7qbrowtILE6Q7DN1PNv
         8HDeKQ+ye8ZQ3a5RtrD8VgOOC83N6OeSn3SIKLvO/XAg2ypn8qrcFcs0kzhT8XgUVnK+
         UFocI2JSa3Xa8jCMzbpBJj3OdETVGWOntB0DMNbug/9TWRDDhXxa1Fbw2wR9v6Ph6/y+
         bfJ1LLONciGcbOWfjdlJNc87fUAVzc3wPVyfhoXLUasBhzUCMhxlzp7zS3HOrpmSFtcX
         ccxw8fZBbWJzfr2nkH+NXmMahjh3BQYo+GivLK5mpH8UwuXhQ7q0TsU3fPuomsw1xFPB
         I/tw==
X-Forwarded-Encrypted: i=1; AHgh+RqEc+QLsexFosmMvwJPY//hzH+OfdRaDTBYqTy++bQS05zKxtFU3xuXHB3ubkGzVUVJuyrDobkGdIHe2UXreeE0@lists.infradead.org
X-Gm-Message-State: AOJu0YzEjD9py6ASQKqnqEKwKwvuce5Mp9O3hsKiJawByd1FEBgZcUXj
	c535pcXvjH6Jxz1jC6A18HOr3WwRyv2l+r9LWAwJ2J81w0prjOEvfGBIV+ObalPloyY=
X-Gm-Gg: AfdE7ckhaqBbZKCgrUFqhi0Hne+TijiBGCx7lFC2e0hHhIIoBDoKvNyGUDHu+o75ag+
	he+NI30pB394K8EA7QVzf0UjVojHFVL0Gua7KaprSVtRtjDuKtyWWRWqL59LkS3o3Kj27YiUYyc
	MAjwvSOhxjyCyu2/vOEiKniS3Wbq3qLQnnRtC30yx2fmbMNg734FI8pwwhRnX6r3xA9ujDy/5pm
	DxQkjUaKx+s/8JzdT7uAPD8yfse3xjZP745h1IYIg+iD9Qs4N3SobEZJ4RlC0BxJKP4rv7OEEB7
	ZxUQhpeLj4Ude8bBF7GRjEJlBAqGeBpvkf4WCD8FFa0Jt8EcIiisgU+CEilX52g6wog23Tu43wm
	2YC+RpXWwC4QKWFdtohSmqBIE+1IXiPIkhf077suJHvn5pT0c0tkByMVr3DyUgN2JBcuQPcf+uE
	stBIR0dqnHlD512fFoJZvdhV0MEbhhjzyUdrTQXEgfsR1UXCGpi+Saf9OOsOZIBngJdxLnzDuyB
	+xk7eOHZA1cRBczZ8SJfHjG2AtEN5O95l//M1gz8wfYdEdyBbyfCNmTpOxrZvsk8zX3VsiX91Mu
	8+2m2/A0LHsuTQ==
X-Received: by 2002:a05:6000:468f:b0:472:8343:7f5b with SMTP id ffacd0b85a97d-47550da01acmr2998787f8f.17.1782811618024;
        Tue, 30 Jun 2026 02:26:58 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47567a6f0ddsm5669083f8f.37.2026.06.30.02.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:26:57 -0700 (PDT)
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
Subject: [PATCH v6 12/16] arm64: dts: st: add spi1 pins for stm32mp25
Date: Tue, 30 Jun 2026 11:24:41 +0200
Message-ID: <20260630092628.1695560-13-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
References: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_022659_916861_DB741C0B 
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

Add the spi1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index c816a6aece47..4e570e2e5157 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -702,6 +702,30 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	spi1_pins_a: spi1-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('G', 6, AF3)>, /* SPI1_SCK */
+				 <STM32_PINMUX('I', 5, AF3)>; /* SPI1_MOSI */
+			drive-push-pull;
+			bias-disable;
+			slew-rate = <1>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('F', 12, AF3)>; /* SPI1_MISO */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	spi1_sleep_pins_a: spi1-sleep-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('G', 6, ANALOG)>, /* SPI1_SCK */
+				 <STM32_PINMUX('I', 5, ANALOG)>, /* SPI1_MOSI */
+				 <STM32_PINMUX('F', 12, ANALOG)>; /* SPI1_MISO */
+		};
+	};
+
 	/omit-if-no-ref/
 	spi3_pins_a: spi3-0 {
 		pins1 {
-- 
2.43.0


