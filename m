Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE86C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 16:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GaNgwEUZugLjq93ZAwVLHZ6D11IgA48Ev9vc639wRME=; b=u2eUQN0fz/kEODFVkjO7QaGUPY
	kyq9GRbsf4EuK2SG/WMCjVGkNZExMO5z/rmULJm6GSsl2X8hQxHf2+K1zlBFNOzKJjokb7ax+w+pO
	STltXIKSDotpZh0M3+widq+N07Z+K1lMveMtxpVtl8oh08JkfKBhLxQC3D0SkbnQVb2g7oVwPXN8d
	gRu98EUIm4DH+/reSlyOFj7nL/h7mTor/EohoLYqgyhVvhYo49gPxNJBJnQCiKziafYIG0Kd1i8Yn
	n0RkOwd5eMl7bMj9pL36EGXIcOvxTxGcC0brLvlxanYSce2d1lDTvzNp9ehZMM7oRYtMoAG3OkvrJ
	7sN7PtWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU6NW-00000006G81-175y;
	Tue, 24 Jun 2025 16:20:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4iX-00000005vaG-3Yfo;
	Tue, 24 Jun 2025 14:33:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=GaNgwEUZugLjq93ZAwVLHZ6D11IgA48Ev9vc639wRME=; b=Hq2Vuu9igr4QZQHOwmnSKWjRjD
	2KhwkZtox+qkZefVI3o++j8klQIbSX5MzPsaFG2INCccY3fkodMOz1fbxq4DwtYeG00MHw573afiB
	DNzHJTwCRvHkMcNtAOPlMA27zOgU6O4nfrSIsAiUeIdy4zedL0/9H0d3akwNOIWs1Jthq299u0NRl
	0VZsVC+fGLLlVZCrqWfCNjmIAMB+4WlchbGhDtuhsbTIHEXbsAbvY9D5FlroaWDUqebQCpF5aitiu
	7p70T4ESqs7xpOwFJ0v9pD637umTYvubfXEggupaJZw4okZ48dfwt2c8S7Fepr2PwBzRdDGaV+l2X
	/dNMty9w==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4iU-00000005Srb-49l4;
	Tue, 24 Jun 2025 14:33:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750775621;
	bh=r5c5hsCWKX10tYNXoxH3x5wqBhztaL6jU+1Ll1bHld4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LGM6ze92hhNZTJRTWWdp/J+3r6PDly4J4ML2T9hv/jDfuo8v2hH1aTF2H91C69boE
	 8XO4kNLZDK1DJT5mNNCIq2W0eOBFTiu8xwD1lfU2TseDPG6mYtgCQ4pVvVmHijSzxY
	 U/toFgFDgkeyVFnuovcBfS7v0p+49hy4GKm8svj7aSSEMK/gnclqu5RLsh+4hmZXoC
	 kD/XkOY0YCo5IeMQU8DHOP0L7oNcCZXkB7pOEhMoBgrstTfLAAvbQlho0M1lD7+HU2
	 vmI4PmnJGa5n31XqtAYhTKsfExw6TgolEs3a2TxjLilF6vcaNBF0z6Dgm7sFqleMx0
	 syETI1Rtwn/VA==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:d2c7:2075:2c3c:38e5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7F2DC17E1560;
	Tue, 24 Jun 2025 16:33:40 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de,
	richardcochran@gmail.com
Cc: guangjie.song@mediatek.com,
	wenst@chromium.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	kernel@collabora.com,
	Laura Nao <laura.nao@collabora.com>
Subject: [PATCH v2 08/29] clk: mediatek: clk-mtk: Add MUX_DIV_GATE macro
Date: Tue, 24 Jun 2025 16:31:59 +0200
Message-Id: <20250624143220.244549-9-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250624143220.244549-1-laura.nao@collabora.com>
References: <20250624143220.244549-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_153343_166433_F43732A1 
X-CRM114-Status: UNSURE (   9.31  )
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

On MT8196, some clocks use one register for parent selection and
gating, and a separate register for frequency division. Since composite
clocks can combine a mux, divider, and gate in a single entity, add a
macro to simplify registration of such clocks by combining parent
selection, frequency scaling, and enable control into one definition.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/clk/mediatek/clk-mtk.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index e2cefd9bc5b8..3498505b616e 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -176,6 +176,25 @@ struct mtk_composite {
 		.flags = 0,						\
 	}
 
+#define MUX_DIV_GATE(_id, _name, _parents,		\
+		_mux_reg, _mux_shift, _mux_width,	\
+		_div_reg, _div_shift, _div_width,	\
+		_gate_reg, _gate_shift) {		\
+		.id            = _id,			\
+		.name          = _name,			\
+		.parent_names  = _parents,		\
+		.num_parents   = ARRAY_SIZE(_parents),	\
+		.mux_reg       = _mux_reg,		\
+		.mux_shift     = _mux_shift,		\
+		.mux_width     = _mux_width,		\
+		.divider_reg   = _div_reg,		\
+		.divider_shift = _div_shift,		\
+		.divider_width = _div_width,		\
+		.gate_reg      = _gate_reg,		\
+		.gate_shift    = _gate_shift,		\
+		.flags         = CLK_SET_RATE_PARENT,	\
+	}
+
 int mtk_clk_register_composites(struct device *dev,
 				const struct mtk_composite *mcs, int num,
 				void __iomem *base, spinlock_t *lock,
-- 
2.39.5


