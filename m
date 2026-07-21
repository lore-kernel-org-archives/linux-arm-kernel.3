Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC58C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 06:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qpPVT8Dc4rsd7+Cy/PRWiKisx//FM/DZEFs1R+jF/Vo=; b=AljTotm+BdRN8X3Ab2KmwF7xWc
	E72lT2u7QTuaqfgwzFQe18VJwiCZPUzpAIXvuTfIVhhhLmBx1s3lVgy+QjKTaXYaIkhXCDR7+7pHC
	QvwBm5Ik+JQqs1hVg0ggWsWlyDWSbvg67ru+j8yvBOgDtfyyQx56U7HjaNXtCWJnBjEzhX9E0EwdD
	ApPEAhcEY9j+dzsjU7IYJkHjfxwB0BtNhElNXn0iqCQWIhPoDq9yxtkkVOB6ADlDFKDaqorA4xl7c
	4WGdQpkHnYDKvcLy4LDUKc3n3EUVA1R6BAOC/M7cv46LqxaQ+Bp3bYH6qvBd+jB2SceJx4/4dyOgn
	sZ1ePWBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4Oi-00000008bTS-2bwP;
	Tue, 21 Jul 2026 06:56:12 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4OJ-00000008b3Y-04TJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 06:55:53 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2ccdb73f0e1so70230385ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 23:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784616946; x=1785221746; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qpPVT8Dc4rsd7+Cy/PRWiKisx//FM/DZEFs1R+jF/Vo=;
        b=KtAOL3dAx7IJjACb08uukp04Ak+ohhr3bYNJqTqjeB4rKZJVUTFZ00ig/jIUEfVxbd
         zdq0V3R+cIY6EnQyOs+Bf7XfbEP7oTrmwK9pCUi8pD1A5NlOUm0UE3WoBusW81obD2wO
         GGzfuPr/ZHcT44obnnMqiBxQwYYziUOxZI/d8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616946; x=1785221746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qpPVT8Dc4rsd7+Cy/PRWiKisx//FM/DZEFs1R+jF/Vo=;
        b=U/XuMstewXQwuQ+g59uFZSezeYZkbUiTEuj48sc2cSVeN50l0/iBZgVT7Z7gnRUon8
         Xqj9+0i+71jpu0jke33uisJy/hthN5veOjX1NuNOLPYdTEe/iITGhckpkqlrdFgcfKrM
         BvMq0aO5cmv4kLF9evMy9EHk6I7qLG9K/8kR6bG0N3iZrFsh/ZCsrkB9fQQR+J/+Ho0P
         reUv/kEfmCa1L8hTpwAFs4MuSVyxJQeeNdFcWS0OPY4WObVDJs9d6ZU3515nw5TLG/YP
         IcqP51EvD/AA0qGk8/4tk1vSXxuYihUm0yN6k+o6n36+fUdrMk4tlgMgqmpabZZhDSHl
         fgzg==
X-Forwarded-Encrypted: i=1; AHgh+Rp/9cMTV9BbvyKzPX8nK649TtkjjMRMJSt4mOVNr2XcvR79qTlbDyO8PtLorcLASxnrJhzJTwoA9g40I4lcMtrF@lists.infradead.org
X-Gm-Message-State: AOJu0YzDslM5Y1api6Cn1B/mAz3VRPaEGK4T8mokUfyuaQiIr9IWaZIQ
	PuOfPWUS06+kBtun/lqwQFA7WcFQ52K2jp6HJMHTAa87gk6T3FM9e9RDfQwIpN4CaQ==
X-Gm-Gg: AR+sD10mloyM3uguhM0dVIh9NVuBF76uIigCoGoXv4gw5C3BLwiCPZmY6EX0ShNhH6t
	zKybs74WgYKj5UGIgQCU4a3LCUP99HitBa21kiu+5etdY2tfK1IzsP9PtpC9cPMbFdSaGs1Ww3u
	ZjNjKNefMivxVpuYBYEEU30xRszwqCuIE97vb/wixRtNtvI9jo1iiADUOQFL15iC7xMmwfvdj1j
	BLTxFIdU3HKZh+C5wPghZmcH9340+YMqDWb5z44rEF26PcyO4atApynpYi+IhVk1gml2UUpFaHG
	gH7or0a7gQt6+g9mIEk5x+EqIdvXPXgCVqNfe8OMZYwCBnarXWMtx9kRrk5XuRP2CK+ByY099L/
	Wtrpv5HD47pHum2ZFt0tS2vX3Rcr2NoWvfHmyyi3/pB6dFBeemgVHLOGerr1koXxeP8Fgbfwb4D
	MzrW3asLkNb3bsvz04MinZB/Tv86Og+Shxvtsgc3xbmgX3BrtHxsAj/TPdt+sK/OryDweA4A==
