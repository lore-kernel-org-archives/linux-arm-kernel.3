Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25FBFEDA07
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 18:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u0En4KcL/SU6NkK1eXcFNBzstXxwR3LITHNqWxLtxrU=; b=Qz0hiIThsqBsj8+GM+d+K3hypp
	KouR5xdaQ84I7jtnysXXDzKtgViLTKVhqCd0dUx10lN0W8Cm+1t/PkmUeKV1sxp+9yagAAOCnj6UI
	7h5cG9rUvgoI5xiGM2P9JmERIJlzkeOGsMzja9Zns5FELKP7pLzNEYeSfhZ7O2lqEDZMjJmKhgkpI
	c5Ie7Fs6KA5yN7rRvLbNdg1dB6p05u8BRVTkHxuMjKA+Ye+b8KYn0ez09QE9vAZXPhac8pMuFJi8o
	TFTM0AWQEjZHcYIwZXNLTamW39Sqal1FaomjxhARPJJqhNA2dOLSseSCImzQ+NVAHtN0SSNELjuQm
	AkShPrdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ZRc-0000000758B-12cC;
	Tue, 17 Mar 2026 18:47:08 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ZRZ-0000000755h-2KuZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 18:47:06 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4852fdb36a8so71227985e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 11:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773773224; x=1774378024; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u0En4KcL/SU6NkK1eXcFNBzstXxwR3LITHNqWxLtxrU=;
        b=hnWDkmkFve1ACU6xwB+67O2dRMoMjowmsCU9VXF2YujbtFHaKyk1aLn1JCUAwRmHc8
         KmsoQNcz+55xtAAyjGHT+KM7aAmUwj+HyuW1cWt3sdDa0oFVafGdmYaHctyO6jj7BWeJ
         ZQ8FoHAHZ+lusA/ivaInv1M4toSb0WXrNXIdfOugXuWcx/TF+AoxVOenMa0OMMnq0IXB
         L/j0QgKB7dp0kmwwdmEJSKcn7ya62j2JEzee//qxcX4yBv4lH35sS5KKuE47D/T5s3g/
         XKMG8z0wtXlU9Bzvv8BMZgZNFdMWmhw9vv2SYwPThToaPAFdav1p9EE7Co5gzO325Wha
         htQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773773224; x=1774378024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u0En4KcL/SU6NkK1eXcFNBzstXxwR3LITHNqWxLtxrU=;
        b=dOw5r9+Jm3xSYfsXw3XCVgEq+KXbh5mmbzSnEVtBkg7gP7aXSziKIaPdj9SdnvLMRa
         iqFOGKXIMCGkGb4qlWBWnFW1OSOl1MHPEgrgMLV854YZcttU3iSey5DKn1kiCUEyK8Ib
         Qbd9Nns3kcT7tJPs22tyHxcQJ4M1m/x2FCc2xlzcSdOtqC1tEP1ybKnOB9qJQ5Y+1Ii0
         uZuOIxal1fphzDsCAxIsdp6h0Bioj+mrjSDMxTotSkpHPPYnIJamjZg1M9jUZF4Hq/dQ
         0488qvSWV2xGH1ejki8bfc/8RwmTpKXuK6CENBf+zozIGpfQAokbyGYH5yvqmL2wU308
         /J4A==
X-Forwarded-Encrypted: i=1; AJvYcCUn2yJdP8geJNvj6bTBhAlUcuQPFgcFoGK+nYKaNR9AMCL9S1LuQt600+t1qT+QtWSiGG/VPMZwRZawFsG+MDBn@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6yGYBwkE9Q7UmI6C5baRsxwMdLbLPScYLS536d/4dvcMwiZWv
	DuGE7RxWZXZCenQwhdc6rDKmH58Dyu+PcSi6xps6AAiPMwXGFDSFNBsB
X-Gm-Gg: ATEYQzyfmOITJb1W7vkY/o46c4ZK2y4qSfJs7wfrS25JjnhJAIFx20JG7k4JO2R4x+j
	QZKEwCgPER60WflE2kx6CWFqVV5A6ncehGYNAKL2QV07EZf9dsuMl8S14gnw6B8Myfz/VnI5Sew
	jCUCroAEq9RVxjfRXPCXEP7WIYoNFmnVxsqg+gcl+gf12jJEdtWyZ5qgHHJ9tTk48UxcRBLk04r
	kncffHAAvb28Jmmv0t1b42o5Qzq3GHw+lUpb/h2cjDghHpyf2r+r1aDrA7VzFhYrDGbEYZ5ndx9
	GbHXwMqWhkUv+2E/2WNzAFtJegabneGff/kFzupRGPQRhmsKq7BbYokvSnvtxhRSSzfpPCfl8+6
	vL27hbyzR8NSDINrRuJVBRRoPfrMDG46bJ1neNY9ZoJmGkRCYWEVzLhStV7vPNxLdozi2c3Dwhd
	rpEsCWutiLRRVSw4zLjl4=
