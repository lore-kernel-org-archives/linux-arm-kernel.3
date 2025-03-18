Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06095C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 22:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2c9kMAX2R1CYPdxk/Jfa9Ec6abXOPEPUdT8mXIO6YFA=; b=wOkuvJQbo1TqaVAYn5mK/oI/zV
	zWh9S8Z441qE+ogQlGgLwZOQn34lw9nd5l0aXXZt5MauljjSbXi9/rv0YjeH9S4/U1nZqy4/QZ6Uo
	e0C1xu91S3EaJDJSpZI4NXv+fCti5gEQHSZzFn73xUq+ZS9qzL0lX7Uvoi+taz5nxWavwZj83msT7
	MYWmOCKgd8s2tc0xPSiaxGQI/CL2RuSr++cnuHGypRrsrzApwgp4r7MKH0wzN5cQPlL/N4aHSaqYY
	ZbQz2CsO8lccFgHz1qpIXxLjtq0ZVchIkGB0d/mrjMPevUQpjdNYfkRF1XnqmoneO+MD8ne4XcEiF
	mDMPT/2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tufPp-00000007Fqa-16Xc;
	Tue, 18 Mar 2025 22:28:05 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tufMU-00000007FAD-3tJS;
	Tue, 18 Mar 2025 22:24:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742336677;
	bh=up+BGxd5yruq1/jjYQr7mm3mJ2LrG2vsIBarOQEem10=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JM0MRf+YtlyHEYRk8ImzBThTeuBeYnzaebvRvz490385HzecGv5k1O9LtoooxGR2v
	 hZcTFmYj0SfCFEkKlPM6jBfOlvpt34NAhPmeklMqkMD912aF22EzouQ+L5kT68q3mZ
	 MCUSbKYpaFFk0vGgJCLACfBs2OF4vNjHVRAPtzESVKEcE9Te6vfYhVqIQ2pXohLJZ4
	 cFSWW0te4RVJclYPhddQjPGrPNaXBAjCEl7PYr4Udd82TeCnDDqM/Gt0zjrEOOOloR
	 rrZEj8LcASGRF/Xo8KvKZjmBn1yNngaLhlCKqFVMLf0dLf1fi0WjMG5ggO4V+okdIr
	 hOOxg0NQzeQAw==
Received: from [192.168.1.63] (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B6A7F17E0FCC;
	Tue, 18 Mar 2025 23:24:34 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 18 Mar 2025 18:22:15 -0400
Subject: [PATCH 1/4] dt-bindings: remoteproc: mediatek: Add missing
 minItems for 8192/8195
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250318-scp-dual-core-mt8390-v1-1-8733e192cc73@collabora.com>
References: <20250318-scp-dual-core-mt8390-v1-0-8733e192cc73@collabora.com>
In-Reply-To: <20250318-scp-dual-core-mt8390-v1-0-8733e192cc73@collabora.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Tinghan Shen <tinghan.shen@mediatek.com>, 
 Olivia Wen <olivia.wen@mediatek.com>
Cc: kernel@collabora.com, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_152439_107719_76974B8E 
X-CRM114-Status: UNSURE (   7.46  )
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

Both MT8192 and MT8195 have an L1TCM memory, so it should be described
in reg, and therefore reg's minItems should be 3, as is already implicit
by reg-names. Override minItems to 3 for MT8192 and MT8195.

Fixes: 6b55b1e2fd7f ("dt-bindings: remoteproc: mediatek: Support MT8195 dual-core SCP")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index adc6b3f36fde49eb3fa7ed3f08b0fa9e7f331162..ee33c233e44f3d51f0851b35697a24208c87f68a 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -185,6 +185,7 @@ allOf:
     then:
       properties:
         reg:
+          minItems: 3
           maxItems: 3
         reg-names:
           items:

-- 
2.49.0


