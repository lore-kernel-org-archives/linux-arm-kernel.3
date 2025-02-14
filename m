Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95975C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 15:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R7hBuZFXrH73Nl/ObnLYXP2ri8z1FFmVnujkJfoZgKk=; b=Bjgo9sKS5OYZhg8TZ1HVTRQv+6
	/KnVeAih2rJBSFyBOsft0oMaKXDzOyuW1NQjqVGmrvYUkEgJZGlcc7prCV4xg03l5b8X0WdPz59gZ
	syCshtmWDd6RytcSMNoUBQaeGVKnHWJ5lx/+rT/oHWcFNlENPxiobGwAmL39242x8bbarBU18yK5L
	CGoh1GQQt4nG4xit7lldXVraPboTHyHEoQEq3Fx6zPMICIdipH2dituwtrzH4QahfNL9/n5MF30jm
	eCNnJIJW3wL9R4ierEcErlinAUonAK99NyDulCrd8+4XmMvk7BhOXCi6Kzhz4IkFP0AaBLGbSm1L+
	NK4Ex6Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tixax-0000000FJP7-1ZMS;
	Fri, 14 Feb 2025 15:27:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tixPI-0000000FGhZ-1Dwc;
	Fri, 14 Feb 2025 15:15:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739546106;
	bh=JlKd02FMr5+yn8vnMu4CtaugEG5YPJLOEvhxTZp5wBQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=e6S0uCEimvGI6HgMA73JSU5MOVMGZa/3wpyIYb1lmvNeTMQ2a+8bTZZSAWU1RNN9W
	 lDiuBMZ4nGKLQ413R1OUJ3YrftqHerYyQJkX0poh3WW9FVnN2U5TwU/4mNsi+jzKF6
	 MoemyRcF03xqTkGPQC80Oe9mHTBZhNvUABNpmoRLwQ7CR7r9HBd9gJSjM7J88qtRaA
	 9grK+3Vlx2G5Hlt8Dm8OsdMLqrULtwW69o6mIanHi6qRie22gmGJI8ujDdrX7S2X2M
	 a/RJOAq7hVXz/4cNIuA9sYX/JFJ+IaNXVmKffYAWhVS+7/kuZwDz+w5MCtiZ+vlkDi
	 v5OfdBF/t/MYg==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1003])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1CCF917E0FBA;
	Fri, 14 Feb 2025 16:15:01 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 14 Feb 2025 12:14:29 -0300
Subject: [PATCH 1/3] ASoC: dt-bindings: mediatek,mt8188-mt6359: Add
 mediatek,accdet
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250214-mt8188-accdet-v1-1-6bbd5483855b@collabora.com>
References: <20250214-mt8188-accdet-v1-0-6bbd5483855b@collabora.com>
In-Reply-To: <20250214-mt8188-accdet-v1-0-6bbd5483855b@collabora.com>
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
X-CRM114-CacheID: sfid-20250214_071508_475188_5593136D 
X-CRM114-Status: UNSURE (   8.47  )
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

Add a mediatek,accdet phandle property to allow getting a reference to
the MT6359 ACCDET block, which is responsible for detecting jack
insertion/removal.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
index 362e729b51b43ec16716aee70ad736420def81f3..41d303e28e4dabd152140531ec0bf7375741b659 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
@@ -40,6 +40,12 @@ properties:
       hardware that provides additional audio functionalities if present.
       The AFE will link to ADSP when the phandle is provided.
 
+  mediatek,accdet:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle to the MT6359 accessory detection block, which detects audio
+      jack insertion and removal.
+
 patternProperties:
   "^dai-link-[0-9]+$":
     type: object

-- 
2.48.1


