Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB6FF3C242
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 12:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FRI44TdrdZ3Legx0P7loaEhsz45HIny8Im0Ko5rp3s8=; b=tw8u1vNH875prv7+87/+g9yivG
	wWof7rA9FrFasUyzFQo24qr2JWiVQOTLJZKSTvOd5ZuFS5zpULiz2isyZSXGDRAPPQoePn4wChupY
	eym6RQVXGbSdUz0/y6DVHW3SdX5Y5rdW8QGu6xvoj2iDMRSqRRLBPaIuYIoM+qyZfH0gapvikWNTw
	7Q6GqRAcy2PhQW7giKq6WEaZvZeYBP/PKoOUCvbkt07yYrYRJ19pDNupxdw2L8sUnRYQ4JdXnFitj
	AMr8PIio2GXY2tpftptELZdi7yQF9drfKdMlQggOm7NHPC0lugjI3dDmaB+jSsoNlLXexnuLnWw7e
	m5+XotAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzZMe-00000007G8U-1JMg;
	Mon, 09 Mar 2026 12:05:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzZMU-00000007Ft4-2HPh;
	Mon, 09 Mar 2026 12:05:27 +0000
X-UUID: 3eadc09e1bb011f19e7563141e833ce8-20260309
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=FRI44TdrdZ3Legx0P7loaEhsz45HIny8Im0Ko5rp3s8=;
	b=PneR0djy53DBUyiMFQDOf+8gWHHU1lQQmsvDcGsXKWcS8KlEhXFP/RnaVWxcmLQ9qXZ1pZVLHWfPA0IXd03XJf7KpOo5NiW5tCZMbdCJDHFHUyR+5XPU1pFPodSpHj7zrX1Ka/rzGKj5DYGWH+6bx/oTX/EurvtPxf7EGgE7sn4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:9edc8521-c640-4c08-954d-934fef71fd13,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:811f6ff1-16bd-4243-b4ca-b08ca08ab1d8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3eadc09e1bb011f19e7563141e833ce8-20260309
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <irving-ch.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1722731215; Mon, 09 Mar 2026 05:05:20 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 9 Mar 2026 20:05:17 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 9 Mar 2026 20:05:17 +0800
From: irving.ch.lin <irving-ch.lin@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Richard Cochran
	<richardcochran@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Miles Chen <miles.chen@mediatek.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <netdev@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Qiqi Wang
	<qiqi.wang@mediatek.com>, <sirius.wang@mediatek.com>,
	<vince-wl.liu@mediatek.com>, <jh.hsu@mediatek.com>,
	<irving-ch.lin@mediatek.com>
Subject: [PATCH v6 02/18] clk: mediatek: clk-mux: Make sure bypass clk enabled while setting MFG rate
Date: Mon, 9 Mar 2026 20:04:44 +0800
Message-ID: <20260309120512.3624804-3-irving-ch.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260309120512.3624804-1-irving-ch.lin@mediatek.com>
References: <20260309120512.3624804-1-irving-ch.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_050526_667009_8222AC6C 
X-CRM114-Status: GOOD (  11.50  )
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

From: Irving-CH Lin <irving-ch.lin@mediatek.com>

Enable bypass clock before MFG changing rate, to make sure
MFG reference clock available during transient.

Fixes: b66add7a74e8 ("clk: mediatek: mux: add clk notifier functions")
Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
---
 drivers/clk/mediatek/clk-mux.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index 5f4b07e7c757..574e35a42115 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -414,16 +414,21 @@ static int mtk_clk_mux_notifier_cb(struct notifier_block *nb,
 	struct clk_notifier_data *data = _data;
 	struct clk_hw *hw = __clk_get_hw(data->clk);
 	struct mtk_mux_nb *mux_nb = to_mtk_mux_nb(nb);
+	struct clk_hw *p_hw = clk_hw_get_parent_by_index(hw, mux_nb->bypass_index);
 	int ret = 0;
 
 	switch (event) {
 	case PRE_RATE_CHANGE:
-		mux_nb->original_index = mux_nb->ops->get_parent(hw);
-		ret = mux_nb->ops->set_parent(hw, mux_nb->bypass_index);
+		ret = clk_prepare_enable(p_hw->clk);
+		if (ret == 0) {
+			mux_nb->original_index = mux_nb->ops->get_parent(hw);
+			ret = mux_nb->ops->set_parent(hw, mux_nb->bypass_index);
+		}
 		break;
 	case POST_RATE_CHANGE:
 	case ABORT_RATE_CHANGE:
 		ret = mux_nb->ops->set_parent(hw, mux_nb->original_index);
+		clk_disable_unprepare(p_hw->clk);
 		break;
 	}
 
-- 
2.45.2


