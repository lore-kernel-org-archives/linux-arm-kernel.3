Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D39EA71B6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 01:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QZGaiIkMDiQfzwMAec81V212wspOnWl2TejFJYsF/rA=; b=tCRMwNEx/zuFOiBpRCVmwbP6M8
	yAItOamdEHN6Qzm8Mj2UvejFAxg/CaLc+yRotNEsLGK4lonKUkrvypEfsEaBG6TcAtM4knuQNgyxM
	CoOiRQrAiXStoo+0/NIbPLLBTrWc58cXq/ECMYc7435GX1p08DysCaGngZx0y3nG7e0avg3i9bwRc
	8stALXCHcudGQD+R8wLYAcCmmN2AeOd2WDvC+dIVLjingU8JbBSea2H0CGmjbC/xiHIkXm4+Oez+u
	1OsMaIN4o9wU1GHzVD1YbIKFiHe31sLWTBznyHZSuZW7oOjEGnxHTeNi0TZmQ9SLJ/A7Ib84U7w/D
	MwbTTfMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEdCZ-00000006Flt-0UJ5;
	Mon, 20 Apr 2026 01:13:27 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEdCU-00000006FjQ-3SRW;
	Mon, 20 Apr 2026 01:13:24 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wEdCO-000000002Wd-1Hpa;
	Mon, 20 Apr 2026 01:13:16 +0000
Date: Mon, 20 Apr 2026 02:13:13 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>, Cyril Chao <Cyril.Chao@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/9] ASoC: dt-bindings: mediatek,mt2701-hdmi-audio: add
 MT2701 HDMI audio
Message-ID: <072c4db4a01ac125e9ee5e34f992cd169c78e117.1776646435.git.daniel@makrotopia.org>
References: <cover.1776646435.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1776646435.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_181322_880155_F27BAA31 
X-CRM114-Status: GOOD (  16.08  )
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

Describe the sound card node that routes the MT2701/MT7623N AFE
HDMI playback path to the on-chip HDMI transmitter. This is
separate from the AFE platform binding (mediatek,mt2701-audio)
because it represents board-level audio routing between the AFE
and the HDMI codec, not an additional IP block. MT7623N boards
carry the same IP and use the mt7623n- compatible as a fallback
to mt2701-.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v2:
 * Fix subject prefix to use schema filename (Krzysztof Kozlowski)
 * Rewrite title and description to describe hardware, not driver
   (Krzysztof Kozlowski)
 * Clarify in commit message why this is a separate binding from
   mediatek,mt2701-audio (Krzysztof Kozlowski)

 .../sound/mediatek,mt2701-hdmi-audio.yaml     | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt2701-hdmi-audio.yaml

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt2701-hdmi-audio.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt2701-hdmi-audio.yaml
new file mode 100644
index 0000000000000..9d5a8166e51ff
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt2701-hdmi-audio.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt2701-hdmi-audio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT2701/MT7623N HDMI audio output
+
+maintainers:
+  - Daniel Golle <daniel@makrotopia.org>
+
+description:
+  Sound card routing the MT2701/MT7623N Audio Front End HDMI
+  playback path to the on-chip HDMI transmitter. The AFE
+  provides the DMA memif and internal I2S engine; the HDMI
+  transmitter acts as the audio codec on the serialised link.
+
+properties:
+  compatible:
+    oneOf:
+      - const: mediatek,mt2701-hdmi-audio
+      - items:
+          - const: mediatek,mt7623n-hdmi-audio
+          - const: mediatek,mt2701-hdmi-audio
+
+  mediatek,platform:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle of the MT2701/MT7623N AFE platform node.
+
+  mediatek,audio-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle of the HDMI transmitter acting as audio codec.
+
+required:
+  - compatible
+  - mediatek,platform
+  - mediatek,audio-codec
+
+additionalProperties: false
+
+examples:
+  - |
+    sound-hdmi {
+        compatible = "mediatek,mt7623n-hdmi-audio",
+                     "mediatek,mt2701-hdmi-audio";
+        mediatek,platform = <&afe>;
+        mediatek,audio-codec = <&hdmi0>;
+    };
-- 
2.53.0

