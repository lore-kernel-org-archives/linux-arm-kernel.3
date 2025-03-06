Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D5EC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 19:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XA2dfnxHcYHg30TCiKmEfVSJuNwDEcHpOWhnk5spKUk=; b=EYYDqLdlb0MdNiTKaFnsgERBdz
	JKECD6RJt7bAUZJdOwiK/calH5sKuS32A5d2hsLtKa9pQqvTmfEZFYWZi0hs/889KAvT28h9K1dDD
	0rHhNLKCZvh7ZGQ0nLAIlQXQfcRPuc4i4K+zIkjwpt+xZw/+ckzp2NPCKwcM05RLvpbk6ARFr8uUS
	GdhjicWMuYHlSqcurW0UebijN3NU6l5kibWKOYVOETwtWDyqaGbVNea0qoWpkpMLHZQ2hFcsrE87U
	BsrbWOkW0JwMZvx1dIk6O7kDf0R4QyxXlLeAwXE/UqtDBxhstiXp5tN5kFyQXW0E5kH0eAIehAJnn
	iCeZ6gGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqHKP-0000000C42w-3ujK;
	Thu, 06 Mar 2025 19:56:21 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqHHH-0000000C3c1-1DMU;
	Thu, 06 Mar 2025 19:53:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741290785;
	bh=kqLKsRWONIOEmraC+9O8yD+AcyM64UYTSdcTa/53UAg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iA3r5LYzxaP2yAgv5oief1N6BEqqJ6EhZdjo+YkSNPe8zEdNs4BifC1bdt8N1EH6a
	 EAWJtBTQxcYO1oe2NBxwhelfx46ySm4NKbkKTdS2/Jd/YnikmypxOHLjmUd7bPOak/
	 cGm3bbkur6xk2JLEP5d5qEacWGx9xgcKlHE0/+9TgLlfxx8G3D7hVCZQ43J7QmNTun
	 AvN1TEkV6bBoxWwzMkx3M2Z7w3b8+LrOdkJU4sISdx46kFkm8l2N5PcEI0kBmS7tmh
	 UrpmxxDk1QL9bADW6sat5du3zi3A64BsT+LBnMidl8VvDp3KvLhLWbVuObjMT0xLw7
	 PDeWY+L4PyDVw==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1002])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AAEDC17E0607;
	Thu,  6 Mar 2025 20:53:01 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Thu, 06 Mar 2025 16:52:15 -0300
Subject: [PATCH v3 1/4] ASoC: dt-bindings: mediatek,mt8188-mt6359: Add
 mediatek,accdet
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250306-mt8188-accdet-v3-1-7828e835ff4b@collabora.com>
References: <20250306-mt8188-accdet-v3-0-7828e835ff4b@collabora.com>
In-Reply-To: <20250306-mt8188-accdet-v3-0-7828e835ff4b@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Trevor Wu <trevor.wu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_115307_470352_46F93032 
X-CRM114-Status: GOOD (  10.02  )
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

Add a mediatek,accdet phandle property to allow getting a reference to
the MT6359 ACCDET block, which is responsible for detecting jack
insertion/removal.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 .../devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
index 8c77e7f68ad7b6f5b88b53cedccb291139a2eeea..76d5a437dc8f4ad1f31c21f84304bad326b0facd 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
@@ -40,6 +40,14 @@ properties:
       hardware that provides additional audio functionalities if present.
       The AFE will link to ADSP when the phandle is provided.
 
+  mediatek,accdet:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle to the MT6359 accessory detection block, which detects audio
+      jack insertion and removal. This property should only be present if the
+      accdet block is actually wired to the audio jack pins and to be used for
+      jack detection.
+
 patternProperties:
   "^dai-link-[0-9]+$":
     type: object

-- 
2.48.1


