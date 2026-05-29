Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4DECD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 10:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OTn1DAxteSlSwPU3wSURibMwp4uzXov4MV2WcBHyVwg=; b=4kr5TIssjC3PGAUsHNsPP08t2u
	uoXGbsmk9M44/wc5O5lCyzE3RO19EvCUgM97TmOpq76vj7gmw1m0JIK21Y/CNDVXMLth61CuGP0x9
	GHWtqG98VsFsgsyd7yaJWzjKYZLwcxMTogxD6eukd857uzNPc6sDsqZ5HBKPJ9osCDl2J9DIzIQnB
	Qd4yeQqf3oE3EkskgTmwnRd0nS5tK75yuwQ2kiP0csL4mOyq+Y1C0XdLgelD+tjeG7UZ+YO5GqXj8
	zPWnF/UERQlAmxuw8hNm5lv9Y1vjKj0jb68ZnOBctl13N4IuYjJCw6h+DPyWMUjb8POOh+dxMSF+k
	ofM2eAQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSu5t-000000078Zd-2SMZ;
	Fri, 29 May 2026 10:05:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSu5l-000000078Uz-2663;
	Fri, 29 May 2026 10:05:27 +0000
X-UUID: e5c4998c5b4511f1acbe4559397dec65-20260529
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=OTn1DAxteSlSwPU3wSURibMwp4uzXov4MV2WcBHyVwg=;
	b=SE8myHQVS2PrhoICBwP1JxhWxhspZyYsdnzjhR61yWlN0du3VQdzbf8Xu5B6CVgigl7W9x9SVlfZblzxHKmRm7cP8NE741w175JAtvHmoVHgQiD8yjbqhjjkdKx60IX9dQg81kuBHlm2H1H4rwzf/a3tQ3qfkeoCKA21gkGvvOU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:8dca5c7b-0b87-4f8b-b569-ace6dfbb2de4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:e0830471-c7f5-426d-bf09-c1b094e924d8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e5c4998c5b4511f1acbe4559397dec65-20260529
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <chun-jen.tseng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 260353022; Fri, 29 May 2026 03:05:19 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 29 May 2026 18:05:16 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 29 May 2026 18:05:16 +0800
From: Mark Tseng <chun-jen.tseng@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<chun-jen.tseng@mediatek.com>
Subject: [PATCH v1 1/1] arm64: dts: mediatek: mt8186: change CCI OPP scaling mapping
Date: Fri, 29 May 2026 18:05:08 +0800
Message-ID: <20260529100514.52082-2-chun-jen.tseng@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260529100514.52082-1-chun-jen.tseng@mediatek.com>
References: <20260529100514.52082-1-chun-jen.tseng@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_030525_542383_D272C02C 
X-CRM114-Status: UNSURE (   8.83  )
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

The original CCI OPP table minimum frequency 500Mhz is too low to cause
system stall, So it need update to new version, 1.4G ~ 0.8G.

Signed-off-by: Mark Tseng <chun-jen.tseng@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 90 ++++++++++++------------
 1 file changed, 45 insertions(+), 45 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index b91f88ffae0e..fded6345d422 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -48,79 +48,79 @@ cci_opp: opp-table-cci {
 		compatible = "operating-points-v2";
 		opp-shared;
 
-		cci_opp_0: opp-500000000 {
-			opp-hz = /bits/ 64 <500000000>;
-			opp-microvolt = <600000>;
+		cci_opp_0: opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-microvolt = <800000>;
 		};
 
-		cci_opp_1: opp-560000000 {
-			opp-hz = /bits/ 64 <560000000>;
-			opp-microvolt = <675000>;
+		cci_opp_1: opp-840000000 {
+			opp-hz = /bits/ 64 <840000000>;
+			opp-microvolt = <806250>;
 		};
 
-		cci_opp_2: opp-612000000 {
-			opp-hz = /bits/ 64 <612000000>;
-			opp-microvolt = <693750>;
+		cci_opp_2: opp-880000000 {
+			opp-hz = /bits/ 64 <880000000>;
+			opp-microvolt = <812500>;
 		};
 
-		cci_opp_3: opp-682000000 {
-			opp-hz = /bits/ 64 <682000000>;
-			opp-microvolt = <718750>;
+		cci_opp_3: opp-920000000 {
+			opp-hz = /bits/ 64 <920000000>;
+			opp-microvolt = <825000>;
 		};
 
-		cci_opp_4: opp-752000000 {
-			opp-hz = /bits/ 64 <752000000>;
-			opp-microvolt = <743750>;
+		cci_opp_4: opp-960000000 {
+			opp-hz = /bits/ 64 <960000000>;
+			opp-microvolt = <831250>;
 		};
 
-		cci_opp_5: opp-822000000 {
-			opp-hz = /bits/ 64 <822000000>;
-			opp-microvolt = <768750>;
+		cci_opp_5: opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <837500>;
 		};
 
-		cci_opp_6: opp-875000000 {
-			opp-hz = /bits/ 64 <875000000>;
-			opp-microvolt = <781250>;
+		cci_opp_6: opp-1040000000 {
+			opp-hz = /bits/ 64 <1040000000>;
+			opp-microvolt = <850000>;
 		};
 
-		cci_opp_7: opp-927000000 {
-			opp-hz = /bits/ 64 <927000000>;
-			opp-microvolt = <800000>;
+		cci_opp_7: opp-1080000000 {
+			opp-hz = /bits/ 64 <1080000000>;
+			opp-microvolt = <856250>;
 		};
 
-		cci_opp_8: opp-980000000 {
-			opp-hz = /bits/ 64 <980000000>;
-			opp-microvolt = <818750>;
+		cci_opp_8: opp-1120000000 {
+			opp-hz = /bits/ 64 <1120000000>;
+			opp-microvolt = <862500>;
 		};
 
-		cci_opp_9: opp-1050000000 {
-			opp-hz = /bits/ 64 <1050000000>;
-			opp-microvolt = <843750>;
+		cci_opp_9: opp-1160000000 {
+			opp-hz = /bits/ 64 <1160000000>;
+			opp-microvolt = <887500>;
 		};
 
-		cci_opp_10: opp-1120000000 {
-			opp-hz = /bits/ 64 <1120000000>;
-			opp-microvolt = <862500>;
+		cci_opp_10: opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <912500>;
 		};
 
-		cci_opp_11: opp-1155000000 {
-			opp-hz = /bits/ 64 <1155000000>;
-			opp-microvolt = <887500>;
+		cci_opp_11: opp-1240000000 {
+			opp-hz = /bits/ 64 <1240000000>;
+			opp-microvolt = <937500>;
 		};
 
-		cci_opp_12: opp-1190000000 {
-			opp-hz = /bits/ 64 <1190000000>;
-			opp-microvolt = <906250>;
+		cci_opp_12: opp-1280000000 {
+			opp-hz = /bits/ 64 <1280000000>;
+			opp-microvolt = <962500>;
 		};
 
-		cci_opp_13: opp-1260000000 {
-			opp-hz = /bits/ 64 <1260000000>;
-			opp-microvolt = <950000>;
+		cci_opp_13: opp-1320000000 {
+			opp-hz = /bits/ 64 <1320000000>;
+			opp-microvolt = <987500>;
 		};
 
-		cci_opp_14: opp-1330000000 {
-			opp-hz = /bits/ 64 <1330000000>;
-			opp-microvolt = <993750>;
+		cci_opp_14: opp-1360000000 {
+			opp-hz = /bits/ 64 <1360000000>;
+			opp-microvolt = <1012500>;
 		};
 
 		cci_opp_15: opp-1400000000 {
-- 
2.45.2


