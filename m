Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6298C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 18:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EYu/Xqo8FCI3CC9WJcK4NA+I/CMKIk9XFrlcNIYdZuY=; b=LAzLQ7VGFqbbg6ryEIBth6TWEy
	qVc+owCKN78lqigdBJAd/GvizrZ2Zg+buGpa0rGafrSxQTp/z6Jzsf/6BH/8N9bEOsgaIa16zUtsZ
	QfwzulsdVDjflAvyF2//YZqbE0hVkJGW8D+gMJMlqBLlKxN7+UM3Kc48fjXfIEtQzFHm+Kv1XuJ6T
	PEU0BuPkHh4ZkWMkqmHHogdVyvbCQ5pwuw/qc2lq1K6XxsS+b4lueaB4dUdxtCbw9sOprQWfqcqYm
	zNQYFUBbpvSBGcufIl0IyVQ7+3+hpYK8MDsFC61Fw/EyvgiRyBDWdWWJk6gazBMg9ANHCQvwr3l+A
	L/3a3LjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0rV-0000000Fx5x-11kh;
	Fri, 14 Feb 2025 18:56:29 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tizLa-0000000Ffrz-13PM;
	Fri, 14 Feb 2025 17:19:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739553564;
	bh=EjrwtqxQ5bYCEJ01b8/loccYAmWqyhZVlY3k8ihmFqI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jKmhFCT46G4ZE7VKoaQa1t7STDOnJBGHbZz5o2FD5c26nn3bYRQTHsxFyI842N1cS
	 3U2IAhk+gjlqqF3bK4f2Bm2izUkzaB6yb9XecmSNgfC7kBnVK8LSdivk5DF7z+wtxv
	 iaqkAej46RbvRahRMOT4SEgv1iqQVm/4FuEjH1bKEcU5Eo0LWM6VKgQjeB+fZV2A11
	 RINMMuvTSvk6qAomCfWRS38Cjeus1m9t7Hpfn50h+WNc0C3UlJcNdN2AzAfla683sF
	 SWVxlbZmH+xNaS9qXEvJisd6DlPy4Tp3o/AozJgDUgDVMGWvMIBJvoeDl4Xa4lItEu
	 8dokj70spGieQ==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1003])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 63F0E17E1507;
	Fri, 14 Feb 2025 18:19:20 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 14 Feb 2025 14:18:33 -0300
Subject: [PATCH 02/13] dt-bindings: mfd: mediatek: mt6397: Add accdet
 subnode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250214-mt6359-accdet-dts-v1-2-677a151b9b4c@collabora.com>
References: <20250214-mt6359-accdet-dts-v1-0-677a151b9b4c@collabora.com>
In-Reply-To: <20250214-mt6359-accdet-dts-v1-0-677a151b9b4c@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_091926_432025_72A3C83D 
X-CRM114-Status: UNSURE (   6.47  )
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

Describe the accdet as a possible subnode of the MT6359 PMIC.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 6a89b479d10fad3c8b61cab5a3af1453baca4d1a..1a8c5748a28da6ad8aa091f8c0a74bc1dc709644 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -224,6 +224,13 @@ properties:
     description:
       Pin controller
 
+  accdet:
+    type: object
+    $ref: /schemas/sound/mediatek,mt6359-accdet.yaml
+    unevaluatedProperties: false
+    description:
+      Accessory Detection
+
 required:
   - compatible
   - regulators

-- 
2.48.1


