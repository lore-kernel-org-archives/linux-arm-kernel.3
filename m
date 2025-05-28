Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C8E9C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 14:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/IYn+Ak3aJNTaLzk0CMzwKGukq1D6rOsByjE7CfES9I=; b=hSAWgBRZgDsAuCkAoAvqxCM38x
	l/LBZzmdea8wODmb0MdXCB4oY40Z9K5K1dlmHFH97q301MGxSey5Ksz0CLl3SD0GXRtbMx9EMbbW0
	NY1fDyftHBDRWwbZvRvT6uy39HygFaXC10zt/O62G2eMiNQWzwa+hDHwBk00za/ZmEZJe6wRnTd+D
	8eEJNI9dCYoThOkYeKuAPAJW7vFH2eYgYO29uCHWn7ZznT5V08mbO3bduxI/UeiHjFYjNNfAsTXCQ
	Qox2Fnluri02Jwme+D5FdlMo0S3+MNXvRKm046Rsh25nBMBjoH6K/v2r1yI3bJ0/wcgyGqv0zjjXu
	8gQGWHMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKHSX-0000000DKRO-3KLr;
	Wed, 28 May 2025 14:08:45 +0000
Received: from mxout3.routing.net ([134.0.28.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKHDX-0000000DIHn-3r59;
	Wed, 28 May 2025 13:53:17 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout3.routing.net (Postfix) with ESMTP id 073AD604DC;
	Wed, 28 May 2025 13:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1748440387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/IYn+Ak3aJNTaLzk0CMzwKGukq1D6rOsByjE7CfES9I=;
	b=ZSdRO8smi2hWk/PzPnGVQxbayF0NO5QBIO9DbjkNur9j5VDSieATcAPjRC3DQ+wceS9DaQ
	rv4V45NILSzZeZUyvVZnFX/AymgbAuYd3mJK90Ht7hpcE9XfeK6MUnHEsLGxnte/hLYlHD
	zihODtfXtsWxaipmiIzQd/5pq60qyT8=
Received: from frank-u24.. (fttx-pool-194.15.80.234.bambit.de [194.15.80.234])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id BE1B21226F1;
	Wed, 28 May 2025 13:53:06 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Georgi Djakov <djakov@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jia-Wei Chang <jia-wei.chang@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [RFC v1] dt-bindings: interconnect: add mt7988-cci compatible
Date: Wed, 28 May 2025 15:52:49 +0200
Message-ID: <20250528135251.6492-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_065316_185650_7A760DCC 
X-CRM114-Status: UNSURE (   8.47  )
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

From: Frank Wunderlich <frank-w@public-files.de>

Add compatible for Mediatek MT7988 SoC with mediatek,mt8183-cci fallback
which is taken by driver.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../bindings/interconnect/mediatek,cci.yaml          | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml b/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
index 58611ba2a0f4..2c6785c588e9 100644
--- a/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
+++ b/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
@@ -17,9 +17,15 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt8183-cci
-      - mediatek,mt8186-cci
+    oneOf:
+      - items:
+          - enum:
+              - mediatek,mt8183-cci
+              - mediatek,mt8186-cci
+      - items:
+          - enum:
+              - mediatek,mt7988-cci
+          - const: mediatek,mt8183-cci
 
   clocks:
     items:
-- 
2.43.0


