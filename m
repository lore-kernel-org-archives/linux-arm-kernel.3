Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFEAD5E364
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 10:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QA/fsK76PyIEeVBw1iU8XeWN7Jlcu8DwwjHRdqh/NK4=; b=DdTN4LnXHWf1TNVbLe4IgIq7go
	vncmCXBp0O4SdqMjmZz3jBdUEgajaR4psuRt4diSEVqs9Z0ftVq3wrQpJSfcer4fhCAqFI0crNXDv
	VoUbetP7w/RvJcKYJv2ZuX6/9YWrhvtYfqzRS4ZKSnqJgP3jaAhn7F9u9Yy4TXKRyLMdvYATw5D1u
	PZ49TesTzuDii0DZ1cFZISnMODOaxkx4Cd3cK10+xBFbLG3FVtxfxCrCYjV9LmfQyefXKZlJP3oLp
	vIayBQtQHWkvy8SYmYeBOojsq1furBBJF9Yy3nm8nXYT83ViY457jBSvWr5s7F0kiYGSQxPN8uMOR
	1Glmmkdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9j4t-0000000D6U4-2NGS;
	Sat, 09 Nov 2024 10:52:27 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9j37-0000000D6O1-2B0O;
	Sat, 09 Nov 2024 10:50:38 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout3.routing.net (Postfix) with ESMTP id 2B28E605E7;
	Sat,  9 Nov 2024 10:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1731149435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QA/fsK76PyIEeVBw1iU8XeWN7Jlcu8DwwjHRdqh/NK4=;
	b=RHjuOMjTBwBSf3KkilIRokQ1u2F78XwqQOBlSeJdqCIuecdTa1n4qEjUUPc6r6HcRInWzV
	r6TkfPCxLVWdtJI5nnIsGx2JBFFcMRrgbw3E7aRIk8HRrU9b2Kq4DAciwipzMO+8CDWDY3
	+DOz3sOpsvUcMijpCUjiwJCzJpHSuMY=
Received: from frank-u24.. (fttx-pool-157.180.226.68.bambit.de [157.180.226.68])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id 3AA1D8032D;
	Sat,  9 Nov 2024 10:50:34 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	Leilk Liu <leilk.liu@mediatek.com>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: spi: add compatibles for mt7988
Date: Sat,  9 Nov 2024 11:50:28 +0100
Message-ID: <20241109105029.52748-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 378da3c5-528d-4834-9528-4df358e72a11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_025037_747007_5F97599F 
X-CRM114-Status: UNSURE (   7.45  )
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

From: Frank Wunderlich <frank-w@public-files.de>

MT7988 has 2 different spi controllers. Add their compatibles.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
index e1f5bfa4433c..ed17815263a8 100644
--- a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
@@ -35,6 +35,8 @@ properties:
           - enum:
               - mediatek,mt7981-spi-ipm
               - mediatek,mt7986-spi-ipm
+              - mediatek,mt7988-spi-quad
+              - mediatek,mt7988-spi-single
               - mediatek,mt8188-spi-ipm
           - const: mediatek,spi-ipm
       - items:
-- 
2.43.0


