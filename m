Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F262CD6E7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 12:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kXBts3WbuCXiU0EHch1WC7B0zhmdg6BYHc3PSPue6D4=; b=zRdvfKmKQR3SpLt1JRAXy9YHxH
	X/7rYVEHptUsSVFY4GigX0XHm+HdPIubOvjTpDwHyU7gLV7UlUx4yS7iDQN4dggJ9sQfwUCWBrecL
	UzEIpZtPNrIWk3E/8Z+YEgR6HxxQXnrRfGIcA44SySrZob3nu4P7gL4RIOz/S0NFIvVAJY7hClmOg
	zS4QSVi3QjH2lWDZZ7xAhB8eFLLUcSfRS/s09L36XgESuT+wI7I3Kn4nANmslmGyiOwRGvlcNCtYI
	6dWucVY+e3KR68FsqFDSyEMaORXLkde9OnKOvCRYEJt0W93q52+Ff0bOBELhVQQmT/7UoM8jMdvyb
	3FKtLc1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVTXG-00000000bl5-2G1S;
	Fri, 05 Jun 2026 12:20:26 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVTXA-00000000beL-3zob
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 12:20:23 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-46015dc517aso1555050f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 05:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780662019; x=1781266819; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kXBts3WbuCXiU0EHch1WC7B0zhmdg6BYHc3PSPue6D4=;
        b=GwZ2iyBa93+cIvYBjD0+K33zggJ89WT6IxcqVeqMfviuwoE/fYIStjpKLtbSNsJcHP
         /VlddyhJvrxD1h5DTL9h4PsmwfJaoSKWNOxTn7dBqm2fGswNjQ0vZ21TBuqU4Zmmgvw9
         6FclYVqy8ZNXoNcXRQsMqXjA482/ZGrUclJD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662019; x=1781266819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kXBts3WbuCXiU0EHch1WC7B0zhmdg6BYHc3PSPue6D4=;
        b=E7hVLiqS81BQAG+jH4hiieFTXsCR+WJxGOHhJpkjQZVeQG+vrnV36zYa6u+X9W3rFZ
         33KJT+5ThGsEQ7QKshvWGi6D5X+o6xPIbeW+NCY1MDKWcKkgB9Y29wJUtcGGiEzVcxYj
         mxvWEsyXw0O64v+erfhLkntVnNel4J63IdNr1ktvzftLpJfVUYynVLwiES7aDqmE7oYl
         u8xr9uN+LW2BOcHy8g9PNQSOv+HaO8kg41bkIxzd0skrCvJUKGiEodD8/7YyVrosV6wQ
         ahX1r6yioRjrDqanqNtMsc3GtRrCdDG2kaMuxBEProxKGa+P1VzrLFCwZoCJ+d2337Px
         wz5A==
X-Forwarded-Encrypted: i=1; AFNElJ/1CW8K96XLoXfyGtzdirX4ZgXr9sylroXFBLDFfYbD9mShM/mDIKEeTE+ekUr7hmi07aggWtvDmm/uQAUN1qcA@lists.infradead.org
X-Gm-Message-State: AOJu0YwEdAh/9BBVDYqZZkHsCghHgW+mi4QkRf9rV+MEkKBomXdBR56g
	qx8HQPiFSP1O9C1Ej9FhCa7Xyx62IpBLPqdJVdlUY0C6TaGV5LlFkV6bBIA9129eb0Q=
X-Gm-Gg: Acq92OEDifkmyU1eeLQO3gBoOAJQChArFa7vX+G/OsuPoMQq1SQHO4vzSERGtIlcqiI
	voqNFcWukgCa7kAMnQ9PecUUvn3gvsF2EYWDcY8OWp0ATpDxjXObAOZ7idy8NrquB5hm0fadRBS
	sT3ne18nts5uzFxAGF8zj6BgwTUNX/VIrTJqCzIdPe9OKiQse5WuVoMu0OpgiDeLEHccsPJ/Mt2
	0kDgjuo4SZFR6bcPnBEs51L/3Qxn27ekvpGH9OPiVyzz/nP4QpeJLQhkZrfVHR8temb4e3joXfs
	1kBEioHiZIKimGtRrPzuM8geoLrxRpFTlgxN1ONYdsxlVSKIMR2h9TX/LwcEQRr8/aBfYhu3dgj
	S1afv10c6bLQXrYa9zRs9K/YeqJjh851Pgjj5M9Fhe8Ipqgz5DrtDazZ3nAwekteNE/pE5tqZhs
	tZD/iJ5CSA8RmMPbYZ3nzlhOmJAFrf1TR5MewuP5VYmFrKE6lvKOCijuUdPq1pHgnIZ5CpeGNVo
	VQ8LwkzSMtZ+UZATMUzFBz2SWtcAtQTPiL9ATMbLAVd9xJwZfjRyEd35xW8z6Z2rX3j4HMyFsn/
	YTrZD6oxvfF/a8XKN1uLM1QiFQmCxcr1Plg=
X-Received: by 2002:adf:f30c:0:b0:45e:ec17:430a with SMTP id ffacd0b85a97d-460304f9ff6mr4772692f8f.11.1780662019076;
        Fri, 05 Jun 2026 05:20:19 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm24785883f8f.2.2026.06.05.05.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:18 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
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
Subject: [PATCH v4 09/14] arm64: dts: st: add sdmmc2 pins for stm32mp25
Date: Fri,  5 Jun 2026 14:18:20 +0200
Message-ID: <20260605121957.78409-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605121957.78409-1-dario.binacchi@amarulasolutions.com>
References: <20260605121957.78409-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_052021_004035_982A1043 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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

(no changes since v1)

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


