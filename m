Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA8AFF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 09:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HtqTk2a/QxzJW1z1N3fiM7yleFu3pVjArf28ybYi7Bs=; b=VQ9BVTJQt76FgQrauAYI3a544O
	xOrm0HdnwgT2AseTF2xANH2k+ApwhoyMG4+etA7EsVFwSq/yBwzAaYP6vbVLfwOyKLTjTjSkyWLXz
	SScVa1XgDcln4SdcgBCV0PjpEQ27R9+FBgJnErClC5XF/GdE2bvWVModigW1xKr3BBxslzNsgiC2M
	qwzKVtYMkx/WE/ulnGZcOoUqXKOHitXgniIIEY/DzgSYL8jcibk2TYsXt5KwItpd3PTzLXeCWzTrg
	BbmDk7w7lUkgvavAqjFx1V6TzTdHI+65+m6C243c5YGWbbfhmvvQpjR4+GGcAXNZ7SsbCUJWnjQ/K
	0cczfjMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1Tq-00000003MrD-3S6o;
	Wed, 29 Apr 2026 09:45:18 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1Tj-00000003MjE-0Zq4;
	Wed, 29 Apr 2026 09:45:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777455908;
	bh=7OjqtC5nux3H7Fom9W3SHcIbBLK9+ElLhz5UxcD6yRc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QO5CM+6k04Xc8Hh2wXASoRvgLKfjb21/fj92l0kkr9htMzpnjKE0JRhmRvJSUvM3l
	 n3iHLvRcf9UUbOK+0Hh3dmZ/atpw/LOXDPflxYi7XrTGl4heJHhLY+z8yF10yPBJuV
	 BVC6CfpmsVN7TBDDQzkjIsWgZSOP5KOrFa+IK5HqLUxN7tUJM5qquis7pFQR/oiHL2
	 qQ+1fc6/LucoaI/qeC/Hew5+ADn1DZdoJT864va5nE8PT7Y88K0vjhDCydChHFot2U
	 5P5LRjDSmfY7BIfV+JRyHfi/xaCys7QpRIj0sZTuvlo8WFFy4j0XEtrPPKTxfZUWk/
	 mVJ0dmIWAanPQ==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 78D7217E0610;
	Wed, 29 Apr 2026 11:45:06 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 29 Apr 2026 11:44:15 +0200
Subject: [PATCH 2/9] dt-bindings: mfd: mediatek: mt6397: Add MT6365 PMIC
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-mediatek-genio-mt6365-cleanup-v1-2-6f43838be92f@collabora.com>
References: <20260429-mediatek-genio-mt6365-cleanup-v1-0-6f43838be92f@collabora.com>
In-Reply-To: <20260429-mediatek-genio-mt6365-cleanup-v1-0-6f43838be92f@collabora.com>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Chen Zhong <chen.zhong@mediatek.com>, Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: kernel@collabora.com, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-input@vger.kernel.org, linux-iio@vger.kernel.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777455902; l=1831;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=7OjqtC5nux3H7Fom9W3SHcIbBLK9+ElLhz5UxcD6yRc=;
 b=QHE3sDIoeLErxc6ns18g57+AuXPkUD82A7HUQsFDM3G8GezjcRt/4/tsatgB5ul2G04y0PsMa
 6Zs7Qqak6oMCTxd6gY+8x8gvI6ji63FqiawT2RmMSSbtd0LqB64DTKA
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_024511_367898_7CDB0A66 
X-CRM114-Status: UNSURE (   9.10  )
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

MT6365 PMIC is compatible with MT6359, so add the compatible strings
for the main and sub devices (regulator, rtc, audio codec).

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index dc2b38cf285d..122aba7a54f8 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -44,6 +44,10 @@ properties:
           - enum:
               - mediatek,mt6366
           - const: mediatek,mt6358
+      - items:
+          - enum:
+              - mediatek,mt6365
+          - const: mediatek,mt6359
 
   interrupts:
     maxItems: 1
@@ -71,6 +75,7 @@ properties:
           - items:
               - enum:
                   - mediatek,mt6359-rtc
+                  - mediatek,mt6365-rtc
                   - mediatek,mt6366-rtc
               - const: mediatek,mt6358-rtc
 
@@ -99,6 +104,10 @@ properties:
               - enum:
                   - mediatek,mt6366-regulator
               - const: mediatek,mt6358-regulator
+          - items:
+              - enum:
+                  - mediatek,mt6365-regulator
+              - const: mediatek,mt6359-regulator
 
     required:
       - compatible
@@ -125,6 +134,10 @@ properties:
               - enum:
                   - mediatek,mt6366-sound
               - const: mediatek,mt6358-sound
+          - items:
+              - enum:
+                  - mediatek,mt6365-codec
+              - const: mediatek,mt6359-codec
 
     required:
       - compatible

-- 
2.54.0