X-Received: by 2002:a17:902:d581:b0:2ce:d34a:5963 with SMTP id d9443c01a7336-2cf3496c380mr178033695ad.24.1784616946307;
        Mon, 20 Jul 2026 23:55:46 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ee77sm69716005ad.4.2026.07.20.23.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:55:45 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v6 15/16] arm64: dts: mediatek: mt8195-cherry: Add M.2 E-key slot
Date: Tue, 21 Jul 2026 14:54:10 +0800
Message-ID: <20260721065413.2306137-16-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721065413.2306137-1-wenst@chromium.org>
References: <20260721065413.2306137-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_235547_091634_E0632D13 
X-CRM114-Status: GOOD (  15.71  )
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

The Mt8195 Cherry design features an M.2 E-key slot for WiFi/BT combo
cards. Only PCIe and USB are wired from the SoC to the slot, along with
some auxiliary signals.

Add the proper representation for it, replacing the PCIe wifi node and
vpcie3v3-supply property under the PCIe controller, and the vbus-supply
property under the xhci3 node.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Drop default GPIO output state from kill pins pinconfig
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 73 +++++++++++++++++--
 1 file changed, 68 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index ef7afc436aef..8d4cc30d91e4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -266,6 +266,47 @@ tboard_thermistor2: thermal-sensor-t2 {
 						120000 51
 						125000 44>;
 	};
+
+	wifi-bt-connector {
+		compatible = "pcie-m2-e-connector";
+		pinctrl-names = "default";
+		pinctrl-0 = <&m2_e_key_kill_pins>;
+		vpcie3v3-supply = <&pp3300_wlan>;
+		w-disable1-gpios = <&pio 61 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&pio 59 GPIO_ACTIVE_LOW>;
+		/* PCIe auxiliary signals wired to controller. */
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* PCIe for WiFi */
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				wifi_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcie1_ep>;
+				};
+			};
+
+			/* USB for Bluetooth */
+			port@2 {
+				reg = <2>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				bt_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&usb3_ep>;
+				};
+			};
+
+			/* SDIO, UART and I2S not implemented */
+		};
+	};
 };
 
 &adsp {
@@ -791,14 +832,14 @@ pcie@0 {
 		reg = <0 0 0 0 0>;
 		device_type = "pci";
 		num-lanes = <1>;
-		vpcie3v3-supply = <&pp3300_wlan>;
 		#address-cells = <3>;
 		#size-cells = <2>;
 		ranges;
 
-		wifi@0 {
-			reg = <0 0 0 0 0>;
-			wakeup-source;
+		port {
+			pcie1_ep: endpoint {
+				remote-endpoint = <&wifi_ep>;
+			};
 		};
 	};
 };
@@ -1085,6 +1126,13 @@ pins-bus {
 		};
 	};
 
+	m2_e_key_kill_pins: m2-e-key-kill-pins {
+		pins-kill {
+			pinmux = <PINMUX_GPIO61__FUNC_GPIO61>,
+				 <PINMUX_GPIO59__FUNC_GPIO59>;
+		};
+	};
+
 	mmc0_pins_default: mmc0-default-pins {
 		pins-cmd-dat {
 			pinmux = <PINMUX_GPIO126__FUNC_MSDC0_DAT0>,
@@ -1637,9 +1685,24 @@ &xhci2 {
 &xhci3 {
 	/* MT7921's USB Bluetooth has issues with USB2 LPM */
 	usb2-lpm-disable;
-	vbus-supply = <&pp3300_wlan>;
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			usb3_ep: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&bt_ep>;
+			};
+		};
+	};
 };
 
 #include <arm/cros-ec-keyboard.dtsi>
-- 
2.55.0.229.g6434b31f56-goog


