Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F4A9E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 12:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RD7ENo9NyIv7l5cCxOSUp9rCp8ftSysYm1Iha4yjY0c=; b=XNjmA+DP9DrjoXN4dsuub6Ra1C
	xuYLvqKFpv98yxPkRZKuAqM/uH3slolJJ/OR0/T7Et2WCSvTTxTvgaaxnGTFthjE3XFSn4MEbLJsA
	5AxcNdVwG+kQSM8I0DntQNAG9DhF9lq7OeSOOEu//bN0A++RS6fZ+NzTuD1cHS51utp8IQou7KcU0
	Vc//1V9vw9+4Z7tPPUZdVqhb9b9O9kVUumqu087+NnhEIGPvVj3JJvw+AOTayYEWq5w6iNXIo8abE
	tlzvFMD3ChR6T4SxLkft6EZxfWf9WpGu6lZ4/5ZKhBU9qT03JdxBNRi3GtGxMz/Aaus2PEcJGiRXe
	iHOwzkzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJApG-0000000Fv98-2ZKx;
	Thu, 05 Dec 2024 12:19:22 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAlM-0000000FuGj-2Sp3;
	Thu, 05 Dec 2024 12:15:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733400919;
	bh=h6EtCNUapE2Uy+r5ZkHsutNJ70Xge99WvLYAuUKOC7s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nQMq15ZU6sWF/LKfR6yL2hLZS/UkmuE9glfKmCHW2b/epxMss/TUlmQ7Zp3SLN8y9
	 y6GEyHBHkDr8smT01nq5yxsklJgEWa2Y+qDeFAihea4u87HsLux1Wimq9Zniz/wL6F
	 JNV7zqksvzPpL3L4t5050qXDakToUKssNvnZp4ekvIedrnKSY4/ZiM0TfkWF2EEysI
	 iLuezBXXTvSaG+EusgkvYOxshXL7oaFBacLAbvi8ydg6DHwyoSZy7YMPdqfgBe4AJj
	 hyftXvMbuPqxd5U8vW2NkdAagyEQWlup0iDE5DIvnStXjLkeLbQ/xeG3dZZA7GSf1o
	 mavCTuRx+rohw==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1000])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0A92417E3661;
	Thu,  5 Dec 2024 13:15:15 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Thu, 05 Dec 2024 09:13:56 -0300
Subject: [PATCH 3/5] ASoC: dt-bindings: mediatek,mt8188-mt6359: Add DSP
 properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241205-genio700-audio-output-v1-3-0e955c78c29e@collabora.com>
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
X-CRM114-CacheID: sfid-20241205_041520_770257_EE3232B6 
X-CRM114-Status: UNSURE (   9.47  )
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

Add the mediatek,adsp and mediatek,dai-link properties to allow
describing the DSP configuration in the sound card node, as is already
the case for other MediaTek SoCs.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 .../devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
index ffe9347b543f5c687433862a21ad534b8aace27e..1e282c34dbd99851d3959b641096968c0b2e71be 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
@@ -33,6 +33,16 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of MT8188 ASoC platform.
 
+  mediatek,adsp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of MT8195 ADSP platform.
+
+  mediatek,dai-link:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description:
+      A list of the desired dai-links in the sound card. Each entry is a
+      name defined in the machine driver.
+
 patternProperties:
   "^dai-link-[0-9]+$":
     type: object

-- 
2.47.0


