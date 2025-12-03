Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BF6D12D63
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 13:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hd6HO5fmwzJsPwJEtAULIsf3Ha7cA9r5K9vZ3ZuhLOg=; b=DF+7IgO3TGH9UfM71EfH1yTwvi
	FH/w60qjov37//0zefLxkAwxYXLYUDWiCFUgj/2+J3k/9voBfltYvON/+VDsq+HN4YIRcAMIZHCST
	ibyFM1Gp2/XC6xhNPfd2CxvKY36XZBV3/HodjPa6W/zRt/pBxr84gRoaAfWwAUO69iYyoYnrVAW5N
	F5et1iA5HIghx3PXKxswZtVfmQBK3vEagMe76+GqOXnl02xD3CVysZotEaAshUQXRU6IZWQxrmppt
	MnrJN8HtUxVmpIsidm5VDEVW35SUWdzE5nRCQFdU1oZhPMFSV80gvDbm8eAlUvz5aW20yQ39NvhF1
	xWa+T1XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQnOS-00000006c44-3HGi;
	Wed, 03 Dec 2025 13:59:44 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQnOP-00000006c13-3g3l;
	Wed, 03 Dec 2025 13:59:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764770379;
	bh=7hzRBQrL67XVTnHZ8d374O2SexVHFXVB/Bjw6Nbx9nw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KhLOpnStngnUxUrufyqXHUMHMh6UrCr3kHIHt9jbHNYwonnEuynOCxIki8b4LEEmX
	 RqWUG2T7rL7a/eeo7judgC9UzNAmyT8B50rzDuvscNlTmo+6SDjy+pq24s1gzwkb1P
	 jkYD4ewqffpkZoa8WX9LuPN45X5mEApvo7CoELT7Y6DITaLd4jsXxm2A3xEQFfledI
	 IlciKhjUWLTMzaMZLEzN6fKa59gjMegnpUEeKYm5+1mg1ovSjgo3cCtSvMyGBv3QQm
	 jF3407HK+3bbj8eWgjFYueWJFYBJ8JnnXdTYrqGPf3xatRhaiVFUXfH/JgGyljuQE8
	 CytLkhBbrxX7w==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8ED6117E0F03;
	Wed,  3 Dec 2025 14:59:38 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 03 Dec 2025 14:59:27 +0100
Subject: [PATCH 2/4] dt-bindings: arm: mediatek: add compatibles for
 Mediatek Genio 520/720-EVK boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-add-mediatek-genio-520-720-evk-v1-2-df794b2a30ae@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764770376; l=1484;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=7hzRBQrL67XVTnHZ8d374O2SexVHFXVB/Bjw6Nbx9nw=;
 b=Ls128W34lagmawLiu3VvhhIoqo2YDImPp7hy4hg1vqBrmNCg/1wbpxuamUV8qJKShVKi5k+eO
 VRzxSWU8J9jDCfZORxpB+Clxft1mE1/I7I3SCDwiAM8AtL9TUsxKVKX
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_055942_071951_9F8BCB57 
X-CRM114-Status: UNSURE (   8.96  )
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

Add compatible strings for the Mediatek Genio 520-EVK (based on
MT8371 SoC) and Mediatek Genio 720-EVK (based on MT8391 SoC) boards.
MT8391 and MT8371 SoC are less powerful variants of MT8189 SoC,
with identical hardware register maps.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 718d732174b9e3974b1a1bf827f48a347dae741f..9adb3c461796e2b176561db755d7d5131c8951d7 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -442,12 +442,22 @@ properties:
               - mediatek,mt8370-evk
           - const: mediatek,mt8370
           - const: mediatek,mt8188
+      - items:
+          - enum:
+              - mediatek,mt8371-evk
+          - const: mediatek,mt8371
+          - const: mediatek,mt8189
       - items:
           - enum:
               - grinn,genio-700-sbc
               - mediatek,mt8390-evk
           - const: mediatek,mt8390
           - const: mediatek,mt8188
+      - items:
+          - enum:
+              - mediatek,mt8391-evk
+          - const: mediatek,mt8391
+          - const: mediatek,mt8189
       - items:
           - enum:
               - kontron,3-5-sbc-i1200

-- 
2.52.0


