Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64632D41D74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 07:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ulck124dMJfdnULyN0n+5eDDExhHKrWCMYXK+eDJ0Y8=; b=ow9/0d0psMiFMrKlGyV0NhpQIl
	WkJMoQmePkhSRfhFQBjcHuegOr/OruwAueR2DFu1Jd6YJ+RNICxAeqQ9o7n3z0oAKIC9N/O++q6iT
	Px8FC/7UNAEjMylCCvv1EmPrie5/FQCUhsDD8s8iLfogYhNPYKNXOp5aVIBy8m+PqGIjWUDBwuUZe
	FHW/BifKC/K2wSEk87545zfeA9JWgiSvuRD26AWFWANpD7NiQR2d0HdRw1XNhLtzA1gfvumNNBr4O
	IcMVvwwQGJCsMsbYma6AVRvQApqkOCKBeOPGG1CVKjd2uFtSDEhuvHlN50Tfu+QGbBUMVEjer8mT+
	gkiq7M1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV3Hl-00000003DZT-1rUd;
	Mon, 15 Dec 2025 07:46:25 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV3Hi-00000003DYd-02nE;
	Mon, 15 Dec 2025 07:46:23 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout3.routing.net (Postfix) with ESMTP id 6B0486067C;
	Mon, 15 Dec 2025 07:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1765784777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ulck124dMJfdnULyN0n+5eDDExhHKrWCMYXK+eDJ0Y8=;
	b=WhmngpebJFvrSu+zpoEvRSKeY5YNlKw0g8yhcg+3TaXHizwWi7RcC9l8aXaVXuwBqYEwo0
	k6eSW5+rbrXLLnylvVqfP+y+oZdLkK8XWwBy+Ql6gaciTbplvFiNQtupm12pN9DrrecPGu
	VIlQanZWKAAHxGU18b5xeaM0ef9pRSo=
Received: from frank-u24.. (fttx-pool-217.61.145.36.bambit.de [217.61.145.36])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 80A1A1226B1;
	Mon, 15 Dec 2025 07:46:17 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] arm64: dts: mediatek: mt7988a-bpi-r4pro: fix model string
Date: Mon, 15 Dec 2025 08:46:08 +0100
Message-ID: <20251215074609.4100-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_234622_660477_87E7589C 
X-CRM114-Status: UNSURE (   9.88  )
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

Fix incorrect model string in Devicetree for BPI-R4-Pro.

Fixes: f397471a6a8c ("arm64: dts: mediatek: mt7988: Add devicetree for BananaPi R4 Pro")
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dts | 2 +-
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dts
index c7ea6e88c4f4..621d01e3cd89 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dts
@@ -9,7 +9,7 @@
 #include "mt7988a-bananapi-bpi-r4-pro.dtsi"
 
 / {
-	model = "Bananapi BPI-R4";
+	model = "Bananapi BPI-R4 Pro 4E";
 	compatible = "bananapi,bpi-r4-pro-4e",
 		     "bananapi,bpi-r4-pro",
 		     "mediatek,mt7988a";
diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts
index c9a0e69e9dd5..bb15bfa5e6ae 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts
@@ -9,7 +9,7 @@
 #include "mt7988a-bananapi-bpi-r4-pro.dtsi"
 
 / {
-	model = "Bananapi BPI-R4";
+	model = "Bananapi BPI-R4 Pro 8X";
 	compatible = "bananapi,bpi-r4-pro-8x",
 		     "bananapi,bpi-r4-pro",
 		     "mediatek,mt7988a";
-- 
2.43.0


