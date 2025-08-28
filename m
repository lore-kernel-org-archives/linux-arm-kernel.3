Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE87C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 09:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YVXhHHEXSGwqnu+r3AHVgz0i2SOhikDJ3D3rLoZ1wH8=; b=DN8fpy/hTPnI1/ULm0k5MDE07R
	fW+GGRpjlqhvUMcH4mHl+n3ozZknNdqweKpXo9P0LFCeP4NW1+yOWZB+YT3GOZcisrn9KSz91exI6
	TMh5eG6yajusFP8dcfl2E7x+IWiNWgFVl6YpHH1cDv4M/l5fmOx+SiL1eLxxZi2vRRQzXX/Nv0nSI
	ttKX9Fvoei3HVuczNGj3/F9Mw8qNHkKhq9bvmXbRYQY0dupUAIA5cQL/B+Hd4uSHKNSKUatabNGwv
	9f5YfnP4Qqk7s8dtj08K23gQ7NtZljGjAQJlQ0V7+bFPnDgQ4q9uXsIpiocICOz8DL4VeZD48zqdq
	EZkqT7JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urYod-00000000wNX-0JHj;
	Thu, 28 Aug 2025 09:21:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urXhK-00000000jch-12Po;
	Thu, 28 Aug 2025 08:09:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YVXhHHEXSGwqnu+r3AHVgz0i2SOhikDJ3D3rLoZ1wH8=; b=Bwc11AXN+0vbkeEY4j/scVxopK
	WSgQ9SzIsFX+GSwPdq7dJLxQsADUpGLP7C/L0S8tg55STjKj6UZU0D3ch0nhWYjzBy16FjHWcvkxz
	jnyfucIP+vc0VOV1oqYCJ+dtkPGPxUU7SaGt+yUxb6yc0O6YqfaeXdxBkGNRkng+ZqOOjGK+JZ1BE
	lFpv/fJ0GMUWc/H3QhwYJPImNBxGBTkwBSyH2D0MP7sgbvcKcXyS0S1fqanK+nmmpi9ktK1i/1Wlp
	XPu9KJ99uWdOuAEybuoXZ4v/LPjCKRV97qY42GDTei4rPn5rcmfUqEq2sSexnD2pRe0jHHxQ0WsxL
	xR0bXFvw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urXhF-00000002fco-1lHG;
	Thu, 28 Aug 2025 08:09:29 +0000
X-UUID: 45023d4283e611f09f706fa2197c6ceb-20250828
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=YVXhHHEXSGwqnu+r3AHVgz0i2SOhikDJ3D3rLoZ1wH8=;
	b=VH+qz5HbPFOafrSgpi2nz3RPDQC/X2F+Of7Zg30azgWPtls76dE7gmtvPNVtZ8vUu1nt7YPIwJP4GJvyI65oqpZyc6RxqbV49TbBjev023IrM2wrqyWkgpNYKL1pm78WSLaf9DkFQNQeKR/ifIN7J/Rwf50+bZo00IblXIUSdAk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:81accd5e-e3a3-405d-9508-65f64129d8c5,IP:0,UR
	L:25,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:20
X-CID-META: VersionHash:f1326cf,CLOUDID:501bf544-18c5-4075-a135-4c0afe29f9d6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:97|99|83|106|11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 45023d4283e611f09f706fa2197c6ceb-20250828
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <paul-pl.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1999990678; Thu, 28 Aug 2025 01:09:07 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 28 Aug 2025 16:09:03 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 28 Aug 2025 16:09:03 +0800
From: Paul Chen <paul-pl.chen@mediatek.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<chunkuang.hu@kernel.org>, <angelogioacchino.delregno@collabora.com>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>,
	<jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
	<singo.chang@mediatek.com>, <xiandong.wang@mediatek.com>,
	<sirius.wang@mediatek.com>, <paul-pl.chen@mediatek.com>,
	<sunny.shen@mediatek.com>, <fshao@chromium.org>, <treapking@chromium.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4 05/19] dt-bindings: display: mediatek: add OUTPROC yaml for MT8196
Date: Thu, 28 Aug 2025 16:07:00 +0800
Message-ID: <20250828080855.3502514-6-paul-pl.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
References: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_090925_969878_0E6B3D98 
X-CRM114-Status: GOOD (  11.52  )
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

From: Paul-pl Chen <paul-pl.chen@mediatek.com>

Add mediate,outproc.yaml to support OUTPROC for MT8196.
MediaTek display overlap output processor, namely OVL_OUTPROC
or OUTPROC,handles the post-stage of pixel processing in the
overlapping procedure.

Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
---
 .../display/mediatek/mediatek,outproc.yaml    | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,outproc.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,outproc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,outproc.yaml
new file mode 100644
index 000000000000..7c884749dd7a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,outproc.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,outproc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek display overlap output processor
+
+maintainers:
+  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
+  - Philipp Zabel <p.zabel@pengutronix.de>
+
+description:
+  MediaTek display overlap output processor, namely OVL_OUTPROC or OUTPROC,
+  handles the post-stage of pixel processing in the overlapping procedure.
+  OVL_OUTPROC manages pixels for gamma correction and ensures that pixel
+  values are within the correct range.
+
+properties:
+  compatible:
+    const: mediatek,mt8196-outproc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        outproc@32970000 {
+            compatible = "mediatek,mt8196-outproc";
+            reg = <0 0x32970000 0 0x1000>;
+            clocks = <&ovlsys_config_clk 49>;
+            interrupts = <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH 0>;
+        };
+    };
-- 
2.45.2


