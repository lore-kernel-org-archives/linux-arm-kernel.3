Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC22606A325
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 04:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qsAlbBv1;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=Qo+QGKu9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1YdCZdKcu6jcPnOK3BGWqFQvI2/EckQ+hEW64XoLjBQ=; b=qsAlbBv1iAqV/v
	45HBKemPxyIfqBfZ3O24giGdRwLF36DGwT9P13PkTWUsch3PWNq9JQ6dsCyEgx6Xpt7A0Clv5Ui7Y
	mw8LRjLU6E0BTosnvHV/MfHnQubf7WHwSSjZ6/LPsiuksuedXiW9AaxEhZk19F6pLqi+gf3GAunqf
	Cg/3ljbxkf6VBL/id24vMv2UU4VUYUFTlJL+l0DwoYEaQqc+PZMww+eKpGWX8omA8HL37KVaHfroc
	wnjbNvFxBXztVCPcfQGQ6F8ykQmmE7wBvV/8CA8C/qQOtgAJtc4w/hDuan60jae8hw2MMvyxrhK1w
	NxV+ryfJEsZXtdDUTK4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNNOb-0000000Dt2O-1Wq1;
	Sun, 01 Nov 2026 04:42:17 +0000
Received: from mail-m16023652234.xmail.ntesmail.com ([160.236.52.234])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNNOL-0000000DsqN-2acB;
	Sun, 01 Nov 2026 04:42:03 +0000
Received: from 5950x.tail741d0a.ts.net (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 530dcc2d0;
	Sun, 1 Nov 2026 12:41:57 +0800 (GMT+08:00)
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
Subject: [PATCH v2 3/3] arm64: dts: rockchip: restore RK3308 codec detection resources
Date: Sun,  1 Nov 2026 12:41:49 +0800
Message-Id: <20261101044149.2018744-4-zhengxing@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261101044149.2018744-1-zhengxing@rock-chips.com>
References: <20261101040125.1864141-1-zhengxing@rock-chips.com>
 <20261101044149.2018744-1-zhengxing@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1956a0b3403a8kunmda3ed7c8171622
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGU1PVhlIHx5LQh8eGh5PQlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=Qo+QGKu9H6ce+LFR1oU9QsQVhG3e74EJkjnpj8SIfDd1aEgZml/aDzLjjWdRdtGtglK+oW17Y9kyzAyI9oTUgA+u9ISEFlDGS33/nK3Bep7Z4NXnrzBL+bewQUbNZISLwu+0dMzd5LhCV5ykGbHDeMqt/eCzoospCyW6exO7cgo=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=1YdCZdKcu6jcPnOK3BGWqFQvI2/EckQ+hEW64XoLjBQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_214201_927326_335F3C22 
X-CRM114-Status: UNSURE (   7.77  )
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

Provide the codec detect-GRF phandle and SPI 114/115 interrupt
resources with the same trigger type and ordering as the vendor DTS.
Name the interrupts codec and hpdet so the driver can request the
B/C headphone detector by name while retaining the legacy index 1.

Keep these SoC resources separate from EVB sound-card routing and
external amplifier GPIO configuration.

Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
---
Changes in v2:
- Retain the same SoC detection resources as v1; no functional change.
- Renumber after consolidating the full codec implementation.

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

