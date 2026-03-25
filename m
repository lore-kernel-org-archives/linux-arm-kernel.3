Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B28FEA801
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 03:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Eto/koeMj9W08OyMdWoPq4maMPXzwgWrY2x5NXKmTI=; b=LamI9BunPwAeOnpoxbcDJ10W9x
	Wp0Ndl4ONcXLSfA4rUmZ6eSEBV7eI3Qih9iOushgK3ObcKooGwDmRjchK3O6XQbHAC1z/E+B0Dixl
	PhKUHO22AR0t4t4ky3NIk50ZrpUbL7ZziVLC7B1+bNAZLEWOtfvpr/XbVrjD1lRIxyp4JTOwJDYSk
	1Qu7T/ttwG5GHefjeNd3FSF1rdbOcRzx7NySQ3CboeOP4Oj5XC95sckZG/iXZl+RKSHKc+FCwTwRq
	lRfKNW3lP2u5OV8NZ6wTGCV+kkhOnj7gg3khx2gb3X8m/8f8ps9LCznlnFjgHkEFV7tG5O+7pUf61
	d1hLDNAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5EmE-00000002aYY-2uD1;
	Wed, 25 Mar 2026 03:19:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Em5-00000002aRY-2Nvl;
	Wed, 25 Mar 2026 03:19:18 +0000
X-UUID: 633b010627f911f19e7563141e833ce8-20260324
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=2Eto/koeMj9W08OyMdWoPq4maMPXzwgWrY2x5NXKmTI=;
	b=R1FTTIN6TKgK8Fo8cZYRzssteQuTGil3FnLqJnsFGN1u6aBCVfv+B4y8hp1CzvMU9aFNkmf2rkZrFVyOCey8ZRM579Ea6lm+imheGA10GjEe7ol+9n72nSst4lK2BfBahAdW+sCXkOcZcVANk7GxQnxSg60CFjCHNqYSqGLi14E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:35847faf-cb6f-4b1e-9e5b-ec7812252afa,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:3ac019d5-060f-4ecc-9ee0-121eeeb4a682,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 633b010627f911f19e7563141e833ce8-20260324
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <ot_meiker.gao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1998947019; Tue, 24 Mar 2026 20:19:09 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 25 Mar 2026 11:19:06 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 25 Mar 2026 11:19:06 +0800
From: Meiker Gao <ot_meiker.gao@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Bayi Cheng <bayi.cheng@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, <linux-spi@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Meiker Gao <ot_meiker.gao@mediatek.com>
Subject: [PATCH 1/2] dt-bindings: spi: Fix clock-names definition
Date: Wed, 25 Mar 2026 11:18:54 +0800
Message-ID: <20260325031900.2099969-2-ot_meiker.gao@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260325031900.2099969-1-ot_meiker.gao@mediatek.com>
References: <20260325031900.2099969-1-ot_meiker.gao@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_201917_624493_CE79BFF3 
X-CRM114-Status: GOOD (  11.68  )
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

Update the device tree binding for the Mediatek.

Signed-off-by: Meiker Gao <ot_meiker.gao@mediatek.com>
---
 .../devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml      | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
index a453996c13f2..0255e19efc8d 100644
--- a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
+++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
@@ -56,14 +56,17 @@ properties:
                      design, so this is optional.
       - description: clock used for controller axi slave bus.
                      this depends on hardware design, so it is optional.
+      - description: clock used for controller axi_f, axi_h, and
+                     axi_p to support the new platform.
 
   clock-names:
     minItems: 2
     items:
       - const: spi
       - const: sf
-      - const: axi
-      - const: axi_s
+      - const: axi_f
+      - const: axi_h
+      - const: axi_p
 
 required:
   - compatible
-- 
2.45.2


