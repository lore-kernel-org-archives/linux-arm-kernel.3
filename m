Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D58560A2600
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 14:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p91tS4Do;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mX1xUva1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UxR1vV0a0gQBYDHK6NtA7PO5bZkmmtV5vXJv9zlPOvU=; b=p91tS4DoeWVaSv
	L/vaypZxDAF37r/SWN2DCndLNMGaM8EhdO/4hLophKd7RK068tJ8LJ0b1wj97UGukX8bJBOiCuJJt
	QWVN8cfUXZ4If6LOJxYvr0ctElR66UmTTHmbl0/aCYZHBcsGI97kJkCy10WBcPGIxvccdNKRYyy8r
	pOKVyHO3zwrsBpT3iOW3MdzaXSS7LyJ0BUxOcW6r2by7VY2mba6o/91YqjNLTasj87vTr1c06r/j5
	eOFKG6+uQ4NAa5HTPUnevlRmnWeeIgtB53UlPs2DiLF6Y2jvTuTtt5CInxjzE2gaZ38jnb/4ZS5tF
	3EF72rSvPPvoc1aM0kNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtUG-0000000EGpb-0dNY;
	Thu, 22 Oct 2026 14:09:44 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtUE-0000000EGoW-15OT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 14:09:43 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso1560618f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 07:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792678180; x=1793282980; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UxR1vV0a0gQBYDHK6NtA7PO5bZkmmtV5vXJv9zlPOvU=;
        b=mX1xUva1g4uPzF6kEHBq/85jLmooqos0AZiZeMFBiotfPXhLFh20em/HNyfi8hRBK0
         w/k6AvzjpZ3Km2VOarPo9PJKPBWYduj9m0jkVcYVLPFAke89OZMkOsnwFRIlj4+ihMHc
         O4aEK1PFrNA6mC92hNWiROXzz5PU4XMihI8LggsQT50kO3bNeHLKufel6f7q2u5dKMkc
         KF3/fttFUEW4hIu60MtgRgopjBwsqeceREHBG596e3WV5QXtC62c0COE4qWy0iihTD3l
         Poiscz0Y4EsEzWt6AhPQJpX0TgVb08AGA6ydxwuBp5OQHnAqRHFlggxfBSTn93Eku0or
         4iDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792678180; x=1793282980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UxR1vV0a0gQBYDHK6NtA7PO5bZkmmtV5vXJv9zlPOvU=;
        b=0CCWdxKJGjRqYQDaBtIYAe26h5WwoJTRlFAONT2LYl+Q3AJfYORWLh5F5Fcp58XgPN
         lYbNyTKl1c9iBN1TlOSD6IJxU0so768VIHRBNv5h0hDzu/HrVNlnOsZvoKxDYnsfSmnJ
         hLdK42XL8tMfYuHexz3d8+ajopnomJNGpCxKkViG1G/9xz3ezFyt9+M67PCEWr4QUtH7
         ZUk4a6MQpmaqj9l3mYXtPyX7QJvprn1qrd5B9Gk1E/6JqinYxZzXLmmlDE/iYcalpFZg
         /9hJrSu8TJuBtxbO07KbWXQnfAY4iZfp4GGuTQ1s2DbVYw71DdafRoSly2wdkAW3SfYL
         MOAg==
X-Forwarded-Encrypted: i=1; AKwUvBzfhD4ZJ6+9hwc0XD/BWcijZNu3QSFFGLXo8pIkbUiziBonWKWUfW399JbqWc70LkSXJSDzZYTZB9Nnqx5YFj8Z@lists.infradead.org
X-Gm-Message-State: AFq9FYJTm5JvyNMZis8Gx2wLgT9uv6ERSPOJPjYDMPFKrLjJz6F4ESVz
	dAn5/uOj0LD2dOH74dUCDFHxv1LxeKO4ymyOWEaeTJif5VpD5Uvcrvtj
X-Gm-Gg: AYBFou2kpyeaWyoG/prNAcYUO+u9E27bXU176FHMgF3zFGrpZpSjkDTiTfTBWCiXETs
	5/sc994DX2I4AmG+tDkJykpKhlmhx0HUOuTCIISv2JdZzoKIWnw92Rmmm7xtHKEidwii9g79dml
	ZST9PgfIqJ4A07rW/72m3V58m8I4RM2UMT1DGbQH1mEMV4tm78yq3XP7rA8/ccHNXvmsSUVzJ8P
	S07rF0m6TjSkbZfVIyM/AKulTRNILpO0QGeDHKyro96jyVvu0eywcFchwzs51kJYcHuMhSeoJdT
	KIW9rgfPgGp/wBjx3Fnn68C6gMBgkwVYkrzNmmID5fBllDtGXHgwR0pKkESinUZCM3zJfY4V9pg
	9iyruqnXkO4Nb+/vbzZCKI8vCUaD5ZYuabkkXcG86dBQ1h1x3lyup+4BElvnTgaEHdzO9aRjrKu
	zdeU08pe9cx8wTLOw7BVmvpOSDRZvjTrA6ZNcbvP/lOW16gmO0XQeqnvA7JY9JyTGoFfftDGil9
	XC5TPGN6OTRUhUh+hhOO+rFYFCNt9WwSxUWS1noi69jU9Fwhs7dvnmdh/9nHZw/q4SrqZGF9YD3
	X6gZR5LcoSfefXzAOtsI+VfrNs5QPK6Q3A/TWqcoLH5otg04Kw39Rcg=
