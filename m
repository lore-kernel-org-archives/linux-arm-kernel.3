Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 541CCE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 06:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9+9ADON0/68ayYIfEfVGSHZvOGdkI3057JB+jrkbu/4=; b=ZIgj2OjusHlt/MqEJdembMLdTy
	eHXSvoIzQCRt7V5qKjlIoLy/Iq8c5X4jyMbRm7uaCIMdoYCwgYJRDFIdbet13o3eBzz8wHI5pd5PT
	i9xXIVAc3VqJ8NeQkwc3ADqYkTHigopijCUKJUkVBMQkRsgH/0TlKytKbnuR8dEYIUvNhcPZEJqxK
	1i7q/ul++ATczsmyKA47VgR1SLNcbZLuGau1bWnBc7SZpcbb8Qx2i+1j7khVw/XTP4VXTIS1ON2uK
	dbRBMXSLHyl4nnahsPMntLSoE0ydnrXI1v5gfLcyrQfxmrgIjkrLdsMXOdVFnIKubmNokhmXwwf2z
	qfddAveA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXaDv-00000007aBk-4C3z;
	Tue, 14 Jan 2025 06:16:24 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXaCg-00000007a2y-2QPA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 06:15:07 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2163dc5155fso93238775ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 22:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736835306; x=1737440106; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9+9ADON0/68ayYIfEfVGSHZvOGdkI3057JB+jrkbu/4=;
        b=muBt7SRN5A9o/2xd3R//xyjemLfgbGq91JG8ieI1OlVMRLZEaNvi/Szz1frIPk15dt
         lfdgVRK44ds9QbbUfkq+MYXVvkU79Yft5npqO1yoLv6mjsISRCTQXdEukZDFjEklQnHz
         s60igkLW97SFm6k6NxobbhJwIwwuS0DdPtcbQ/+pZ+lHSb5fG7sNEPZxNQ6t3ko4LTzA
         s1LQWPjkRAy7LhPNmlkK/xnxhT8gMrb87diLIPvmUqC9aowlGe/2zJTK+FT8Bz0DnGH7
         rigbpskcejUs8hoSlnh3rIDek2i14VgxG4PyuhXEgl2S0jarO/sAr2remFrLDXHj1txO
         wWUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736835306; x=1737440106;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9+9ADON0/68ayYIfEfVGSHZvOGdkI3057JB+jrkbu/4=;
        b=cp9fj/G6QEL4jT7tMGz1DN3g1/2syQlWCw2bjsbgnFkD/NI9hFBKSzqma12+HWq72/
         diKyff91YyEjVBB+WI9qfcsj9OfI4uceiMZ/DvO9OjV62xD/aYlqF94EZaO3rWPHouK+
         GmeVzHh6VxYi2/2q1Ip0Hm/v3Qr5nsc1aKg1Y3n70Zlz/0WsaWZpPfcb4BOBJMztIg5P
         ahxA6iAK4hHIXuKPow+Enn2b7mJa4qVgyMwKx4VpjiqYermdJLIrx3upTfroWJRNLVqF
         /dfApLRvt+dHifsjQaR9f3F6na2eMPhxoq9Cw+uW6b3lWbNh8AIGEWHn71U7tRsSW/Mk
         sObQ==
X-Forwarded-Encrypted: i=1; AJvYcCXX+5HEfinOGTYGTxrV6jg4VMGSGroAFYIy28YBLNrf751bazUeQ/1eZUqAI5kz1etOd6IFW1oJidlIX7i5uRB4@lists.infradead.org
X-Gm-Message-State: AOJu0YyVj6Q78Ok5+5oHKlxBD/FsQrTyfjUE89Y26o1gNCxwSzpiOJit
	m5xEEpn3KwO7wHYb01PAOyH3gNI6NsKZ05vdauQtsYIAtMEGop5U
X-Gm-Gg: ASbGncvSba3AZi74Yfvkzm0h9UMKk5qH0W8G9r72D+q8kKOYEJP/B7g4L9EX+1kg1Rk
	6/xfw9x0KQE8W0XmJyWBnBFB1DzQ5pf/48tfLeIGNxlWIUyYLNMuVO9ZlnMQNb3cnBlKtMeo5ua
	rWRAElChRaknZsVhHrXX7PTa5XLLPiGJa5hPSUyHjiiIuCAYkZSzZmH8xLBQJs0xH7817sohOyh
	x0cDbizPYxh69NCSZtGNC7CWlNhHXw+8iVnFSZXE7PPtE31Ut9gmrfrxPnDln3Jsz/f2ayqDkgh
	RHA3tCE0zABy6HRs3x1z38c2yK1XI2BwhQ==
