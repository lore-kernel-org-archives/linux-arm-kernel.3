Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7661CC83F3E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 08:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qTk3CaUjrlXYE6puZpLxm2dSmQaEjt3CJufwyvSfla8=; b=rCsvQI7K0qVsr50mhhURIZQlvG
	YKmHekbYHtkqCLqlFpk+cgj3JpS/jQjdb1C4AwlDbJB7SbP09sD7QnSAxf2ZqOwai11atghSpNoCx
	wX3LD6ajohtTzLeQoxt+zLkDeF0glnkiGaGknRkkE1m/HQTokeaDdG0Kych+9W6OgnS04XH2GPuYH
	+QyBJLhDo0YU1Q813/EF6w+/1ac74YCzeQxP/X0KsKLdjOstxV8u+sp3hgmXhPvTxwELSMMqyw8/1
	2FrOVv8rtNoSjPKEO+27LHTMIsOlegaCRa4jIzuWB3RA/eXeKbySrM94BjPitAntqNhMuXgkXvxo0
	oTN8roHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucg9F-0000000ByVo-0dMn;
	Fri, 18 Jul 2025 08:08:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucfxS-0000000BwbZ-3ViK;
	Fri, 18 Jul 2025 07:56:44 +0000
X-UUID: ba92e6ba63ac11f09f706fa2197c6ceb-20250718
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=qTk3CaUjrlXYE6puZpLxm2dSmQaEjt3CJufwyvSfla8=;
	b=eimLsBBW4eVYE5QfIHz/MtN1Ty0na+aiKLW0DxysUfFQ5GI0+vYwEtI3hHO0HO8L3IAhuVeQKaYLpvBfJRrj86KXYlgss/RZoux22ehLkF38ZKhGnZkps2ZhkKPm08/IfKRn4e5rGmx9Qckiznh+xmT+aQZfLaav4grCQGXaEJg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:cd393e6e-1c1d-4a25-b659-51e549bcc9d8,IP:0,UR
	L:0,TC:0,Content:45,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:45
X-CID-META: VersionHash:9eb4ff7,CLOUDID:aa272673-f565-4a89-86be-304708e7ad47,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:3|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ba92e6ba63ac11f09f706fa2197c6ceb-20250718
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <sirius.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 791588890; Fri, 18 Jul 2025 00:56:36 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 18 Jul 2025 15:56:32 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 18 Jul 2025 15:56:32 +0800
From: Sirius Wang <sirius.wang@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <wenst@chromium.org>,
	<xavier.chang@mediatek.com>, Sirius Wang <sirius.wang@mediatek.com>, Conor
 Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 2/3] dt-bindings: serial: mediatek,uart: Add compatible for MT8189
Date: Fri, 18 Jul 2025 15:56:25 +0800
Message-ID: <20250718075630.644870-3-sirius.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250718075630.644870-1-sirius.wang@mediatek.com>
References: <20250718075630.644870-1-sirius.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_005642_908990_AA8688D3 
X-CRM114-Status: UNSURE (   8.84  )
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

Add compatible string for serial on MT8189 SoC.

Signed-off-by: Sirius Wang <sirius.wang@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
index 5bd8a8853ae0..3f0f4aea0a4c 100644
--- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
@@ -47,6 +47,7 @@ properties:
               - mediatek,mt8183-uart
               - mediatek,mt8186-uart
               - mediatek,mt8188-uart
+              - mediatek,mt8189-uart
               - mediatek,mt8192-uart
               - mediatek,mt8195-uart
               - mediatek,mt8365-uart
-- 
2.45.2


