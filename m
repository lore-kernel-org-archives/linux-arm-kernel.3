Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F365BC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 09:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uIRHt+csoMqqeeEh6CcdY7U6w8VlXpY+igi1y40Z2eM=; b=OmqoKKb5N7nBaQRMXi0D0xQPV5
	YD3vuu00uSDaBwYPDePGxwxajx43hpdeyJTfTVzejSqK3UUAuYdUQ0+RUzVwCnQA/uG5XROHQ8FYD
	5Ze/sWixDZl17fj860ATfzL48/ff3ya6rglTrwofAU23yINVBamLeF3q3ksdGTih/ayEgdouN9Pfw
	Rs4zWxmRD2Z60YhFIIpMXXZPudoIXwVnDvWrLfdPJ1tLrvWkL8yI8lJKuyK3nQT1ATHhsN+EoqcV2
	h7UKY4OJUrduBSkudVyRlDhG8YFeta8hTqSy+E8Kelm65oEkOCG4gk0bMXQ4j/LdYw7h1Rv8zTHMX
	H3OeiKsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5LAh-0000000CNK5-2ffr;
	Thu, 17 Apr 2025 09:04:35 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5KrR-0000000CJfx-1EbE;
	Thu, 17 Apr 2025 08:44:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744879480;
	bh=yYuncH4o/OXu+LBXvJQSH5seIVPQe5LqP78BPBexpWU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bQ9G7o1O5KE5HrcB3TN3qvG0lAcYgiwSq8nLNUDwggbHNXkUEm/vJp5dWR7P5Ddo0
	 zZu9yVmDkMG5hH1Tw/R6gRFTl1rXZbaYVcVL6T80bHpnklT/4vLJY6vGwcdHF2ZU0W
	 5ZeQX5xatb6jSWo05Ymc6or10ioYQh+N4gTa9B4IngYp0l2m50GX32OQvrdPlnQ87q
	 21cb2xNifROdMdwFQPnvAGBeTyl3s0qrmfKzog+TvMCs1F5Nurtn+/d7svQ4lNXGEw
	 +RzEnVvlGCc3/CQmPaJvsUeSIZvBX90+U/CjOWDXmJRrGyNB9dZvioPrPnffc22Kaz
	 W/wfu2stcKu/w==
Received: from apertis-1.home (2a01cb0892F2d600c8f85Cf092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3E19817E3655;
	Thu, 17 Apr 2025 10:44:39 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Thu, 17 Apr 2025 10:44:36 +0200
Subject: [PATCH 5/6] ASoC: dt-bindings: mt8195: add missing audio routing
 and link-name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-mt8395-audio-sof-v1-5-30587426e5dd@collabora.com>
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
X-CRM114-CacheID: sfid-20250417_014441_477753_AFF00B54 
X-CRM114-Status: UNSURE (   7.87  )
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

Add missing DL_SRC_BE link,as well as Headphone L/R that are
provided by mt6359.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml b/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml
index 54a53d15f40c0af56a2a0221025f3a090a05b6e6..356e1feee9620981aadbf91115af1d67a735bb2c 100644
--- a/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml
@@ -45,6 +45,8 @@ properties:
         - Right Spk
 
         # Sources
+        - Headphone L
+        - Headphone R
         - Headset Mic
         - HPOL
         - HPOR
@@ -89,6 +91,7 @@ patternProperties:
       link-name:
         description: Indicates dai-link name and PCM stream name
         enum:
+          - DL_SRC_BE
           - DPTX_BE
           - ETDM1_IN_BE
           - ETDM2_IN_BE

-- 
2.49.0


