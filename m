Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476EEC55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 10:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f46D8elfs2mejfp79ZcrH4drgId4dWQXMb2z10L2Lpg=; b=j2X88VC5K4V1V6x1+CqyXteewL
	N3XtwhoEMYz7QyDQbe5XJrD4VZPk0VsAvhIeGO80JnEo2nOnRd/5wlCNqyAkC2IS0PdNUPqb6pG+F
	o6u7wpwm2ilO9Vdnds2hX0kBMTmDcRaOKrI0jCZm7wtjj/Fm2XKF4biK1YbeteURBwhyLlVbLs8zI
	GOScwmG7Yc2Xqad/QnfYp35GPhUfq51DwHpJm97eGn7Yo8ObSBM/qxDKAmaHohdrOu1wlP5vCBFkf
	DzXeNY17GWx1+DOsczw1KDvyexnrWmecghW09JhSvjDNNF3bsJSsTPlq22T6tHQ6tM8twBkXwUmM8
	aHvpxV3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqphV-0000000GozK-0nUO;
	Mon, 03 Aug 2026 10:15:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqphT-0000000GoyF-0gfB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 10:15:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 260A71596;
	Mon,  3 Aug 2026 03:15:10 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BDBA43F632;
	Mon,  3 Aug 2026 03:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785752114; bh=Ca4WNKwt2jZCjoz4pJbAO6t+h4BpkJ3DGmk2qwJhIwg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m3iJUsgLVOZMW4Vrp/KBT8ByLEkfSIlzXzbfHzwEEbi57tgaEm8FZCs4HFj5a9j1U
	 vE729Mt8slcrB2SZlaz9wchSpEQCND9D91h+iGk9EoUPTtOVfpP5IrD5Ny10JcWu9M
	 nUY+UQFPL/y5S0x0wGaRUwalsTdOsMgpdxwh0QMU=
From: Andre Przywara <andre.przywara@arm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Liu Changjie <liucj1228@outlook.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/6] dt-bindings: net: Maxio PHY: add PHY-ID for -Q2C variant
Date: Mon,  3 Aug 2026 12:14:49 +0200
Message-ID: <20260803101452.2993721-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803101452.2993721-1-andre.przywara@arm.com>
References: <20260803101452.2993721-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_031515_237587_9890A787 
X-CRM114-Status: GOOD (  11.14  )
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

The Maxio MAE0621A PHY is out there in at least two variants: the
MAE0621A-Q3C chip, with the PHY-ID 0x7b744412, and the -Q2C variant,
identifying as 0x7b744411.

Allow both IDs to be used as the PHY compatible string, to potentially
avoid probing, which might fail due to unavailable resources (clock).

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 Documentation/devicetree/bindings/net/maxio,mae0621a.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/maxio,mae0621a.yaml b/Documentation/devicetree/bindings/net/maxio,mae0621a.yaml
index f1ea54583225..c4d06c626168 100644
--- a/Documentation/devicetree/bindings/net/maxio,mae0621a.yaml
+++ b/Documentation/devicetree/bindings/net/maxio,mae0621a.yaml
@@ -14,7 +14,9 @@ allOf:
 
 properties:
   compatible:
-    const: ethernet-phy-id7b74.4412
+    enum:
+      - ethernet-phy-id7b74.4411
+      - ethernet-phy-id7b74.4412
 
   maxio,clk-out-frequency-hz:
     description:
-- 
2.43.0


