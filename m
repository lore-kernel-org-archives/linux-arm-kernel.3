Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F8FCF58C5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 17:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mz1Hei/9QJRhAecU/xXAdrbHkGMc20BKiYFo6RjYfNw=; b=fSA3c2Bep85Mx7zetMMGSibvAU
	d9eROSAoFcPGYFKT3AlNJPJnURQbdLbDCpydTBjzNFJrcvc+pSuHAlFtGfCw5eHPhxPvgeX2GdRpQ
	MWxb8e2SUADwMDdXOjSvkmFQZUMnM/FjEJW6RpdKYTqwS3raFhz2VxBxyndZpfdTp/j4p5DrwbSC3
	z7cWE67cojV4u6e6zgx+CIQ/15qudwz8CnaymixTfzIF9P+xHmfXtErtGBC6p3Dx91LGzSCgauR4C
	vtpt8QK2r2BWDgKenvZFmoTOfkHN1L+MhxIbq6FSjY0+EUAxgKMrQK8XV7iIlfOWRkonp6hGKy64/
	1jxaFoTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmLK-00000004IWp-3Qyn;
	Wed, 19 Nov 2025 17:51:46 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmLI-00000004IUq-2FCL;
	Wed, 19 Nov 2025 17:51:46 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout2.routing.net (Postfix) with ESMTP id 1C4B25FF2F;
	Wed, 19 Nov 2025 17:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1763574700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mz1Hei/9QJRhAecU/xXAdrbHkGMc20BKiYFo6RjYfNw=;
	b=h1pkhQ7oO0mI5BKEEuGV744muaLAeSUioojkJsuQ1XyGa1C6H0SN+rHH8qlOpUNMgPD9f8
	IzQrJduvjp2jn881kD1GjkrR7RYRoWXBz3IKCbUtH5+fVwc44PrI7bNZ3K/pH4e9BhmBy2
	83L0jLnVGzMP6rSrqzPuKgCP5rPB8aQ=
Received: from frank-u24.. (fttx-pool-194.15.82.239.bambit.de [194.15.82.239])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id E38A61225D8;
	Wed, 19 Nov 2025 17:51:39 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 2/2] arm64: dts: mediatek: mt7988: add dtbs with applied overlays for bpi-r4 (pro)
Date: Wed, 19 Nov 2025 18:51:23 +0100
Message-ID: <20251119175124.48947-3-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119175124.48947-1-linux@fw-web.de>
References: <20251119175124.48947-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_095144_742965_27E702E1 
X-CRM114-Status: UNSURE (   8.76  )
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

Build devicetree binaries for testing overlays and providing users
full dtb without using overlays for Bananapi R4 (pro) variants.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
It is not required to build all possible combinations, only for
common usecases and to test if all overlays can be applied.
---
 arch/arm64/boot/dts/mediatek/Makefile | 32 +++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 77d76730d61b..cac8f4c6d76f 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -52,6 +52,38 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-pro-cn18.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-pro-emmc.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-pro-sd.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-sd.dtbo
+mt7988a-bananapi-bpi-r4-emmc-dtbs := \
+	mt7988a-bananapi-bpi-r4.dtb \
+	mt7988a-bananapi-bpi-r4-emmc.dtbo
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-emmc.dtb
+mt7988a-bananapi-bpi-r4-sd-dtbs := \
+	mt7988a-bananapi-bpi-r4.dtb \
+	mt7988a-bananapi-bpi-r4-sd.dtbo
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-sd.dtb
+mt7988a-bananapi-bpi-r4-2g5-emmc-dtbs := \
+	mt7988a-bananapi-bpi-r4-2g5.dtb \
+	mt7988a-bananapi-bpi-r4-emmc.dtbo
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-2g5-emmc.dtb
+mt7988a-bananapi-bpi-r4-2g5-sd-dtbs := \
+	mt7988a-bananapi-bpi-r4-2g5.dtb \
+	mt7988a-bananapi-bpi-r4-sd.dtbo
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-2g5-sd.dtb
+mt7988a-bananapi-bpi-r4-pro-8x-emmc-dtbs := \
+	mt7988a-bananapi-bpi-r4-pro-8x.dtb \
+	mt7988a-bananapi-bpi-r4-pro-emmc.dtbo
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb
+mt7988a-bananapi-bpi-r4-pro-8x-sd-dtbs := \
+	mt7988a-bananapi-bpi-r4-pro-8x.dtb \
+	mt7988a-bananapi-bpi-r4-pro-sd.dtbo
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb
+mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15-dtbs := \
+	mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb \
+	mt7988a-bananapi-bpi-r4-pro-cn15.dtbo
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb
+mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18-dtbs := \
+	mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb \
+	mt7988a-bananapi-bpi-r4-pro-cn18.dtbo
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8167-pumpkin.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana.dtb
-- 
2.43.0


