Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F286CCFA1E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 09:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QTZzDelfQTA4uZrVZJdbpfidqUQQQNkgj+JIycA97gE=; b=QFyxd7tEpL5gD6N1TfvEalZr2c
	FY7rQcm9ovsYWIUSescfDwM9vHUkR1y/AmWDTePRnbTJOslDKw+cJD82GydXtRHaak58MiGiGKrJx
	Wcoyd7M2+st5H+LpOoz6+jJ83HNxP9sPZNbWN3+v8wSzpszzYX1xMelhhBKC9AejrP9n5+mjTDuXL
	wQk7ydIKp4B81pfghpmDY46roT600qpkaaIFZBTFPcXA/4Pts2Lw9CP/9wpL8F2mUkLCjS1HC60Dz
	rQj98wO5k9Ib7IoRLpfAss/K+TJ9S6FaWpUaHPpfch+idnzMwwkUrrj7y4ZHN9d4a0kUbh6Fykw3E
	rdNXxFiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIOP2-000000056i9-1JAd;
	Mon, 10 Nov 2025 09:41:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIOOz-000000056gM-2KHH;
	Mon, 10 Nov 2025 09:41:34 +0000
X-UUID: 6da9a6c8be1911f09f706fa2197c6ceb-20251110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=QTZzDelfQTA4uZrVZJdbpfidqUQQQNkgj+JIycA97gE=;
	b=jWPmc88rj4fMeO9OKP+kKNGKIO+Q1xHznS+YZGZMTI/FpQ71eqtaBT8ke4Al+vghz2Q0q9O3hDX2KTbm7As/T4wT4WjVGJOFXvp588qLGhL+RY6zcR+Vc6ebeT1g9w1FNCAgfplHSksemILEoYLtsKvH6AZdlO92nZRe0CtKw0g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:32bafafd-c9cf-42c7-87b4-42b503a96792,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:a9d874c,CLOUDID:6b9ba1ba-0c02-41a0-92a3-94dc7dc7eeca,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6da9a6c8be1911f09f706fa2197c6ceb-20251110
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <hanchien.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1406361003; Mon, 10 Nov 2025 02:41:27 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 10 Nov 2025 17:41:24 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Mon, 10 Nov 2025 17:41:24 +0800
From: Hanchien Lin <hanchien.lin@mediatek.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
	<lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Balsam
 CHIHI <bchihi@baylibre.com>
CC: <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <hanchien.lin@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<raymond.sun@mediatek.com>, <Irving-CH.lin@mediatek.com>
Subject: [PATCH 2/2] thermal/drivers/mediatek/lvts_thermal: Add MT8189 support
Date: Mon, 10 Nov 2025 17:40:39 +0800
Message-ID: <20251110094113.3965182-3-hanchien.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251110094113.3965182-1-hanchien.lin@mediatek.com>
References: <20251110094113.3965182-1-hanchien.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_014133_633176_4E356676 
X-CRM114-Status: GOOD (  21.13  )
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

Add support for the MediaTek MT8189 SoC to the LVTS thermal driver.

Signed-off-by: Hanchien Lin <hanchien.lin@mediatek.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 155 ++++++++++++++++++++++--
 1 file changed, 144 insertions(+), 11 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index ab55b20cda47..8c15fdaac48c 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -65,6 +65,7 @@
 #define LVTS_HW_FILTER				0x0
 #define LVTS_TSSEL_CONF				0x13121110
 #define LVTS_CALSCALE_CONF			0x300
+#define LVTS_MONINT_CONF_STAGE3		BIT(31)
 
 #define LVTS_MONINT_OFFSET_HIGH_INTEN_SENSOR0		BIT(3)
 #define LVTS_MONINT_OFFSET_HIGH_INTEN_SENSOR1		BIT(8)
