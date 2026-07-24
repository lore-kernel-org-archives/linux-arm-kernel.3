Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C5FC531FC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 08:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pSIe19R3Jx2/rJrVImdy8rgHYnwLDdUMVV9CAsQ6TV0=; b=b4peMX+HiXenQkQ6A7XOugfJtw
	m0UXr7X7r0tw0WelTj83/5FSz2c6r8oxJ5i4aFA6YsDBftjgMAv/62hq8MO5J7Nqa0QjIuunqpvz7
	TQ3eoQnHylnWNyeX4U5CpvtACcZADNXMuDOiWWJDLd/jzlbD+0LX6+j/PqLfc8SkvPj1O6Owb2ssf
	7tY5dhHT/GkTR7TrBmR2zPMOcsGwiFjQ6HCuGahJP45oCR52K4PVh6czMteR6VkIbTdenIvsEHMlI
	cVNvFfvnXgmWmfWj4wRpD5yXOP34DDNxg2Fc5LyUMUByPEKGNZcVL1sY4wfS8G2l4dQT07b+wHbml
	SbBB/MiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBXY-0000000FrsM-2616;
	Fri, 24 Jul 2026 08:45:56 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBX1-0000000FrQQ-321z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 08:45:25 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-385ea3ce80dso153374a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 01:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784882723; x=1785487523; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pSIe19R3Jx2/rJrVImdy8rgHYnwLDdUMVV9CAsQ6TV0=;
        b=UMV2pH5F5XyuPMJGXmfVU/oU3iuKXZDX8IaJpNZem34DScDubzAWLudjISSid7d63e
         9wZ00y+IA0gQYGQOn5QI376s0UEjbrrJXMt2tcS7HiItH2aZteMEJOPAO8w+WXTjFOUx
         SwagWO87C/w1KgYPyzFN45OQb1xQyQwWmF2wM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784882723; x=1785487523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pSIe19R3Jx2/rJrVImdy8rgHYnwLDdUMVV9CAsQ6TV0=;
        b=RFGFb6yD2mrQG/cbIywXpBUkV2erO2ANgeHDLPhyr5ZfovSBoXBfy+iv4Bw7GV3moW
         ZWWEbeohH4Fnri2W7KfxH7xI7cGY3ptzvbpKj2X88Kl+2ucsqJVGyPpHKAujOX0WWx9u
         sK/vJ4Afp2lrqgh8TwwVljKiTJxBGl+HBztfBEgRXkJqabQsbmyN6mtohAae+DvVxLoR
         g2ZcwjpHfHk+BR2bWqqXukc1JEEEuOG0QLtbpsfh8e0agJHvWt9cXS7qa18bvIRj9WXH
         iqD0ZBRWV/6Uo/R8n9eqpZNkKfamMbcVASgt+GrH2HQ5wdlld9NNcJDG50qIB/LtUwkp
         /gtg==
X-Forwarded-Encrypted: i=1; AHgh+Rr/MYn4010p0sREZGo6p44CEzVtRALXRz0wvZQ98gVV+S/08ou7aiVLTOlsMbVV2zGXW9GHvqe7toujfxTAK7h5@lists.infradead.org
X-Gm-Message-State: AOJu0YyDW3POGr7IABmQzmkdPVFPaVnaXaQC633CkZ9lnCL/myNm+BS4
	gXcQbVnXcmgQUmQuiW2cmJfp/R8lcI06ZJVDiRl8sazRUEKU3Rr0whZcmxd40dEuOw==
X-Gm-Gg: AR+sD12cefQ0JFz0yC+nRB5cdyD3fnhCdN9DPcEuVUmD0qidgOpiBQxvmZ+SYQAqOHC
	n0FtUqK0+6NDHp07QVRr7ls/lnfQIBsZVjoDGPOqADZA5LBV0R9VRZ9Txczgg9idUYQEJveIcm0
	slOfDm+bjv35HydA1iT0RlU6VV4oV0ta4e9nN5Lmjd1x5oU/Rz5rYfAS4/kYEX1ECV1YayQ42Kl
	8CKTXc+J4d7Z8MUM5hfvajUNsQuNB7junGQg0Eue2oK3cQpEx70BK1/HvOEr1MrlKgRISzhyD8D
	ZgSUXyalEhwweYFhk8hVCstLrtKonoKSXxBlBxu+hLiDepvzf3hmBjoQM+2+7VEmX9OoDoLrK+e
	z9lH9nTsZh5wEBEQCCgqcrTfaQURjg2ap2QJwFHdsOfhly2pZ9d/W9KvqH3RF/XoU/GADkD7JWZ
	GMqCGkboBnzvDq86/uQnSjzFd+vgmi6Gk+laOjJMPll9HfwwpsUvBFomJtR9XUdmwoYtn9+g==
X-Received: by 2002:a17:90b:586c:b0:38e:7446:d2b8 with SMTP id 98e67ed59e1d1-38ec6890685mr7222992a91.41.1784882723047;
        Fri, 24 Jul 2026 01:45:23 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f131:86cc:5858:7325])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f089ac6d8sm434546a91.2.2026.07.24.01.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:45:21 -0700 (PDT)
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
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v7 15/16] arm64: dts: mediatek: mt8195-cherry: Add M.2 E-key slot
Date: Fri, 24 Jul 2026 16:43:24 +0800
Message-ID: <20260724084328.3943997-16-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260724084328.3943997-1-wenst@chromium.org>
References: <20260724084328.3943997-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_014523_790089_08D6EE89 
X-CRM114-Status: GOOD (  14.91  )
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

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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


