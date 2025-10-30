Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED5CCCF9FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 07:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H1e2BZL1LoCABOb0FqDiAKQLBLYoFJ1xyYOFBRbrS98=; b=R78yQBgwDYEjB+WfrsdTrPGUqq
	L8Z3vPDSTg7aOCOGQvrcc1AewOPHCwU2/FD4bbHBLgqKIsjjGkMeU5iOpuYyopa9g1zP2+PA6Blga
	5a8G8jKHdr8Hks4S2fnv8ZzKo9ptUk2FwYXFhF8sAdG3+C47sJBAvFmZ4gMG/HovZqca+CfSraaVQ
	JiKIhH+P84uh13IKyJNIYyRwrfWBxnCcNsIz/nVjBxfOYu6PpPy/bZoa4T/oOtlQYsPiUhoCmxhuh
	pLeh9awZXnMrvfPnIELKhTa8WvtYapQpJEM/+tevxy62i2AvihHgjl6Kr0zdjCDuSHiHJrVVU0qNP
	pXmVX6fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vENGs-00000003dmD-392L;
	Thu, 30 Oct 2025 07:40:34 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vENGq-00000003dlp-31j8;
	Thu, 30 Oct 2025 07:40:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761810029;
	bh=zCqPLDYFSTIRnT5sZnTePsSmoKp8F3Uxev9dTCYAwN4=;
	h=From:Date:Subject:To:Cc:From;
	b=QiXqai0YhuS1zsntczP51FL2lAyKU+mSzKqZfJCF24pmV9eyjNKPbdY6dSXXi5sCX
	 xxypI0eRqI5EsYdtJOW3UyEQG2oUVthHTGTar2H+01fSta0vTcFfE8Mfbb2EjtMWd3
	 0Arc948XTbMu1DK6DwMoM+AJwMVAglltEbs0FSSyfls+MGi3DZWjI0zKolSp5SXBuh
	 jaDV8jpIa6GCxzqlPKOU02S9wIXndsmpRDrHtxzSfzvBPPXEVkIDMxUokvE9V4b2/x
	 LQkzyrqdbhiafbas/Vkp9CwIH33ZEHdgpGTY9kACO8GbjiGKYJXiG6SxxA4YZ+StUK
	 f20h+BrRiuZHA==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9AAEE17E009B;
	Thu, 30 Oct 2025 08:40:28 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 30 Oct 2025 08:40:07 +0100
Subject: [PATCH] dt-bindings: watchdog: mediatek,mtk-wdt: Add compatible
 for MT8189 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-mt8189-dt-bindings-wdt-v1-1-975971ba29e5@collabora.com>
X-B4-Tracking: v=1; b=H4sIAFYWA2kC/yXNwQqDMBAE0F8Je+5CEqmov1I8RLPaPSS22dgK4
 r83NMc3MDMnCCUmgUGdkOjDwlssMDcF89PFlZB9MVht70bbHkPuTNejzzhx9BxXwW+Bb72zi26
 cbTWU8ivRwsd/+DFWJ3rvZT/XECYnhPMWAudBRToy1o9Gw3hdPwdI4MGZAAAA
X-Change-ID: 20251029-mt8189-dt-bindings-wdt-d6da2f03a260
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761810028; l=1181;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=zCqPLDYFSTIRnT5sZnTePsSmoKp8F3Uxev9dTCYAwN4=;
 b=Z/NT/ku5a3v7+z6gX10fuY1Tr/RmBBg9g8JoOhmLn+z6ju0nEQ29d788LkwfFkB5A/uNgX3BD
 dya/nH7WNjHBzv4EOmQKpgqhWkG3puV6wox3ImpYnwwuBiJ0kgLucAJ
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_004032_922423_3F0E0A44 
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

Add compatible string for the watchdog block on MT8189 SoC, which is
compatible with the one used on MT6589.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index ba0bfd73ab62a86befead007d4b7d2a870b81a0c..caa1140fdf44f79f229644b54f759a93145f26d8 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -41,6 +41,7 @@ properties:
               - mediatek,mt7623-wdt
               - mediatek,mt7629-wdt
               - mediatek,mt8173-wdt
+              - mediatek,mt8189-wdt
               - mediatek,mt8365-wdt
               - mediatek,mt8516-wdt
           - const: mediatek,mt6589-wdt

---
base-commit: d78b0fee454c25d292fb6343253eca06d7634fd9
change-id: 20251029-mt8189-dt-bindings-wdt-d6da2f03a260

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