X-Google-Smtp-Source: AGHT+IEyP70V5BBHMys71/WsXOS/rY0o9WW3Q+/v6dsdado13jARyxFY0TuAdoBRAxFx2Ha6CPRa3g==
X-Received: by 2002:a05:6a20:244d:b0:1d9:fbc:457c with SMTP id adf61e73a8af0-1e88d0a4771mr20947524637.36.1736835305592;
        Mon, 13 Jan 2025 22:15:05 -0800 (PST)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d4065c3b4sm6796218b3a.112.2025.01.13.22.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 22:15:05 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Tue, 14 Jan 2025 14:12:46 +0800
Subject: [PATCH v3] ARM: dts: aspeed: catalina: Update DTS to support
 multiple PDB board sources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-potin-catalina-dts-update-20250102-v3-1-14981744b2fe@gmail.com>
X-B4-Tracking: v=1; b=H4sIAF0AhmcC/43NTQqDMBCG4auUrJuSiX+1q96jdDGJUQfUiElDi
 3j3RqHFpct3GJ5vZs5MZBy7nWY2mUCO7BAjOZ+YbnFoDKcqNpNCZgKE5KP1NHCNHjsakFfe8dd
 YoTf8/1JCqkSOqaoUsgiNk6npvY08nrFbct5On20zwHr98ckRPgAHroQqMJOJLvPrvemRuou2P
 Vv5IHckHCNlJKGQGUBRmwLLPbksyxdpc/gjJwEAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736835302; l=6499;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=lbOKlY5AnxmP5unErxDp8hen0opmaKpQ0vRsSWRl/Ao=;
 b=IAKC+rhHag+WcW2qKa8cX5x57+SOcI0rbFTphPzuFoDlRzL/KC5ugdzDPn5IPheQLvlXqyVd7
 ZcoCBLS4rpCCT3HUb2ZTb1dF5f2KsU+QtX5VOG6L0RGza74k9vOZ/91
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_221506_625947_FE068239 
X-CRM114-Status: GOOD (  13.31  )
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

This patch updates the Catalina device tree to support different sources
of PDB boards.

Changes for Main source PDB board
- Thermal Sensor Monitoring:
  - Added IOB NIC nodes (TMP421) for thermal sensor monitoring.
  - Added FIO remote thermal node (TMP75) for thermal sensor monitoring.
- Fan Monitoring and Control:
  - Add fan p12V power sensor node (MP5990) for sensor monitoring.
  - Add fan controllers (MAX31790) for fan control and tach monitoring.

Changes for 2nd source PDB board
- Fan Monitoring and Control:
  - Added 2nd source fan controllers (NCT7363) for fan duty control and
    tach monitoring.
- Power Monitoring:
  - Added 2nd source HSC nodes (XDP710) for power sensor monitoring.
- Address Conflicts:
  - Removed all ina238 nodes due to address conflicts. Moved the driver
    probe for ina238 to userspace.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
Updating the Catalina DTS to support multiple PDB board sources.
---
Changes in v3:
- Remove delta_brick nodes due to compatible string not supported
- Link to v2: https://lore.kernel.org/r/20250113-potin-catalina-dts-update-20250102-v2-1-1725117fe7a9@gmail.com

Changes in v2:
- Add delta_brick nodes to support PDB brick board
- Link to v1: https://lore.kernel.org/r/20250103-potin-catalina-dts-update-20250102-v1-1-b0b7a523c968@gmail.com
---
 .../dts/aspeed/aspeed-bmc-facebook-catalina.dts    | 149 +++++++++++++++++----
 1 file changed, 126 insertions(+), 23 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
