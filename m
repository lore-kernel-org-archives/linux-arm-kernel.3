Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B409E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 17:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R0goM2PHB/ERJmVDSdaKLM3QNR3Jr4HnKNXXHLwCWPQ=; b=Nv59pDoR+3NqmOEjdYIJyrFU3n
	vUtJAzyp5efFfsCAVza/HkZbsoV0ew/0JU6a2sH98qmCy4bw8iDdSY8ctWrPglAcWpqSZwivvlH1a
	0E9nb3Z5+acHGqAVa4SSmEXBXzs9d0Dj7YNTKcOIo25mS2NkXqsRjo0MuZmcOhjOX2lp9Wv4c75lV
	/RSgwItCCt7PlaqILRqMuF3wXaeicD7nPpQ3D8yzBVIsBzUO2ZLMhyI6K9BbSeDqnVppgsjaQ+CMx
	1E+QU/a9EECHyYG6l0MFQ1UIn1rNS87VB5GAi6efNcMX5mKnvyGx1Qzrrxz2MdtrYKNJ0AewZcGBH
	bg2uzOeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTPT6-0000000B3Fg-2bt9;
	Thu, 02 Jan 2025 17:58:48 +0000
Received: from mail.netcube.li ([173.249.15.149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTPOX-0000000B2LU-1qcU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 17:54:06 +0000
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References;
	bh=R0goM2PHB/ERJmVDSdaKLM3QNR3Jr4HnKNXXHLwCWPQ=;
	b=cT1g6hrMpoSgvrHApkpxx+NLw5aY3Rfe89jf5Ucu6zwKMaQetF4PnVKTdDvQSS4cnO4KPzj4h31jAD5y1rwdcv57QlX0PxR7MFR/BXIPknzNy+Lk1Qcvzg98/Bd12buKVOoYB98Tqtgqtxeo/ONwNWbmxPrbZdycUNRQVHSvrjE=
Received: from 854af3ed5e24.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPA
	; Thu, 2 Jan 2025 18:53:52 +0100
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: arm: sunxi: Add NetCube Systems Kumquat board
Date: Thu,  2 Jan 2025 17:50:00 +0000
Message-Id: <20250102175006.3675-3-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250102175006.3675-1-lukas.schmid@netcube.li>
References: <32b5c286-9457-4b93-a93f-c8aff356ec10@kernel.org>
 <20250102175006.3675-1-lukas.schmid@netcube.li>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_095405_811440_528D54C7 
X-CRM114-Status: UNSURE (   8.31  )
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



