Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B312C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 10:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s3lUIl7tpDtkxNOWzKSiZqXC/oZXnG1SOoq8hfyeiVc=; b=IuCPghw9pp2onb1jpqGY6FUGc3
	17JeSrUjdd3YSSybIvwN1LxfRETbahyNE8SQMydzpkaiXPeYQ8vNZJbEoWO9SLuxKXrWBgzs/Uf8C
	6SIWZ3nrNbCWF6aa+/lEY8A/+hOUqsRICk2Yb+KXKDiNaiffamoOkg5CR7R/Ew7pc0EPLIwc10ubf
	Hqq5Ae72yM5WMX0f7wMmeq8CEQOVj5ZRaFlS5hvJ8lsevJL29ggsucepbid4QDB9fl0w307JfNsCr
	QfMXM5c2UMaFlNqRYfK/ATqJbMf8P/tg4JmG58IkMdFFDKGJHpYOdrcLDalx92obGa4NptZ2Rt6Q9
	bVwV29Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA58R-0000000Cbiy-30Yf;
	Wed, 30 Apr 2025 10:57:51 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA4g5-0000000CWiO-0Cmx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 10:28:34 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 5B6471FA7B;
	Wed, 30 Apr 2025 12:28:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1746008911;
	bh=s3lUIl7tpDtkxNOWzKSiZqXC/oZXnG1SOoq8hfyeiVc=; h=From:To:Subject;
	b=zN0GFWg7+v9aC4eohZEm/n8gZUmvQf0H+VnxWI644v11+zIwDey1tcJceywYqDqYB
	 deD8cUwClhqfdIuJinXt1cC74XDDxkoqFmVesZiEGu6ya1xBvRDk+Bpr10sW18XuHe
	 H6RUoT97ryUkFFbTQjX3fQ3tE5wFwMIyHn/Km8cgg2DtMmkZjoBrV56zYG4yw1z0kd
	 yhUp5CCSJ2S/Gh1urZeD3FYKa6wV4BZvMjhGYcHvnPmLRUsbuiBoAms2EmVQID3QFm
	 xmzChctnH+DCZVukKzmjd7hGnUx7DsQFYv2tTuRocBEJ9YBIOuL5t+mtPAJD4kAC68
	 8kk2ttnmz+uzg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/6] dt-bindings: arm: ti: Add Toradex Verdin AM62P
Date: Wed, 30 Apr 2025 12:28:10 +0200
Message-Id: <20250430102815.149162-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250430102815.149162-1-francesco@dolcini.it>
References: <20250430102815.149162-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_032833_243072_2E607758 
X-CRM114-Status: UNSURE (   6.46  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add toradex,verdin-am62p for Toradex Verdin AM62 SoM, its nonwifi and
wifi variants, and the Toradex carrier board they may be mated in.

Link: https://www.toradex.com/computer-on-modules/verdin-arm-family/ti-am62p
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 .../devicetree/bindings/arm/ti/k3.yaml        | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index a6d9fd0bcaba..bf6003d8fb76 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -76,6 +76,30 @@ properties:
           - const: toradex,verdin-am62          # Verdin AM62 Module
           - const: ti,am625
 
+      - description: K3 AM62P5 SoC Toradex Verdin Modules and Carrier Boards
+        items:
+          - enum:
+              - toradex,verdin-am62p-nonwifi-dahlia # Verdin AM62P Module on Dahlia
+              - toradex,verdin-am62p-nonwifi-dev    # Verdin AM62P Module on Verdin Development Board
+              - toradex,verdin-am62p-nonwifi-ivy    # Verdin AM62P Module on Ivy
+              - toradex,verdin-am62p-nonwifi-mallow # Verdin AM62P Module on Mallow
+              - toradex,verdin-am62p-nonwifi-yavia  # Verdin AM62P Module on Yavia
+          - const: toradex,verdin-am62p-nonwifi     # Verdin AM62P Module without Wi-Fi / BT
+          - const: toradex,verdin-am62p             # Verdin AM62P Module
+          - const: ti,am62p5
+
+      - description: K3 AM62P5 SoC Toradex Verdin Modules and Carrier Boards with Wi-Fi / BT
+        items:
+          - enum:
+              - toradex,verdin-am62p-wifi-dahlia # Verdin AM62P Wi-Fi / BT Module on Dahlia
+              - toradex,verdin-am62p-wifi-dev    # Verdin AM62P Wi-Fi / BT M. on Verdin Development B.
+              - toradex,verdin-am62p-wifi-ivy    # Verdin AM62P Wi-Fi / BT Module on Ivy
+              - toradex,verdin-am62p-wifi-mallow # Verdin AM62P Wi-Fi / BT Module on Mallow
+              - toradex,verdin-am62p-wifi-yavia  # Verdin AM62P Wi-Fi / BT Module on Yavia
+          - const: toradex,verdin-am62p-wifi     # Verdin AM62P Wi-Fi / BT Module
+          - const: toradex,verdin-am62p          # Verdin AM62P Module
+          - const: ti,am62p5
+
       - description: K3 AM642 SoC
         items:
           - enum:
-- 
2.39.5


