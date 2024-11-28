Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDE7D6D256
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 02:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ihUogkJ3FW2Gqhs9h36UD6fhHJRJ+i0c245MwkyAcrU=; b=BH96ueWVyULh9EmufvSrwx9u5m
	ZRfb5eZcP/tL/KP264mP1Tfr9jv04QTVs6ktdDr1mkkxE6ACHfBXg+VnUksfUD280sNkHH3t+cned
	T9jLtdU8f5kTvyQ2ZEzDxExif5Yam7rm7R8SXd/eQUDpK/TC4fEFxlt2M30DYNnSC4OlBCzXXR6Cf
	ZeBMg40eJLuxyREMleWe8lsm6LxfEQwrRrbAKV8RxKxZMrTTpN+1dp5v01GPpJU9MoDGgUqbwegKw
	bqtyQ6WPr/kIlMSRW9jRWNL1TLV26BHBtAb7k7R6sQa3SN0f0al5HSyboz0NSNhHiA5Gpj5UmM7Gz
	ydezicpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGUQe-0000000EYTl-0s0T;
	Thu, 28 Nov 2024 02:38:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGUPg-0000000EYOU-0r9j;
	Thu, 28 Nov 2024 02:37:53 +0000
X-UUID: be9bca06ad3111ef82ff63e91e7eb18c-20241127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ihUogkJ3FW2Gqhs9h36UD6fhHJRJ+i0c245MwkyAcrU=;
	b=ciVsT9Nky5WFa9owOX9jUHEjm4Z1jP+lRk0pV8a4JuPcNZIIRS2wnPUuptwsh16p3H/55jRm2BzXaH0ifEsV3c34F6Q6UQxBmnW93hOMmrzZ4cBiqgcItHlvv2clCgIBc4/7E6X30bibhqHH+zqi73jDQ6Kvob2mriUkC3I0Ibs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:070869ca-b000-47dc-8fbd-f3d92037e6d5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:f2749e23-634f-4016-85ba-2d63e55c9400,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: be9bca06ad3111ef82ff63e91e7eb18c-20241127
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <liankun.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1747234795; Wed, 27 Nov 2024 19:37:43 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 28 Nov 2024 10:37:38 +0800
Received: from mszsdclx1211.gcn.mediatek.inc (10.16.7.31) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 28 Nov 2024 10:37:38 +0800
From: Liankun Yang <liankun.yang@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <jitao.shi@mediatek.com>,
	<mac.shen@mediatek.com>, <peng.liu@mediatek.com>,
	<liankun.yang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 1/1] drm/mediatek: dp: Add sdp path reset
Date: Thu, 28 Nov 2024 10:37:21 +0800
Message-ID: <20241128023733.16294-1-liankun.yang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.187400-8.000000
X-TMASE-MatchedRID: d+BGjaEADBWvhOOX3csmVw0QY5VnQyAN6SXuwUgGH0iyrCkM9r1bWpVD
	ZsT0rYWC8MF78pseROBIT4SOZxkibrGaAH5r9EhkhK8o4aoss8pZT2gl0gqGyo5RXzY0MfgCcHj
	giTON9jJOFu8ssjxG8xp0MHP646G7Xcx4M+DrsF7huXUWQoMQt63iVpZ0luwMXaZ/Rba9vHG9E+
	yWHMdHvIJcsHHt88vbfjWeJX0rKbMfE8yM4pjsD7fIDYp/ogjHxEHRux+uk8jfhP1xgyx3DI9Iw
	OwJvhdTjFYSmlsXcFYbKWuoGkRlU90Y22Zk8+IQQiUfzB96MHWijOQaxDKu8qPapq2aFl88gSb5
	10g5A6p+YIbiC0qUfG1Rjoup2VCcWve+eVz4Pp5Vk5utmQ1VlGVF3+d9rnoxpI8EFEZVbig=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.187400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 43089957CAFD153865D27ECE052C0FF448EEC90AA7150D7E68B797BFEA6F72A52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_183752_237410_0EAD955A 
X-CRM114-Status: GOOD (  11.38  )
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

When using type-c to type-c to connect to the monitor,
the sound plays normally. If you unplug the type-c and
connect the type-c to hdmi dongle to the monitor, there will be noise.

By capturing the audio data, it is found that
the data position is messy, and there is no error in the data.

Through experiments, it can be restored by resetting the SDP path
when unplugging it.

Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
Changes in V4:
- Fix align to the right of '('.
Per suggestion from the previous thread:
https://patchwork.kernel.org/project/linux-mediatek/patch/20240925064854.23065-1-liankun.yang@mediatek.com/

Changes in V3:
- No change.
Per suggestion from the previous thread:
https://patchwork.kernel.org/project/linux-mediatek/patch/20240923132521.22785-1-liankun.yang@mediatek.com/

Changes in V2:
- Fix build error.
Per suggestion from the previous thread:
https://patchwork.kernel.org/project/linux-mediatek/patch/20240923133610.23728-1-liankun.yang@mediatek.com/
---
 drivers/gpu/drm/mediatek/mtk_dp.c     | 15 +++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dp_reg.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 1cc916b16471..4f4233bd83f7 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1135,6 +1135,18 @@ static void mtk_dp_digital_sw_reset(struct mtk_dp *mtk_dp)
 			   0, DP_TX_TRANSMITTER_4P_RESET_SW_DP_TRANS_P0);
 }
 
+static void mtk_dp_sdp_path_reset(struct mtk_dp *mtk_dp)
+{
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3004,
+			   SDP_RESET_SW_DP_ENC0_P0,
+			   SDP_RESET_SW_DP_ENC0_P0);
+
+	/* Wait for sdp path reset to complete */
+	usleep_range(1000, 5000);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3004,
+			   0, SDP_RESET_SW_DP_ENC0_P0);
+}
+
 static void mtk_dp_set_lanes(struct mtk_dp *mtk_dp, int lanes)
 {
 	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_35F0,
@@ -2397,6 +2409,9 @@ static void mtk_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 			   DP_PWR_STATE_BANDGAP_TPLL,
 			   DP_PWR_STATE_MASK);
 
+	/* SDP path reset sw*/
+	mtk_dp_sdp_path_reset(mtk_dp);
+
 	/* Ensure the sink is muted */
 	msleep(20);
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
index 709b79480693..8ad7a9cc259e 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
+++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
@@ -86,6 +86,7 @@
 #define MTK_DP_ENC0_P0_3004			0x3004
 #define VIDEO_M_CODE_SEL_DP_ENC0_P0_MASK		BIT(8)
 #define DP_TX_ENCODER_4P_RESET_SW_DP_ENC0_P0		BIT(9)
+#define SDP_RESET_SW_DP_ENC0_P0				BIT(13)
 #define MTK_DP_ENC0_P0_3010			0x3010
 #define HTOTAL_SW_DP_ENC0_P0_MASK			GENMASK(15, 0)
 #define MTK_DP_ENC0_P0_3014			0x3014
-- 
2.45.2


