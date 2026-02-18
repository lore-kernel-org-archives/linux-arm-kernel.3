Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EACEE9A04C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 09:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nwWtLMdM42YbzoLo4/7wEhs5yhymMA6ChDA3SGBdOa0=; b=tUtKatToxc71Yi9gO8sqqB1Yoj
	96xatiB3YBzDlXrAIQzzfxlefBKbdMaNPKPMmoTLdY6c8Ws5EHiz2OFB2HDh8pluTJ1d18t/JBeyD
	KEBDi+Txrwo3bBSxDo2a9LK+nJ+IzpP0U+9zaOhjrlathvK12BOtLNNNCnvZEwqHsZ3moWiJKlEaf
	G10MLlSHx3wIZKPrW+PmrInHad3EdUzr1nP2+O5d+TQJmPUQZxaMTqF8w93k5jAcvgMWjYhGsnBHI
	zID8Qn6fJeDsGoWXA0zNjSfIXaYw5p6TfiWeN915tfOVYYVXojIavnRDl155PZllHEbNCBI4LE9Wc
	RlwmYg0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsdmn-00000009XLJ-47M9;
	Wed, 18 Feb 2026 09:23:57 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsdmi-00000009XHJ-0O3a;
	Wed, 18 Feb 2026 09:23:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771406628;
	bh=3D8WQoaBuVJDthUioSmU/QbK1HNlGUVg/GvxA17VnHg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RWACkuJkTlXZPeSXnL+tY30C4VGAceUv5SzxRhe+9SiplAir673BtIw2wptGl00/Q
	 ee/dzMUlIS7BQjrmKVxMNEz+KzT9H5anSm8h2l1KjlfHvvjbMH+nlxZoDOh3hBlt+W
	 OtKC9HmjhR7k6SNSx9HTQd+vf7M1C0jVWUCmcDbrQP9icuAst3FRWpQIzc2sXfHJGa
	 hwb5ZffJJRzvmGa981pk5Kp/8NlumcFZCMOLbczD2T9pwkAVHdOgN5oP8WWr8nBoc8
	 e//LMtRijgKHVrvDy66bnzt6zbJyafTQ+yRsyp86epGFwhp6X2lQVRDTiH4gIeKb8B
	 icXE6YMF7AP6w==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 90A4517E1525;
	Wed, 18 Feb 2026 10:23:47 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 18 Feb 2026 10:23:04 +0100
Subject: [PATCH 3/3] arm64: dts: mediatek: mt8365-evk: add mmc aliases
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-mtk-genio-mmc-aliases-v1-3-e218e9f771c5@collabora.com>
References: <20260218-mtk-genio-mmc-aliases-v1-0-e218e9f771c5@collabora.com>
In-Reply-To: <20260218-mtk-genio-mmc-aliases-v1-0-e218e9f771c5@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771406625; l=944;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=3D8WQoaBuVJDthUioSmU/QbK1HNlGUVg/GvxA17VnHg=;
 b=yB9pG51AuwxoABSH+RUS8W4fd8hH0d+dPkxrerms0/q3Nd4Lr62aMB0tiYKwkScgLkZhG0T25
 rvhaM/RPAmABerlsIJQZl/2oWuf5CMEvGbIxxQ2WyJib/R5E3/pbfBd
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_012352_388762_BE59BD5C 
X-CRM114-Status: GOOD (  10.42  )
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

Add aliases for mmc nodes, so that the eMMC and SDCard host controllers
get enumerated in a consistent order for the Mediatek Genio 350-EVK
board.
Also, reorder serial0 so all aliases are sorted alphanumerically.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index b5dd5ef9fa11ae1d54aa754325bac2e184b90dd3..a30ee523b0b587977f9427767d09b21894eb7ae3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -20,8 +20,10 @@ / {
 	compatible = "mediatek,mt8365-evk", "mediatek,mt8365";
 
 	aliases {
-		serial0 = &uart0;
 		ethernet = &ethernet;
+		mmc0 = &mmc0;
+		mmc1 = &mmc1;
+		serial0 = &uart0;
 	};
 
 	chosen {

-- 
2.53.0


