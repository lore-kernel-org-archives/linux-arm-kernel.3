Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F46C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 01:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L4KH8JHlv0HNRJoXHhJ4cliujJzXkW/G5MJIvFj62IA=; b=Q40/eNGFmM4669eLBpcIO1+b4q
	u7ai2LC3YrHs9cjMqDPAFTmS8+nwSO36xdB14gcRa6RIffoVtlUdH9XDv/uTiGV6aqgxuB0M8w4Se
	B6S23ehk8eun1wg7bAdoJt0zcH29JWrL14D4Tj7D1NSfVJtNOvujD/ScZDo5ppHqa8PodXyDrCHQ8
	iZMK334xiuhDXuVE5VZSiiPD0+jE9NsivpjqW+bkSr1QfQYYTkLItzpgPTwlARFJe2Ke89mwFDXRg
	iU1f/DiSd7qvncQHgty7WjEesrjDlEk6PTu2rH8Mq8A+NYenRjMeK2+kbXFzXfgshomeV1YtOj+K/
	xAzZbGWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqMMu-0000000Cmgp-350n;
	Fri, 07 Mar 2025 01:19:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqM21-0000000ChxN-3fI5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 00:57:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E9401BC0;
	Thu,  6 Mar 2025 16:57:54 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 114E73F5A1;
	Thu,  6 Mar 2025 16:57:39 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 10/15] dt-bindings: arm: sunxi: Add new board names for A523 generation
Date: Fri,  7 Mar 2025 00:57:07 +0000
Message-ID: <20250307005712.16828-11-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250307005712.16828-1-andre.przywara@arm.com>
References: <20250307005712.16828-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_165741_956287_C4E7B4E7 
X-CRM114-Status: UNSURE (   9.41  )
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

The new Allwinner A523 SoC family comes in different packages, though
they all share the same die, and so the devicetree bindings.

Add three board names that use a version from this SoC family:
- The Avaota A1: an Open Source hardware router board.
- The Radxa Cubie A5E: a typical development board
- The X96QPro+: a TV box

Add their compatible name to the list.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 046536d02706f..80096819fda91 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -840,6 +840,11 @@ properties:
           - const: allwinner,r7-tv-dongle
           - const: allwinner,sun5i-a10s
 
+      - description: Radxa Cubie A5E
+        items:
+          - const: radxa,cubie-a5e
+          - const: allwinner,sun55i-a527
+
       - description: Remix Mini PC
         items:
           - const: jide,remix-mini-pc
@@ -961,6 +966,11 @@ properties:
           - const: hechuang,x96-mate
           - const: allwinner,sun50i-h616
 
+      - description: X96Q Pro+
+        items:
+          - const: amediatech,x96q-pro-plus
+          - const: allwinner,sun55i-h728
+
       - description: Xunlong OrangePi
         items:
           - const: xunlong,orangepi
@@ -1076,4 +1086,9 @@ properties:
           - const: xunlong,orangepi-zero3
           - const: allwinner,sun50i-h618
 
+      - description: YuzukiHD Avaota A1
+        items:
+          - const: yuzukihd,avaota-a1
+          - const: allwinner,sun55i-t527
+
 additionalProperties: true
-- 
2.46.3


