Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32D5C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 01:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TAxbYiGEZJdo5AMPd9IrehlD1wcLvsBdRUtV/IW/9QE=; b=UOfwljvVk4JF/Db9Xni49wj67k
	q60sfotSyucZn35FQmoYVoDqLZNkhgxKsv7owuntx86RNLpMgadNdROnWLPAfVAG+2upuh9ZNRkGI
	GsLer/zcmEbI9Pf/vhl4m8u0fbZibmCaPm4a/Jp/zVl+HY0sux82Y22dofPDiLootQ8pk43W7vUYO
	SfZnKd/8S1ATcxHueJAEcVemtz9Fq3ZqXQGgJezLBWoKhGnjmRHjobU2vnjHGgsDz0mf6BLX8INz7
	8TsRugxA4WMa0M6+ft1+jLsn08YXMUXO19jFrWKksIWMQ46AIMPVE8Uev5qG8MSDAOirmHaZ2YJdO
	gBOxtbbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlHp6-00000003g93-43dN;
	Fri, 21 Feb 2025 01:27:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlHki-00000003f22-22qg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 01:22:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 784C01BA8;
	Thu, 20 Feb 2025 17:23:09 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 243903F59E;
	Thu, 20 Feb 2025 17:22:50 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 2/3] dt-bindings: arm: sunxi: Add YuzukiHD Chameleon board name
Date: Fri, 21 Feb 2025 01:20:37 +0000
Message-ID: <20250221012038.13706-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250221012038.13706-1-andre.przywara@arm.com>
References: <20250221012038.13706-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_172252_568710_F22CD5D9 
X-CRM114-Status: UNSURE (   9.05  )
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

The Chameleon is an Open Source hardware board designed by YuzkuiHD,
using the Allwinner H618 SoC: https://github.com/YuzukiHD/YuzukiChameleon

Add its compatible name to the list of valid board name.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 046536d02706f..7af28d4786b49 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -1076,4 +1076,9 @@ properties:
           - const: xunlong,orangepi-zero3
           - const: allwinner,sun50i-h618
 
+      - description: YuzukiHD Chameleon
+        items:
+          - const: yuzukihd,chameleon
+          - const: allwinner,sun50i-h618
+
 additionalProperties: true
-- 
2.46.3


