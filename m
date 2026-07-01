Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70240C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 18:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xO6I0cQmE/o/jLdfAj6Gj34sxxTE7oWAFzWnpM35sCs=; b=ItflVVKPjedGek5eTj28ze7uCJ
	tTvaWCpZ6XoovNeBYcxTFgPnBJclXeIIKXapYikE234z0bN7mofSr0HQ7ulsNo70KJTQE1OCMkCU0
	Aq3Om2FLGqWt32698dqeksEt/L2phG3rm8dCIK7GMv53rtTDqnIGglDfwAHJ2qAeT1RJvcYskgl4C
	MIxKkcEra64/g+j4NHFXBDEN07b8Pv1NhzPTcv8tXZ0ozfHL7+rAKLQGOOTPwGjXazTdxHmu1u0cL
	OhnNKB2nz+Tz/F6YURTqkfEcBbkmq3/cgNrNtR5B0+JkSwwgiBifAx5ZQ5Lttxa9YFVigHNDnKKbD
	PjnoMeQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetwM-00000001txO-1o17;
	Wed, 01 Jul 2026 12:21:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetw6-00000001tKd-2mee;
	Wed, 01 Jul 2026 12:21:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=xO6I0cQmE/o/jLdfAj6Gj34sxxTE7oWAFzWnpM35sCs=; b=YeOrbSloLYXIQS90sqCbQCF27b
	Tn4mOXy7dyEI3thr1+xbmWs4AgCYM0MRn97Ja6F7MzMQlJ1tNrnSP11v3agPW1PnUXzh76zes1wJM
	k4FGSy3uJCo+zsGVLEsCuWvMJujlfW/9Y5JdRY1IjCTyxbusojq5wLwkfzWmt5tJJjDG2f8AfQN6V
	HFi4VeR8qlCwHK6PmaIVwvoWuYXFFdQMdDhQVYhkbRoAVSuIy3jeqJebG/kFJHb+N7w7+X4pbuGjZ
	vXkvS5Sx2vAzIdw7iEd4br7ujtVRI8szU4ntcYaROExYQpYDpqLsPck1Xiw3t1y722caqIq0r5qwm
	O8b2ahMQ==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wetw1-00000002jXW-2UCE;
	Wed, 01 Jul 2026 12:21:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908456;
	bh=MH9rZNYjTexT9/FSQg9LOO/88ptllu4jdjcPjbmJHTI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FDRdcObXoQGxpSBq5tszZW0ObJHRVfa1cpxLK2fqJaguAl4arNEC8PkiDPWOxEPS2
	 kPT3nTIPZucvglyTd4QyXT7CRzScrN9bA1pPwRu/SCln3UkIs17qth1mlxI7f/u21h
	 Yrk2sLk8MfrIVWu5oFcok/amzu4dcbU2IPjodTIyR2FlR6PU+GknNRjvMYgP/nUU+X
	 M0N97n2pUUBEH+NN4WT+vqAP9vcFBa81t6EvqPShuYnhPLEW9w4qnWiY3UcO6OIDzz
	 KvAH3judd6aJtkXr0hCd7cc219UNmYi4OhUcJED2BjR85rMn4oKCFnooEAA4544XIe
	 HRb9uvJB5S/5Q==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0BBC317E116D;
	Wed,  1 Jul 2026 14:20:55 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	andi.shyti@kernel.org,
	djakov@kernel.org,
	broonie@kernel.org,
	jitao.shi@mediatek.com,
	ck.hu@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	kernel@collabora.com
Subject: [PATCH 6/6] soc: mediatek: mtk-mmsys: Use MMSYS_ROUTE() in default routing table
Date: Wed,  1 Jul 2026 14:20:43 +0200
Message-ID: <20260701122043.19612-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701122043.19612-1-angelogioacchino.delregno@collabora.com>
References: <20260701122043.19612-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_132057_755176_8D6C1960 
X-CRM114-Status: GOOD (  11.54  )
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

All of the mtk_mmsys_routes tables for all SoCs were converted to
use the MMSYS_ROUTE() macro but the default one used for MT2701,
MT2712 and SoCs from that generation was not: convert this one as
well.

