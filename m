Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C29D3B7FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 16:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2dDaGDPIGWtJ9Cf1Q1M6OfvftMRe7/Ljca7OOl5DSl0=; b=LFh6b/jEZJOl01hWyNoipWU0ip
	7yWCtHM2I9sdkciTizyI3rIqSB3xIpz//7qhK4cJVKSrctWCNmH5RydtmqGjHvQ8dJCtIeGEdoVMp
	mIsxzer+MkdC2Yv66YGPrdOEfkDdyCLssS7xBmGLjBwLEBvA/zK6SVzgIFxtPGWBhH0VWtEuotM/z
	14ap4yAF7/ZRYx/uHe9xIrEcbeByWCiqfe8VxSZy3I7kyB+6go6wHdiNskuW61Y6qXgll+VqVItWc
	ZGkga921BLRBA0kZJvKv77f9zyno3fl0RfYC8JblwP9WjCF0PykT2NQ3yORwNu+O8oZpedBLVwGbS
	LfE7apKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT0gA-0000000EX2p-3jGE;
	Tue, 09 Dec 2025 16:35:10 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT0fw-0000000EWeH-315Y;
	Tue, 09 Dec 2025 16:34:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765298094;
	bh=rasd2yBAbbleQLS5uLsgb/aOApXHNV+JTG3/osBNvzs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NN8/y9M28vW2NknSKoW1j4B5FqUTsP+kOxrmZD4l+4Eunp7qDUQJuPB+sFLDWJKZg
	 SHYXS6VRdfbbkCuyopKm5kVXiCCfuCbSgzi+KCfuSguRuPKUmC6a9Rmuc1y/AgxWqt
	 28vctTtqGXwfAWcDJCgGrb3HzHQYifKhWRzilLAJr+iCQDwd3Hn0hrV4KmR/cQRRSd
	 Ky/rXeZplxrz/PMZJ6Ah5SuOO6+TnCciL5EjOXGzoA7Nh2yR7jj8trzF5ATKCYPyDR
	 nq8u6SZgqyuvDDiN2HlBxAeBNKG5M8vBgYi9QhU3jE8h2N/T0w3xWdCebO4+OPOPPI
	 6lKGdLOwH5tEQ==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A882917E153D;
	Tue,  9 Dec 2025 17:34:53 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 09 Dec 2025 17:34:41 +0100
Subject: [PATCH 11/12] arm64: dts: mediatek: mt8395-genio-common: Add HDMI
 sound output support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-mtk-genio-evk-hdmi-support-v1-11-9a6106effba6@collabora.com>
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
 bh=rasd2yBAbbleQLS5uLsgb/aOApXHNV+JTG3/osBNvzs=;
 b=+2VnhI1Z4qTwcY1U11ptFHKqka4ogIdJY+xGfKzKxWkhI0/yaeVHYZJTC2FkTk3x3okTYViFn
 XOjyqEfy1PFDmaqb3WFHjzw9QAZXrCjWqxcnK9ANLo+va1wJEo9Wm7O
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_083457_014083_BF2EB7A9 
X-CRM114-Status: UNSURE (   8.41  )
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