X-Received: by 2002:a05:6000:26c9:b0:48e:1299:663f with SMTP id ffacd0b85a97d-48e264f1802mr11901050f8f.56.1792678180098;
        Thu, 22 Oct 2026 07:09:40 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2584e760sm12368150f8f.59.2026.10.22.07.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:09:39 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 16:09:33 +0200
Subject: [PATCH v2 1/5] arm64: dts: freescale: imx8mm-verdin: Share the
 UART_4 MCU overlay
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-v1-imx95-overlays-v2-1-c769d6eb54fd@toradex.com>
References: <20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com>
In-Reply-To: <20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com>
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
X-CRM114-CacheID: sfid-20261022_070942_330641_03FE08FD 
X-CRM114-Status: GOOD (  17.01  )
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Verdin UART_4 is the UART the module assigns to the Cortex-M4F core.
Other Toradex modules also assign one UART to their Cortex-M core, such
as Verdin and Aquila UART_4 and SMARC SER0 on i.MX95, but on a different
UART instance, so an overlay naming the instance cannot be shared.

Label the UART uart_mcu in the module device tree and turn the Verdin
iMX8M Mini overlay into imx-tdx-uart-mcu.dtso, which reserves the
labelled UART. The combined Verdin iMX8M Mini DTB keeps its name.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                     |  5 +++--
 arch/arm64/boot/dts/freescale/imx-tdx-uart-mcu.dtso        | 14 ++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mm-verdin-uart4-mcu.dtso | 14 --------------
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi           |  2 +-
 4 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a80cccf34eb5..a40bcbe4876d 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -107,6 +107,8 @@ dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-tqmlx2160a-mblx2160a-14-11-x.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-tqmlx2160a-mblx2160a-14-8-x.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-tqmlx2160a-mblx2160a-14-7-x.dtb
 
+dtb-$(CONFIG_ARCH_MXC) += imx-tdx-uart-mcu.dtbo
+
 dtb-$(CONFIG_ARCH_MXC) += imx8dx-colibri-aster.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8dx-colibri-eval-v3.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8dx-colibri-iris-v2.dtb
@@ -268,7 +270,6 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
-dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-uart4-mcu.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia.dtb
@@ -298,7 +299,7 @@ imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := imx8mm-verdin-
 imx8mm-verdin-wifi-dev-nau8822-btl-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dev-nau8822-btl.dtbo
 imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := imx8mm-verdin-wifi-dev.dtb \
 	imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
-imx8mm-verdin-wifi-dev-uart4-mcu-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-uart4-mcu.dtbo
+imx8mm-verdin-wifi-dev-uart4-mcu-dtbs := imx8mm-verdin-wifi-dev.dtb imx-tdx-uart-mcu.dtbo
 imx8mm-verdin-wifi-yavia-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-yavia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 
 imx8mm-tqma8mqml-mba8mx-lvds-g133han01-dtbs += imx8mm-tqma8mqml-mba8mx.dtb imx8mm-tqma8mqml-mba8mx-lvds-g133han01.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx-tdx-uart-mcu.dtso b/arch/arm64/boot/dts/freescale/imx-tdx-uart-mcu.dtso
new file mode 100644
index 000000000000..001bc3286e8e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx-tdx-uart-mcu.dtso
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Reserve the UART that the module assigns to its Cortex-M core, labelled
+ * uart_mcu in the module device tree, so that Linux does not claim it.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&uart_mcu {
+	status = "reserved";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-uart4-mcu.dtso b/arch/arm64/boot/dts/freescale/imx8mm-verdin-uart4-mcu.dtso
deleted file mode 100644
index 8dbecffe9e7b..000000000000
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin-uart4-mcu.dtso
+++ /dev/null
@@ -1,14 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
-/*
- * Copyright (c) Toradex
- *
- * Verdin iMX8M Mini UART_4 for Cortex-M4F
- */
-
-/dts-v1/;
-/plugin/;
-
-/* Verdin UART_4 */
-&uart4 {
-	status = "reserved";
-};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
index 4f64c5da8d15..1ac9d000d415 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
@@ -776,7 +776,7 @@ &uart3 {
  * Verdin UART_4
  * Resource allocated to M4 by default, must not be accessed from Cortex-A35 or you get an OOPS
  */
-&uart4 {
+uart_mcu: &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart4>;
 };

-- 
2.43.0


