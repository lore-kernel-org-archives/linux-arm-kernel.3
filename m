Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CBEC7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 16:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=beXMkE+CsTchSH0VAk/fIYrWU0BfruLUJAXuGq0v1BM=; b=OpDCixPPoX0DG761dwAMtkh++J
	MOGdGrXHdSvqFSQr19bgK6LtRTAoBzFo8+sYC/PzpI2pUw0ECP5UsDkP39Fu45iVxWXigMdJ5cyFq
	kgKKDnCPfnxzsYkUHiaAGI+QC+4D4J99kC2mBxJ0XVbcBYy+QUqV1p114if6ZwxBY0Pk5F29w4Uh8
	4tX5Me3U/YTP8VwKmLXXm8dl5yEyGJTF7ramGH+30TwFN1Pg7B2V2BZVf0AVfY7JYjmuauMr2kAby
	xGhCV3UEJs4s9IJL2rW16r+O76YOQOz+48dbtLxIlkakJXfJcjfNm0+UfcaSE1T2ejIjs5arvOwKQ
	8+GvSWVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVYKl-0000000H13k-49xS;
	Sat, 28 Jun 2025 16:23:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVYDt-0000000H08P-3kut
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 16:16:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D899646376;
	Sat, 28 Jun 2025 16:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 117DBC4CEF3;
	Sat, 28 Jun 2025 16:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751127372;
	bh=rY5b8vRqdXfrxDOAn0nZ9LkgMlPuDFO9Y76rv/I7xqs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sph/C58FoShQ8ZeW1fkWGQ3Wd54JKn2/xOnPwbsO1TISvMdye+RGxwAM83zavc558
	 m4r7MLl038PeGnuaqD4C/bMT96ltpbyOeWijlonfWsb2yFJ1TTYe/plcrnDwcUMLjT
	 V6R+NMidPLidHhTMmfylDp9SjgqcJQjlCYB41IEAl6kli5c7xvbu2a0nz8PpOg4PPV
	 E/sk+Y62g2Ktx8gyC3laCl+htwEPyvLQ1ehkC921PCaxbjlgDYfmmLWr8Zp8SD0lQj
	 OCu1Y8tnKCs4EMdPWJ7iInydjWB/4moQC+4QFyGFN7rSbFVuBnspbDnsRi+UiVh5Pg
	 PXbKb45lcQidg==
Received: by wens.tw (Postfix, from userid 1000)
	id 4A06C5FE36; Sun, 29 Jun 2025 00:16:09 +0800 (CST)
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
Subject: [PATCH v3 1/5] dt-bindings: arm: sunxi: Add Xunlong OrangePi 4A board
Date: Sun, 29 Jun 2025 00:16:04 +0800
Message-Id: <20250628161608.3072968-2-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250628161608.3072968-1-wens@kernel.org>
References: <20250628161608.3072968-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_091613_958899_6FBF2040 
X-CRM114-Status: UNSURE (   9.63  )
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


