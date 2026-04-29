Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9E8CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 09:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D3MGuyIZt2o2QorUkjqgSR6suEILxpKE4Yp7EfdhyHg=; b=d57YFudyoYVcFWcBTX1a4hYaMp
	45UTxRjzLcAmcOCAIITlfi9332yOUlNgJ7BP8IOUUrGG7uLloL8go38Z7M1cGYl1NJdikIl5Ksi6t
	NdfgQruzSdiAmTuoPnu1SveVgIpqv6KhJwucOdMy0p65P1M+ZDemb3ABqSvq3yK9OLGcUasTwBblb
	6wO8aTOP+rz17tOm6rnb7E7Z94lhQCsLUJszClWc1Fs9jGFzPnOP8XQyu44dwRrhvh1X9dgO461Ke
	AgML8feKEI+vMjcion+ZAEVr/yluJyxqo0hPNHXMMARb+k3jOIVsLlMf4+CBPtYYZVZQNIoF1g1j5
	CezfX5Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1Tz-00000003My8-28U4;
	Wed, 29 Apr 2026 09:45:27 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1Tl-00000003Mlg-1EtV;
	Wed, 29 Apr 2026 09:45:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777455911;
	bh=TSR8+FrWKPGQLmMRKvH66z/2gbF9VH8G/RaYA1rHxoI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DiicNPQtHG9DBBbkq2z1eJR5y0kr2p/OOFm8UFTlzMu3KLSJiQGEzbqShNZH2g3zw
	 MGCSl3Rne36XWF38bXFDUiZ2aLev2VmXXNQL2QRCaNfxh8JCjvrinA+CituHMU+mac
	 nrVn1T9PHmzTnZUYp9j41YYjWw+1iPvgDHshD0sHGA9PrhwuH6QU/8pHO8uju+lPX6
	 XsLMPunquWJXPc7WTZZch+YuwlfaLspSpN7MKFsfkXuTEvXr7hXEo+RR7kCE2AX2sa
	 mC9/q7zrDwMLytfnHFWWmhyHvGFQ/8nCa7P8mDX6IsfUriSAw80QGedou88/yNcDpb
	 BjQ0NsHwQD9tQ==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 04F1A17E12E5;
	Wed, 29 Apr 2026 11:45:09 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 29 Apr 2026 11:44:17 +0200
Subject: [PATCH 4/9] dt-bindings: iio: adc: mt6359: Add MT6365 PMIC AuxADC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-mediatek-genio-mt6365-cleanup-v1-4-6f43838be92f@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777455902; l=1321;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=TSR8+FrWKPGQLmMRKvH66z/2gbF9VH8G/RaYA1rHxoI=;
 b=9uy0SJ4P2FfSH2gveM/Zktxjbd+42yJvnuj7AGX6tn242abshLgb0m880+IMVpt8fP1axmbQv
 dFNUjPbeaEGD7nUmx5SApTaqTSH/EDPkuxehP+vmV5lmbYsrtL/CssE
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_024513_493500_34030A51 
X-CRM114-Status: GOOD (  10.35  )
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

Add compatible string for the AuxADC block found on the MT6365 PMIC,
that is compatible with the one found in MT6359.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 .../bindings/iio/adc/mediatek,mt6359-auxadc.yaml        | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
index 5d4ab701f51a..9936aa605c7b 100644
--- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
@@ -18,12 +18,17 @@ description:
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt6357-auxadc
-      - mediatek,mt6358-auxadc
-      - mediatek,mt6359-auxadc
-      - mediatek,mt6363-auxadc
-      - mediatek,mt6373-auxadc
+    oneOf:
+      - enum:
+          - mediatek,mt6357-auxadc
+          - mediatek,mt6358-auxadc
+          - mediatek,mt6359-auxadc
+          - mediatek,mt6363-auxadc
+          - mediatek,mt6373-auxadc
+      - items:
+          - enum:
+              - mediatek,mt6365-auxadc
+          - const: mediatek,mt6359-auxadc
 
   "#io-channel-cells":
     const: 1

-- 
2.54.0


