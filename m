Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571A2C43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 16:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/hsQU5Rk1UqvO+xT0pJpi0/3Fk2RjVJnQU23qqvsk8A=; b=r6P9ofNozXigyDbr9BgOHcKkj5
	SEwX1I9/vS1D2abkOKNONrKpHRkSO1xZdjadw02t2rgsz2owbFFjl/FTi8kJrZaw1auSnzfbUr+rW
	QDnISX+sCOuKfohmQO9ORFB3sCS5+AOQXUVPd5KiTT30yX29fvjU4kTYAnfasrIaIRniNSSDgLJHL
	1uEHAIh85WZ6F81LZ2+d/sua3B3M0mlgTzcjSAnwAfI95+SfFx7rHqc8TOcB9LSy9fdHSrijSiAyT
	byBJkEz6bOwllNe7b8CGbk4hMDFL5eXNEo/tNVoYcdOLy5KqonFcspD6YYPBuN5CFgrjUOlYcH77N
	sYX3oKdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexvO-00000002XvZ-2i6C;
	Wed, 01 Jul 2026 16:36:34 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexvM-00000002Xsq-07w1;
	Wed, 01 Jul 2026 16:36:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782923789;
	bh=5ihOjXMhiw1eMT8WEGagj+g3YULfrVIuO8TU9nVMXX0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=psMf9YanVWUts91Uh5Atc4Og/x+rX4dm56rh41XZWtY2Pb4Oq4R1HNq+n9AZev7vW
	 B4Afftm8Xgv1RncNYdxl16t+BnTIN0Q7m5N0L8IjyGw05CwqH1NGu+AjXDl0M4G8nR
	 rIY/hL2x4pBqfKYuO15cixVF6RPk8Cz/qQaiMJWKuL3ZKQ7a9GO/f/YnQ/cktZ5VVN
	 J6wqeUoY3IWi/USCDT/LI6UV6l/TGJ74A3X4a4fB7KWKkZDQ/YMQiD9q4PhrU2C/Zk
	 nTniD//+vg73rP5SUMKBLOQignekakEUefMPoOZaE7pOSTM6tU4dtflUWByTRVfa10
	 /oO2WZWTFA9yg==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 53BDB17E05DE;
	Wed,  1 Jul 2026 18:36:28 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 01 Jul 2026 18:35:19 +0200
Subject: [PATCH v2 1/4] dt-bindings: serial: mediatek,uart: Add compatible
 for MT8189 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-add-mediatek-genio-520-720-evk-v2-1-19d5da4ef984@collabora.com>
References: <20260701-add-mediatek-genio-520-720-evk-v2-0-19d5da4ef984@collabora.com>
In-Reply-To: <20260701-add-mediatek-genio-520-720-evk-v2-0-19d5da4ef984@collabora.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782923787; l=1009;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=5ihOjXMhiw1eMT8WEGagj+g3YULfrVIuO8TU9nVMXX0=;
 b=3DphN/rwspOIJWv/SxkQxuEL5iIHUc4G5Qq7vODX+m6nZf/lTM4MGBhWMC/l3yKFDltPlKSXc
 VGnzgb7vzzPCc8kXCVbP8ZrmrQdZevhyQieAgMztuUGAGL6qyO543oq
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_093632_225381_9B909A53 
X-CRM114-Status: UNSURE (   9.61  )
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

Add a compatible string for the MT8189 SoC.
The UART IPs in this chip are fully compatible with the one found in
MT6577 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
index 5bd8a8853ae0..3f0f4aea0a4c 100644
--- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
@@ -47,6 +47,7 @@ properties:
               - mediatek,mt8183-uart
               - mediatek,mt8186-uart
               - mediatek,mt8188-uart
+              - mediatek,mt8189-uart
               - mediatek,mt8192-uart
               - mediatek,mt8195-uart
               - mediatek,mt8365-uart

-- 
2.54.0


