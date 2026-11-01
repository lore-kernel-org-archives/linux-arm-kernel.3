Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC838606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 04:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1cA+AT4+;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=Z4GrQNjD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=peN5ftTqyFAP70ofPsYsaUWUB0BkZNqrFQzWyZxPC0Y=; b=1cA+AT4+1W84NU
	BfCwSGP1e3IvRofRTRbDpJUpQkMDVpjrApEhKcR8C8IibEptRE1gfFF+3RyfUgvJdA/dEGr3b4bSH
	Q3Tb+pqEAZYvzsRUDgR/HFvOgZxE1U8Ax3YTVQFpOevk2eciqwKVEEXbb3XuPr2HEwSmjgXdZ/g9l
	+eINafEGC+VYNfBGFUnhiBAEl2BhzDxxdIC73epavAwqPz5sSGybhiZbo53K7y7M1U2U67xyYq7hs
	Ejcuez+ZaJbMiWW+lHbD9uWVtvjxDsXFra2GQyVj+mVKrqcUXspdf6nJ6ua/GJS+YutBg3S11dJEX
	UAwl0Q0amQ77BklMmJvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNMlo-0000000DrAE-2nYH;
	Sun, 01 Nov 2026 04:02:12 +0000
Received: from mail-m1039.netease.com ([154.81.10.39])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNMld-0000000Dr1j-2JeV;
	Sun, 01 Nov 2026 04:02:05 +0000
Received: from 5950x.tail741d0a.ts.net (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 530d84159;
	Sun, 1 Nov 2026 12:01:55 +0800 (GMT+08:00)
From: Xing Zheng <zhengxing@rock-chips.com>
To: broonie@kernel.org,
	heiko@sntech.de,
	linux-sound@vger.kernel.org
Cc: luca.ceresoli@bootlin.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	huangtao@rock-chips.com,
	sugar.zhang@rock-chips.com,
	lxt@rock-chips.com,
	xing.zheng@rock-chips.com
Subject: [PATCH v1 6/6] arm64: dts: rockchip: describe RK3308 codec detection resources
Date: Sun,  1 Nov 2026 12:01:25 +0800
Message-Id: <20261101040125.1864141-7-zhengxing@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261101040125.1864141-1-zhengxing@rock-chips.com>
References: <20261101040125.1864141-1-zhengxing@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa19545653203a8kunm8fccdc7416d2c3
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZGUMeVk9CGRpCQkhKGBlDTVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=Z4GrQNjDREKR9OntzCbcxyJ0F4IAzMQOh4a3q2Glom4QFLLIjtZYqUW//oeuY9C3Tn0Hsaws2HgV2mfhwcZGRi9pBHYoRerVStTJPO70+4cmGMgTNjIRcyhywQJBCkKj4NkZhSIfqL3wBwUvsZfbR3/LaY70oBqC4jxBb7WGeuU=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=peN5ftTqyFAP70ofPsYsaUWUB0BkZNqrFQzWyZxPC0Y=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_210201_814243_E427A8B6 
X-CRM114-Status: UNSURE (   6.42  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Describe the detection GRF phandle and the codec and headphone
interrupts for the internal audio codec. Name the interrupts so
consumers can identify the revision-B/C headphone detector without
depending on resource indices.

Keep board audio routes and external amplifier GPIOs out of the SoC
description.

Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
---
 arch/arm64/boot/dts/rockchip/rk3308.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3308.dtsi b/arch/arm64/boot/dts/rockchip/rk3308.dtsi
index 31c25de2d689..fb4465eda574 100644
--- a/arch/arm64/boot/dts/rockchip/rk3308.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3308.dtsi
@@ -836,6 +836,10 @@ codec: codec@ff560000 {
 		compatible = "rockchip,rk3308-codec";
 		reg = <0x0 0xff560000 0x0 0x10000>;
 		rockchip,grf = <&grf>;
+		rockchip,detect-grf = <&detect_grf>;
+		interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "codec", "hpdet";
 		clock-names = "mclk_tx", "mclk_rx", "hclk";
 		clocks = <&cru SCLK_I2S2_8CH_TX_OUT>,
 			 <&cru SCLK_I2S2_8CH_RX_OUT>,

