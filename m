Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC8BD3B981
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 16:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lhbGlrrkCvQnkV9qAipiOxr7Kf0BEAjHL+cjbnUYcxc=; b=BiiY4NU9bBelOqIrEyuS7BwFjB
	HxxHz2Vv3/Nextp9na8KZN5PodzrsNIh6UY5Ox/8rH8PZP0NXuF63X8QhVPt0+wTMkCdUkiZySkSy
	xFh4e7ltA7TwCDF3/zQshXsA+Y1/sJI78m50O68tyuscbEYuNfUuawKxrqxzkv+XPBtAIeCGMaXlq
	M2MQY+DSirIqPX+LVR5ZMNw9oXxYvgzwYdcric7sZ2zQcqrEHAbYMYFQTeJkpvbDnngEgacexBZwu
	FuRpLqpSeBS8oo8Lh29PMB/wXD8FqeuTJpC8Jpv7hH2WuDn0k9c2kav/ZtxP8hQ472t/zKKye22/N
	5H2/fD+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT0g8-0000000EWys-2DeA;
	Tue, 09 Dec 2025 16:35:08 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT0fu-0000000EWcB-3ijs;
	Tue, 09 Dec 2025 16:34:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765298092;
	bh=GKcOSBIVFDnp+GUxDrITE/MDL4om5/OvUq+7HaEF0uc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ISpgg3mIxI6mnE36Vy8Z1cYPMIQc4Hdygxp9kHJdDq3sBqfEberI46Autv5Mjmcfu
	 YwjpSd56VoZ/eOuJzMzpCX8ryEO5rprwDyDPWsvTd31p2SgOIQlpOmT3u39gFB/ubs
	 c1vaIkHs5Yk7+oiLNJLioRbEiTyEP6DlrMsIu6jaIUr/Xg+p9TLkoZvTYqYoYVIEyg
	 nGoxAgKFTDU1T4QHF/9Fjts7jZWEQCowNOwl9q4XG8xQF44dGZVt4gBDhjlzYWBoj1
	 7swDMlGGn5bn0nohZYEU/3s/SkOruQ2JTaHgs8f0K6yBmHy5xpJ2FK5IlyOuvlLFQE
	 GpEhRcQGR8Beg==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E6D4F17E13CD;
	Tue,  9 Dec 2025 17:34:51 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 09 Dec 2025 17:34:39 +0100
Subject: [PATCH 09/12] arm64: dts: mediatek: mt8395-radxa-nio-12l: Add HDMI
 sound output support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-mtk-genio-evk-hdmi-support-v1-9-9a6106effba6@collabora.com>
References: <20251209-mtk-genio-evk-hdmi-support-v1-0-9a6106effba6@collabora.com>
In-Reply-To: <20251209-mtk-genio-evk-hdmi-support-v1-0-9a6106effba6@collabora.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Guillaume Ranquet <granquet@baylibre.com>
Cc: kernel@collabora.com, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765298083; l=861;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=GKcOSBIVFDnp+GUxDrITE/MDL4om5/OvUq+7HaEF0uc=;
 b=rrmm0qHNwHdTm/aW+yZazeF7J3LgIjWtXHF8w93CGmE4Mi6ozvcZU/F4yZTeVzon9j57pjJ7L
 EyYnCMi0TqLABHSjPYIofSxAWCtJWfqSQ//oe9/Jvpkf5NCQpGjmzTg
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_083455_192918_846D5FFD 
X-CRM114-Status: UNSURE (   8.49  )
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

Add in the sound node a new dai-link for ETDM3_OUT_BE to add the sound
output support through the HDMI TX connector.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index b0e18876bd5d2341c6f17f47e9f11433be807ccd..1cd4b84e98615be6c5cb13d01b7baed0e017c3be 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -1072,6 +1072,14 @@ codec {
 			sound-dai = <&pmic 0>;
 		};
 	};
+
+	hdmi-dai-link {
+		link-name = "ETDM3_OUT_BE";
+
+		codec {
+			sound-dai = <&hdmi 0>;
+		};
+	};
 };
 
 &spi1 {

-- 
2.52.0


