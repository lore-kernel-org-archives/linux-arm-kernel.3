Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93D1C44506
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 15:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mEaEPgDHs/eRQrrc83NdButSZXS8RBVR7NJYdir/6Fk=; b=Ar3UflTPknZv/BxdZaQwbHQRmf
	usICGEJ8ECSmJnz0U/++0V2sxT29PWKUiyhMaUGQ6fBWLVrYFmRyZJM2PumwUtt2NUmfgdAGt4Aji
	SQ8mdOECAyWHxFSoxmALNA9MwTlK/V9dhgkmP3zQUmsgJzHy5ZRESWzd+4qxpVmiBRJ8APHHiQygR
	rtBuyIBkZnASM8r9inzVPz8AMZOMew6oSFRtGxJIoYeKkFFlBiWtC0HlwTXKt2kpXtDkHAwpr7Tl2
	uPL6aNhSbhIzJ7WF+TFzRtcF/y983hSzqPbggUnOcQNo3q1L0ifuxD5pP1/IiSZ2IYTXeNhR5iDDh
	Q3wvAk3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7wz-0000000FMG4-46hz;
	Tue, 07 Jul 2026 15:43:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7wr-0000000FM3e-2mW6;
	Tue, 07 Jul 2026 15:43:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=mEaEPgDHs/eRQrrc83NdButSZXS8RBVR7NJYdir/6Fk=; b=oOS3Jccw7U0jRI6LCle6Q0klB/
	prZj4/ZgjM1YSxODRl7f7tLxUG2aojcJqkusFgfBMlsjXRn5naTqKwcFMCjvNdiVqp5k6h+YGSuKl
	IxzlRGzzMHnbR+N8BpBlLL8HcfVBJ8mhOIjBORac9tc4dOGv4NdJ6GU763NV7b1IvM98bkQ/Jcim5
	7lRwq9sFvSZvjoFZIvLKdR+rMshr6pwjj/mIUwO7lzVV4U6dpHQpdV6WZMzO0Xs3OL/HdP08bCDuu
	g6xfb78WIwgPMj/xm8IY0/lfVmvWNXjak/qEE2F0aUcWYkN6xVjE9P0haTelWjGYepCfi3dipa8/n
	wjyu9/jw==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wh7wo-00000007cjn-2fSa;
	Tue, 07 Jul 2026 15:43:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783438976;
	bh=LJ6ZVFc0UffNbOs77FSWmD06wTHMRBp9lVFLgxT0GYA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ypi/l0ifpG2qVtkjUCdTE0b/8GyXFkylZCal6WUVN51dR1Kc6cz5TqSI6QRzx/O+h
	 xDIAoVpu6RlDeZgErmvW6SEb9wD3d83ngRRbtDqrsCF47Kmk2SKPL8e2bl+OF9mGF6
	 YxTFAlylzsXetBRMfQ0Up9+USN93exGlN3bcv9bSjJG2n9XzEtDv3C43N1o5Bl+a0L
	 rpifhdkwJB+aPcrLtoRu/f5CoZUUhQkZJuWPg57l7JZE518DzKurlI/i/XjPNTpkyw
	 zr1jqEkPkv4W1UzhcwGagEDLUY0fVC7FmMcq8Quc0aDF1joQ2uvfSMHyleoHpodQsN
	 xzdqTg50zdC7w==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DE48617E0DE6;
	Tue, 07 Jul 2026 17:42:55 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunfeng.yun@mediatek.com
Cc: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	justin.yeh@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH v3 09/12] phy: phy-mtk-dp: Rewrite and document default driving param macros
Date: Tue,  7 Jul 2026 17:42:42 +0200
Message-ID: <20260707154245.198361-10-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707154245.198361-1-angelogioacchino.delregno@collabora.com>
References: <20260707154245.198361-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_164258_824177_5059322E 
X-CRM114-Status: UNSURE (   8.16  )
X-CRM114-Notice: Please train this message.
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

Use FIELD_PREP_CONST and add nicer definitions/macros to build the
default driving parameters for the PHY and, while at it, also add
comments explaining what they are supposed to set in the PHY.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/phy/mediatek/phy-mtk-dp.c | 86 +++++++++++++++----------------
 1 file changed, 41 insertions(+), 45 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
