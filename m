Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89094C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 19:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=beXMkE+CsTchSH0VAk/fIYrWU0BfruLUJAXuGq0v1BM=; b=JSDWtCDsCYZJuFoKKvK142N9hu
	05D1gIVcBIHXeNfk2Bo4kPL7+NvKoY+TDESA62A2i7c0ms1699Z254JPznigXebz5VkCEIE7IcorU
	tr9PCA8ORrPdWwev0B+QghOSr3HA2jNP1kRq4POCtczqHLzpe/Kl2zl6vrs5JkseI/Xu3PUHUwerO
	FJAmeoYVMMrseqau2Xv3PHKLvlKNHKEPNDkObEFYwqbw3GNf1nh59fQ7bheP3xka7kozZKE0HN+1S
	GvYYRrcIHV3ChYSeonSUIjNcrdNgk+9lt0peMTOv5yd8GfnJaBFBcANETqbCGmwwBo8Cx9q2iWfig
	tBJOM0RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUVUQ-00000009hgo-16G6;
	Wed, 25 Jun 2025 19:08:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQ00-00000008lk9-3A06
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Jun 2025 13:17:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=beXMkE+CsTchSH0VAk/fIYrWU0BfruLUJAXuGq0v1BM=; b=iKv2izBxr37DotfXgetmvMoJe3
	KuByYUfuVxAXXurdXlHSQRH29wNBiZrXnF0YQGfkI0wH4Gn2i/QOPNPm/5nOZlUf2KW54GsNZdIK/
	7kk1rWkUe/Wa0jLACV2VF4KhrW5pzu031DCws4m26eN0y/v3nkk9DG7ylByXibGhdtq20djcx6cVc
	GDxY2J+4rurxf2/nid3e+0gADszqdtbAOrmJa+xIBWZb78PbaB6tQQm2eVFeAS97ak62fsYFeQ3eh
	93Krn4Fs6YGJkuQnAAbFGcGVLDufsiidxJZ+FgwICRVgiI64B1wrE9jXrQRu8a5Wm0ai0cL7Y5NKA
	D7MNsUmg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUPzx-00000005rim-3VRJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 13:17:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6918F4A539;
	Wed, 25 Jun 2025 13:17:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBDD9C4CEF0;
	Wed, 25 Jun 2025 13:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750857425;
	bh=rY5b8vRqdXfrxDOAn0nZ9LkgMlPuDFO9Y76rv/I7xqs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tZFq04FJczg0EJNQiggiT9bTqrGhHGfEryGsPeCBi4zbJnm9eHI+gjO4qQzu4MJgu
	 j0ZzvH1Dg1GMBraQAtBe/EjWQg6RamqjKKaz6SgQfbvyHxJKurD0Ac0q/KSjaRcdON
	 TNWBCs7dOb5BBdiTEz6Re1hxpuRe0bNd4E0aezKDvmSDWdjzmUs6P24EImmwRMGkyv
	 u6RvSd/8etVRpK0eoxi+t4YCaeXN+pxYkuvLMVfbLgOmnfFzXowaWAZdo8d0alJuaH
	 ukskJTj6qxHRhe1pqbXL9TNasHg9Rak9Euc8f/cUZrw/dlFsBhNm2M5nb+23y7yMUz
	 rQrRU5muXWGkA==
Received: by wens.tw (Postfix, from userid 1000)
	id 587075FAC5; Wed, 25 Jun 2025 21:17:02 +0800 (CST)
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
	Andre Przywara <andre.przywara@arm.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/5] dt-bindings: arm: sunxi: Add Xunlong OrangePi 4A board
Date: Wed, 25 Jun 2025 21:16:48 +0800
Message-Id: <20250625131652.1667345-2-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250625131652.1667345-1-wens@kernel.org>
References: <20250625131652.1667345-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_141710_067091_417EDF38 
X-CRM114-Status: UNSURE (   9.93  )
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

From: Chen-Yu Tsai <wens@csie.org>

The OrangePi 4A is a typical Raspberry Pi model B sized development
board from Xunlong designed around an Allwinner T527 SoC.

Add its compatible name to the list of valid ones.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
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


