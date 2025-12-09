Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE1CD3B986
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 16:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sqdwydWeRF+ZyNYB0kGE+ADcV/Vl/LCBXqM3lPm70us=; b=Uk5WA+EtBTPZAidkx8/PVsbzcg
	hYwBo3pC/IekDinbbm6RCO8h41Sc6Spt14nGSIjKbDeS9XyEbHloDaXqYX8qbd2+Cmn9NrVvwLYD/
	JRMBUPRw2QOtrKs7qMVYvnBufCrbzahAfFN76dLO+i2XLD/i93dA17qrsd8SAoYWGQ9xX6H0mTqEJ
	vCFkLboFjmhhkWd8f/w/C16I9pINfOtfmjnFOFXrRFXF3o0RJkb0g8wlZeJfznfLNVjrN2bqpFuKf
	VbFDZrihlBkFa4zEDkUx3SrJBC3Kukj0qF1mhbvAmiCQKbifxbTqGNL/RybdyppJTNV/fCKYYLAO+
	iOPCpsMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT0fu-0000000EWeE-3KWp;
	Tue, 09 Dec 2025 16:34:54 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT0fp-0000000EWYO-2sTK;
	Tue, 09 Dec 2025 16:34:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765298085;
	bh=UAgQYJMonNyvABFQUCYGTv0h55DLB+kYqjP0l6avOdQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JPNCr2TpBi2kaRVdpAZ/5/A0y/zmB6QfWQqtyig711HC4dgg7kgGyulVjB+Ba72Sq
	 a3hi0bFzpe3zsXMmXoQaRBlR34J/NyrqYHSSmmz1EQ6ZDoA+bptntsVNvCfFvJpA7b
	 wrtzsUVpweFL74f9OlqSFgxXRifTUVUVOV+PGYScAxNncl9ogkS4zmlk52qdNYvvkp
	 sV/V0x8SYW4lyKxBVHVezVU9of77FZWo8ykEI6Dd14mxt9jGni/dxfEE4n6QcvbAct
	 OmrEfsLyOvoThTYLmrePb8GTH7Vpd/t0Jl3yM3zo2nkgiyBCvi8TVww6EzV7KBZiik
	 4ma6b6GWRPIoQ==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DB83A17E13CD;
	Tue,  9 Dec 2025 17:34:44 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 09 Dec 2025 17:34:31 +0100
Subject: [PATCH 01/12] dt-bindings: phy: mediatek,hdmi-phy: Fix clock
 output names for MT8195
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-mtk-genio-evk-hdmi-support-v1-1-9a6106effba6@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765298083; l=1455;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=80k4rA+yIjkX5sofkMjaL77NjvPABi7qoBPmKhwouPs=;
 b=98URLzBi+Ca0Vc4b04hGBVXS9zCB3FEsgOuTkNSoMBlCimncBF8/pZtMFCRPQ04tSwgmicV9b
 2A1tPriYlmBAMxfhSIZAdcCzMa/dEyEkuvzCjD1/ABh/oQysT6fq+1R
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_083449_907718_42B4A499 
X-CRM114-Status: GOOD (  10.05  )
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

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

For all of the HDMI PHYs compatible with the one found on MT8195
the output clock has a different datasheet name and specifically
it is called "hdmi_txpll", differently from the older HDMI PHYs
which output block is called "hdmitx_dig_cts".

Replace clock output name string check by max item number one to allow
the new name on all of the HDMI PHY IPs that are perfectly compatible
with MT8195.

Fixes: c78fe548b062 ("dt-bindings: phy: mediatek: hdmi-phy: Add mt8195 compatible")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
[Louis-Alexis Eyraud: splitted patch, addressed previous feedback from
mailing list, and reworded description]
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
index f3a8b0b745d13ffc55d391570bff20830d925ed3..10f1d9326f18dba85b92b4c88f4c0f6cdddc4c25 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
@@ -42,8 +42,7 @@ properties:
       - const: pll_ref
 
   clock-output-names:
-    items:
-      - const: hdmitx_dig_cts
+    maxItems: 1
 
   "#phy-cells":
     const: 0

-- 
2.52.0