X-Received: by 2002:a05:600c:4612:b0:485:40db:d40c with SMTP id 5b1f17b1804b1-486f442e710mr7845185e9.3.1773773223563;
        Tue, 17 Mar 2026 11:47:03 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4ba760esm102725e9.24.2026.03.17.11.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 11:47:03 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Gary Bisson <bisson.gary@gmail.com>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v3 9/9] arm64: dts: mt6392: add mt6392 PMIC dtsi
Date: Tue, 17 Mar 2026 18:43:12 +0000
Message-ID: <20260317184507.523060-10-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317184507.523060-1-l.scorcia@gmail.com>
References: <20260317184507.523060-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_114705_638910_4E3EA5B3 
X-CRM114-Status: GOOD (  13.78  )
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

From: Val Packett <val@packett.cool>

Add the dts to be included by all boards using the MT6392 PMIC.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt6392.dtsi | 141 +++++++++++++++++++++++
 1 file changed, 141 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/mt6392.dtsi b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
new file mode 100644
index 000000000000..fbf6f671524c
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ * Copyright (c) 2024 Val Packett <val@packett.cool>
+ */
+
+#include <dt-bindings/input/input.h>
+
+&pwrap {
+	pmic: pmic {
+		compatible = "mediatek,mt6392", "mediatek,mt6323";
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		keys {
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
+		pio6392: pinctrl {
+			compatible = "mediatek,mt6392-pinctrl";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		rtc {
+			compatible = "mediatek,mt6392-rtc",
+				"mediatek,mt6323-rtc";
+		};
+
+		regulators {
+			compatible = "mediatek,mt6392-regulator";
+
+			mt6392_vproc_reg: buck_vproc {
+				regulator-name = "vproc";
+			};
+
+			mt6392_vsys_reg: buck_vsys {
+				regulator-name = "vsys";
+			};
+
+			mt6392_vcore_reg: buck_vcore {
+				regulator-name = "vcore";
+			};
+
+			mt6392_vxo22_reg: ldo_vxo22 {
+				regulator-name = "vxo22";
+			};
+
+			mt6392_vaud22_reg: ldo_vaud22 {
+				regulator-name = "vaud22";
+			};
+
+			mt6392_vcama_reg: ldo_vcama {
+				regulator-name = "vcama";
+			};
+
+			mt6392_vaud28_reg: ldo_vaud28 {
+				regulator-name = "vaud28";
+			};
+
+			mt6392_vadc18_reg: ldo_vadc18 {
+				regulator-name = "vadc18";
+			};
+
+			mt6392_vcn35_reg: ldo_vcn35 {
+				regulator-name = "vcn35";
+			};
+
+			mt6392_vio28_reg: ldo_vio28 {
+				regulator-name = "vio28";
+			};
+
+			mt6392_vusb_reg: ldo_vusb {
+				regulator-name = "vusb";
+			};
+
+			mt6392_vmc_reg: ldo_vmc {
+				regulator-name = "vmc";
+			};
+
+			mt6392_vmch_reg: ldo_vmch {
+				regulator-name = "vmch";
+			};
+
+			mt6392_vemc3v3_reg: ldo_vemc3v3 {
+				regulator-name = "vemc3v3";
+			};
+
+			mt6392_vgp1_reg: ldo_vgp1 {
+				regulator-name = "vgp1";
+			};
+
+			mt6392_vgp2_reg: ldo_vgp2 {
+				regulator-name = "vgp2";
+			};
+
+			mt6392_vcn18_reg: ldo_vcn18 {
+				regulator-name = "vcn18";
+			};
+
+			mt6392_vcamaf_reg: ldo_vcamaf {
+				regulator-name = "vcamaf";
+			};
+
+			mt6392_vm_reg: ldo_vm {
+				regulator-name = "vm";
+			};
+
+			mt6392_vio18_reg: ldo_vio18 {
+				regulator-name = "vio18";
+			};
+
+			mt6392_vcamd_reg: ldo_vcamd {
+				regulator-name = "vcamd";
+			};
+
+			mt6392_vcamio_reg: ldo_vcamio {
+				regulator-name = "vcamio";
+			};
+
+			mt6392_vm25_reg: ldo_vm25 {
+				regulator-name = "vm25";
+			};
+
+			mt6392_vefuse_reg: ldo_vefuse {
+				regulator-name = "vefuse";
+			};
+		};
+	};
+};
-- 
2.43.0


