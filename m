Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E15BDC43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 12:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OpePOPLCA0PXvchecli98EIEzQF2dD3vOt0f1SSbJi8=; b=mQFoWGXVvP2f8nhWzkpOS8jILJ
	Dttdy514jaGOJ2YDkcPh6yrz9Lq2NUbvPcQc/ZagFXsZ+PfGaL4biabX5wXaOA8S1tn95W4pSkQx9
	6pWb/g55DWVOgYeT7b23o89KFzDAcIA9Y7kCHZz+KPN36UxyK/j2sqGnfAbn1N0WxBkgYJXgNgI4G
	n4zsZrCQ7BP6E68HprB4xw41sb9g2Cj78dkS++0s5rkum571j7gLf2wM5+9+yZQzAstpfteGpHwiJ
	egCoDbWw743Nm2cGNd1ElMtrNobctnDcgt8hn8yqu1u5yQI8Al2/+NfIchxYowEsbzJAk7pXifFe+
	OTnG/Vag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetwl-00000001v1q-1iIg;
	Wed, 01 Jul 2026 12:21:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetwO-00000001u1D-2Kej;
	Wed, 01 Jul 2026 12:21:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=OpePOPLCA0PXvchecli98EIEzQF2dD3vOt0f1SSbJi8=; b=PjxaiTcWHZ2SHRbDeepAmNXIfV
	txstrE7iWNq54EkLlz0GeA2Pasp7jA/DtLw478r0HMCoLIp1lOTdu4Jw2GUD9QpxzwiKYEb1E8IGi
	3Zj0j5Q/gghJ5SQiORdSR1dXHeGRGM+/HBxIwNa5MKqrcVmJs9BTtPHBuIx4Wpa0jxfl2hkB7ipBS
	5gGfOA7zt3QIBzKHXOvPdC+cXoNHXTOneZTKjzeJTif3in0ZVBTCLHbA7bq+SFN9pgh9+G4sJDgEe
	SR7rsgzZgfgASeXI6QLoUlYlLnIixWPw8CGC0iNeEljcDwrbMODmak6j81cw4QnUxTVOFP1z2R3yI
	oARkCsOQ==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wetwL-00000002ji7-3EAn;
	Wed, 01 Jul 2026 12:21:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908476;
	bh=bouJrrAmvaCef0ljEylZ0CN770Hr5Qsn4ItcvLnxm7g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FWMa0OnqQ0lEFTe8z1u/M+eRNlY0XZE1P3HK+q9jM+QMd8styF+35vFxhXdJS9Gkx
	 4A3dRRpJ9Mu1a+stnivyS1dW5XzsR6Fli3gDylqGLI7EpFYjpsw2tpQd1uj/H8pr5/
	 Jxm5dpzK3Y0BNyWVI5IR3AFx/AqgfJx7GHoSxa1s4y4IOpBlpV3WEjkKa5vT/7AyyP
	 caOImNhoWOrWQ0xl6Gi3BoUEfcqX39imRPLdpoQktQKSz+OsM74Ad2UqHDSUhNf/2o
	 bhm1umDqmQgHswkVS274hoHAXnA4zLZl7/rocVCmXrltDL0uQdlOSVDnIUwRv3Debb
	 fxFcShBdCPhmA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D194517E0FB0;
	Wed,  1 Jul 2026 14:21:15 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	kernel@collabora.com
Subject: [PATCH 12/42] drm/mediatek: ovl_adaptor: Add special MERGE component check
Date: Wed,  1 Jul 2026 14:20:27 +0200
Message-ID: <20260701122057.19648-13-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
References: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_132117_944043_2D2265FD 
X-CRM114-Status: GOOD (  12.20  )
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

On the legacy ovl_adaptor for MT8195 and MT8188, four MERGE IPs
from VPPSYS are used, and those shall be exclusive to the OVL
Adaptor driver.

For this reason, add a branch in mtk_ovl_adaptor_is_comp_present()
to check if the component that is being checked is MERGE and, if
so, iterate through the list of component matches to understand if
it is one of those that must be exclusive to OVL Adaptor.

This resolves a corner case happening when mediatek-drm retries to
probe after a probe deferral, where all MERGE components would get
added to both "normal" and OVL Adaptor pipelines.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index ed9a2e35ba8a..bbf1d8ccda05 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -519,6 +519,17 @@ bool mtk_ovl_adaptor_is_comp_present(struct device_node *node)
 	if (type >= OVL_ADAPTOR_TYPE_NUM)
 		return false;
 
+	/* Check if this is one of the MERGE components used in OVL Adaptor */
+	if (type == OVL_ADAPTOR_TYPE_MERGE) {
+		int id = of_alias_get_id(node, private_comp_stem[type]);
+
+		for (int i = OVL_ADAPTOR_MERGE0; i <= OVL_ADAPTOR_MERGE3; i++)
+			if (comp_matches[i].alias_id == id)
+				return true;
+
+		return false;
+	}
+
 	/*
 	 * In the context of mediatek-drm, ETHDR, MDP_RDMA and Padding are
 	 * used exclusively by OVL Adaptor: if this component is not one of
-- 
2.54.0


