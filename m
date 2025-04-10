Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30081C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 15:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6qAiFntSOocLWKkMNczyCHDhGt8ueuTtAdLO0x/eeYg=; b=MgQNgf+a6WFlw4HVgeoAmatKnq
	qLzhhjqoniI338Ltw9uwEKbhwX6eGzXC5PH37JRnIF+FX/FE4z4RGW16RF1Sl41cLZJuifL2MVAHk
	/RgcxOO5mZY1QC1z0JgaCwXh1LYruAzjAwAEd1w0kafkHaJ3SUlCS9JU3pVatnzSFFu7FwrpCC9Io
	NLbQZOx40KXQepNU8lTHV5yBmABrnPFTgokX/z+/Z5pe0qlQtE9ITnFERyPSdNf4uOWYhdq8rD9i8
	Trw/nDhpXM+su0AaEw4gGhm87YvSkoXd+ERo0QqObxH7LL8FstbXw5+O+zWgtEPn4RRsNOKgHisw+
	awUJvTWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2tWw-0000000Axlq-0qEe;
	Thu, 10 Apr 2025 15:09:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2t50-0000000AsWC-3V7Z;
	Thu, 10 Apr 2025 14:40:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6qAiFntSOocLWKkMNczyCHDhGt8ueuTtAdLO0x/eeYg=; b=VqoqOyuEQsPVhPE1RvHI88fVrv
	mnQcXb/p0SeM63mJOApel1n1XUFnewmUYpRG68ZI7Nzed1STOpYtkiX7MmXCXKk7IJdofnn7FTGqp
	QKZ2XYlCDiyTMgzdEY90hBHXrL9l7trhKDoJj52QgdU30BzsCS4wheF/3JHq0RMDVzWxbCOpS3ugM
	h4zFAzvyaT4L3/RfW9DaI37pPXFX5unYP2b+wzY/Ji53UlCY3SpDLtSrQMgYtU4Gpt34nwGjfTXKZ
	XpPuFRp62heZcT013xPVvI2ksH5Ec1vvn/S2bEGz3yUVoZzu2VzmrydtVCjs2u1eXOAdn9BWJ5NCx
	5JfS2l9g==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2t4y-00000008pkS-05y3;
	Thu, 10 Apr 2025 14:40:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744296031;
	bh=kqSJ93vK2S4mqV0ElW2RKyULJci/G30jK+JAfppUqTA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZT/QaPsG4Fd/55L3wCh3wfRZTv3uf06znLWMLhAe+nvshFSt5X1jsusd//qD6iUO1
	 RSuRbBSVRDdj3XbXGhs2d/dysi2l2P9g2FNr/qNBBHYlp6y2su+xX9OvfESoLE/8rU
	 yNX66qQ3utbXRdpwKQ+wZ80X0ek/LkRbawO8g6lJZancmwEd5eb63V8+pwqm3/vaeD
	 1IC5QnsUK0+b6gvWX/meLc3y/pbVIKVnr5zq/TJ1IiVrs4OT+62IDioGGBMUSX25wN
	 rxa55xws+sm3XIqpVo/0GDoZ2clazWwnK6Gb4hH5BFIip8KS7V4rr4sEW2O1MqwIK0
	 jqD/RCGRUy9Ew==
