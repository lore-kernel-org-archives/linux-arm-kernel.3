Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE1A606A334
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 14:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mlSKhyhg;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oZybPUtO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vXc4CAj//Yvh/R5TXeL7axIFzwlES1+gsFXpkClPxwY=; b=mlSKhyhggdSvAK
	S6dqEcEr2bNALtCF8s4dAkD4j9YFC2ChCHdFiP9eJ/6cLM91NdWiF6tgHn2cX9r2MSbXzmN0ZZLC4
	Ko2Hkh7T27d3fup4Q01D8lMsZiLps3Z3dGetI4hl5BDMwtop0TE6MhGgTZXbjCks86vTmlcNSO5R0
	vQ1jekxMWN2WKLmex/k77sZWwpVkJjWiDgxAl0D0XZFasrQiNMMZFexTx3zjMESophYkeolH8tc7C
	G3KSQFBj087RzsZyzFjknhzFCvvHC0GLpX1xLXJZ61qY8jJGbWuWvmXck7NT7ZDJzOP+U2X3MIjci
	3ylKocMH2vk/shhJ1p7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtUQ-0000000EGtz-1dWK;
	Thu, 22 Oct 2026 14:09:54 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtUF-0000000EGol-2T6Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 14:09:44 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso5522475e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 07:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792678181; x=1793282981; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vXc4CAj//Yvh/R5TXeL7axIFzwlES1+gsFXpkClPxwY=;
        b=oZybPUtOeujiUN3h/FJg16GlqTBw8Qr5++BqkIxi3ftMfgTNgkHwsK/VbvISQArdrq
         VDfKqOWPchnApI3EwHZrtQEtZmqKfK4k/GRpVTGOTPyl78hJqomATMocXMJ9/SC+NqAk
         7HzwfX7s5NJjIHxv1xpBLrVLe6NGHXnM8B1Yt+jLqOv1oPOIbg7pKtjpU+H4EbSPqt0J
         4cMm/lqwUuPQVX6SlpJpTQx12BTAeZm6aR/xUtToi37dA71f+duQSFxRQPWJjSe2Qctl
         hZiRQ2jPHis3Nj/sDpfOBMmQacLG3TfZyymzun5jQkK8xKBaWpMAimTpCL+trFsN3L1v
         sMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792678181; x=1793282981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vXc4CAj//Yvh/R5TXeL7axIFzwlES1+gsFXpkClPxwY=;
        b=n+RWzqQ4fM6g9haHRB/0xFG/o7/7wlsdIdljX9zd8JUAax/bTF7FfVBuE/YbqwqCky
         Lq+Ymmcxef/hWOobwk2KYwaOsdZpsvumdqzuWOf3kiQ03FsS8KEBbFw0UpiVB73KtP0Y
         ak6wdvcSzR7yZPSbYkweX6p9mf4zSL30lG1MfuQ0/AoxySA1YpWSv17okYI86dcgZDS7
         anmpaRKg5RTSawYFf/fv0idAbXlZBjDWuA1oNXiRwGUC6WoG+91Geoy2c1eEP4PJqM4x
         mVwTnDI2NXgHup2fyVtJ/Yymbk3l2C3VkWHIGCwT9DY/ArxjVW6bE+IVH2wl68w8vIRj
         PPwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxt2okpRGxKazTfZ6BL4ewBeGdneCnGwSaomT5Uk21bcWcBLXOsXOZdM/2iA7wGxDZTlsLfkm+gro+KL4kKd2t2@lists.infradead.org
X-Gm-Message-State: AFq9FYL/2rdb/QnzP7PUfioceT9/j7T4f0SUho2AYLZ8H7QQE6O6p4V/
	IxzulJgFSpZYXwAizFmv9C/K0l48Vr1HCJcFv53vYNr/M2zgtLblcqew
X-Gm-Gg: AYBFou1v2StxToI5j8QfKeR1mKMr/FhluGf3uCEpMd6s3bsYen4Q8kkkrkDF50HdE69
	RnyghRuNLUjp4kH5KQyTDIQnv5vwB/k3kpOn38edCnCvFKEcUaSrfhkl6L3WxMA+6kAiYy/wr6u
	Hcr2CGTzffE4t8rLVouMcmeClopH5FdB/ZXCX/GIW77dIW2UCk1Ri4IDTVtzXV5BlkkHzxlXapo
	gN4lNdThvDKro8YRN34UR+h3X86HaKfo8zRK1XnEYsuAEP0SEDs0KAduMR31xyKS91R74qpJZY9
	rv/fOjuOC/Dm6UfjNZDFRCdwbP6v0RIdMO5I9vcGEeVYE2jqfjYyD196s5h5zrafU3OHleD3lhR
	+fx8HycRNjUjX4ICihpjI67qmDUQp0Th7l7/OgfDgICEgMqH590AopBFP4ZXI/ujm4JrxZ2qLBf
	UuV5DhTeOUQ4HqtjnQzZ+7FSLZmNacpTYxSYgZD40fGeUzzls6XiRjFrskPpPNc5Wfh4+cbLQiX
	x6OeHjIo1azr/SinF2tng8FhIdh1hsA/vociIV7Fb0Y9JXONryFwyW6eg6TlSNqEPe+chjZwOQi
	kClDKxPy44ojPPrj86CfHbUame6uvgZyelREee/daQU1bRCxDdO8u5udizrPF6YIvNvfNMLr6hk
	J
X-Received: by 2002:a05:600c:1c19:b0:4a1:efba:511 with SMTP id 5b1f17b1804b1-4a1fdd74b84mr137319755e9.35.1792678181416;
        Thu, 22 Oct 2026 07:09:41 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2584e760sm12368150f8f.59.2026.10.22.07.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:09:40 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 16:09:34 +0200
Subject: [PATCH v2 2/5] arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7
 UART_4 overlay
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-v1-imx95-overlays-v2-2-c769d6eb54fd@toradex.com>
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
X-CRM114-CacheID: sfid-20261022_070943_651566_2AFF38D6 
X-CRM114-Status: GOOD (  12.87  )
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

Verdin UART_4 can be assigned to Cortex-M7 firmware. Label it uart_mcu
so the shared imx-tdx-uart-mcu overlay can reserve it, and combine the
overlay with the Verdin iMX8M Plus Development Board device tree to
provide a ready-to-use DTB for the non-WiFi SoM variant. UART_4 carries
Bluetooth on WiFi SoMs.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile           | 3 +++
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a40bcbe4876d..5ee9fa583515 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -732,6 +732,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw74xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw75xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw82xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-mallow.dtb
@@ -744,6 +745,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
 
+imx8mp-verdin-nonwifi-dev-uart4-mcu-dtbs := imx8mp-verdin-nonwifi-dev.dtb imx-tdx-uart-mcu.dtbo
+
 imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtbo
 imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-hdmi.dtbo
 imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
index 9fee2cf9ef54..7c9b21a041c5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -857,7 +857,7 @@ &uart3 {
 };
 
 /* Verdin UART_4, used for Bluetooth on Wi-Fi/Bluetooth SKUs */
-&uart4 {
+uart_mcu: &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart4>;
 };

-- 
2.43.0


