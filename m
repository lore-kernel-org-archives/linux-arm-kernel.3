Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB978D12D5C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 01:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Avd2G97pwhJYlG6uDpk0JgHJosfsnuPjV/PlN2ANK5k=; b=xQdn7Rbw5z9BZEN0VZ5I4171Pf
	7HCNKFZ47yBlqI0d9+MfXZ6e8s3v1Kg3q2OaBKbX/HvQZRU5lk5pCIxrutbu5n0kbkGvKQPBM96qn
	2YdqTboV5xYi3/jOXe2XvGhi7Z6psWXhr+KffEqpcyBny+g9PmJzeX0/2b/aUw7FkAMX+lv9jxk2t
	8WF3aAi2xl0WHQjlveXPJQIr2swEj7COhy/BT1tDjTE5l1L3/7OzHZRTJTUa5MqLWuN2E0DX0jJma
	j+aRxFOmlWpIxGnt28oiMvPLZ5Jt9hkWA02hxVmhs0fKm/79V+56OngeQqUE6OncASlThiyg3RvF5
	bYQd00Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAJUS-0000000G40b-1FGg;
	Mon, 11 Nov 2024 01:45:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAJGe-0000000G1sQ-0cY9;
	Mon, 11 Nov 2024 01:31:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA89D13D5;
	Sun, 10 Nov 2024 17:31:29 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 152FE3F66E;
	Sun, 10 Nov 2024 17:30:57 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH 07/14] dt-bindings: phy: document Allwinner A523 USB-2.0 PHY
Date: Mon, 11 Nov 2024 01:30:26 +0000
Message-ID: <20241111013033.22793-8-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241111013033.22793-1-andre.przywara@arm.com>
References: <20241111013033.22793-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_173100_252944_DEEA3244 
X-CRM114-Status: UNSURE (   9.22  )
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

The Allwinner A523 SoC contains a USB-2.0 PHY fully compatible to the
one used in the D1/T113s SoCs. This PHY controls the two USB-2.0 ports,
there is a separate and quite different PHY for the USB-3.0 port.

Add the new compatible string, with a fallback to the D1 version.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../bindings/phy/allwinner,sun50i-a64-usb-phy.yaml     | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
index f557feca97630..b070a5aeab11d 100644
--- a/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
@@ -15,9 +15,13 @@ properties:
     const: 1
 
   compatible:
-    enum:
-      - allwinner,sun20i-d1-usb-phy
-      - allwinner,sun50i-a64-usb-phy
+    oneOf:
+      - enum:
+          - allwinner,sun20i-d1-usb-phy
+          - allwinner,sun50i-a64-usb-phy
+      - items:
+          - const: allwinner,sun55i-a523-usb-phy
+          - const: allwinner,sun20i-d1-usb-phy
 
   reg:
     items:
-- 
2.46.2