Received: from IcarusMOD.eternityproject.eu (fi-19-199-243.service.infuturo.it [151.19.199.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9004F17E1072;
	Thu, 10 Apr 2025 16:40:29 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	henryc.chen@mediatek.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 5/5] soc: mediatek: mtk-dvfsrc: Add support for Dimensity 1200 MT6893
Date: Thu, 10 Apr 2025 16:40:19 +0200
Message-ID: <20250410144019.475930-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410144019.475930-1-angelogioacchino.delregno@collabora.com>
References: <20250410144019.475930-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_154032_218376_1C120E9A 
X-CRM114-Status: GOOD (  10.59  )
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

Add support for the MediaTek Dimensity 1200 (MT6893) SoC's DVFSRC
v2 hardware: the only difference between this and the only other
supported DVFSRCv2 SoC (MT8195) is the VCore-DRAM OPP array.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-dvfsrc.c | 40 +++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-dvfsrc.c b/drivers/soc/mediatek/mtk-dvfsrc.c
index 65c7d7bf743e..d24010b88c33 100644
--- a/drivers/soc/mediatek/mtk-dvfsrc.c
+++ b/drivers/soc/mediatek/mtk-dvfsrc.c
@@ -453,6 +453,45 @@ static const struct dvfsrc_bw_constraints dvfsrc_bw_constr_v2 = {
 	.max_dram_hrt_bw = 1023,
 };
 
+static const struct dvfsrc_opp dvfsrc_opp_mt6893_lp4[] = {
+	{ 0, 0 }, { 1, 0 }, { 2, 0 }, { 3, 0 },
+	{ 0, 1 }, { 1, 1 }, { 2, 1 }, { 3, 1 },
+	{ 0, 2 }, { 1, 2 }, { 2, 2 }, { 3, 2 },
+	{ 0, 3 }, { 1, 3 }, { 2, 3 }, { 3, 3 },
+	{ 1, 4 }, { 2, 4 }, { 3, 4 }, { 2, 5 },
+	{ 3, 5 }, { 3, 6 }, { 4, 6 }, { 4, 7 },
+};
+
+static const struct dvfsrc_opp_desc dvfsrc_opp_mt6893_desc[] = {
+	[0] = {
+		.opps = dvfsrc_opp_mt6893_lp4,
+		.num_opp = ARRAY_SIZE(dvfsrc_opp_mt6893_lp4),
+	}
+};
+
+static const struct dvfsrc_bw_constraints dvfsrc_bw_constr_mt6893 = {
+	.max_dram_nom_bw = 255,
+	.max_dram_peak_bw = 255,
+	.max_dram_hrt_bw = 1023,
+};
+
+static const struct dvfsrc_soc_data mt6893_data = {
+	.opps_desc = dvfsrc_opp_mt6893_desc,
+	.regs = dvfsrc_mt8195_regs,
+	.get_target_level = dvfsrc_get_target_level_v2,
+	.get_current_level = dvfsrc_get_current_level_v2,
+	.get_vcore_level = dvfsrc_get_vcore_level_v2,
+	.get_vscp_level = dvfsrc_get_vscp_level_v2,
+	.set_dram_bw = dvfsrc_set_dram_bw_v1,
+	.set_dram_peak_bw = dvfsrc_set_dram_peak_bw_v1,
+	.set_dram_hrt_bw = dvfsrc_set_dram_hrt_bw_v1,
+	.set_vcore_level = dvfsrc_set_vcore_level_v2,
+	.set_vscp_level = dvfsrc_set_vscp_level_v2,
+	.wait_for_opp_level = dvfsrc_wait_for_opp_level_v2,
+	.wait_for_vcore_level = dvfsrc_wait_for_vcore_level_v1,
+	.bw_constraints = &dvfsrc_bw_constr_v2,
+};
+
 static const struct dvfsrc_opp dvfsrc_opp_mt8183_lp4[] = {
 	{ 0, 0 }, { 0, 1 }, { 0, 2 }, { 1, 2 },
 };
@@ -530,6 +569,7 @@ static const struct dvfsrc_soc_data mt8195_data = {
 };
 
 static const struct of_device_id mtk_dvfsrc_of_match[] = {
+	{ .compatible = "mediatek,mt6893-dvfsrc", .data = &mt6893_data },
 	{ .compatible = "mediatek,mt8183-dvfsrc", .data = &mt8183_data },
 	{ .compatible = "mediatek,mt8195-dvfsrc", .data = &mt8195_data },
 	{ /* sentinel */ }
-- 
2.49.0


