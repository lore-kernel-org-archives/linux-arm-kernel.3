Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B32FC88E4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 09:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=84lhWACOXFzTdoTCSz0BhCozhzcd9zC7vCjekr6vEgs=; b=QzpOTR4VrLvwYawGlDtp1Lk92e
	wXD1fwtBnz3eKc8/3GGWEwfsTbJSgFwSEfZfYZAEaHk7D7Ier9iJFOPG+rsNv6bI2I6J09pibno9o
	DsRKjelmvLeRj5xP2pZi6QeSM/1dXQFT5ZKi7rQGiRBcrdaRp5N6m/BZpfcsGl8jWx7B8VKJtudv5
	n6tjknpHhLN+wovun4ovImmZzB0pU4PyAzuFqVBs7uVqPgFOfaNY+wNSSZIih57C5AvUkvqrwv1it
	BDPBs7b64MIMkASeLhsRsdOoiAvH0sAnRi28AI8nTZDkmY/vpod3zVM0omDlgkQWi+BG+a4V/y8YV
	KkuVWXfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wcx-0000000G7kB-2Yo2;
	Fri, 11 Sep 2026 08:28:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wcv-0000000G7gh-1Vip;
	Fri, 11 Sep 2026 08:28:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 05C0A401C4;
	Fri, 11 Sep 2026 08:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D35EEC2BCF4;
	Fri, 11 Sep 2026 08:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789115331;
	bh=Hp6Oz9sNuMG2k+i7B0+dNTO/+y2pO5GzZRg3Z2yhjLs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=q9GqzSFT0gRvLjCZlMLX3TC0aec6jJEz3OMwX+UhLYI/Tk+uk2LUgMD9kv4Rz9SWQ
	 XIjUYilEcjWvTwD4y/z85cjpupr+SRXnJyoQKNWboseeQ1lKAgkwhV63DI856DlwYL
	 h/gBcLFvZCopvI/sd2utpXA2bJbayJ2vmJmcT5s0rKd7VlFmAWMFJTTb76lN+Ibfyq
	 Oncb9aELeKMdj53gGRoI+uV6s9XGdVBPpbjMiPVKbz3NxmRMzHR8k3239LcjKn+idY
	 GttkDwNVNg6YM4BjBKBsqzCBy2SuumX8hev0xLtJ3C1nBZlJVoCYKKSJ+rgOxnLv8I
	 QeGUdwogFUiYA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B40E9C79FA1;
	Fri, 11 Sep 2026 08:28:51 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 11 Sep 2026 16:28:28 +0800
Subject: [PATCH 01/10] dt-bindings: soc: amlogic: Add compatible to support
 more SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-more-socs-to-support-clk_measure-v1-1-940e269aa52f@amlogic.com>
References: <20260911-more-socs-to-support-clk_measure-v1-0-940e269aa52f@amlogic.com>
In-Reply-To: <20260911-more-socs-to-support-clk_measure-v1-0-940e269aa52f@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789115329; l=1253;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=cohyDpjVw0jD9doFV5tm/XEidv0ja/sUaS7qt5A3x+8=;
 b=+zRqxruOYTQd2GWbHMyhce6LqqsCixdgV8s7tFf1e7uXuhtRdOC4Qbns3oWiIJK2gcihR6bq4
 IhjH2to1X/2CqUefRZCrhxwbaNuxHIzjijPh9TGjnL5GH1DbkKXt/oJ
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

Add clk-measure compatible for amlogic A5, A4, S7, S7D, S6 and A9 SoCs.

Although the clk-measure IP itself has little hardware difference across
SoCs, the clock inputs connected to the clk-measure block vary between
SoCs. Therefore, it is difficult to fall back to the configuration used
by previous SoCs.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 .../bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
index b1200e6940ac..125be01e3b2c 100644
--- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
+++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
@@ -26,6 +26,12 @@ properties:
       - amlogic,s4-clk-measure
       - amlogic,a1-clk-measure
       - amlogic,t7-clk-measure
+      - amlogic,a5-clk-measure
+      - amlogic,a4-clk-measure
+      - amlogic,s7-clk-measure
+      - amlogic,s7d-clk-measure
+      - amlogic,s6-clk-measure
+      - amlogic,a9-clk-measure
 
   reg:
     maxItems: 1

-- 
2.42.0



