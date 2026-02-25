Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B15F357DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 07:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mUlMJL8sDqfMhOaBSEuOUb8RroUd2MJOVQPpugM29u0=; b=L5zb+zvC6yI6CUWXY7ksBKFGO3
	4DI8pofTtxOqiqxfNhwzhPeFq7rKHyYYSVyrNEICPSoc9oxgy5HvDxaDy1+gregqK/N/KyNHU9IW0
	4iaZAcFFLGxUnSb+ei9aCD62sEhHFiiHuSYpnT1Vgjylqd6rr1cJDC06xkUdVmP/0cDntaQJiANzJ
	niK11NbHn4nxZ0SYT1tTyUy9QvNPA4WA/Ip7/tTFEms4Hul/FflMWd3oXKrTNkxLBNs2L5M21A0Ey
	6W4W5IwzOUHUK3kJeyyhRkI5K+Rm2qgRDXiQMDcNpmV3Amka+Ixzkr6Mg0iSiRIeLRt6bNkp7fgYS
	FTTt8q7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv9Ep-00000003PhF-1a7M;
	Wed, 25 Feb 2026 07:23:16 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv9Ei-00000003PXo-067r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 07:23:09 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c6e734ba92bso3149992a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 23:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1772004187; x=1772608987; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mUlMJL8sDqfMhOaBSEuOUb8RroUd2MJOVQPpugM29u0=;
        b=O2FfshCsYLKH9KDHDe6h8C1LMqJnrC8SMZ5qPVg8YvXzRodsj3VLU/oT5ofTfo10wB
         qx9kBn4b+5014fJG10tn/07rY9qeXVIH3MDHiMRq6P/UdQARy9ruUdWKMURvCsZDPmid
         AmMHpot4s8G+mbEt8KVmT8lWnK8doZwZincqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772004187; x=1772608987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mUlMJL8sDqfMhOaBSEuOUb8RroUd2MJOVQPpugM29u0=;
        b=bvUg5b4ND0Tszhw4QHQoT5t37kFaWqiKQegZ7P9U1ASf5a40UJ2p+WLaJyyC0/1gE7
         Os10dBO8neO8UOUtCV4woUC1cR693ba2bfR6E0dFaiAAbAXCsc7gE9jjsrsAdXOTdBAX
         pMD5mO8+lZ3i+zzs83pTkLvZ1xiod1RdoWEvokOWbwKl6nOjGvxYzr8talhan8DSLHqI
         ZRI3dMr/xaHwJ+AsQHQhw5Y1jxrp5/5QuQIxn20M/G/7sqAeEzJzdePytaRwdFxGTBRC
         t/lGu++t/u+HaHSWCp8nV81pqsmKQVx5Olw1BAwRW8wW4dfgNOib1hamPbxEO4IblWni
         WL4g==
X-Forwarded-Encrypted: i=1; AJvYcCW0TwNbmsL5OE0PoB+qDUJnPIZGw/2+wVecSclprSQwuBMw7FNnrkR59qEg0DviqxCHMrxCC93QXaNzLfQFl77A@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4eKWBQd3Z44JsMSA3l5AdYNMWfSpA/qe6xp5+3p6eVN7cghJT
	0ZTcvbBAq9U1W1X2j2b05EiRngUPNKr9ZItq6bcFJ+l7LYzxEzrAngI8/ABTtFjUcA==
X-Gm-Gg: ATEYQzz2qaj76M1rzFvcXPeKFcLz/qA/kJK2tCcdegD/37IGitxJGBP7qVNOckkCtSX
	RYWmuDp/T4fkRmIbuN2wl8LGd2QDorKQ/etL7P/zhsPHnN0vdHpOAxmOUIIwYfiyQribPSF8lK7
	xWaHXPUg6mxLuvKLbMGToarFBGePrf+cF2V4S/PQCvn39AGhdE+4odqqx4pQ7y7puViEYB+xGRx
	759YSqWCJDnrzgXAr2k9ZJTRGMEYLx+R+pGA4h4nKaKXOcM8l/z+mg5TMcoWEMnTCsHQeHzi/W/
	qfRaKmbAMoExa/6Jv8zIjhhMP8xx4MMHLp2taeiv5qOBcausqDobaoiQpRaiz7ogSMU2st30FuV
	vLSXhybmSEqBu21zrmRIz86JXt80yOdnBMMbhr7QturgtFypqRVLFCr9oU1fnzrYT8Pk803ZacH
	5HAHh0En7uSojWeWZJcmLbJ8W3YUnl4leOgtWeNuJviSE53rmJqT82my1ZLkt4+PqOBhI2LaMhK
	DDoaA==
