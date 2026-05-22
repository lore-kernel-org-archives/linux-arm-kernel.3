Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21879CD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 17:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sEzEUIi3oWaa4bkqOIR8hzCtlujzV1XyxBwf8XTkUg4=; b=3fMJGSPPZKjpH/03E9ruv+oQ/w
	0Tzfmllu4DLb2Zju70Pt2dbx6jf+8dK6DisLS0i0OEni1jlOt+a1SUqXdRqbUWJS2Fnz5Y6PS1+Gy
	IBZtBuG6AymbHE+oyQ72lFU88S4o4D1Whs16Pql8uofJAXz8MNivrwKMqoXIc6mzb8lJplCXXmP0J
	LCfQtL6MbMCY8zlU227DbUmPFs502r7FnzqtIAzCOq6WArWEZo/ZA2m6VTUMImkxfb/MYTykD61Ue
	i1P+jVtPJOcF/gMWuIyImz04CuR5zMUTxFXuzfBHJDpVOyE9+sy2SVRwkdxFygvTphdoyJAwQoN7r
	XK+spWMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQSTk-0000000BNwO-4B60;
	Fri, 22 May 2026 16:12:04 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQSTZ-0000000BNmR-2HcU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 16:11:54 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso54696895e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 09:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779466311; x=1780071111; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEzEUIi3oWaa4bkqOIR8hzCtlujzV1XyxBwf8XTkUg4=;
        b=DqpahI1w+afYWRYA2koLvabkc4fpXMFv3tjMIodMcMpahNyy1hTLFWAwBk6Mt9B+j5
         +DZmMszbaWKyWI4V67Lys9q3WorYVd1H9bos/RIavLKipDIDzDLbLH/6zdPU+OdjahZZ
         ywInfo9sls1EmFkVFLUsCyJjUQBi95BHf80LCQYSuoh/UC2/mF5qy6RG7WwqgSI2omlB
         FeJNAp4J25X0JuP7x6ftEMH8NKco+9xhjCAzKqwYnTztaFeXRhNRTl1jRpfIkzKNQZP7
         Bk8BNbSbcbNmEfbRPYKqI1qMicyxes4sZ8qfIExFXq9NxKBbztXANt4DMxhsmurdMNXh
         x1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779466311; x=1780071111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sEzEUIi3oWaa4bkqOIR8hzCtlujzV1XyxBwf8XTkUg4=;
        b=GBhugviHe0DX3Zc7mUXv6FIHbF2WMtMXmj8dmx/hcXxGs9nYokK0xtHdpMKqaTinPn
         TPyMKaZEK5m7TsprisjNH/MdF2Jt/N6ayOGiWynMDr5tSt5Hbdf+o0I7ziTPOTYBMT4T
         hDPNkPB5TBdfbRrD2bR4qHAGXiQnaQ7Ne0URQjcBcGj5qdHZFRWmxP8xaDsm14eT2YuW
         K69LN2oKfQ1whU4VC9SOUR61wXShBU/pFkVX+aF9UzDYNrTq2s+/tCi02hQ+suv7LyYR
         5objN+qMWAWPvhOO621dpWTDE0xNL/M5i0pCTHQ6HT5b+JFKFH2t3udCb1bh5JJYtorv
         XYjw==
X-Forwarded-Encrypted: i=1; AFNElJ95F+FunYagtfhpEXtmvfzl/PrncoP0w08Sw/m+w8P4lym9AowhonTGlDU9p9Ww4YAqW9bxM7jmlb+HJ9POozdm@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3dB4F4DlMcE5Th3vFJDNQckb/SCeUE59VEHS4pI8mMMHbwyJn
	MGre2a1wZ/krfPOI7YGSoUuv+VJBMWfZvcvjwZnOUWuGNfNmUlrS/OmM
X-Gm-Gg: Acq92OELioSsvHA0OMg1M1Mi0AxwXwrL7SRrYWzV6/V2a1t8Jm7CrqmXJ3XvpQA5MQ1
	n0jZngHL8kwlLj83nqDqCv133m/z4heRB5HCr53BSbGy7ZmN52dWgM20Gf/ArjhLVtoDGUnvbai
	GPLPmDkHI1qBEr/P7iWKz31OjoCRpAeWgPvZnZTEHykdkgIV6i1/fQDRz6agWSC2bhZFDEinQGG
	MrX2HwnIu352Du5Prhh4y4aJkKurGIiEQRb6Qkq5MVaG3dsUljkdyKfqBP7BnoOHRj05sZKxyBN
	eeDZJijA9/OUYwZYn9SDhST6dPxkQ93451j44RAEkLC++KiCaOLyaEYDrqyAwteMHOA0eMUBKxc
	/JAvSYDCUs6ZawyT3o9UCFU/HCItk+Ylu0e+fmfcTCVL041bNlOI8BiXX8Xd1wjyDpLoycyE5di
	joVo3IZIzeMtCa2LMLcroXUVjF6n8H9iR2hlW0+7Fk1g==
X-Received: by 2002:a05:600c:4fc9:b0:490:3893:c71 with SMTP id 5b1f17b1804b1-4904248839emr59095215e9.5.1779466311391;
        Fri, 22 May 2026 09:11:51 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b9asm51042755e9.11.2026.05.22.09.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 09:11:50 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 07/11] arm64: dts: ti: k3-am62-verdin: Add NAU8822 Bridge Tied Load
Date: Fri, 22 May 2026 17:11:11 +0100
Message-ID: <20260522161105.277519-20-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522161105.277519-13-ivitro@gmail.com>
References: <20260522161105.277519-13-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_091153_596870_DE68DBD3 
X-CRM114-Status: GOOD (  14.19  )
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

From: Vitor Soares <vitor.soares@toradex.com>

Add a device tree overlay enabling Bridge Tied Load (BTL) mode on the
Nuvoton NAU8822 audio codec present on the Verdin Development Board.
In BTL mode, the two loudspeaker outputs are bridged to deliver higher
output power on the X28 speaker connector.

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile                    |  4 ++++
 .../dts/ti/k3-am625-verdin-dev-nau8822-btl.dtso    | 14 ++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dev-nau8822-btl.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 14898f8ab0e2..a1083c0b2502 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -29,6 +29,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay-csi2-tevi-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-phyboard-lyra-rdk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-tqma62xx-mba62xx.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
@@ -224,6 +225,8 @@ k3-am625-sk-hdmi-audio-dtbs := k3-am625-sk.dtb k3-am62x-sk-hdmi-audio.dtbo
 k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
 	k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
+k3-am625-verdin-wifi-dev-nau8822-btl-dtbs := k3-am625-verdin-wifi-dev.dtb \
+	k3-am625-verdin-dev-nau8822-btl.dtbo
 k3-am625-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := \
 	k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-panel-cap-touch-7inch-dsi.dtbo
@@ -332,6 +335,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-sk-csi2-tevi-ov5640.dtb \
 	k3-am625-sk-hdmi-audio.dtb \
 	k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
+	k3-am625-verdin-wifi-dev-nau8822-btl.dtb \
 	k3-am625-verdin-wifi-dev-panel-cap-touch-7inch-dsi.dtb \
 	k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds.dtb \
 	k3-am62-lp-sk-hdmi-audio.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-dev-nau8822-btl.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-dev-nau8822-btl.dtso
new file mode 100644
index 000000000000..e4b662519a6b
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-dev-nau8822-btl.dtso
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Enable Bridge Tied Load (BTL) speaker mode on the Verdin Development Board,
+ * combining the two loudspeaker outputs for higher output power.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&nau8822_1a {
+	nuvoton,spk-btl;
+};
-- 
2.54.0


