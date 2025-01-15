Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50763C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 10:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mWDLtelO8iglPcJwW9OsJzifr99fH6CJM/aWB7cDGS8=; b=WU86SJnvPbdFlnE3kY36jh94lJ
	3b/rKpejXGOZc2NOxPdIOATvjoS5U2PEAHWSLVIavNovRRgqGKy2TaWmAennUu0VrL5XYx94UWN7H
	QhkPvdYmxgg47Slwu6T6oEGJ0xdZqbylxnpvxlMkdlXdthHdOskqH7+puyyHRa185omnRx1ZBwoPy
	gI/J+lnaPu49AvZv9XKpAC/GF5e0k+sr7cRNE+p6qB92ykhHlfIWIdSN5Z+p3KRyzSxkU4n1slSki
	VuiRQ0yi0boqFgIXCke4Ee63Q4iMNLZ/1u7XX7bYgPRooGWmG3QAzMljLLCs65KiLNzXaiOM8+4co
	eGCNDMdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0h3-0000000BVSr-48fm;
	Wed, 15 Jan 2025 10:32:13 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0eb-0000000BUct-0nms;
	Wed, 15 Jan 2025 10:29:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736936979;
	bh=bZB8wY5GPpQ6Ij8HzLPuECw1iQfeE2kH9xQl80QDmWw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Oco2YgeL+qWZvjGiMDbeH+vhFy9m+1/KGipT5dMXfldHcfVtUWRxaclBoyOrflVXG
	 hQOrftU4tM2SzgbN66XaooXMN3K2vj0CyHhIGGFB0PUeHDuqT3bj3wpxpoTRlrnc4h
	 mT8IyCYQTVKKIfT8OF3YBO2xTVAOndw0yGyOLLwHbZVMjrDNTulzpKoCMUxwwC0Zt4
	 I/UM4tTmbd9449MKDvw3m7s7vnut2h5Wcx5oM4RHnecTtSQn3hRm82ORKUF+IswmNK
	 5Oz/1ZdLgceOsgj8Xrz9dvyekPnSDhdPQHMtkffzDPAzjnfZqTMxs+wP46LNsunzlf
	 fnHre0P9Fl1Aw==
Received: from fedora.home (lfbn-tou-1-1147-231.w90-76.abo.wanadoo.fr [90.76.208.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 936FA17E0DD8;
	Wed, 15 Jan 2025 11:29:37 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 15 Jan 2025 11:29:02 +0100
Subject: [PATCH v2 1/4] dt-bindings: arm: mediatek: add mt8370-evk board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-dts_mt8370-genio-510-v2-1-fc9b01d08834@collabora.com>
References: <20250115-dts_mt8370-genio-510-v2-0-fc9b01d08834@collabora.com>
In-Reply-To: <20250115-dts_mt8370-genio-510-v2-0-fc9b01d08834@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 kernel@collabora.com, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736936976; l=1347;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=bZB8wY5GPpQ6Ij8HzLPuECw1iQfeE2kH9xQl80QDmWw=;
 b=k5DqrUoLPzbQjqBNU6/bRAXRTjdcXKgZrSGjgRhO1GbvE8zRVY2LkBtInkEjx2Vn7LZB5LJMO
 f19lst/PGYXChoXB7cjooK45VkwqNElF8/Tr0qo3fpo9F7wCFYvk9ZU
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_022941_376148_F26C075B 
X-CRM114-Status: UNSURE (   8.94  )
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

1. Add compatible for MT8370.
2. Add bindings for the MediaTek mt8370-evk board, also known
as the "Genio 510-EVK".

The MT8370, MT8390 and MT8188 belong to the same SoC family.
It is a less powerful variant of MT8390 SoC and their main
differences are:
 - Arm Cortex-A55 cores number (4 vs 6)
 - Arm Cortex-A78 core speed (2.0 GHz vs 2.2 Ghz)
 - Arm Mali-G57 GPU core number (2 vs 3)

Like MT8390, MT8370 hardware register maps are identical to MT8188.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 3ce34d68c213acae44c27bdee3a9bb0b9dbcd1fd..108ae5e0185d93976556a03768595961961bcc33 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -412,6 +412,11 @@ properties:
           - enum:
               - mediatek,mt8365-evk
           - const: mediatek,mt8365
+      - items:
+          - enum:
+              - mediatek,mt8370-evk
+          - const: mediatek,mt8370
+          - const: mediatek,mt8188
       - items:
           - enum:
               - mediatek,mt8390-evk

-- 
2.48.0


