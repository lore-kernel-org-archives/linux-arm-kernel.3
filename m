Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA08DC88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 08:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PYR5maRbUEPUYHaCDp1coaVQzS9XJQmry5uta3mhbEE=; b=L38H+Ug9xIPcB2xBd/ZUK7aSZr
	JKIb+9wvh4gWtaLlqf3Eiocqz/i2ar9KpCAX5xixxupyaTQiizVXBHaMdS/sasepH2oKhT8VQrmoz
	7cbtB2S/M9FTmxA69wvGwUfrQcuhotE3HLN0QgOuAcBDqLDzTp4V7zNzlR7bAFbRyLwBuG86dUPG/
	oPKeZJjytcNQigsOJUFTWlv8QeOpvkefxpnvynjzjG4PTJQcVRomQPbTusRBDZ0TYtjfLWi31qR/3
	I2h9CaYCtV14vgttIapdRFp9Ztokf+EgD1VcDfJcyMjODM5j2c+wVN0n9VsjtKD7yWJb5L7Ehiz56
	DyQ5XGlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kZT-00000008f5b-2nvE;
	Wed, 16 Sep 2026 08:00:47 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kYK-00000008ePk-3NOA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 07:59:39 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so2012815a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 00:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545576; x=1790150376; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PYR5maRbUEPUYHaCDp1coaVQzS9XJQmry5uta3mhbEE=;
        b=TIva9R0e/PPmkYVZY9spuU6js4RmKWtzqqLDvh0Ct5ATIpG1Fk1EFVmPfjGazXCz0L
         7bfo3RnIQjlDafJo3LcAmElwlq1Iu3NeseRxSI02QPIEHWBipSkvGeBBTVNCnB7OMS9k
         aK28RQJCV7wP2aZ3UIenYA6N4m5a2SM1HL0pI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545576; x=1790150376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PYR5maRbUEPUYHaCDp1coaVQzS9XJQmry5uta3mhbEE=;
        b=CELNsYYy1GmiiGXGcZ+Cnti+gKGMvYn6FN3a1oFNJ7e/U8BmpmDopk/OpaNDK9Vlod
         oecvdd5Z2DLbWFqKIC1EEXuptf9B9l5unLuKyVyrSCo3c9jZ/t+IKTEdHfIlAHs2z2B4
         rEBEFYrklgA5r11MtFuE3mH61HfhxFZ4f1Lu9vw6UXjnskL3N2jUL1sQJZkGLtLF5zJ2
         vjwOhfwiCCSU4YkMvE+AlWjVGZq7tWnTQibWGm7Qn/J9/X3fjImZAv3YYI2eNFmL3iQW
         JZornjFbOQtLuX2iQIkbYZ4AOwJXrP/G4sjj1EG5khI9nQb9lL6TdXBjQUTyMuB4jMrj
         pWew==
X-Forwarded-Encrypted: i=1; AKwUvByC9gt5UfgvSZ5tQw4brAktf/MCjlMjAcZqrXKT/NYsgYdxTDgYlj42i6iKVukxOlVv8D7A5r4BWbkEdmASELyN@lists.infradead.org
X-Gm-Message-State: AFuF++kj+48g/U4VYSaoqkChXAO/FXwqcQBs067eAicY02RbovJCFGpj
	4N98Y35LIeH54bBBDaoGffDrNYChvwjezxncnd+Wkw92LXVpJ3d4EGYHTP97+7CI8g==
X-Gm-Gg: AYBFou3FE9qZHTcWJVmp7CL7+9P6ITT77uJQydjJqMhT0rXmziifd920ikZB7SlNhrl
	gRa8oRwLY3s3t3UPN7aBqY3rZc6WaSiul5BfWdVCZIvXBao8lPBvoonUt10TNXj6lKaE4VXVaid
	yYW58W4BsnTBHqGhtg+9UypEM2YKJ1Tvq+381Pbfm7FmOTixvlW9dBF5M3q1WhlQ8GZCp0jGdnm
	m2ufgbLXyiMo+3+P2nuKWxF0Nsj3/FPUk3po3rB/E+eJZ+02+ILTM/7SnoE+nbV6OBfSTJjGm1v
	Bw+I1fJGPrKtfUbWe/tXLZ018R5uRp0aFGtxGqYlIeS/qPuxd3Lc4NcmXmeXfNMpYqob50hNMHB
	uHSQdW+hVJ9Athq1bphSl/Ctp1y3Dsblf0Uet0xygbhLwljg/vsKP5axxhTVFZ4RFdJm34Jffdo
	PL/9cVYayef9wIPHJxtRjZp4U/V504JA09q76kv8Q1RZahCFmK1rDqMAst3ss8H8J4qM9nldsoR
	DkBgoRETfdytZNsVAUjBm5JQkpGUibmI+BA8aIuhp8/R5PJtc9VfvTX59Pmzj4IxdVB
X-Received: by 2002:a17:90b:3c08:b0:39e:fe9:c5b8 with SMTP id 98e67ed59e1d1-39e0fe9c653mr6440889a91.10.1789545575967;
        Wed, 16 Sep 2026 00:59:35 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:59:35 -0700 (PDT)
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
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v9 14/15] arm64: dts: mediatek: mt8195-cherry: Add M.2 E-key slot
Date: Wed, 16 Sep 2026 15:57:40 +0800
Message-ID: <20260916075745.3549953-15-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916075745.3549953-1-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_005937_630055_C399B0D7 
X-CRM114-Status: GOOD (  15.61  )
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
index f06ca2bc165d..5d65f4554c6e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -271,6 +271,47 @@ tboard_thermistor2: thermal-sensor-t2 {
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
@@ -796,14 +837,14 @@ pcie@0 {
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
@@ -1090,6 +1131,13 @@ pins-bus {
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
@@ -1642,9 +1690,24 @@ &xhci2 {
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
2.55.0.1032.g73a4cd73de-goog


