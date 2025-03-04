Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52746C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 15:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RCEp98455K9QoM6MUs4rkR/yQgrNWgR9TZeiNuQSxH8=; b=ERST9LUfHQGm6mRtqJOyEsOM68
	PW6BdaRo/lMvSqPsdVUVQTN89JwWgDX9zr72FXyUlZJQ7ZDKPX6ITGKdC1FMPm/Ox0OytQydgt9sJ
	IUGcaWPI00KHu368GIUgWv1xm6PMVOa0JR5JFK/7xetnau04zEN7iM3438AzY82fYgyeIOVc/euj0
	rUycXyyvAGkGaZBWlNtfi8vyXopLWXN6l3qPJZ3rjQ3MXiC1uF/JLaJMWr8q+P3g9ZnZ90VokBxGA
	LCS2qW9BGG4UlRkmiMbyC33K9mV0FB+zqj/aUoRZ//uQR2qByT0OXrlUKHD4CTwbXZ6HK7SvJ/QaQ
	hwrWxIww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUXB-00000005I8E-3UQm;
	Tue, 04 Mar 2025 15:50:17 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpU0E-00000005A48-293W;
	Tue, 04 Mar 2025 15:16:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741101373;
	bh=sv7vt2JjPvah5UEUTejJW8tA4asG5xEJWZ5yqaPrTtI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QPCJ5GE8Yie0IXMbI3fkiqyq+XY4XVLqX+fpGOul1EMU3uYNOOWNTt5Z/sLZ3RSOd
	 SNkyjLJtWiZ8wm8T1b5xhLOfoD0wmcb84E49JPQ7lzLEu+EfC8frHcy7fgjYFlIkSg
	 CnUDIZJgGxeXbCWiIuT+cOR4+VDlR5Yk7/l2xXsN3PmQt/h7nAD9167J6iwNAZKxgz
	 NtSeSzFnxYZcC0EJ5gTAeljq5+eqrzp6zEqctEhwCL4L5JDLRpFSxU2atTUVgY3+U6
	 IQz+pZYgMOAMDKnh/NQpRCJHLO0PHpwHMSHTqZ4TVXwtP7Mv8LVmxSNfZU4Ew2narM
	 xXL2hZGdcraAg==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 11C8E17E07F8;
	Tue,  4 Mar 2025 16:16:07 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 04 Mar 2025 12:15:42 -0300
Subject: [PATCH v3 01/20] ASoC: dt-bindings: Add document for mt6359-accdet
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-mt6359-accdet-dts-v3-1-5b0eafc29f5b@collabora.com>
References: <20250304-mt6359-accdet-dts-v3-0-5b0eafc29f5b@collabora.com>
In-Reply-To: <20250304-mt6359-accdet-dts-v3-0-5b0eafc29f5b@collabora.com>
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
X-CRM114-CacheID: sfid-20250304_071614_694057_8607DF0D 
X-CRM114-Status: GOOD (  12.01  )
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 .../bindings/sound/mediatek,mt6359-accdet.yaml     | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt6359-accdet.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt6359-accdet.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..1d27148ed7bffee3f73015c8af88bfffa8701843
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
+description:
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
+      By default, MT6359's HP_EINT pin is assumed to be pulled high and
+      connected to a normally open 3.5mm jack. Plug insertion is detected when
+      the pin is brought low in that case. Add this property if the behavior
+      should be inverted, for example if a normally closed 3.5mm jack is used,
+      or if the line is pulled low on open.
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


