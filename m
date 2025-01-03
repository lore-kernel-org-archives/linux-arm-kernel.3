Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB747E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 20:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1DG0UFFDzcg646sVxWcaNWOXL8rzbqGt6rW1oTHrfM=; b=Xx3RUxa01DIgvka9yGvYZca5ki
	C6BFZ+HZ+egjeIpiULPUHce/Vqng3jehYb+OQo/iA+a7Uu/ha7XktwQkyNvf1lYcgUmNVckdi5KPa
	wDbpmBn8jADcj8Dx0CyDNg2xdHx3vWGrjsRo5PCBQfOh4Cy5NWMP9kI5zBIidavUsvGoSymA+gg2G
	Qn3cFVJ8dPCtwz2YdTS3RCFntpO1nI95NXIbnUMY20m1Bfj6a/I5JWKihJbC+Xkjq8USRdZoQmPpF
	XddS3qs9mqWRXQ9hbUliR0aC5ibKketmL0gc6iE2ZVt6D6lX8ykIAknTCzO+i1jP+8ODhp1Yr2yaE
	jyPWtXrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTofe-0000000DyOS-37BF;
	Fri, 03 Jan 2025 20:53:26 +0000
Received: from mail.netcube.li ([173.249.15.149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTocB-0000000DxuJ-0hS3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 20:49:52 +0000
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References;
	bh=S1DG0UFFDzcg646sVxWcaNWOXL8rzbqGt6rW1oTHrfM=;
	b=IcG3kR8RNDCAnRv44zli0i5wifEVFY3eN6JEBstnAsfyqBa0C6W9ysMZxoUzD4bHV04jZ3PdGSB+9zpn0w7/hnea2iwbWUBCZ8l7twk7eoH0bAWgrnFYraXV17L1yFX6bIgQ4uc21SLY59o3Q5+oaWdUBMACAvRRvWtD0efCw0k=
Received: from 854af3ed5e24.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPA
	; Fri, 3 Jan 2025 21:49:32 +0100
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v3 2/4] dt-bindings: arm: sunxi: Add NetCube Systems Kumquat board
Date: Fri,  3 Jan 2025 20:45:18 +0000
Message-Id: <20250103204523.3779-3-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250103204523.3779-1-lukas.schmid@netcube.li>
References: <20250103204523.3779-1-lukas.schmid@netcube.li>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_124951_511685_B81640FB 
X-CRM114-Status: UNSURE (   8.65  )
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

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 046536d02706..f536cdd2c1a6 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -589,6 +589,11 @@ properties:
           - const: emlid,neutis-n5h3
           - const: allwinner,sun8i-h3
 
+      - description: NetCube Systems Kumquat
+        items:
+          - const: netcube,kumquat
+          - const: allwinner,sun8i-v3s
+
       - description: NextThing Co. CHIP
         items:
           - const: nextthing,chip
-- 
2.47.1



