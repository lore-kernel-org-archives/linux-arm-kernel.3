Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206F5C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 18:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WcMjbLfQb2Bk85jZP8lhpYKdLT9SE+4PHP+m9xSH4XY=; b=2GaMZbeqdjXmbOFMbQitOkYxnK
	shKizrZejjVrDBQHk9W1JraU7WjKbrQQkoF+IToB9orTXoNPTG0v3wZyUjIGiF9dhjNNmcUmwQp/y
	h8zjWXUHhsaO/4SaIstXmHLMfy30L/L0UXFTMoatIeeUeBEU0eQscwrDLr1iQHeKRpBX3PclxbMdp
	p4yrdMSCCFPraz3wqEYKV6bXkkPoUbXuVYSE0ri5EqFrvHTXoTeJ1I8IEhpNDm9mkFmfhyUju3oiu
	FSIvc259bhPu7oggVUN1NyIy+ve8RsMRPRwHcL0o80nBR94BtRgq/GL163A+ty8p+7kqevNnY8+j7
	neKLXQNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKDC-0000000E074-3GAS;
	Thu, 19 Jun 2025 18:42:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSJ5b-0000000Dn3J-3Zge
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 17:30:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F343D617F2;
	Thu, 19 Jun 2025 17:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 369AEC4CEEA;
	Thu, 19 Jun 2025 17:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750354214;
	bh=q6nrjT2Dpercv5DoePpH+dBXKOMzG9sjRP9CjTTCRFQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pT9Ouj/JeTRfyA+9Nv+N2klirdDENDpWxZMDFqGzbQzxJaKbewkF05a1GUWrJ4NUq
	 ziWjJqcoKvIbVk83Ze0XqjdkJUHZ8o+oUuKy60SZQBlHeEGeQfKrL7iJRbHgg2xD8M
	 XucpkGHYAe3h0hvGC5VL0wzZkYVmNChU20yFmqIxpf9s9OTICKf9ZYPBhrO6e76hoZ
	 /xQPRGr5YrkdZg5P/JI64s6arkvyCF6Pm/hVTRR2W3hS0IeG1dMmThtlOTPAAiI42i
	 rZ82WhiFUPnM2cMdv3rVz2CwAj9f6NXXrkyqxdobNI0rPPHOS8eX4QuUuZNULVSpc+
	 cS/y5yZtL3Q9A==
Received: by wens.tw (Postfix, from userid 1000)
	id 1BFD85FE81; Fri, 20 Jun 2025 01:30:12 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH 1/5] dt-bindings: arm: sunxi: Add Xunlong OrangePi 4A board
Date: Fri, 20 Jun 2025 01:30:03 +0800
Message-Id: <20250619173007.3367034-2-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619173007.3367034-1-wens@kernel.org>
References: <20250619173007.3367034-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Chen-Yu Tsai <wens@csie.org>

The OrangePi 4A is a typical Raspberry Pi model B sized development
board from Xunlong designed around an Allwinner T527 SoC.

Add its compatible name to the list of valid ones.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 7807ea613258..c41d0a0b89e6 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -996,6 +996,11 @@ properties:
           - const: xunlong,orangepi-3
           - const: allwinner,sun50i-h6
 
+      - description: Xunlong OrangePi 4A
+        items:
+          - const: xunlong,orangepi-4a
+          - const: allwinner,sun55i-t527
+
       - description: Xunlong OrangePi Lite
         items:
           - const: xunlong,orangepi-lite
-- 
2.39.5


