Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734EF606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 19:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mBclPPLF;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TYRftS+E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kSakqCvIRYmZp4Kah4XkFCmivNJpbW+r8furabcNvo4=; b=mBclPPLF+mjWbv
	HNmlzBA2hNXtBDRWWeqjGpcQ/Eg2QyFvR3Ib5zQf2ue3NkpXtSeEHutOiIHSPKd+P8Ho1HIzvQ0E6
	OZzZyrUieALup1NuPz7IkiEb3YDHfbfwjKkr8NWuWY1AjInZuiR21qqL6Ango5wS3bu6ppE3FQeBJ
	FuhiPIk2oAgGXTpDCs4e/NPukk0uR2ZY4BGUALokj8Mo1QqRkiRH8KMM2c96eZwMrFd3OBvQxNaik
	CL8EPHSNoPVU3Gy6iCyLgQ5l5OJoKqpOhBzR3HHv72GPdhWZhhzVeINnPHcLOTQLshwpY+Tds9Wh4
	DXp6BVXHutBwO08HgJdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3Yw-0000000AS6K-2ec8;
	Thu, 05 Nov 2026 19:55:54 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3YN-0000000ARuU-0fsA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 19:55:31 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so21508545e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 11:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793908517; x=1794513317; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kSakqCvIRYmZp4Kah4XkFCmivNJpbW+r8furabcNvo4=;
        b=TYRftS+Eft2N7HMfIZuIpsGKDfinjeiz8RfBwgGwj+JZ5Q41Xef4TRCve9Prbl+XEp
         HOuD48bzV9PHFFsVwlJiCGclZ8Q+Ro0SmqLmWc8aW4hv405YQzlsmsssDAcJB9ihp/tO
         h7HRbOfJ11FuD2UB4gmGa7v4oA1npH75DeJNNUYwKYYxJd0EV4kdnVWJcUfbxg03lXUu
         ZXNsxuCUlzZIBADuLGttkXEcVq5yU5z5Gbl9UFQpt3Q6wFZuG1fHwRFhWBW6VIwEz6kV
         ke9Xd+A2ohZRE3Pk0PkBmk3imXpYHnFeFFnboewkyIr5bgAaFU2kUYSja7SighBl6ymk
         y/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793908517; x=1794513317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kSakqCvIRYmZp4Kah4XkFCmivNJpbW+r8furabcNvo4=;
        b=Sozfw/zMDu14Gx4wVUdjJT/3RkNTbhWhL6tEXxovnpot6DC8DXc5uHrRDx68ZY21nX
         SJBYyzORK9BmsFg5yIg/a/bD3xyWKx1W4cc6uQXOTeppk2K4kE74t1tX2B+rCziO+lvy
         c/Vro5F3BmPCq2RbeueHSfPdlgrOEVQptjKyoWh3ILcnu1VfY/5GjNAEb719bkQ2AKZB
         oYGhja3JTIE0XXI3i+ZP18MAhBcAzHZo3nnqc3BO/1+rw2yg+o91NklrbJUPnJ0hsWOW
         g88HkXPfqXMrkv1FHdgBRm4y5pM5bgFIMnefiNtFF85wMieSxDxDlm7YEnD/6ucxhHGR
         426g==
X-Forwarded-Encrypted: i=1; AKwUvBw4NyPrvxP1O/WKIjIpFy2aFup85voNPV3ASuYKmWeJQzD+JAHJoNI6fUj/I0j1qkRwje7IHIYH23sMnPVHx0Sy@lists.infradead.org
X-Gm-Message-State: APuU4Z8x3pn3V25dy57G8aOQXsY6rhiZDPu7xb9SCLGj90xZcr/XppMm
	3MF67ar/mWMjnhgZslWyF7Iww0wHhhlrtVSAqpo6vzeqDnAbSaPlP/r0
X-Gm-Gg: AYBFou0woWFQKxFda3IxqqacrBtARF8GT+mXZXuVHqNImejOTufSYWdNUNd7LBRc05y
	ajQrVByJnbJtJSyPOUp3JsvtQnqKhPapQvc8UlxTUc8bbOJLLKhl1l5gTFo4HYUDpL+77SixTuR
	NvE/j70exx8vlPwUnvvaAN4sMWYtPLluhhOxfvuxN44vWgZlwOeLaZqDPwgumdBHy6On1lLuqFQ
	mnynWqARk193cEm7w5nqLs9IK2pLLTxBbLySK+ydf+L8uLOhsvkp0IVH6bPHEKAhTuOPcW9WH1p
	gkUL2bt6HJilJ6dCUODpHhNIH1GI+sQ/ZrseYGs6nVbEAcQT0LM72za7D9CUoJHTPbWJFNZDOus
	7Yw+O2Sbk8qBzHztB0sLhUh/04zx06I4XJ+OpYKNbdSOrb7bYzLbEwrYJQ8zbx2qETdOJtcsAci
	KyaafI1GgTUMjuL/xODFyNRlNNDElT/WQUFdthnXJOXxstlmlez0YKv063dIouY5q4siUf8UCQ3
	X/ewPKYkGdZa6hyvODK27tjXOUYLX2XCFujWBxV7vSO3EDLZI8E+g79YWcoK2q59MNEkJmMVnLI
	aM/inv9aLoaeQm8Q9QbrSen7
X-Received: by 2002:a05:600c:871b:b0:4a1:e57b:667c with SMTP id 5b1f17b1804b1-4b6df5e87f8mr2566715e9.26.1793908517156;
        Thu, 05 Nov 2026 11:55:17 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b5725fb0d1sm83862895e9.8.2026.11.05.11.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:55:16 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: [PATCH v12 8/8] arm64: dts: mediatek: Add MediaTek MT6392 PMIC dtsi
