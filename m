Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A747D606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 17:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4g0XjdaF;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=lAGslH4X;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UBbC+PaP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ocwe/ua5bx6fTunJTjbDvG/Rp4d0BH8Fbx4UwIDjj0c=; b=4g0XjdaFnCPiYQZdlRVnHlVwuO
	R3EM5MFFAHpliKy1SnJwAjhfrqdnxfB0DgyxlGrL2pOa+c/akZz3AbWJ4e9XOEkRAuxzR7atNnjih
	TSHmOcuXp25oaaOky6EJLyN8XhxfJPrIvl7zU/JrotoQrvzX36TXv3MhJJyIPNlkqiPBoMHlrno8f
	q4beA7dkJCHI+Hgdf+uuVHrBRvt0/4vuhlQ83ArzpofV2myfrj6cMFOwC1hm2D2NcyOKiX6oKJOBk
	F1cwXcO1YvEKPHHyAgEgQ1RwM6c024vvJN8xG5ikSkkTGC52kRRJNy50V9/GApqYXB1cIeNl6cCrp
	iPAOSrNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJDnE-0000000AMti-4AuW;
	Tue, 20 Oct 2026 17:38:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJDnC-0000000AMsU-2h42
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 20 Oct 2026 17:38:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ocwe/ua5bx6fTunJTjbDvG/Rp4d0BH8Fbx4UwIDjj0c=; b=lAGslH4XA4Wr8YTE1rpztjqGRx
	vkCXJLf9/MfUPpVdu2Cf9vE26DC+i2jvefIVFxq/wz3bSkvWKYSF5BeuyLX68+lE2Lfj/DRBxdahV
	xlUxrfaXOFbMBH5YuOeU9IkueC1ye5ijoiCAlbVzbIfI5V7cGsk2KBSw481HvozGYnafKuMmXv2SK
	b2AOcWc1BmFVBfxbiCT83L5xCn96zCYFQZuFLYc04d2Bhlx+Ie9Y2jf0SOsB/oslzw0/snesPVt6N
	nH66tRqLnGAadC/Cq1Okd2J+zPn4jY6cQYiO/zLgWuqZ38A2fiR+4aHJ8xK8UTTDfAxMY8mQZ7axe
	PX7VmDqQ==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJDn9-000000051eE-3Rhw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 17:38:29 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso24368245e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 10:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792517906; x=1793122706; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ocwe/ua5bx6fTunJTjbDvG/Rp4d0BH8Fbx4UwIDjj0c=;
        b=UBbC+PaP4EGjvSoGTJHgrdSMA8ciJ/K7SEfPfjOOZdTwbv2UKNMu/3vPyX6bcA6OtU
         +XehIQfZEjTajFix6HQx82onIQKWStgZB4S1LkHy3rMzjDga3PNy0upgMWaU9qs9taVT
         GAZ8g/1UKfiCYqQ7Uv5JjvE3fRwGXLouU9roJF01u9GLzAlCVM8QMPs6QohVMVYmdtje
         VIFdGUP63yewurSeN6TdxM3S/kg741Qo/GgPEFQl4aOFWRXQ9kgvz/GJn2MQvlhBS5XM
         Cp9Oo1it6b8nt1N9Cdo38lW/rZ9LSoRS/yps7JsPTnd7VVAOJnAgmu9DECyg2Ml3tJRY
         0Z+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792517906; x=1793122706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ocwe/ua5bx6fTunJTjbDvG/Rp4d0BH8Fbx4UwIDjj0c=;
        b=MHSWyMdK9OibYmSXs/G1bw0urjdlwnibrNkOLtkjNl++wqTSjb+b/fqjMc3jc9CbRU
         Ib4P8scotTh/lUM0tA+X7oqYXvPj161tDvSKj+prS6MIuJb/Nyrg47jUgdB4iFUPvfOs
         gSZkzKCpusERzG5rTZByd7hVanTccH8mN5bJMBVc8fhT+aCZUoxH+NEoNdHo1DJO+vmx
         5FPva/NIaUC+7n9ujZdt0CyY5PWnlkK+v/3tFfeG8WxPof59EI4jPZDvkrdvfuFLBN2/
         8ozVDRgmpo7sELVyIDn14KrAtPkyioEBywVhXi2gMBowLI/ajVunq5KBH3kRSr4st30C
         Wotg==
X-Forwarded-Encrypted: i=1; AKwUvBzmI7ftUDujc5YIlcJW9EMy9g6GKkwuBw06uceDCYVxCL7Qtvb1EdUvq3A2gLCBwAQBukiRpJ8LsQ0OSQ612O0S@lists.infradead.org
X-Gm-Message-State: AFq9FYIo2sFV9mUA0lF7R9aOmYQHfZrLulJTzim8W03oURQbDo9OeKq7
	d8sWDjVdhHwsLzvsoHsjCK0X8amNKgcfk0G3O73C0/fgwI5Z0GgFmNlL
X-Gm-Gg: AYBFou2VOTvUgjPoBcMaF90bpQ3PaxNeuYaCDp6gRZMoVMm8/vbcnQwO2JsNH2lLFZS
	Emi6+eWjvOzHx2YFbK9bUElo/7yiyRKNbPiKii0GQqrwMmyrEAmzJlxnDv0X/Rh0s4ayfUSRb1N
	05Nzjy/GSE35aZp9jWKEpszYHKRsY/mMHsKl2N4axk3PyKiCFQXvZ4jYZ/R5+mJjN3a/cUEzsmy
	u7XvulVSpHUfuizDKYraApHSYllAf3qG0F4Q+DMNjHgNxbBTgwq4fcNe5AYS6xHqsZ+6xo9svfH
	zCliKwqYYXGXExmj5QN/LZTg99QxqlHq99xODkCCA7jrTdCzb26Bh5ZZ/F/hXYREns+TwAbyb4O
	p14fvaF2HUNaECe75lAcnF6T25+lANxvMDILLF/WuVI36FCfVSjDdQVzLWzNZUVlTq1BUIVE893
	9cjKoS2FoS4pTaKL45wbLHYjH7/s5gPLRqZrXH6PXqbxSVGzcsoeClXQkfBD1dJ94+/g==
X-Received: by 2002:a05:600c:3b1e:b0:49f:fdca:c361 with SMTP id 5b1f17b1804b1-4a1d75f9341mr271641575e9.12.1792517906016;
        Tue, 20 Oct 2026 10:38:26 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f8016c93sm52505235e9.5.2026.10.20.10.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 10:38:25 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH RESEND v10 9/9] arm64: dts: mediatek: Add MediaTek MT6392 PMIC dtsi
Date: Tue, 20 Oct 2026 19:33:30 +0200
Message-ID: <20261020173556.632798-10-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020173556.632798-1-l.scorcia@gmail.com>
References: <20261020173556.632798-1-l.scorcia@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_183828_088846_D4A5C09F 
X-CRM114-Status: GOOD (  19.19  )
X-Spam-Score: -0.2 (/)
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

Import the new file in the shared device tree for the Pumpkin boards.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6392.dtsi      | 145 ++++++++++++++++++
 .../boot/dts/mediatek/pumpkin-common.dtsi     |   7 +
 2 files changed, 152 insertions(+)
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
index 805fb82138a8..b19d5792bd89 100644
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
-- 
2.43.0


