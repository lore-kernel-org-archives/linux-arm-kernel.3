Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3312C369C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 09:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EPgNR/sROm7jzLt2t97F0yxCCTK9RqgvE4VhwkRebxU=; b=UI5QgydTNBW2/f2M//eSHhn8ei
	Qrj1Qr++9dJVZYv1q3kEr4AbHAgZZWVVakecApebNWKgpHWte4s0xPpZQbNefALsko0MkDAWmHuVV
	Kd/hKIqVnYkwZXdXrnJfFbqpjfVH9L+l2pGgwV7dHOpsdkUsTPUQE6Qarsw7FL9AH5AKxSPzetxWN
	s90u5d+6pSrLvpbhyicIsygWW6V9AkkoQkfBISybHnVkZllsceopRfI2n5vDXkgbQsgaszDmYijz2
	2iLAzNJWRkRpYWq0n2Qxp5qA3OPkJZl5+U8fzSk2E5BbFh/pF0l3N+CyLIOroXZ0V5KQmlC5LeH+O
	V/N9KHxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5L8s-0000000CMtJ-2NcB;
	Thu, 17 Apr 2025 09:02:42 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5KrQ-0000000CJfN-1YB5;
	Thu, 17 Apr 2025 08:44:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744879479;
	bh=v23JT6QPcdjNmOFZ+Icy4Oan4WiHogN5p2dur86WsSA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BL5osxyyEoLBP8cwkPBkXrJiPkOMmvBPBis+4m/ayWLf7ukS72qW13VjcTDNm2RML
	 NCdkhRCeDTs2Vg1xTSjwRf9qxHzC8B4ruxLjyomsDZOG4w/dCjTHkY8OeHs6KT61cQ
	 sxzTlzzoi+bJxMwX4ydRDPQwNHbWO8VqCqwQLPnqg62xuDtEq7sc5IpNPG+1DljEZE
	 9av9S+AmDz+Z0ijadnhHtkOuxBtbuWJyh0nqXu+Wgi4si1apFdkp9ztvYoA4sOltEa
	 5J8dswTjqgxSHrniZ1rGfPNhsI4U87qX2SatELJBTIyrm0WOlUMYxOSzTwiX9xDjbD
	 MgxsrhwmAKuNw==
Received: from apertis-1.home (2a01cb0892F2d600c8f85Cf092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 53D3C17E3654;
	Thu, 17 Apr 2025 10:44:38 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Thu, 17 Apr 2025 10:44:35 +0200
Subject: [PATCH 4/6] ASoC: dt-bindings: mt8195: add compatible
 mt8195_mt6359
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-mt8395-audio-sof-v1-4-30587426e5dd@collabora.com>
References: <20250417-mt8395-audio-sof-v1-0-30587426e5dd@collabora.com>
In-Reply-To: <20250417-mt8395-audio-sof-v1-0-30587426e5dd@collabora.com>
To: kernel@collabora.com, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_014440_556072_CA189B3F 
X-CRM114-Status: UNSURE (   7.94  )
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

Make it also compatible for platform without external
codecs.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml b/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml
index 2af1d8ffbd8b58f1dce42b369fd699795183a7d7..54a53d15f40c0af56a2a0221025f3a090a05b6e6 100644
--- a/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml
@@ -21,6 +21,7 @@ properties:
       - mediatek,mt8195_mt6359_rt1019_rt5682
       - mediatek,mt8195_mt6359_rt1011_rt5682
       - mediatek,mt8195_mt6359_max98390_rt5682
+      - mediatek,mt8195_mt6359
 
   model:
     $ref: /schemas/types.yaml#/definitions/string

-- 
2.49.0


