Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2331EC9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 06:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3x2ot6m9D0YAqTNHu1DbGx2MV4wgVy90cyvnp98bbGQ=; b=zEVmI/xS5D+GdgXcYZ8X23epkn
	q2b/3ffj5h1x+TcctE6G7r6SDItZxyzG+vNt47WF7/aHkftm8p+hLCl/IzsxxfahnAgAft+z2yba9
	6wvmHUkFy6znZq7F+DwCi1LSkyzWU0cwDxgSVVae4KXjPs/YzvysTqGNjF/ytTwP/ewoW2lj9MMBL
	/ZIc3e8GVxnvZWJcdgBgvS0D9CCFTzVJVw/qJpJiBpJPPRxlyI3OaMIaOXB+aaKqigPHXSu9sqMuX
	xlLzMau3gqNl/7yrOJzI1mQBzEXqlK9gjK7pnXhemIBPxD6s1h8+H+hVTua2GXLdKM6qlB1m/j4rS
	bX7ffpgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRQ6-00000002SZN-1qbS;
	Tue, 29 Sep 2026 06:34:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRQ2-00000002SYE-1Hjg;
	Tue, 29 Sep 2026 06:34:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 79F0D602CA;
	Tue, 29 Sep 2026 06:34:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99F631F00893;
	Tue, 29 Sep 2026 06:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790663665;
	bh=3x2ot6m9D0YAqTNHu1DbGx2MV4wgVy90cyvnp98bbGQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Q9tbMXx8kYcztvxAmoSKjrMNdJHbmhF0a2fkDbNVvswQaRfytD9MaJ0+9MVWqgesE
	 c16Taz6yc8so+gftxT/gl7cGw4zkyeOZpMShoHBINFUSXp+84XR7STtMzUfRgqhtws
	 fyFCjNMdSJZLUluAvcPcLWWx0kravdiFTpD2RVfK68NimB1ncJ9ZjadTT7Zl528dBa
	 /OT9imjGKkkkFgwH/4p9dW6fS5B7Btru1/WdLQj2i1cs5LV22n5vbddWlFTvK5Wvwn
	 0Z86dAFEf9yr7InhqwQKC/hP1Ew8y0ljLy13JIUn14UkLyF7rSmIrnVN0zJVHo2unc
	 SzyRE0sURDT3g==
From: Jisheng Zhang <jszhang@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	mfd@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 01/20] dt-bindings: serial: snps-dw-apb-uart: Add Synaptics sl261x uart
Date: Tue, 29 Sep 2026 14:13:58 +0800
Message-ID: <20260929061417.20733-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260929061417.20733-1-jszhang@kernel.org>
References: <20260929061417.20733-1-jszhang@kernel.org>
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

Add the compatible for the UARTs of the Synaptics SL261X, which are
compatible with the Synopsys DesignWare APB UART.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../devicetree/bindings/serial/snps-dw-apb-uart.yaml | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index 664305de4986..7a80357230eb 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -34,7 +34,16 @@ allOf:
       properties:
         resets:
           minItems: 2
-    else:
+
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - starfive,jh7110-uart
+                - syna,sl261x-uart
+    then:
       properties:
         resets:
           maxItems: 1
@@ -80,6 +89,7 @@ properties:
               - starfive,jh7100-hsuart
               - starfive,jh7100-uart
               - starfive,jh7110-uart
+              - syna,sl261x-uart
               - ultrarisc,dp1000-uart
           - const: snps,dw-apb-uart
       - const: snps,dw-apb-uart
-- 
2.53.0


