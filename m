Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741DBC3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 14:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=09L0bbi2Bma9JXQKFtRq2kpouHX/DXAgs6YhAdRHLGI=; b=4jSIThTM1XLoauIWFLIEGf3Kt2
	ifYa5YwApRR6PxJ3Ptw/EV/Ywn9Xjfuv+KQ2cQ9cddrAHdMWcURh232HCob+ENUf3LsVf1G9GBIVl
	MFzQCKt5pR6X9vrGC3N6H3dB/RpYdTJ/adRc5iMJJtbc/O5w1duqh5NNtlWVbqjL/NOPNEZGNlVHF
	7w7T+0CUKrJEDdb/y39Ay6dnCkwxhJmHdc8VOKeII8DF2Fnkm3WIIO/wi5yFSU3XxEpau0M8c1Bnj
	A0MBOiIKVmMquPjhysvFrxW9v8qE+zGillTArY3OA6lSQwncSgOFX0SiAMyKG6qoEYAyqbhuAG7Tm
	Q+dvgGnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE7j3-00000007N7q-417a;
	Sun, 11 May 2025 14:32:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE7XC-00000007LXb-07aX;
	Sun, 11 May 2025 14:20:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=09L0bbi2Bma9JXQKFtRq2kpouHX/DXAgs6YhAdRHLGI=; b=jsOm6eSbI69YbSOrduQW/uURGl
	rGDYA/WcDCEZgp293Ni0JkAifErJnL/70jv7PTUsXLbQAgAscBe20UbD/XKyt1gdaANtGpThmrZ/W
	PJFVCTI/fOvz0hoevzre5JaWIGOguaL9pBz8WZX+oloGFhPPCWzJazGid9fh094/AvVQ/sPpyVTrq
	8356iUPVjc6enlo4n28KmJu8l3mjNnrDndQGRvl9zZXjmSz1oSM+7s/jVk9qA9p2D4UkTrjN2/1lU
	i4FyoPbFDNpHlm7sRhSWMd8U2oSExTt9qONGbnW8B0FP3jbE5f4tBT2IB7zqVmOcA7c0AllBCW/Fn
	Iqpu/DBA==;
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uE7X6-0000000Gcgo-3GtM;
	Sun, 11 May 2025 14:20:04 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout4.routing.net (Postfix) with ESMTP id C50D7100569;
	Sun, 11 May 2025 14:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1746973194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=09L0bbi2Bma9JXQKFtRq2kpouHX/DXAgs6YhAdRHLGI=;
	b=Lr8RdLBiPGlG/BnV8gmWcbdfWQri+pExu7H/FH/LtvAzNGF8xHDHjcCxZRLrtra10Tc4rX
	3Mx/8G1XAvlHkRptC7u4QVSVg6OjE7VtDfWXhcAVEBJvD2kApbX8WmGBCYzDXMNEOXpkvX
	tgduPpVf1q6ricuXpSxBnUqSdbuE5Lk=
Received: from frank-u24.. (fttx-pool-194.15.84.99.bambit.de [194.15.84.99])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 90738100787;
	Sun, 11 May 2025 14:19:52 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v1 01/14] dt-bindings: net: mediatek,net: update for mt7988
Date: Sun, 11 May 2025 16:19:17 +0200
Message-ID: <20250511141942.10284-2-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511141942.10284-1-linux@fw-web.de>
References: <20250511141942.10284-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 43a9dc2b-8449-488e-bbf8-467610c50a98
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_152001_051881_5BD94654 
X-CRM114-Status: UNSURE (   7.97  )
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

Update binding for mt7988 which has 3 gmac and 2 reg items.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 Documentation/devicetree/bindings/net/mediatek,net.yaml | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
index 9e02fd80af83..5d249da02c3a 100644
--- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
@@ -28,7 +28,8 @@ properties:
       - ralink,rt5350-eth
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   clocks:
     minItems: 2
@@ -381,8 +382,12 @@ allOf:
             - const: xgp2
             - const: xgp3
 
+        reg:
+          minItems: 2
+          maxItems: 2
+
 patternProperties:
-  "^mac@[0-1]$":
+  "^mac@[0-2]$":
     type: object
     unevaluatedProperties: false
     allOf:
-- 
2.43.0


