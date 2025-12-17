Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DFCD65532
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 10:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2dDaGDPIGWtJ9Cf1Q1M6OfvftMRe7/Ljca7OOl5DSl0=; b=ZyylhUycLWP6fL77yFjXXJ5icL
	UF6Q8tV54ni8ADV9MV70+LTAx3VoG/O++hT9alpKza2Vdnx7LBm/VDM5PmsxJ/ZlMBf5CqX8M8HcU
	JZHcU9TFzpvgSuTmlIy1jgkG8BixCquc7C/i9kgaZv45XVjtgHboSFECXP17w+wol2f9/NiNRXnKw
	j9V9c2Kcq7/TnJrzzAdeuO9xSKlpclqocHfvgQ++lCnjMbgDtwwD4rXSUbK7dqgqWxPooQlF+4Wwf
	+fSXqG/Srao1QCYcHg0xV1Rs8/fGYcS1YOoa9bJ9xcsAzwR0kB6cqWM0xg5UCm21T/Gz3Ig3Ym0mK
	yoEeLWKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVodu-00000006bym-3e5r;
	Wed, 17 Dec 2025 10:20:26 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVodI-00000006bH6-2EdS;
	Wed, 17 Dec 2025 10:19:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765966786;
	bh=rasd2yBAbbleQLS5uLsgb/aOApXHNV+JTG3/osBNvzs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AQCAQxJDzqIgB0AQMjT/ioa/Qix5bJFwOsvOEVMFNjzgtZn6eWXnlrzQkvE1xfIo7
	 YPvBf5XXkNDp9fA3sb7GEwYfla0JdHtNek+VwsYXnDyotRUnGxHVeJHC66s6bS2J0C
	 X5macOwEMOZ0YFqnBy91DpjqK5949yOsurB/dL2CMmRrVahOLZaONorWfEmUaS5VjI
	 E8jMoxd7Nn/uk8boMlDirjHw8wbJr5WDZXQCjX8pZR9BKpDI8p5Mj2r2wtCOzbzect
	 zpUzaLwdguSRZ1ZUP/P5pFFt4UM4hJH/39Z9iRpw6T8BC5k8IvOHBXINaaSwJVa84G
	 91acvDPMmnWOw==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9637217E1149;
	Wed, 17 Dec 2025 11:19:45 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 17 Dec 2025 11:19:10 +0100
Subject: [PATCH v2 11/12] arm64: dts: mediatek: mt8395-genio-common: Add
 HDMI sound output support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-mtk-genio-evk-hdmi-support-v2-11-a994976bb39a@collabora.com>
References: <20251217-mtk-genio-evk-hdmi-support-v2-0-a994976bb39a@collabora.com>
In-Reply-To: <20251217-mtk-genio-evk-hdmi-support-v2-0-a994976bb39a@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765966775; l=861;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=rasd2yBAbbleQLS5uLsgb/aOApXHNV+JTG3/osBNvzs=;
 b=JO21AcO+ZgbZQXgQV92YUZq8r+v9R2am5sevpzr2i2IOdoJCBpaU6rL5sM0ro8spPqCVZrAVU
 wgmVlsTjIZsC/rwdYTNhPNxvi5QhGzeW07Rvz1GHqPJGw1LaM3JNrjz
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_021948_943289_2525F5FF 
X-CRM114-Status: UNSURE (   8.29  )
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
 arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
index 345fc5ac9e039de8660ae325f36ae6265ef3a7c8..d849af4d36134df6a7b9f7967efd0db13c372d7a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
@@ -1189,6 +1189,14 @@ codec {
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


