Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AC560A382C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 14:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uxPmA4H3;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E76B/fSS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WZHUSThoPU0ne8Qirrakt2mvv8fxh4b57S/T0d1mLFU=; b=uxPmA4H3VGyego
	Di8FQg1cuGAdk9aZq6mU7XoQkyBIFNDhwgyT66TzdyrfTOIEoTgvV99vAZha25ZTsGhXWzz40HWhy
	BFdlKAR77IHgDBWBAzuPJe45DZORV7i8LQWtQZRnNsdFcBIB8TNad2Do6lG9Rag4thzJlvceKK3uh
	g7h/0ozwkO+Mw8VXQaNqb4ij7O5D45mssSyRt8WC1fdLFhDcT1SiUCVx8cQBsJbWJfmBUavqEv8G/
	868Rhb7/xDWL6WfA4W7gTgmaaT2QsYDhD/AoNzafcgHHwg1qMuXEaW15DpCedTc60AJaJTPHLdyzK
	yYXD7WGLEHXsUZmy8moQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtUQ-0000000EGup-3A7A;
	Thu, 22 Oct 2026 14:09:54 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtUI-0000000EGqC-08Xw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 14:09:47 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-48b060ec084so1449597f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 07:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792678184; x=1793282984; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WZHUSThoPU0ne8Qirrakt2mvv8fxh4b57S/T0d1mLFU=;
        b=E76B/fSSCP6t22TbqRbDZq4Vvt6XFv/9guZ09sQpZiYi8xlqmEzqhd34S2AquJApne
         qGhvBSC/q6G4vDVFDebFyNJiIkUx65AVgvHHmvit1gPWIjukrhYM+tb0/rv1OOG6px1a
         H+vNvUnxhYYDI1W8fJ2Oc33a8FxePsfk4pf7VDI3uuJCaLhV0+DyHy9cK6FzI8Z6EOUl
         WTwk65M5r1vU10Zmqxrkd+Jurvea6wZYDRnwdzK6jRqjz+IYKFdaShQAIthmPxo9Fede
         P2fyS/3gsyhrSTB0+fip56h2Zrxu1ggCG6I6VkTXM84kVAwcgejx5z4qbDFr61swHDLu
         5wSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792678184; x=1793282984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZHUSThoPU0ne8Qirrakt2mvv8fxh4b57S/T0d1mLFU=;
        b=XlAwTfuI0vl8mHk689Z5kIcUp28NE1ZaMoSc1LX7RHG7R75NLRbr/WDe280Dsm69FL
         bd5popV416hpOCysSVaG886ac/F6kbvA6Pn75O9yJCBIRm+wGhlRcOFeCqgaA+A5CTau
         eJgodlmuCzWHG3IR4jPFqAuA0WuKRrdsqiWyoYibaziHmkenGUeKqGNBpOFpG0+eGCHY
         0ftRVyRF1FqiHiI9xHlJojEel2KAr8ORkCmRuU7bgs3Vd50aMKZMCHDd1Rimb5c3hBfg
         JD/Dp4r3bSj4hIozI5s7g3ZVF6wNdHekK87eJjH6HcIn/oy5tRp40gKHoQ6XuB3Khlwj
         Ixpw==
X-Forwarded-Encrypted: i=1; AKwUvBx4+/QW3Vq5Nrqzn7gsYx/H3MX+CSMhOxruMbXmMOgCJjc7HSygO7Bx/48bhFjgt7ZBoh4OcvRWArKvftj/QY4r@lists.infradead.org
X-Gm-Message-State: AFq9FYKlg57lIs8b9TeyIYYZwngcB1Qy2tO7QSjPnZb+fcuKUEPKR5c1
	33XbSufozTCxibHsuSkKgxVDh0U2z4FKN9FbgZIqetRSEc+CuPSjSvox
X-Gm-Gg: AYBFou1hZgtANs+7A3GNC4hniTnnono9MXSqJcX6ZSGjhEsl8fTJl6hxS594llsKaYy
	MHvD44wsE2jz0WJ5pdM1fcknHVowicvB4L+SEsht0ERcdiaMtGInpApqvqSViEku6er7Ng4G/NA
	/4LrXXyj8/xRoGjWXYEzSKYeTIs9ty6sIAC8Ist78cM5cWA2xlYD42zcecSecQCgZCzOwh1MO5L
	jbC82vVtdorKdtpwD7hEPiZpL647DB/GbqdvFFdgqbkE1Nn7nw665wlsPa48V9rgKBWfJInwQ4a
	tPMMqUD9qtN245PLV79pDlp4O0YhtdWPmNYvsCJOL3PdB0PZwosABkukIzCOdr4XLEbmiQz5UZ7
	OMsRYpSbRA9AHKrbGQF9jVx1qZj6GZ77a8WMKUUM3KpVPSUlDrP9RRMTduyvkkMrSGDB/EYu8TG
	nxdj/oeEmGQyYENDx+slHVW1RYIqppIb/cWDZlPtV/fGp8Uby6qdoC1jTYz5y7+fx9MkOD2TyL5
	xG2kupJQR5CP0D1KKoX6IwcrloGpUqcCzBBwHrbgcjZh/DYjQWs5M0nH2ZtB1Xkcq2ecBZk0JX3
	BLBB5Ky1EPEhH7BNKidokonAF55lGLhu2/6Giq7PkobCh4/DA4uv/jEWf5W2kQnK1wJQl9ODv2L
	X
X-Received: by 2002:a05:6000:60e:b0:48e:2b82:e833 with SMTP id ffacd0b85a97d-48e2b82e8b5mr7621910f8f.21.1792678184030;
        Thu, 22 Oct 2026 07:09:44 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2584e760sm12368150f8f.59.2026.10.22.07.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:09:43 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 16:09:36 +0200
Subject: [PATCH v2 4/5] arm64: dts: freescale: imx95-aquila: Add Cortex-M7
 UART_4 overlay
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-v1-imx95-overlays-v2-4-c769d6eb54fd@toradex.com>
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
X-CRM114-CacheID: sfid-20261022_070946_120141_6F09FF6E 
X-CRM114-Status: GOOD (  12.46  )
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

Aquila UART_4 can be assigned to Cortex-M7 firmware. Label it uart_mcu
so the shared imx-tdx-uart-mcu overlay can reserve it, and combine the
overlay with the Aquila iMX95 Development Board device tree to provide
a ready-to-use DTB. Firmware must configure the UART and its pads for
the intended MCU application.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile          | 2 ++
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index f957797d90a6..12786932858a 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -968,6 +968,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-frdm-pro.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-clover.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-navq.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-osm-dev.dtb
@@ -989,6 +990,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
 
+imx95-aquila-dev-uart4-mcu-dtbs := imx95-aquila-dev.dtb imx-tdx-uart-mcu.dtbo
 imx95-verdin-wifi-dev-uart4-mcu-dtbs := imx95-verdin-wifi-dev.dtb imx-tdx-uart-mcu.dtbo
 
 imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
index c5f4cf0541f2..d4e8768f382c 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
@@ -553,7 +553,7 @@ &lpuart1 {
 };
 
 /* Aquila UART_4 */
-&lpuart2 {
+uart_mcu: &lpuart2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart2>;
 };

-- 
2.43.0


