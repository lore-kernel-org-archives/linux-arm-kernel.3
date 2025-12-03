Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F49D12D56
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 13:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y8kgZeAdTqPLLlaDoY7uENhXujHhJ3GmEgcH72lcGn8=; b=yeEaWjv0KWw0g03Gs2E2liFF7d
	yvILwWrMDWnO20NgOBwqZxc6g1YjGW60Tp4i81uvClKMW7ErO3pNqxeRU2Tj41EI0SePTkdd0usMo
	W9nYp3xTvfpCN5ASMSB+4vIFqvHBvzw9hcL2w37+7Lr5bGPLyFXKQ2OG+UzofdbXJOAJNOCf0Tr7W
	rndLONenN0J7ZtYnI1uAXNjIj5a7VneIjHHt3HpGySZUEyksuHLWA9KZzaV3K41aC1Ksn4Z/f8BXh
	hGsPmUnvwH+FFfA4gVWXTzfkmXN3FDmpKS4VyWZIr7jE3vbGtnVtAozgp/aKAwTVHr56i5XralF2O
	nCZMllCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQnOQ-00000006c2C-2E5f;
	Wed, 03 Dec 2025 13:59:42 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQnOO-00000006c11-2WM6;
	Wed, 03 Dec 2025 13:59:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764770378;
	bh=Coa8HH2Y80U+8oDJEeTZktMM2J7wD1YAwBHcYUfHBB8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KpmnDXL7Oy0frt5g96fb4XsIU0VNv2JEJk+Mz9zETt3l5ZdyuXGAQFZ8njVdXA8Vs
	 ABRLoMLd4bjzqrukfipOqP96qmy/PIzYJvTt9nBMxJyURTmYtRUV0HSPVgXpVs4zmE
	 9Mcv61a+Yh0guVw/G8snxj7itv190JRVji/59Ml09pBvbxJfk/Kkz9zBeWgoKsYkzf
	 wlv8fcxvilSF6XLVjwaSdW08H0gCYw55iLF6bsPPqNFRuiDyNHcTOECZtoGwYTrQ74
	 NvJ6h+Ry/ivq1GvDCgcnOeK7YwTxBoeDauWNvkr88vn6KOnzNzIpFFIQOPHrf0qxGF
	 5uwKwgFt5Iizg==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CB0E917E0330;
	Wed,  3 Dec 2025 14:59:37 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 03 Dec 2025 14:59:26 +0100
Subject: [PATCH 1/4] dt-bindings: serial: mediatek,uart: Add compatible for
 MT8189 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-add-mediatek-genio-520-720-evk-v1-1-df794b2a30ae@collabora.com>
References: <20251203-add-mediatek-genio-520-720-evk-v1-0-df794b2a30ae@collabora.com>
In-Reply-To: <20251203-add-mediatek-genio-520-720-evk-v1-0-df794b2a30ae@collabora.com>
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
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764770376; l=995;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=Coa8HH2Y80U+8oDJEeTZktMM2J7wD1YAwBHcYUfHBB8=;
 b=Y5mQykRO/xlACP/ELaAg9N2ySD3XHV5tyS3bTSZsebFcO5XddKxaH5zW6fA+n5tekkPqfDTaq
 a3LpGtHPgTVAoTnSGq89TU0B58HRMoJmSfz5AhwHH01EiOHcsClyTCi
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_055940_792753_BDA5DD47 
X-CRM114-Status: UNSURE (   9.33  )
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

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
index 5bd8a8853ae0d4ae309d28350fd54b6f9b4e731e..3f0f4aea0a4c0ef11055ddd08ba71d045e7fa519 100644
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
2.52.0