X-Received: by 2002:a17:903:41cc:b0:2a7:6aa5:68f3 with SMTP id d9443c01a7336-2add13834a8mr16305355ad.34.1772004187261;
        Tue, 24 Feb 2026 23:23:07 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9d6:2e6a:941b:690])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7503fdc9sm130814435ad.80.2026.02.24.23.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 23:23:06 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] arm64: dts: mediatek: mt8195-cherry: add WiFi PCIe and BT USB power supplies
Date: Wed, 25 Feb 2026 15:22:23 +0800
Message-ID: <20260225072225.3345307-7-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
In-Reply-To: <20260225072225.3345307-1-wenst@chromium.org>
References: <20260225072225.3345307-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_232308_057886_A42A5061 
X-CRM114-Status: GOOD (  15.52  )
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

The MT8195 Cherry design features an M.2 E-key slot wired up with PCIe
and USB for a WiFi+BT adapter. Previously the power was just enabled
all the time with a default pinctrl setting that set the GPIO pin high.

With the PCIe slot description DT binding in place, the power supplies
can at least be added and tied to the PCIe and USB hosts. Once the
M.2 E-key binding is merged, this description can be further converted
to an M.2 E-key.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 47 ++++++++++++++-----
 1 file changed, 36 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 6e99122c65ac..f1ff64a84267 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -83,6 +83,17 @@ pp3300_s3: regulator-pp3300-s3 {
 		vin-supply = <&pp3300_z2>;
 	};
 
+	pp3300_wlan: regulator-pp3300-wlan {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pp3300_wlan_en_pin>;
+		regulator-name = "pp3300_wlan";
+		/* load switch */
+		enable-active-high;
+		gpio = <&pio 58 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&pp3300_z2>;
+	};
+
 	/* system wide 3.3V power rail */
 	pp3300_z2: regulator-pp3300-z2 {
 		compatible = "regulator-fixed";
@@ -760,10 +771,25 @@ &ovl0_in {
 };
 
 &pcie1 {
-	status = "okay";
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_pins_default>;
+	status = "okay";
+
+	pcie@0 {
+		compatible = "pciclass,0604";
+		reg = <0 0 0 0 0>;
+		device_type = "pci";
+		num-lanes = <1>;
+		vpcie3v3-supply = <&pp3300_wlan>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+
+		wifi@0 {
+			reg = <0 0 0 0 0>;
+			wakeup-source;
+		};
+	};
 };
 
 &pio {
@@ -1179,12 +1205,6 @@ pins-vreg-en {
 	};
 
 	pio_default: pio-default-pins {
-		pins-wifi-enable {
-			pinmux = <PINMUX_GPIO58__FUNC_GPIO58>;
-			output-high;
-			drive-strength = <14>;
-		};
-
 		pins-low-power-pd {
 			pinmux = <PINMUX_GPIO25__FUNC_GPIO25>,
 				 <PINMUX_GPIO26__FUNC_GPIO26>,
@@ -1222,6 +1242,12 @@ pins-low-power-pupd {
 		};
 	};
 
+	pp3300_wlan_en_pin: pp3300-wlan-en-pins {
+		pins-en {
+			pinmux = <PINMUX_GPIO58__FUNC_GPIO58>;
+		};
+	};
+
 	rt1019p_pins_default: rt1019p-default-pins {
 		pins-amp-sdb {
 			pinmux = <PINMUX_GPIO100__FUNC_GPIO100>;
@@ -1570,11 +1596,10 @@ &xhci2 {
 };
 
 &xhci3 {
-	status = "okay";
-
 	/* MT7921's USB Bluetooth has issues with USB2 LPM */
 	usb2-lpm-disable;
-	vbus-supply = <&usb_vbus>;
+	vbus-supply = <&pp3300_wlan>;
+	status = "okay";
 };
 
 #include <arm/cros-ec-keyboard.dtsi>
-- 
2.53.0.414.gf7e9f6c205-goog