index 3822bb3c9243..23583665ba12 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -190,6 +190,12 @@ i2c0mux0ch0: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
+
+			// IOB0 NIC0 TEMP
+			temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
 		};
 		i2c0mux0ch1: i2c@1 {
 			#address-cells = <1>;
@@ -200,6 +206,12 @@ i2c0mux0ch2: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <2>;
+
+			// IOB0 NIC1 TEMP
+			temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
 		};
 		i2c0mux0ch3: i2c@3 {
 			#address-cells = <1>;
@@ -361,6 +373,12 @@ i2c0mux3ch0: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
+
+			// IOB1 NIC0 TEMP
+			temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
 		};
 		i2c0mux3ch1: i2c@1 {
 			#address-cells = <1>;
@@ -371,6 +389,12 @@ i2c0mux3ch2: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <2>;
+
+			// IOB1 NIC1 TEMP
+			temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
 		};
 		i2c0mux3ch3: i2c@3 {
 			#address-cells = <1>;
@@ -464,40 +488,105 @@ i2c1mux0ch0: i2c@0 {
 			#size-cells = <0>;
 			reg = <0x0>;
 
-			power-sensor@41 {
-				compatible = "ti,ina238";
-				reg = <0x41>;
-				shunt-resistor = <500>;
-			};
-			power-sensor@42 {
-				compatible = "ti,ina238";
-				reg = <0x42>;
-				shunt-resistor = <500>;
-			};
-			power-sensor@44 {
-				compatible = "ti,ina238";
-				reg = <0x44>;
-				shunt-resistor = <500>;
+			power-sensor@22 {
+				compatible = "mps,mp5990";
+				reg = <0x22>;
 			};
 		};
 		i2c1mux0ch1: i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0x1>;
-
-			power-sensor@41 {
-				compatible = "ti,ina238";
-				reg = <0x41>;
-			};
-			power-sensor@43 {
-				compatible = "ti,ina238";
-				reg = <0x43>;
-			};
 		};
 		i2c1mux0ch2: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0x2>;
+
+			hwmon0: hwmon@1 {
+				compatible = "nuvoton,nct7363";
+				reg = <0x01>;
+				#pwm-cells = <2>;
+
+				fan-9 {
+					pwms = <&hwmon0 0 40000>;
+					tach-ch = /bits/ 8 <0x09>;
+				};
+				fan-11 {
+					pwms = <&hwmon0 0 40000>;
+					tach-ch = /bits/ 8 <0x0b>;
+				};
+				fan-10 {
+					pwms = <&hwmon0 4 40000>;
+					tach-ch = /bits/ 8 <0x0a>;
+				};
+				fan-13 {
+					pwms = <&hwmon0 4 40000>;
+					tach-ch = /bits/ 8 <0x0d>;
+				};
+				fan-15 {
+					pwms = <&hwmon0 6 40000>;
+					tach-ch = /bits/ 8 <0x0f>;
+				};
+				fan-1 {
+					pwms = <&hwmon0 6 40000>;
+					tach-ch = /bits/ 8 <0x01>;
+				};
+				fan-0 {
+					pwms = <&hwmon0 10 40000>;
+					tach-ch = /bits/ 8 <0x00>;
+				};
+				fan-3 {
+					pwms = <&hwmon0 10 40000>;
+					tach-ch = /bits/ 8 <0x03>;
+				};
+			};
+			hwmon1: hwmon@2 {
+				compatible = "nuvoton,nct7363";
+				reg = <0x02>;
+				#pwm-cells = <2>;
+
+				fan-9 {
+					pwms = <&hwmon1 0 40000>;
+					tach-ch = /bits/ 8 <0x09>;
+				};
+				fan-11 {
+					pwms = <&hwmon1 0 40000>;
+					tach-ch = /bits/ 8 <0x0b>;
+				};
+				fan-10 {
+					pwms = <&hwmon1 4 40000>;
+					tach-ch = /bits/ 8 <0x0a>;
+				};
+				fan-13 {
+					pwms = <&hwmon1 4 40000>;
+					tach-ch = /bits/ 8 <0x0d>;
+				};
+				fan-15 {
+					pwms = <&hwmon1 6 40000>;
+					tach-ch = /bits/ 8 <0x0f>;
+				};
+				fan-1 {
+					pwms = <&hwmon1 6 40000>;
+					tach-ch = /bits/ 8 <0x01>;
+				};
+				fan-0 {
+					pwms = <&hwmon1 10 40000>;
+					tach-ch = /bits/ 8 <0x00>;
+				};
+				fan-3 {
+					pwms = <&hwmon1 10 40000>;
+					tach-ch = /bits/ 8 <0x03>;
+				};
+			};
+			pwm@21{
+				compatible = "maxim,max31790";
+				reg = <0x21>;
+			};
+			pwm@27{
+				compatible = "maxim,max31790";
+				reg = <0x27>;
+			};
 		};
 		i2c1mux0ch3: i2c@3 {
 			#address-cells = <1>;
@@ -509,6 +598,14 @@ i2c1mux0ch4: i2c@4 {
 			#size-cells = <0>;
 			reg = <0x4>;
 
+			power-monitor@13 {
+				compatible = "infineon,xdp710";
+				reg = <0x13>;
+			};
+			power-monitor@1c {
+				compatible = "infineon,xdp710";
+				reg = <0x1c>;
+			};
 			power-monitor@42 {
 				compatible = "lltc,ltc4287";
 				reg = <0x42>;
@@ -580,6 +677,12 @@ temperature-sensor@4b {
 				compatible = "ti,tmp75";
 				reg = <0x4b>;
 			};
+
+			// FIO REMOTE TEMP SENSOR
+			temperature-sensor@4f {
+				compatible = "ti,tmp75";
+				reg = <0x4f>;
+			};
 		};
 	};
 };

---
base-commit: becaccc292bfbd12df81148746043c5221e49da8
change-id: 20250102-potin-catalina-dts-update-20250102-914b06a4bdba

Best regards,
-- 
Potin Lai <potin.lai.pt@gmail.com>


