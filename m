Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD354CA0EDF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 14:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J2wGQ2oMb74lV+UDpUpsZVQOZjDtMIs56uGi332fPyI=; b=q5GKPd8a86c0bGAWDV9yED53re
	Mnc3doGutYU6cghbX26qHtQJ3u5CiE7SghpEh5Gz4eo+3FLsrEuTVMsPjvMotfaEEt5dTsY3sFvJR
	KvhyvQXFjJji12dThL2XKXxVTKUW3zJOdU4KmGL+f3/asxEulYoZuzS+lFnqAw7p+a1k1tpASJE1n
	sgKClX7l3a6HvmTyV+FZnc77o6LTRBgttixhvrOtpFY+W2Ph4HVFPm9KWAhVGXFySj40w2Ys6Hr0i
	Ic2i7of9g7bmhqmhkcsrwS7h/3NzKbGg9oFql7o9NxUYHPbR23BBVGtP/5/JZ22Xlg5zKrPrZTCPq
	GnUIO3JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulqMk-0000000B6wf-1rY2;
	Tue, 12 Aug 2025 14:52:42 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ull7Y-0000000ALmx-17Fh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 09:16:43 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-af95b919093so773067266b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 02:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1754990199; x=1755594999; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J2wGQ2oMb74lV+UDpUpsZVQOZjDtMIs56uGi332fPyI=;
        b=RxrWBU2yjTt4mXAZ2zN0ojGtFbbL6MjBUDSkA4fzpVMdfOE6i4i4OUI1QtRkoHD31e
         dIYNgZEOoDrsLtW+3fgD49hu9C6ZUWQ3AEPL3NIiTfKBxRxUwUlZlpWfwKHrzz2Lj1Ry
         QI4RYS5UwZDyEkBuk0i98C4EVRHTXRi2toc4bJxqid/ng4z+qrzBku463J1GHt1QfYjH
         45A/Tw1uCn454mL6nVpdhygfv9I1EQWLD+729dkaWBVmVC8f4VtArJ5ptZxy2WKziBWC
         QNwBn1D5uD3o39PX/Fr0pEGqvN0IbZ8cXd7wT7GN+j/9E3Smc6CQMK2o59d8hPrf66IH
         m6ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754990199; x=1755594999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J2wGQ2oMb74lV+UDpUpsZVQOZjDtMIs56uGi332fPyI=;
        b=v5CNi5LofMFoUK2uHxAakVYrC4QXQmkzaoMsJLI6892KvFFMq85Bd6TYV1R0+8GzMV
         Z84uUxNK0Dq0LsZfYgXQ+Skf9egavWuVKnXldRm7SS8TeekN3J2cbBz0W3HEpNXYwVOX
         jseFcVkZFIapYz/cX2p7Eqc0DAwJyI+xb/ZZ38cHyZZIUTf1IRmIOa5JcHFdno17LkzD
         QYW/VZ7GqRBMmmT33KrV/vbtXI3H0AMa8pN8+JWXrVyUb9CYiIrCeqckYnMvixe5sd6b
         izO7I3l1vErhDhWI87whRVGh2KmTOjemnfGnmNOtbuQ+WXJSLbTaBAypqSLxKLIIu4kM
         TCIA==
X-Gm-Message-State: AOJu0YzVmnpzCqX533Cs7hZuPHtaIye2gbNBX5ESNED0wfq+IdVAcyY9
	wtbe0JuUhMkwJ4ZfIFcnGZvfr6/rxOB6ibTk4IW6kEF/y5MqlHbyfWnVLHsIJfy570w=
X-Gm-Gg: ASbGnctnRKX4v7zN9fMiK4VjDt7rTRuAHbEz4bxAq4LRWdOC3m1S44d2gNeP+cKWIrT
	MMj1we88vuMlrJki0uVZ4HLqHltikRp0A3bZrEOcaFekmBejQrRUEd7pshLstmK5Oohu1a3mOhf
	pMJ6eYnBHeMpCFQnP0cMhFtomIlCNfJU1NZ9vec7n15quNS5hm5PF63J31nlC3BZyeDEp8F0ohq
	kXmznxkx/hDm8HPSl0UTGvfi6CJ+4S5xAmLHUqY/2Nw+YGn+cn2LnaqWWFuk+tMZdPf3aQjTT2K
	CiloHY0+kpXrbH+cvYULmpWmfRTJK4sxwl3f+iMrAudK3nhVCDUd32MUwc/yrhkK6lyw/ARAu2F
	b+yeahmAnqhr0IZlveQ==
X-Google-Smtp-Source: AGHT+IGHjBx8sMYs3lHE3j4YSxLMvMr0rPrffmNJN86ZbeNGXfVWDc4mK7dwT8BOAHal4p0WxIZHVw==
X-Received: by 2002:a17:907:6d15:b0:aec:5478:9697 with SMTP id a640c23a62f3a-afa1e0bee34mr206209666b.34.1754990198702;
        Tue, 12 Aug 2025 02:16:38 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8691:4b7a:7bbd:bac:c56e])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-af91a219ecfsm2165135966b.94.2025.08.12.02.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:16:38 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Tue, 12 Aug 2025 11:15:26 +0200
