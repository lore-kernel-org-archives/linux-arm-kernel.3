Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BEEBCCF9FA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 07:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DRSdQR7HLl7IR75mtgzcnNEBFsG59tEp36QZrxhfCFA=; b=PGpJ3h/9r9noSqjH95c0r18jl3
	1uHfOFpev3M8fWU2fcij2zj67/c5STPMeiwDBjO8hPGkyg0dyL3EgHl9v+hwT4W+wO4ee3IWIR341
	uIs+NC7HLLVl7uv561t1QFZ3Q/A247lISTZ+NNlXMuuXSfJDxM0PoA1xSrEBbJjbDFnmlmPSHEmJo
	Db6Cafa/KpNnC1UVoN5fYDV8w9AzbpbPnbCQT/bHJc76A6lW9IYxeQcpiYvHCwPw4RIFZVL0Txf/D
	VlP7uVMmWXtoYkaV7EpkgUuKYCHe02xfqps227zFPiNzjZGIoDTPpPZvekobB/56ABY+lRGclJqF0
	0qEERPpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vENWc-00000003evP-0g1G;
	Thu, 30 Oct 2025 07:56:50 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vENWa-00000003eum-0Ykh;
	Thu, 30 Oct 2025 07:56:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761811004;
	bh=IiJIHtx4LNQ3qF/KRvZQ+MHK5HTeIwkOeW1dOjSZDFs=;
	h=From:Date:Subject:To:Cc:From;
	b=pBsx3SMjSEC7MviEGO95wmcJHfj/QHCzMV5mPbg2jTiLtL3KTJMqot4SkEM95Nucu
	 nzqrx6dmA10b9IV7XzYc5Z3YuRdvcOdn761vEoxBfEZ76m4XxuuOwd+qs2piGTBj+B
	 MBcMHBUERxTAYltU/EgekrkEY/C1Tvn+daLNFvgSNhZ/nvXX1CRYWPiKamWeE3YXdk
	 fKFAyQGquPfQEzCatN9BlBSWxVblZ6ZvdKrRa9EHkE4gprzEMBfmlj7E/wLCZeEe5t
	 omEWFcI61+gXYPj+S2U1YKFMXmq5ipY2Q+eOVv9SvsYCBNef+NRb9V0FzmYxFWJCTf
	 xFafOHvGCw5kg==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 250C517E0CF8;
	Thu, 30 Oct 2025 08:56:44 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 30 Oct 2025 08:56:29 +0100
Subject: [PATCH] dt-bindings: i2c: i2c-mt65xx: Add compatible for MT8189
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-mt8189-dt-bindings-i2c-v1-1-5b60914c6453@collabora.com>
X-B4-Tracking: v=1; b=H4sIACwaA2kC/yWNQQ7CIBBFr0Jm7SRAbYRexXRBYayzgCqgadL07
 hJZvpf89w8olJkKTOKATF8uvKUG6iLAP11aCTk0Bi31qKS2GKtRxmKouHAKnNaCrD3egjFXGmw
 YXYA2fmV68P4P3+fOmd6f1q9dwuIKod9i5DqJRHvF/jFImM/zB9YNynCZAAAA
X-Change-ID: 20251029-mt8189-dt-bindings-i2c-7d884e39d5ad
To: Qii Wang <qii.wang@mediatek.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761811004; l=1109;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=IiJIHtx4LNQ3qF/KRvZQ+MHK5HTeIwkOeW1dOjSZDFs=;
 b=XbTvX83Kx4NFoKuoYVDYvyO2jrZ+6lSryjDVRAiL9yZSEGCjOm1sh87rkoRpIj55MypbtBG07
 wXWsB68KKBTBx2/9vta16iPk7IiYriiM8xfF5JWu81zhBvdx+jOC9xn
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_005648_345187_AC29670A 
X-CRM114-Status: UNSURE (   8.12  )
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

Add compatible string for MT8189 SoC.
Its multiple I2C controller instances are compatible with the ones
found in the MT8188 SoC.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
index 3562ce0c0f7e4889d34410a9d32e1c8e6ddaae0a..ecd5783f001b3e1c2a29aa6575141093ead4e6a2 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
@@ -54,6 +54,7 @@ properties:
           - enum:
               - mediatek,mt6878-i2c
               - mediatek,mt6991-i2c
+              - mediatek,mt8189-i2c
               - mediatek,mt8196-i2c
           - const: mediatek,mt8188-i2c
       - items:

---
base-commit: d78b0fee454c25d292fb6343253eca06d7634fd9
change-id: 20251029-mt8189-dt-bindings-i2c-7d884e39d5ad

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