Date: Thu,  5 Nov 2026 20:50:28 +0100
Message-ID: <20261105195206.3440-6-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105195206.3440-1-l.scorcia@gmail.com>
References: <20261105195206.3440-1-l.scorcia@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_115520_425965_83EA2F8F 
X-CRM114-Status: GOOD (  18.40  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Val Packett <val@packett.cool>

Add the dtsi to be included by all boards using the MT6392 PMIC,
providing support for regulator, keys, pinctrl and RTC.

Import the new file in the shared device tree for the Pumpkin boards and
declare the regulators that must be enabled at boot for proper operation.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6392.dtsi      | 145 ++++++++++++++++++
 .../boot/dts/mediatek/pumpkin-common.dtsi     |  82 ++++++++++
 2 files changed, 227 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/mt6392.dtsi b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
new file mode 100644
index 000000000000..cc4770d70246
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ * Copyright (c) 2024 Val Packett <val@packett.cool>
+ * Copyright (c) 2026 Luca Leonardo Scorcia <l.scorcia@gmail.com>
+ */
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/regulator/mediatek,mt6392-regulator.h>
+
+&pwrap {
+	pmic: pmic {
+		compatible = "mediatek,mt6392";
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		mt6392keys: keys {
+			compatible = "mediatek,mt6392-keys";
+
+			key-power {
+				linux,keycodes = <KEY_POWER>;
+				wakeup-source;
+			};
+
+			key-home {
+				linux,keycodes = <KEY_HOME>;
+				wakeup-source;
+			};
+		};
+
+		mt6392pio: pinctrl {
+			compatible = "mediatek,mt6392-pinctrl";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		mt6392regulators: regulators {
+			compatible = "mediatek,mt6392-regulator";
+
+			/* Fixed supply defined in the data sheet */
+			avddldo-supply = <&mt6392_vsys_reg>;
+
+			mt6392_vcore_reg: vcore {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_BUCK_MODE_FORCE_PWM>;
+			};
+			mt6392_vproc_reg: vproc {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_BUCK_MODE_FORCE_PWM>;
+			};
+			mt6392_vsys_reg: vsys {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_BUCK_MODE_FORCE_PWM>;
+			};
+			mt6392_vaud28_reg: vaud28 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vxo22_reg: vxo22 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vaud22_reg: vaud22 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vadc18_reg: vadc18 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vcama_reg: vcama { };
+			mt6392_vcn35_reg: vcn35 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vio28_reg: vio28 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vusb_reg: vusb {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vmc_reg: vmc {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vmch_reg: vmch {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vemc3v3_reg: vemc3v3 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vcamaf_reg: vcamaf {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vgp1_reg: vgp1 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vgp2_reg: vgp2 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vefuse_reg: vefuse {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vm25_reg: vm25 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vdig18_reg: vdig18 { };
+			mt6392_vm_reg: vm {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vio18_reg: vio18 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vcn18_reg: vcn18 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vcamd_reg: vcamd {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vcamio_reg: vcamio {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vrtc_reg: vrtc { };
+		};
+
+		mt6392rtc: rtc {
+			compatible = "mediatek,mt6392-rtc", "mediatek,mt6323-rtc";
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
index 805fb82138a8..c6af3def4a29 100644
--- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
@@ -6,6 +6,8 @@
 
 #include <dt-bindings/gpio/gpio.h>
 
+#include "mt6392.dtsi"
+
 / {
 	aliases {
 		serial0 = &uart0;
@@ -160,6 +162,11 @@ &i2c2 {
 	status = "okay";
 };
 
+&pmic {
+	interrupt-parent = <&pio>;
+	interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
+};
+
 &uart0 {
 	status = "okay";
 };
@@ -251,3 +258,78 @@ pins-eth {
 		};
 	};
 };
+
+&mt6392_vcore_reg {
+	regulator-min-microvolt = <700000>;
+	regulator-max-microvolt = <1350000>;
+	regulator-always-on;
+	regulator-boot-on;
+};
+
+&mt6392_vproc_reg {
+	regulator-min-microvolt = <700000>;
+	regulator-max-microvolt = <1350000>;
+	regulator-always-on;
+	regulator-boot-on;
+};
+
+&mt6392_vsys_reg {
+	regulator-min-microvolt = <1400000>;
+	regulator-max-microvolt = <2987500>;
+	regulator-always-on;
+	regulator-boot-on;
+};
+
+&mt6392_vxo22_reg {
+	regulator-always-on;
+	regulator-boot-on;
+};
+
+&mt6392_vaud22_reg {
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <2200000>;
+	regulator-always-on;
+	regulator-boot-on;
+};
+
+&mt6392_vaud28_reg {
+	regulator-always-on;
+	regulator-boot-on;
+};
+
+&mt6392_vadc18_reg {
+	regulator-always-on;
+	regulator-boot-on;
+};
+
+&mt6392_vio28_reg {
+	regulator-always-on;
+	regulator-boot-on;
+};
+
+&mt6392_vusb_reg {
+	regulator-always-on;
+	regulator-boot-on;
+};
+
+&mt6392_vmc_reg {
+	regulator-boot-on;
+};
+
+&mt6392_vmch_reg {
+	regulator-boot-on;
+};
+
+&mt6392_vemc3v3_reg {
+	regulator-boot-on;
+};
+
+&mt6392_vm_reg {
+	regulator-always-on;
+	regulator-boot-on;
+};
+
+&mt6392_vio18_reg {
+	regulator-always-on;
+	regulator-boot-on;
+};
-- 
2.43.0