This brings no functional change.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-mmsys.h | 279 +++++++++++++------------------
 1 file changed, 114 insertions(+), 165 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
index b37d859b6c14..d534d43aad6f 100644
--- a/drivers/soc/mediatek/mtk-mmsys.h
+++ b/drivers/soc/mediatek/mtk-mmsys.h
@@ -157,171 +157,120 @@ struct mtk_mmsys_driver_data {
  * to an independent table.
  */
 static const struct mtk_mmsys_routes mmsys_default_routing_table[] = {
-	{
-		DDP_COMPONENT_BLS, DDP_COMPONENT_DSI0,
-		DISP_REG_CONFIG_OUT_SEL, BLS_RDMA1_DSI_DPI_MASK,
-		BLS_TO_DSI_RDMA1_TO_DPI1
-	}, {
-		DDP_COMPONENT_BLS, DDP_COMPONENT_DSI0,
-		DISP_REG_CONFIG_DSI_SEL, DSI_SEL_IN_MASK,
-		DSI_SEL_IN_BLS
-	}, {
-		DDP_COMPONENT_BLS, DDP_COMPONENT_DPI0,
-		DISP_REG_CONFIG_OUT_SEL, BLS_RDMA1_DSI_DPI_MASK,
-		BLS_TO_DPI_RDMA1_TO_DSI
-	}, {
-		DDP_COMPONENT_BLS, DDP_COMPONENT_DPI0,
-		DISP_REG_CONFIG_DSI_SEL, DSI_SEL_IN_MASK,
-		DSI_SEL_IN_RDMA
-	}, {
-		DDP_COMPONENT_BLS, DDP_COMPONENT_DPI0,
-		DISP_REG_CONFIG_DPI_SEL, DPI_SEL_IN_MASK,
-		DPI_SEL_IN_BLS
-	}, {
-		DDP_COMPONENT_GAMMA, DDP_COMPONENT_RDMA1,
-		DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN, GAMMA_MOUT_EN_RDMA1,
-		GAMMA_MOUT_EN_RDMA1
-	}, {
-		DDP_COMPONENT_OD0, DDP_COMPONENT_RDMA0,
-		DISP_REG_CONFIG_DISP_OD_MOUT_EN, OD_MOUT_EN_RDMA0,
-		OD_MOUT_EN_RDMA0
-	}, {
-		DDP_COMPONENT_OD1, DDP_COMPONENT_RDMA1,
-		DISP_REG_CONFIG_DISP_OD_MOUT_EN, OD1_MOUT_EN_RDMA1,
-		OD1_MOUT_EN_RDMA1
-	}, {
-		DDP_COMPONENT_OVL0, DDP_COMPONENT_COLOR0,
-		DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, OVL0_MOUT_EN_COLOR0,
-		OVL0_MOUT_EN_COLOR0
-	}, {
-		DDP_COMPONENT_OVL0, DDP_COMPONENT_COLOR0,
-		DISP_REG_CONFIG_DISP_COLOR0_SEL_IN, COLOR0_SEL_IN_OVL0,
-		COLOR0_SEL_IN_OVL0
-	}, {
-		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
-		DISP_REG_CONFIG_DISP_OVL_MOUT_EN, OVL_MOUT_EN_RDMA,
-		OVL_MOUT_EN_RDMA
-	}, {
-		DDP_COMPONENT_OVL1, DDP_COMPONENT_COLOR1,
-		DISP_REG_CONFIG_DISP_OVL1_MOUT_EN, OVL1_MOUT_EN_COLOR1,
-		OVL1_MOUT_EN_COLOR1
-	}, {
-		DDP_COMPONENT_OVL1, DDP_COMPONENT_COLOR1,
-		DISP_REG_CONFIG_DISP_COLOR1_SEL_IN, COLOR1_SEL_IN_OVL1,
-		COLOR1_SEL_IN_OVL1
-	}, {
-		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DPI0,
-		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_MASK,
-		RDMA0_SOUT_DPI0
-	}, {
-		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DPI1,
-		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_MASK,
-		RDMA0_SOUT_DPI1
-	}, {
-		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DSI1,
-		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_MASK,
-		RDMA0_SOUT_DSI1
-	}, {
-		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DSI2,
-		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_MASK,
-		RDMA0_SOUT_DSI2
-	}, {
-		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DSI3,
-		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_MASK,
-		RDMA0_SOUT_DSI3
-	}, {
-		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
-		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_MASK,
-		RDMA1_SOUT_DPI0
-	}, {
-		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
-		DISP_REG_CONFIG_DPI_SEL_IN, DPI0_SEL_IN_MASK,
-		DPI0_SEL_IN_RDMA1
-	}, {
-		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI1,
-		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_MASK,
-		RDMA1_SOUT_DPI1
-	}, {
-		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI1,
-		DISP_REG_CONFIG_DPI_SEL_IN, DPI1_SEL_IN_MASK,
-		DPI1_SEL_IN_RDMA1
-	}, {
-		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI0,
-		DISP_REG_CONFIG_DSIE_SEL_IN, DSI0_SEL_IN_MASK,
-		DSI0_SEL_IN_RDMA1
-	}, {
-		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI1,
-		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_MASK,
-		RDMA1_SOUT_DSI1
-	}, {
-		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI1,
-		DISP_REG_CONFIG_DSIO_SEL_IN, DSI1_SEL_IN_MASK,
-		DSI1_SEL_IN_RDMA1
-	}, {
-		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI2,
-		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_MASK,
-		RDMA1_SOUT_DSI2
-	}, {
-		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI2,
-		DISP_REG_CONFIG_DSIE_SEL_IN, DSI2_SEL_IN_MASK,
-		DSI2_SEL_IN_RDMA1
-	}, {
-		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI3,
-		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_MASK,
-		RDMA1_SOUT_DSI3
-	}, {
-		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI3,
-		DISP_REG_CONFIG_DSIO_SEL_IN, DSI3_SEL_IN_MASK,
-		DSI3_SEL_IN_RDMA1
-	}, {
-		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DPI0,
-		DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_MASK,
-		RDMA2_SOUT_DPI0
-	}, {
-		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DPI0,
-		DISP_REG_CONFIG_DPI_SEL_IN, DPI0_SEL_IN_MASK,
-		DPI0_SEL_IN_RDMA2
-	}, {
-		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DPI1,
-		DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_MASK,
-		RDMA2_SOUT_DPI1
-	}, {
-		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DPI1,
-		DISP_REG_CONFIG_DPI_SEL_IN, DPI1_SEL_IN_MASK,
-		DPI1_SEL_IN_RDMA2
-	}, {
-		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI0,
-		DISP_REG_CONFIG_DSIE_SEL_IN, DSI0_SEL_IN_MASK,
-		DSI0_SEL_IN_RDMA2
-	}, {
-		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI1,
-		DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_MASK,
-		RDMA2_SOUT_DSI1
-	}, {
-		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI1,
-		DISP_REG_CONFIG_DSIO_SEL_IN, DSI1_SEL_IN_MASK,
-		DSI1_SEL_IN_RDMA2
-	}, {
-		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI2,
-		DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_MASK,
-		RDMA2_SOUT_DSI2
-	}, {
-		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI2,
-		DISP_REG_CONFIG_DSIE_SEL_IN, DSI2_SEL_IN_MASK,
-		DSI2_SEL_IN_RDMA2
-	}, {
-		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI3,
-		DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_MASK,
-		RDMA2_SOUT_DSI3
-	}, {
-		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI3,
-		DISP_REG_CONFIG_DSIO_SEL_IN, DSI3_SEL_IN_MASK,
-		DSI3_SEL_IN_RDMA2
-	}, {
-		DDP_COMPONENT_UFOE, DDP_COMPONENT_DSI0,
-		DISP_REG_CONFIG_DISP_UFOE_MOUT_EN, UFOE_MOUT_EN_DSI0,
-		UFOE_MOUT_EN_DSI0
-	}
+	MMSYS_ROUTE(BLS, 0, DSI, 0,
+		    DISP_REG_CONFIG_OUT_SEL, BLS_RDMA1_DSI_DPI_MASK,
+		    BLS_TO_DSI_RDMA1_TO_DPI1),
+	MMSYS_ROUTE(BLS, 0, DSI, 0,
+		    DISP_REG_CONFIG_DSI_SEL, DSI_SEL_IN_MASK,
+		    DSI_SEL_IN_BLS),
+	MMSYS_ROUTE(BLS, 0, DPI, 0,
+		    DISP_REG_CONFIG_OUT_SEL, BLS_RDMA1_DSI_DPI_MASK,
+		    BLS_TO_DPI_RDMA1_TO_DSI),
+	MMSYS_ROUTE(BLS, 0, DPI, 0,
+		    DISP_REG_CONFIG_DSI_SEL, DSI_SEL_IN_MASK,
+		    DSI_SEL_IN_RDMA),
+	MMSYS_ROUTE(BLS, 0, DPI, 0,
+		    DISP_REG_CONFIG_DPI_SEL, DPI_SEL_IN_MASK,
+		    DPI_SEL_IN_BLS),
+	MMSYS_ROUTE(GAMMA, 0, RDMA, 1,
+		    DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN, GAMMA_MOUT_EN_RDMA1,
+		    GAMMA_MOUT_EN_RDMA1),
+	MMSYS_ROUTE(OD, 0, RDMA, 0,
+		    DISP_REG_CONFIG_DISP_OD_MOUT_EN, OD_MOUT_EN_RDMA0,
+		    OD_MOUT_EN_RDMA0),
+	MMSYS_ROUTE(OD, 1, RDMA, 1,
+		    DISP_REG_CONFIG_DISP_OD_MOUT_EN, OD1_MOUT_EN_RDMA1,
+		    OD1_MOUT_EN_RDMA1),
+	MMSYS_ROUTE(OVL, 0, COLOR, 0,
+		    DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, OVL0_MOUT_EN_COLOR0,
+		    OVL0_MOUT_EN_COLOR0),
+	MMSYS_ROUTE(OVL, 0, COLOR, 0,
+		    DISP_REG_CONFIG_DISP_COLOR0_SEL_IN, COLOR0_SEL_IN_OVL0,
+		    COLOR0_SEL_IN_OVL0),
+	MMSYS_ROUTE(OVL, 0, RDMA, 0,
+		    DISP_REG_CONFIG_DISP_OVL_MOUT_EN, OVL_MOUT_EN_RDMA,
+		    OVL_MOUT_EN_RDMA),
+	MMSYS_ROUTE(OVL, 1, COLOR, 1,
+		    DISP_REG_CONFIG_DISP_OVL1_MOUT_EN, OVL1_MOUT_EN_COLOR1,
+		    OVL1_MOUT_EN_COLOR1),
+	MMSYS_ROUTE(OVL, 1, COLOR, 1,
+		    DISP_REG_CONFIG_DISP_COLOR1_SEL_IN, COLOR1_SEL_IN_OVL1,
+		    COLOR1_SEL_IN_OVL1),
+	MMSYS_ROUTE(RDMA, 0, DPI, 0,
+		    DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_MASK,
+		    RDMA0_SOUT_DPI0),
+	MMSYS_ROUTE(RDMA, 0, DPI, 1,
+		    DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_MASK,
+		    RDMA0_SOUT_DPI1),
+	MMSYS_ROUTE(RDMA, 0, DSI, 1,
+		    DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_MASK,
+		    RDMA0_SOUT_DSI1),
+	MMSYS_ROUTE(RDMA, 0, DSI, 2,
+		    DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_MASK,
+		    RDMA0_SOUT_DSI2),
+	MMSYS_ROUTE(RDMA, 0, DSI, 3,
+		    DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_MASK,
+		    RDMA0_SOUT_DSI3),
+	MMSYS_ROUTE(RDMA, 1, DPI, 0,
+		    DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_MASK,
+		    RDMA1_SOUT_DPI0),
+	MMSYS_ROUTE(RDMA, 1, DPI, 0,
+		    DISP_REG_CONFIG_DPI_SEL_IN, DPI0_SEL_IN_MASK,
+		    DPI0_SEL_IN_RDMA1),
+	MMSYS_ROUTE(RDMA, 1, DPI, 1,
+		    DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_MASK,
+		    RDMA1_SOUT_DPI1),
+	MMSYS_ROUTE(RDMA, 1, DPI, 1,
+		    DISP_REG_CONFIG_DPI_SEL_IN, DPI1_SEL_IN_MASK,
+		    DPI1_SEL_IN_RDMA1),
+	MMSYS_ROUTE(RDMA, 1, DSI, 0,
+		    DISP_REG_CONFIG_DSIE_SEL_IN, DSI0_SEL_IN_MASK,
+		    DSI0_SEL_IN_RDMA1),
+	MMSYS_ROUTE(RDMA, 1, DSI, 1,
+		    DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_MASK,
+		    RDMA1_SOUT_DSI1),
+	MMSYS_ROUTE(RDMA, 1, DSI, 1,
+		    DISP_REG_CONFIG_DSIO_SEL_IN, DSI1_SEL_IN_MASK,
+		    DSI1_SEL_IN_RDMA1),
+	MMSYS_ROUTE(RDMA, 1, DSI, 2,
+		    DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_MASK,
+		    RDMA1_SOUT_DSI2),
+	MMSYS_ROUTE(RDMA, 1, DSI, 2,
+		    DISP_REG_CONFIG_DSIE_SEL_IN, DSI2_SEL_IN_MASK,
+		    DSI2_SEL_IN_RDMA1),
+	MMSYS_ROUTE(RDMA, 1, DSI, 3,
+		    DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_MASK,
+		    RDMA1_SOUT_DSI3),
+	MMSYS_ROUTE(RDMA, 1, DSI, 3,
+		    DISP_REG_CONFIG_DSIO_SEL_IN, DSI3_SEL_IN_MASK,
+		    DSI3_SEL_IN_RDMA1),
+	MMSYS_ROUTE(RDMA, 2, DPI, 0,
+		    DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_MASK,
+		    RDMA2_SOUT_DPI0),
+	MMSYS_ROUTE(RDMA, 2, DPI, 0,
+		    DISP_REG_CONFIG_DPI_SEL_IN, DPI0_SEL_IN_MASK,
+		    DPI0_SEL_IN_RDMA2),
+	MMSYS_ROUTE(RDMA, 2, DPI, 1,
+		    DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_MASK,
+		    RDMA2_SOUT_DPI1),
+	MMSYS_ROUTE(RDMA, 2, DPI, 1,
+		    DISP_REG_CONFIG_DPI_SEL_IN, DPI1_SEL_IN_MASK,
+		    DPI1_SEL_IN_RDMA2),
+	MMSYS_ROUTE(RDMA, 2, DSI, 0,
+		    DISP_REG_CONFIG_DSIE_SEL_IN, DSI0_SEL_IN_MASK,
+		    DSI0_SEL_IN_RDMA2),
+	MMSYS_ROUTE(RDMA, 2, DSI, 1,
+		    DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_MASK,
+		    RDMA2_SOUT_DSI1),
+	MMSYS_ROUTE(RDMA, 2, DSI, 1,
+		    DISP_REG_CONFIG_DSIO_SEL_IN, DSI1_SEL_IN_MASK,
+		    DSI1_SEL_IN_RDMA2),
+	MMSYS_ROUTE(RDMA, 2, DSI, 2,
+		    DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_MASK,
+		    RDMA2_SOUT_DSI2),
+	MMSYS_ROUTE(RDMA, 2, DSI, 2,
+		    DISP_REG_CONFIG_DSIE_SEL_IN, DSI2_SEL_IN_MASK,
+		    DSI2_SEL_IN_RDMA2),
 };
 
 #endif /* __SOC_MEDIATEK_MTK_MMSYS_H */
-- 
2.54.0