index f59a415b401c..df193c712c77 100644
--- a/drivers/phy/mediatek/phy-mtk-dp.c
+++ b/drivers/phy/mediatek/phy-mtk-dp.c
@@ -91,51 +91,47 @@
  * [2,5,8]: Swing 2 Pre1 and Swing 3 Pre0
  */
 #define PHYD_DIG_NUM_DRV_PARA_REGS	9
-#define XTP_LN_TX_LCTXC0_SW0_PRE0_DEFAULT	BIT(4)
-#define XTP_LN_TX_LCTXC0_SW0_PRE1_DEFAULT	(BIT(10) | BIT(12))
-#define XTP_LN_TX_LCTXC0_SW0_PRE2_DEFAULT	GENMASK(20, 19)
-#define XTP_LN_TX_LCTXC0_SW0_PRE3_DEFAULT	GENMASK(29, 29)
-#define MT8195_DRIVING_PARAM_3_DEFAULT	(XTP_LN_TX_LCTXC0_SW0_PRE0_DEFAULT | \
-				 XTP_LN_TX_LCTXC0_SW0_PRE1_DEFAULT | \
-				 XTP_LN_TX_LCTXC0_SW0_PRE2_DEFAULT | \
-				 XTP_LN_TX_LCTXC0_SW0_PRE3_DEFAULT)
-
-#define XTP_LN_TX_LCTXC0_SW1_PRE0_DEFAULT	GENMASK(4, 3)
-#define XTP_LN_TX_LCTXC0_SW1_PRE1_DEFAULT	GENMASK(12, 9)
-#define XTP_LN_TX_LCTXC0_SW1_PRE2_DEFAULT	(BIT(18) | BIT(21))
-#define XTP_LN_TX_LCTXC0_SW2_PRE0_DEFAULT	GENMASK(29, 29)
-#define MT8195_DRIVING_PARAM_4_DEFAULT	(XTP_LN_TX_LCTXC0_SW1_PRE0_DEFAULT | \
-				 XTP_LN_TX_LCTXC0_SW1_PRE1_DEFAULT | \
-				 XTP_LN_TX_LCTXC0_SW1_PRE2_DEFAULT | \
-				 XTP_LN_TX_LCTXC0_SW2_PRE0_DEFAULT)
-
-#define XTP_LN_TX_LCTXC0_SW2_PRE1_DEFAULT	(BIT(3) | BIT(5))
-#define XTP_LN_TX_LCTXC0_SW3_PRE0_DEFAULT	GENMASK(13, 12)
-#define MT8195_DRIVING_PARAM_5_DEFAULT	(XTP_LN_TX_LCTXC0_SW2_PRE1_DEFAULT | \
-				 XTP_LN_TX_LCTXC0_SW3_PRE0_DEFAULT)
-
-#define XTP_LN_TX_LCTXCP1_SW0_PRE0_DEFAULT	0
-#define XTP_LN_TX_LCTXCP1_SW0_PRE1_DEFAULT	GENMASK(10, 10)
-#define XTP_LN_TX_LCTXCP1_SW0_PRE2_DEFAULT	GENMASK(19, 19)
-#define XTP_LN_TX_LCTXCP1_SW0_PRE3_DEFAULT	GENMASK(28, 28)
-#define MT8195_DRIVING_PARAM_6_DEFAULT	(XTP_LN_TX_LCTXCP1_SW0_PRE0_DEFAULT | \
-				 XTP_LN_TX_LCTXCP1_SW0_PRE1_DEFAULT | \
-				 XTP_LN_TX_LCTXCP1_SW0_PRE2_DEFAULT | \
-				 XTP_LN_TX_LCTXCP1_SW0_PRE3_DEFAULT)
-
-#define XTP_LN_TX_LCTXCP1_SW1_PRE0_DEFAULT	0
-#define XTP_LN_TX_LCTXCP1_SW1_PRE1_DEFAULT	GENMASK(10, 9)
-#define XTP_LN_TX_LCTXCP1_SW1_PRE2_DEFAULT	GENMASK(19, 18)
-#define XTP_LN_TX_LCTXCP1_SW2_PRE0_DEFAULT	0
-#define MT8195_DRIVING_PARAM_7_DEFAULT	(XTP_LN_TX_LCTXCP1_SW1_PRE0_DEFAULT | \
-				 XTP_LN_TX_LCTXCP1_SW1_PRE1_DEFAULT | \
-				 XTP_LN_TX_LCTXCP1_SW1_PRE2_DEFAULT | \
-				 XTP_LN_TX_LCTXCP1_SW2_PRE0_DEFAULT)
-
-#define XTP_LN_TX_LCTXCP1_SW2_PRE1_DEFAULT	GENMASK(3, 3)
-#define XTP_LN_TX_LCTXCP1_SW3_PRE0_DEFAULT	0
-#define MT8195_DRIVING_PARAM_8_DEFAULT	(XTP_LN_TX_LCTXCP1_SW2_PRE1_DEFAULT | \
-				 XTP_LN_TX_LCTXCP1_SW3_PRE0_DEFAULT)
+#define XTP_LN_TX_LCTXC_SW0_PRE0	GENMASK(5, 0)
+#define XTP_LN_TX_LCTXC_SW0_PRE1	GENMASK(13, 8)
+#define XTP_LN_TX_LCTXC_SW0_PRE2	GENMASK(21, 16)
+#define XTP_LN_TX_LCTXC_SW0_PRE3	GENMASK(29, 24)
+
+#define XTP_LN_TX_LCTXC_SW1_PRE0	GENMASK(5, 0)
+#define XTP_LN_TX_LCTXC_SW1_PRE1	GENMASK(13, 8)
+#define XTP_LN_TX_LCTXC_SW1_PRE2	GENMASK(21, 16)
+#define XTP_LN_TX_LCTXC_SW2_PRE0	GENMASK(29, 24)
+
+#define XTP_LN_TX_LCTXC_SW2_PRE1	GENMASK(5, 0)
+#define XTP_LN_TX_LCTXC_SW3_PRE0	GENMASK(13, 8)
+
+#define BUILD_DRIVING_PARAM_0(sw0_pre0, sw0_pre1, sw0_pre2, sw0_pre3) (	\
+	FIELD_PREP_CONST(XTP_LN_TX_LCTXC_SW0_PRE0, sw0_pre0) |		\
+	FIELD_PREP_CONST(XTP_LN_TX_LCTXC_SW0_PRE1, sw0_pre1) |		\
+	FIELD_PREP_CONST(XTP_LN_TX_LCTXC_SW0_PRE2, sw0_pre2) |		\
+	FIELD_PREP_CONST(XTP_LN_TX_LCTXC_SW0_PRE3, sw0_pre3)		\
+)
+
+#define BUILD_DRIVING_PARAM_12(sw1_pre0, sw1_pre1, sw1_pre2, sw2_pre0) (\
+	FIELD_PREP_CONST(XTP_LN_TX_LCTXC_SW1_PRE0, sw1_pre0) |		\
+	FIELD_PREP_CONST(XTP_LN_TX_LCTXC_SW1_PRE1, sw1_pre1) |		\
+	FIELD_PREP_CONST(XTP_LN_TX_LCTXC_SW1_PRE2, sw1_pre2) |		\
+	FIELD_PREP_CONST(XTP_LN_TX_LCTXC_SW2_PRE0, sw2_pre0)		\
+)
+
+#define BUILD_DRIVING_PARAM_23(sw2_pre1, sw3_pre0) (			\
+	FIELD_PREP_CONST(XTP_LN_TX_LCTXC_SW2_PRE1, sw2_pre1) |		\
+	FIELD_PREP_CONST(XTP_LN_TX_LCTXC_SW3_PRE0, sw3_pre0)		\
+)
+
+/* MT8195: Logic State Change Point (LC TX C) */
+#define MT8195_DRIVING_PARAM_3_DEFAULT	BUILD_DRIVING_PARAM_0( 16, 20, 24, 32)
+#define MT8195_DRIVING_PARAM_4_DEFAULT	BUILD_DRIVING_PARAM_12(24, 30, 36, 32)
+#define MT8195_DRIVING_PARAM_5_DEFAULT	BUILD_DRIVING_PARAM_23(40, 48)
+
+/* MT8195: Positive Edge (LC TX CP) */
+#define MT8195_DRIVING_PARAM_6_DEFAULT	BUILD_DRIVING_PARAM_0( 0, 4, 8, 16)
+#define MT8195_DRIVING_PARAM_7_DEFAULT	BUILD_DRIVING_PARAM_12(0, 6, 12, 0)
+#define MT8195_DRIVING_PARAM_8_DEFAULT	BUILD_DRIVING_PARAM_23(8, 0)
 
 enum mtk_dp_phya_ana_glb_regidx {
 	DP_PHYA_GLB_BIAS_GEN_0,
-- 
2.54.0


