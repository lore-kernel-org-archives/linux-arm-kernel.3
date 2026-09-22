Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26325C98308
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 14:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7aTHjSzS1R0vCIpKPbqs/XUMxbN0QidNLYGJ72kagVc=; b=PoafJwU6b4hGs/lFWWnUN/TXRI
	i0mEgrdSWZN+WtR4h+Z+tkvyDI13r1EfapnURYRw22ozznKB5tQkaHKpVN0VJG4I7v9ZjqOMjaaml
	lQFLEHP7bbLLkTZsmt7wf1QEaEcKh5rp3KlTuqHqLpyRX+iVSqack5xpbellWzChV5WkdShsxicgf
	ztQyOKJeZKwSCmUDbe0Ty4DHfrRjBvT5F2OIvtlOrRNYaIbhGDpOYtkmZtWgIpRSwM9V0vHTgjVGM
	uEvbljOGH0tBT/3+GBobw1EP3DRarrLyFwKEu3oKUVReFfM4QGfK6AKgGL401Z6GYX7/VoK1ZBAet
	oPglQ7ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x91ZX-00000005he0-3BzK;
	Tue, 22 Sep 2026 14:34:15 +0000
Received: from mail-ej2-x0f.google.com ([2a00:1450:4864:34::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x91ZP-00000005hZy-0tZy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 14:34:08 +0000
Received: by mail-ej2-x0f.google.com with SMTP id a640c23a62f3a-c2a4fbc5586so387730366b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 07:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790087645; x=1790692445; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7aTHjSzS1R0vCIpKPbqs/XUMxbN0QidNLYGJ72kagVc=;
        b=q8X+A6os8qppqhPojUKiDaRm1lGZiKnykDS34ixMl/eANnhNI+KwhF48IQEidjOmAt
         Q6R9l/jJgSAlWe0pS8QjCDJCi43i74+pOngrkfGHefd5Nv34dc/+ZBZbuxuphyB6tzOT
         ecWI9ZmwrnXtQyGux7xj9yl6wpQ+rAVlZhu8HDBAzw8xCu7yU4xEmUsfj0TzHuTtzl3Y
         9Zk+kmy7z4MMLu0Qg1O85gyQ5kH94bg7i3F6Y0kKjorEL8qqNlNq776ab5BtTWnASL6F
         JRHMVUyQIjcwzjWdeZIPF+PeTkmBJhxIAl8W5u1wh5vPLFFQTwO2czoXCfLfGP8UXSO4
         HR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087645; x=1790692445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7aTHjSzS1R0vCIpKPbqs/XUMxbN0QidNLYGJ72kagVc=;
        b=t7UgvXrMwfNX3nab/vLWjgdV/MQrg4hTumBg0M00upu6lTShuryd+/L3b6gca1AqX4
         AtNs3H2vLcM2Xvzq3ch+S9ZPGYCB4Hp8s1dTUJl+XR+lMxaTUPuSQR2XjYiBWZmIyRM4
         BTsPQVjg5jE5V466FOj4eE0CxJVVUfvMmqSu2tUHrIgidjh0Qho7YXUmWyU4CxIabb9H
         Yowpd8jyXBOPGRZex5XWQ3z+zHLUScQZ5Om5/xW8W+efOtHdaAmnFq2n2gtGmhYUU+97
         EPCkObRrRRrW8q6+t8pAS6OUMlZaCHnTt15qXsdrLPWeWd/Qdkphg02buQz4VYQUMxtr
         BbRA==
X-Forwarded-Encrypted: i=1; AKwUvBy6+2jZIWw/c7xhb3M56fic8k8O9FkRX0a7XVhfWrSLg6eQ0WUboLlwl6l/IaH13nMQk4fj6B0ykDlOiZa714fY@lists.infradead.org
X-Gm-Message-State: AFuF++nG+phP6vXbnT7Q9DLkjE5lpyFGz4KUe1Mr62JoE7WUOAIRDn36
	oPtOKvy+AI+Xv35onJJfjE/T/csDAVB9SFl0JkndK1aIzt2zwDtvh43A
X-Gm-Gg: AYBFou1pN8qDak8wVCq/CIapCbMHEuqyGLZDDO4X1UiGf+lpfcqbW757XqkmI9M9uzM
	wWpJl+UztowqPgRp4tvIHkPV0Qy6y2Syuk96IOKqGJPJzCeSkWzCMtaVdDh8ZshIPg8htFtvFO+
	hQYygzkcKxnBjQzqoGTDUCuEL/2nqUM6F+n+24ITZQ2XSmcuX2ht6QwXpOhmTTgBkS0mgn3s3EV
	iFGH2gPsaGMpL/k386KPy0k3gTsOIkW1/qMc6j1BBhGAfb2OIQ0sFwYqTuRKIxeXckmtsWN27Wp
	CGQ7wMldNehenjhJ7TfJFyS3Yg1i16p891E/Wqk/EYkOIVHdRm/j7/8kP6oXeM47nY04Idq2cg9
	B5KbyyvDpdC81/Ee/47H2ESzn0jZi32ay9XL6hlY9Aw25nvPG9tYonijplmSXyJVwfjZ71s/acD
	FXvoOzCRhOPuCwN7RdC19Qrziba8aNhZw79Bqy4E+grjpxPeJS58aBYJe5Dwg2xQHZYtOyByQRB
	7veTF46s4PchZdG8wYFzYGCTIBAkvG1LfoKSGfdAj+nwnMk7ntA39mqypyILkQVAnAAZgo5v/qm
	XFR2CnN0
X-Received: by 2002:a17:907:dac:b0:c29:f5d8:9c75 with SMTP id a640c23a62f3a-c2a15834020mr1228411666b.36.1790087645170;
        Tue, 22 Sep 2026 07:34:05 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c5814e2sm103469966b.27.2026.09.22.07.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 07:34:04 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Tue, 22 Sep 2026 16:33:46 +0200
Subject: [PATCH 1/4] arm64: dts: freescale: imx95-verdin: Add NAU8822
 Bridge Tied Load
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-v1-imx95-overlays-v1-1-694100afb4bc@toradex.com>
References: <20260922-v1-imx95-overlays-v1-0-694100afb4bc@toradex.com>
In-Reply-To: <20260922-v1-imx95-overlays-v1-0-694100afb4bc@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_073407_272787_BF8D5C60 
X-CRM114-Status: GOOD (  14.43  )
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

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

The NAU8822 on the Verdin Development Board can combine its two
loudspeaker outputs into a Bridge Tied Load output. Add an overlay to
select this mode when using the board with Verdin iMX95.

The overlay is also combined with the Verdin iMX95 Development Board
device tree to provide a ready-to-use DTB for the WiFi SoM variant.
The codec and its routing are already described by the carrier device
tree.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                     |  4 ++++
 .../boot/dts/freescale/imx95-verdin-dev-nau8822-btl.dtso   | 14 ++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 7944e3b32513..a7ae74a706a8 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -959,6 +959,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596la-mba95xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-var-dart-sonata.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-ivy.dtb
@@ -966,12 +967,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
 
+imx95-verdin-wifi-dev-nau8822-btl-dtbs := imx95-verdin-wifi-dev.dtb imx95-verdin-dev-nau8822-btl.dtbo
+
 imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin-dev-nau8822-btl.dtso b/arch/arm64/boot/dts/freescale/imx95-verdin-dev-nau8822-btl.dtso
new file mode 100644
index 000000000000..e94c60381c4e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin-dev-nau8822-btl.dtso
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
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
2.43.0