Subject: [PATCH v2 7/7] arm64: dts: ti: k3-am62p5-sk: Set wakeup-source
 system-states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-topic-am62-dt-partialio-v6-15-v2-7-25352364a0ac@baylibre.com>
References: <20250812-topic-am62-dt-partialio-v6-15-v2-0-25352364a0ac@baylibre.com>
In-Reply-To: <20250812-topic-am62-dt-partialio-v6-15-v2-0-25352364a0ac@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, 
 Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3451; i=msp@baylibre.com;
 h=from:subject:message-id; bh=HcH21KdBujh53AhMHGkxOxQ7fcl0i2byElm0n9yxHEI=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhozZbOl3hBvMDeZeape7b/3hzc/Jz0r2Hm++ey+hM+RC2
 b+F+e+3dZSyMIhxMciKKbJ0Joam/ZffeSx50bLNMHNYmUCGMHBxCsBElm1k+F95cZeRCtNn7Z+T
 nB+8X68Vd/9K4LQvXvO71MP77GvKlygwMvzhemOgzTw1MSXQKJe7cVn/saqKPWq2G4UyHh3Z0Rh
 rzQIA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_021642_074232_4C0E0D43 
X-CRM114-Status: GOOD (  12.60  )
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

The CANUART pins of mcu_mcan0, mcu_mcan1, mcu_uart0 and wkup_uart0 are
powered during Partial-IO and IO+DDR and are capable of waking up the
system in these states. Specify the states in which these units can do a
wakeup on this board.

Note that the UARTs are not capable of wakeup in Partial-IO because of
of a UART mux on the board not being powered during Partial-IO.

Add pincontrol definitions for mcu_mcan0 and mcu_mcan1 for wakeup from
Partial-IO. Add these as wakeup pinctrl entries for both devices.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>

- Merge devicetree nodes in k3-am62p5-sk.dts
---
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 71 +++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index 899da7896563b43021de14eda1b0058a5c6d36da..a2dffb5e243f543c90081eeacdc0758b38bd0eb9 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -762,12 +762,52 @@ AM62PX_MCU_IOPAD(0x028, PIN_OUTPUT, 0)	/* (D7) WKUP_UART0_TXD */
 		>;
 		bootph-all;
 	};
+
+	mcu_mcan0_tx_pins_default: mcu-mcan0-tx-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x034, PIN_OUTPUT, 0) /* (D6) MCU_MCAN0_TX */
+		>;
+	};
+
+	mcu_mcan0_rx_pins_default: mcu-mcan0-rx-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x038, PIN_INPUT, 0) /* (B3) MCU_MCAN0_RX */
+		>;
+	};
+
+	mcu_mcan0_rx_pins_wakeup: mcu-mcan0-rx-wakeup-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x038, PIN_INPUT | WKUP_EN, 0) /* (B3) MCU_MCAN0_RX */
+		>;
+	};
+
+	mcu_mcan1_tx_pins_default: mcu-mcan1-tx-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x03c, PIN_OUTPUT, 0) /* (E5) MCU_MCAN1_TX */
+		>;
+	};
+
+	mcu_mcan1_rx_pins_default: mcu-mcan1-rx-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x040, PIN_INPUT, 0) /* (D4) MCU_MCAN1_RX */
+		>;
+	};
+
+	mcu_mcan1_rx_pins_wakeup: mcu-mcan1-rx-wakeup-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x040, PIN_INPUT | WKUP_EN, 0) /* (D4) MCU_MCAN1_RX */
+		>;
+	};
 };
 
 &wkup_uart0 {
 	/* WKUP UART0 is used by DM firmware */
 	pinctrl-names = "default";
 	pinctrl-0 = <&wkup_uart0_pins_default>;
+	wakeup-source = <&system_io_ddr>,
+			<&system_deep_sleep>,
+			<&system_mcu_only>,
+			<&system_standby>;
 	status = "reserved";
 	bootph-all;
 };
@@ -808,3 +848,34 @@ &epwm1 {
 	pinctrl-0 = <&main_epwm1_pins_default>;
 	status = "okay";
 };
+
+&mcu_mcan0 {
+	pinctrl-names = "default", "wakeup";
+	pinctrl-0 = <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_default>;
+	pinctrl-1 = <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_wakeup>;
+	wakeup-source = <&system_partial_io>,
+			<&system_io_ddr>,
+			<&system_deep_sleep>,
+			<&system_mcu_only>,
+			<&system_standby>;
+	status = "okay";
+};
+
+&mcu_mcan1 {
+	pinctrl-names = "default", "wakeup";
+	pinctrl-0 = <&mcu_mcan1_tx_pins_default>, <&mcu_mcan1_rx_pins_default>;
+	pinctrl-1 = <&mcu_mcan1_tx_pins_default>, <&mcu_mcan1_rx_pins_wakeup>;
+	wakeup-source = <&system_partial_io>,
+			<&system_io_ddr>,
+			<&system_deep_sleep>,
+			<&system_mcu_only>,
+			<&system_standby>;
+	status = "okay";
+};
+
+&mcu_uart0 {
+	wakeup-source = <&system_io_ddr>,
+			<&system_deep_sleep>,
+			<&system_mcu_only>,
+			<&system_standby>;
+};

-- 
2.50.1