@@ -107,6 +108,7 @@ struct lvts_sensor_data {
 struct lvts_ctrl_data {
 	struct lvts_sensor_data lvts_sensor[LVTS_SENSOR_MAX];
 	u8 valid_sensor_mask;
+	int hw_tshut_temp;
 	int offset;
 	int mode;
 };
@@ -134,6 +136,9 @@ struct lvts_data {
 	int temp_offset;
 	int gt_calib_bit_offset;
 	unsigned int def_calibration;
+	bool clock_gate_no_need;
+	bool reset_no_need;
+	bool conf_stage3_need;
 };
 
 struct lvts_sensor {
@@ -150,6 +155,7 @@ struct lvts_ctrl {
 	struct lvts_sensor sensors[LVTS_SENSOR_MAX];
 	const struct lvts_data *lvts_data;
 	u32 calibration[LVTS_SENSOR_MAX];
+	u32 hw_tshut_raw_temp;
 	u8 valid_sensor_mask;
 	int mode;
 	void __iomem *base;
@@ -859,6 +865,14 @@ static int lvts_ctrl_init(struct device *dev, struct lvts_domain *lvts_td,
 		 */
 		lvts_ctrl[i].mode = lvts_data->lvts_ctrl[i].mode;
 
+		/*
+		 * The temperature to raw temperature must be done
+		 * after initializing the calibration.
+		 */
+		lvts_ctrl[i].hw_tshut_raw_temp =
+			lvts_temp_to_raw(lvts_data->lvts_ctrl[i].hw_tshut_temp,
+					 lvts_data->temp_factor);
+
 		lvts_ctrl[i].low_thresh = INT_MIN;
 		lvts_ctrl[i].high_thresh = INT_MIN;
 	}
@@ -919,7 +933,7 @@ static void lvts_write_config(struct lvts_ctrl *lvts_ctrl, const u32 *cmds, int
 	}
 }
 
-static int lvts_irq_init(struct lvts_ctrl *lvts_ctrl)
+static int lvts_irq_init(struct lvts_ctrl *lvts_ctrl, const struct lvts_data *lvts_data)
 {
 	/*
 	 * LVTS_PROTCTL : Thermal Protection Sensor Selection
@@ -947,6 +961,7 @@ static int lvts_irq_init(struct lvts_ctrl *lvts_ctrl)
 	 * writel(0x0, LVTS_PROTTB(lvts_ctrl->base));
 	 * writel(0x0, LVTS_PROTTC(lvts_ctrl->base));
 	 */
+	writel(lvts_ctrl->hw_tshut_raw_temp, LVTS_PROTTC(lvts_ctrl->base));
 
 	/*
 	 * LVTS_MONINT : Interrupt configuration register
@@ -954,7 +969,10 @@ static int lvts_irq_init(struct lvts_ctrl *lvts_ctrl)
 	 * The LVTS_MONINT register layout is the same as the LVTS_MONINTSTS
 	 * register, except we set the bits to enable the interrupt.
 	 */
-	writel(0, LVTS_MONINT(lvts_ctrl->base));
+	if (lvts_data->conf_stage3_need)
+		writel(LVTS_MONINT_CONF_STAGE3, LVTS_MONINT(lvts_ctrl->base));
+	else
+		writel(0, LVTS_MONINT(lvts_ctrl->base));
 
 	return 0;
 }
@@ -1041,7 +1059,8 @@ static int lvts_ctrl_calibrate(struct device *dev, struct lvts_ctrl *lvts_ctrl)
 	return 0;
 }
 
-static int lvts_ctrl_configure(struct device *dev, struct lvts_ctrl *lvts_ctrl)
+static int lvts_ctrl_configure(struct device *dev, struct lvts_ctrl *lvts_ctrl,
+								const struct lvts_data *lvts_data)
 {
 	u32 value;
 
@@ -1143,7 +1162,7 @@ static int lvts_ctrl_configure(struct device *dev, struct lvts_ctrl *lvts_ctrl)
 	value = LVTS_FILTER_INTERVAL << 16 | LVTS_SENSOR_INTERVAL;
 	writel(value, LVTS_MONCTL2(lvts_ctrl->base));
 
-	return lvts_irq_init(lvts_ctrl);
+	return lvts_irq_init(lvts_ctrl, lvts_data);
 }
 
 static int lvts_ctrl_start(struct device *dev, struct lvts_ctrl *lvts_ctrl)
@@ -1290,7 +1309,7 @@ static int lvts_domain_init(struct device *dev, struct lvts_domain *lvts_td,
 			return ret;
 		}
 
-		ret = lvts_ctrl_configure(dev, lvts_ctrl);
+		ret = lvts_ctrl_configure(dev, lvts_ctrl, lvts_data);
 		if (ret) {
 			dev_dbg(dev, "Failed to configure controller");
 			return ret;
@@ -1322,9 +1341,15 @@ static int lvts_probe(struct platform_device *pdev)
 	if (!lvts_data)
 		return -ENODEV;
 
-	lvts_td->clk = devm_clk_get_enabled(dev, NULL);
-	if (IS_ERR(lvts_td->clk))
-		return dev_err_probe(dev, PTR_ERR(lvts_td->clk), "Failed to retrieve clock\n");
+	if (!lvts_data->clock_gate_no_need) {
+		lvts_td->clk = devm_clk_get_enabled(dev, NULL);
+		if (IS_ERR(lvts_td->clk))
+			return dev_err_probe(
+				dev,
+				PTR_ERR(lvts_td->clk),
+				"Failed to retrieve clock\n"
+			);
+	}
 
 	res = platform_get_mem_or_io(pdev, 0);
 	if (!res)
@@ -1334,9 +1359,15 @@ static int lvts_probe(struct platform_device *pdev)
 	if (IS_ERR(lvts_td->base))
 		return dev_err_probe(dev, PTR_ERR(lvts_td->base), "Failed to map io resource\n");
 
-	lvts_td->reset = devm_reset_control_get_by_index(dev, 0);
-	if (IS_ERR(lvts_td->reset))
-		return dev_err_probe(dev, PTR_ERR(lvts_td->reset), "Failed to get reset control\n");
+	if (!lvts_data->reset_no_need) {
+		lvts_td->reset = devm_reset_control_get_by_index(dev, 0);
+		if (IS_ERR(lvts_td->reset))
+			return dev_err_probe(
+				dev,
+				PTR_ERR(lvts_td->reset),
+				"Failed to get reset control\n"
+			);
+	}
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
@@ -1586,6 +1617,78 @@ static const struct lvts_ctrl_data mt8188_lvts_ap_data_ctrl[] = {
 	}
 };
 
+static const struct lvts_ctrl_data mt8189_lvts_mcu_data_ctrl[] = {
+	{
+		.lvts_sensor = {
+			{ .dt_id = MT8189_MCU_LITTLE_CPU1,
+			  .cal_offsets = { 4, 5, 6 } },
+			{ .dt_id = MT8189_MCU_LITTLE_CPU2,
+			  .cal_offsets = { 8, 9, 10 } },
+			{ .dt_id = MT8189_MCU_LITTLE_CPU3,
+			  .cal_offsets = { 12, 13, 14 } },
+			{ .dt_id = MT8189_MCU_LITTLE_CPU4,
+			  .cal_offsets = { 16, 17, 18 } }
+		},
+		VALID_SENSOR_MAP(1, 1, 1, 1),
+		.offset = 0x0,
+	},
+	{
+		.lvts_sensor = {
+			{ .dt_id = MT8189_MCU_LITTLE_CPU5,
+			  .cal_offsets = { 24, 25, 26 } },
+			{ .dt_id = MT8189_MCU_LITTLE_CPU6,
+			  .cal_offsets = { 28, 29, 30 } },
+			{ .dt_id = MT8189_MCU_LITTLE_CPU7,
+			  .cal_offsets = { 32, 33, 34 } },
+			{ .dt_id = MT8189_MCU_LITTLE_CPU8,
+			  .cal_offsets = { 36, 37, 38 } }
+		},
+		VALID_SENSOR_MAP(1, 1, 1, 1),
+		.offset = 0x100,
+	},
+	{
+		.lvts_sensor = {
+			{ .dt_id = MT8189_MCU_BIG_CPU1,
+			  .cal_offsets = { 44, 45, 46 } },
+			{ .dt_id = MT8189_MCU_BIG_CPU2,
+			  .cal_offsets = { 48, 49, 50 } },
+			{ .dt_id = MT8189_MCU_BIG_CPU3,
+			  .cal_offsets = { 52, 53, 54 } },
+			{ .dt_id = MT8189_MCU_BIG_CPU4,
+			  .cal_offsets = { 56, 57, 58 } }
+		},
+		VALID_SENSOR_MAP(1, 1, 1, 1),
+		.offset = 0x200,
+	}
+};
+
+static const struct lvts_ctrl_data mt8189_lvts_ap_data_ctrl[] = {
+	{
+		.lvts_sensor = {
+			{ .dt_id = MT8189_AP_SOC1,
+			  .cal_offsets = { 64, 65, 66 } },
+			{ .dt_id = MT8189_AP_SOC2,
+			  .cal_offsets = { 68, 69, 70 } },
+			{ .dt_id = MT8189_AP_SOC3,
+			  .cal_offsets = { 72, 73, 74 } },
+			{ .dt_id = MT8189_AP_APU,
+			  .cal_offsets = { 76, 77, 78 } }
+		},
+		VALID_SENSOR_MAP(1, 1, 1, 1),
+		.offset = 0x0,
+	},
+	{
+		.lvts_sensor = {
+			{ .dt_id = MT8189_AP_GPU1,
+			  .cal_offsets = { 84, 85, 86 } },
+			{ .dt_id = MT8189_AP_GPU2,
+			  .cal_offsets = { 88, 89, 90 } }
+		},
+		VALID_SENSOR_MAP(1, 1, 0, 0),
+		.offset = 0x100,
+	}
+};
+
 static const struct lvts_ctrl_data mt8192_lvts_mcu_data_ctrl[] = {
 	{
 		.lvts_sensor = {
@@ -1804,6 +1907,34 @@ static const struct lvts_data mt8188_lvts_ap_data = {
 	.def_calibration = 35000,
 };
 
+static const struct lvts_data mt8189_lvts_ap_data = {
+	.lvts_ctrl		= mt8189_lvts_ap_data_ctrl,
+	.conn_cmd	= default_conn_cmds,
+	.init_cmd	= default_init_cmds,
+	.num_lvts_ctrl		= ARRAY_SIZE(mt8189_lvts_ap_data_ctrl),
+	.num_conn_cmd	= ARRAY_SIZE(default_conn_cmds),
+	.num_init_cmd	= ARRAY_SIZE(default_init_cmds),
+	.temp_factor		= LVTS_COEFF_A_MT8195,
+	.temp_offset		= LVTS_COEFF_B_MT8195,
+	.gt_calib_bit_offset	= 0,
+	.def_calibration	= 35000,
+	.clock_gate_no_need	= true,
+	.reset_no_need		= true,
+	.conf_stage3_need	= true,
+};
+
+static const struct lvts_data mt8189_lvts_mcu_data = {
+	.lvts_ctrl		= mt8189_lvts_mcu_data_ctrl,
+	.num_lvts_ctrl		= ARRAY_SIZE(mt8189_lvts_mcu_data_ctrl),
+	.temp_factor		= LVTS_COEFF_A_MT8195,
+	.temp_offset		= LVTS_COEFF_B_MT8195,
+	.gt_calib_bit_offset	= 0,
+	.def_calibration	= 35000,
+	.clock_gate_no_need	= true,
+	.reset_no_need		= true,
+	.conf_stage3_need	= true,
+};
+
 static const struct lvts_data mt8192_lvts_mcu_data = {
 	.lvts_ctrl	= mt8192_lvts_mcu_data_ctrl,
 	.conn_cmd	= default_conn_cmds,
@@ -1861,6 +1992,8 @@ static const struct of_device_id lvts_of_match[] = {
 	{ .compatible = "mediatek,mt8186-lvts", .data = &mt8186_lvts_data },
 	{ .compatible = "mediatek,mt8188-lvts-mcu", .data = &mt8188_lvts_mcu_data },
 	{ .compatible = "mediatek,mt8188-lvts-ap", .data = &mt8188_lvts_ap_data },
+	{ .compatible = "mediatek,mt8189-lvts-mcu", .data = &mt8189_lvts_mcu_data },
+	{ .compatible = "mediatek,mt8189-lvts-ap", .data = &mt8189_lvts_ap_data },
 	{ .compatible = "mediatek,mt8192-lvts-mcu", .data = &mt8192_lvts_mcu_data },
 	{ .compatible = "mediatek,mt8192-lvts-ap", .data = &mt8192_lvts_ap_data },
 	{ .compatible = "mediatek,mt8195-lvts-mcu", .data = &mt8195_lvts_mcu_data },
-- 
2.45.2


