Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EA9C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 16:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/d3Bq8v5y5No+XTIWRYmPhp69XHKj3YxfOuEHx8gNag=; b=rnCCl+l/OFoMEc5ojqZIdyfABx
	RyB0SxaBcpYWE4utIwc4b40CBsU3hhTEwrz6m76yWunG1YS6j5mAcczMsBe+a6MWdQ+H68VsojdX6
	l1U/OMMv5tiu6AMgdwob6y2fjPVmm94MhInXxD7m86nOe8S42Op+uo7TXFFZm27JDgt+tg4lx2W6s
	snbGTuJ72QMN0vq2j1ntLTsjW/8ebrL8ydXjorZxpQNI22nIeOO8obyXbaM1HGJuz8zXxuLNpzecU
	DZKSOGmsKBJc7rvZl2ArXQGjM/DXtLZb1qMxN6pKE5aeyM1Fzz77Es1gLTE4BAKYJFjlT+1lYh8BE
	vc7tnkGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tomGb-0000000GKzz-09Fi;
	Sun, 02 Mar 2025 16:34:13 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tomDY-0000000GKIL-3QG0;
	Sun, 02 Mar 2025 16:31:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740933063;
	bh=osRZAE8iggAuTuQfgUs1urVrp8xOcij0fdpUhTd0IR4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lCGwz7D8/3lHPubSEXZHciP30N4PidM0JcMYbudUAKFRmc2NlQxG84xTM7RkxSOmb
	 iYDx5CNz64b0QBL1k+PZZAKaG+r/nA0hEDPs0+pJfX8QdEqLOsldABbB7jzqJLyo0a
	 gxqjJrSqy8LwG+F06NP+5R/ihhCVyXZP1LTJxGLFocO1XoEam7ZNEYPWY35ovcj75s
	 /UQ/MrtHGGt27rdZnfvYBrKulk6xkvHnmOA27lzvY2Rn8XO1E6u/Wm0ZC12b7ZT1a8
	 IN/r/GwSJ5C2QKvYmBhysDzOp/Hh6e1SV4XNm8PJmE093M9i0597vFlJflZtA26vN2
	 Eaugt7i1rvNOg==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1002])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 770AA17E0880;
	Sun,  2 Mar 2025 17:30:58 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Sun, 02 Mar 2025 13:30:40 -0300
Subject: [PATCH v2 01/20] ASoC: dt-bindings: Add document for mt6359-accdet
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250302-mt6359-accdet-dts-v2-1-5bd633ee0d47@collabora.com>
References: <20250302-mt6359-accdet-dts-v2-0-5bd633ee0d47@collabora.com>
In-Reply-To: <20250302-mt6359-accdet-dts-v2-0-5bd633ee0d47@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_083104_999387_78D79147 
X-CRM114-Status: GOOD (  12.37  )
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

Add dt-binding for the MT6359 ACCDET hardware block.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 .../bindings/sound/mediatek,mt6359-accdet.yaml     | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt6359-accdet.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt6359-accdet.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..d08a79301409374714c76135b061e20e8e8acfaf
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt6359-accdet.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt6359-accdet.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MT6359 Accessory Detection
+
+maintainers:
+  - Nícolas F. R. A. Prado <nfraprado@collabora.com>
+
+description: |
+  The MT6359 Accessory Detection block is part of the MT6359 PMIC and allows
+  detecting audio jack insertion and removal, as well as identifying the type of
+  events connected to the jack.
+
+properties:
+  compatible:
+    const: mediatek,mt6359-accdet
+
+  mediatek,hp-eint-high:
+    type: boolean
+    description:
+      By default, the HP_EINT pin is assumed to be pulled high and connected to
+      a normally open 3.5mm jack. Plug insertion is detected when the pin is
+      brought low in that case. Add this property if the behavior should be
+      inverted, for example if a normally closed 3.5mm jack is used, or if the
+      line is pulled low on open.
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    accdet: accdet {
+        compatible = "mediatek,mt6359-accdet";
+        mediatek,hp-eint-high;
+    };

-- 
2.48.1


