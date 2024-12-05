Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581EAE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 12:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FPnIIC00O8dYi0RsEW4tIzGMyETMNCqxFBSCFpLBjA8=; b=LRU9W9ddWEcLmONa7iT9sC66O4
	XMXZLrOu9hkomLQ+2g8bUE9PDwrO/TDG+UYQsQhvQSKbQnKfi/jcvrXHq+6ppnpJIMyt09J1PSzAS
	hc3mi2EGlADx4yxWe1EGbvz+eKuIwoSw6O1CbsOcrisCe/LWefORSX5XVElZqV7pqWGcPCA+8I0h9
	waFE9E6eAflmA0c3zMlepyOkpMI7Z+IaNboP2vOcdjNQpSqq6vsUse/0szZCwZRoercjCD3S4XsY7
	b16YBwMZCH1VqgyWLsLsx+TiFEIhYezV9ER/YxlH797Aum/EMOE5x4zBoW0v7tKBeqL8rQbc+cHNg
	j1J7WSXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAqG-0000000FvJZ-22St;
	Thu, 05 Dec 2024 12:20:24 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAlQ-0000000FuJr-1UB1;
	Thu, 05 Dec 2024 12:15:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733400923;
	bh=s9PqXLkNpVGPkGaqAGeOVRgPs+SSzp40pXGX6y3dMVc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AyCr3/RQDBbHkpLbU9EyjM0n0rRgWL876AM4B2L0KQCXM/phSpOoYxqKWtkvRsq4U
	 TDNgLWcIOdnRqrx4TI9ztjOSwagwi4d+f0ofOb9TqZAlNzedHOQhxzX8cn3qeylKWN
	 9FGIWub2DTBXBEiGkJHUqTtZ03MN3JLQqmWZoc0EULG1c753LnNGr5GaOiOmX13Rv7
	 /o7Pybotnudaa0hRMMH73UXnlPLOqlfA8V+rzAgqgecIH2d/b8zQs9fylTvkw+JICj
	 taepxs+mYssa46ygpIFySRHF2SiXXfb9dFJE3lq2ODSIJTOu/j8jJS/R0ooZszj+KT
	 JNydJ5GxId8Vg==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1000])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BC57017E363B;
	Thu,  5 Dec 2024 13:15:19 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Thu, 05 Dec 2024 09:13:57 -0300
Subject: [PATCH 4/5] ASoC: dt-bindings: mediatek,mt8188-mt6359: Allow
 DL_SRC/UL_SRC dai-links
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241205-genio700-audio-output-v1-4-0e955c78c29e@collabora.com>
References: <20241205-genio700-audio-output-v1-0-0e955c78c29e@collabora.com>
In-Reply-To: <20241205-genio700-audio-output-v1-0-0e955c78c29e@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Trevor Wu <trevor.wu@mediatek.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_041524_534557_D920E776 
X-CRM114-Status: GOOD (  10.37  )
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

Add DL_SRC_BE and UL_SRC_BE as possible link-names for dai-links. These
DAI back-ends are currently hardcoded in the driver to the
MT6359 codec, but they may still be overridden with dai-links in the
Devicetree to assign them additional codecs or even to make the
dependency to the MT6359 codec explicit and allow device links to probe
the components in the right order and avoid unnecessary probe deferrals.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
index 1e282c34dbd99851d3959b641096968c0b2e71be..8993dff01244db9fc2fbf7bdefe7ea863be7c362 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
@@ -63,6 +63,8 @@ patternProperties:
             - ETDM2_OUT_BE
             - ETDM3_OUT_BE
             - PCM1_BE
+            - DL_SRC_BE
+            - UL_SRC_BE
 
       codec:
         description: Holds subnode which indicates codec dai.

-- 
2.47.0


