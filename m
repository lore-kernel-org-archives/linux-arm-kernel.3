Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B309CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 14:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=21icvDkt2X9lcXLIGMKTfpYxoFG2Oa0hCtiRlEJ3Bg0=; b=JBtwXI9QiPghnPb7TY/ESpsVAk
	QiSnh9IvLk9GIYbNsxhIIdCmwcGhA0rFpKKx4SIrIz+UKRJ/yeXPzxcsmgkaFFx1lJJ7nH55iuFbP
	jO+6LPN6Cs0iDRPcNLt7xeL6hUG5SqwEaqSRaThdRlCzmMI3L4TljJ647QlFYmdYn4VNUDbcuw2B7
	AUpcGpdMUVNIjH14P6ysw2HmrnN691bSJX4/ymVgI9qHnT5XdhLCQUE/EMb+tSvgv5TMqygyOTRA0
	+HFx4x2OML3CP9aVuBOr11MMY+JcEEtnijb54b1/1wC/GVJWFBTr2t2Hwro3J9HFdqO4qMlLY+2pV
	AWaqqyGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7YD-00000001fk1-39zt;
	Wed, 29 Oct 2025 14:53:25 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7Xx-00000001fZp-0gmc;
	Wed, 29 Oct 2025 14:53:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761749585;
	bh=N6uMqjuiISTOWC7xpwd26uYXqqmjP9OurvhshEZsv3s=;
	h=From:Date:Subject:To:Cc:From;
	b=MTnCWUVIZZoLoLMUjShhq8WfeteVxk53b8MtdCO/RuaHHHwwbPVsprs3iphiRon9f
	 i3wnUDQDufMa7SIFA9FnJbbf2pfX8mAROh0/n6jGryZYgPpAoc6Qcb4Uqw924UrMbt
	 csfoHWmzQPBgHv+oOijFX5uceXKiZxowHYHGA2+cNlgITkSlWeDOUH6pqWPdXHaf82
	 Yv86sXEv++OHoGIK9G2CEr+sbEN3P3Jjzlbc7GHBdYjnjwuH2ktRVbFTVBrTxVcqgA
	 9zTQ4wKO3qMTtqVyreZOHoDPTHNvTTIuUETLdBfx9JHsdhVfwjLJIXqjDeV4iv8fHv
	 kfnRBfbS6VUZw==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 325C517E12D5;
	Wed, 29 Oct 2025 15:53:05 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 29 Oct 2025 15:52:53 +0100
Subject: [PATCH] dt-bindings: iio: adc: Add compatible for MT8189 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-mt8189-dt-bindings-auxadc-v1-1-cd0496527a70@collabora.com>
X-B4-Tracking: v=1; b=H4sIAEQqAmkC/zWNQQ7CIBBFr0Jm7SSAGqFXMV1QGOssoArUkDS9u
 8TG5fvJf2+DQpmpwCA2yPThwkvqoE4C/NOlmZBDZ9BSX5XUFmM1ylgMFSdOgdNc0K3NBY/GumB
 Jups5X6D/X5ke3H7u+3hwpvfaE/UYYXKF0C8xch1Eolbxn4Fx37+5ZLO9nAAAAA==
X-Change-ID: 20251029-mt8189-dt-bindings-auxadc-89ad9e0a7834
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: kernel@collabora.com, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761749585; l=1241;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=N6uMqjuiISTOWC7xpwd26uYXqqmjP9OurvhshEZsv3s=;
 b=Oicll2/zjt262uSpgPWCOKPgyQiMpk6vchlAy9c5/PYkfYrtCokj1Yu4U0np4tZKQMgwvgHA/
 debgLh2k2e1BoaX6NH9qSgaQZk5VbTgAzovLXnicuABrQR9Dv0xjjYu
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_075309_366739_DCF496FA 
X-CRM114-Status: UNSURE (   8.70  )
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
The AUXADC IP in this chip is fully compatible with the one found in
MT8173 SoC.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
index 14363389f30aef85c596251fca0fe800200e2b41..d9e825e5054fe51c4010fc8a97af05c7639d4753 100644
--- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
@@ -42,6 +42,7 @@ properties:
               - mediatek,mt8183-auxadc
               - mediatek,mt8186-auxadc
               - mediatek,mt8188-auxadc
+              - mediatek,mt8189-auxadc
               - mediatek,mt8195-auxadc
               - mediatek,mt8516-auxadc
           - const: mediatek,mt8173-auxadc

---
base-commit: c9a389ffad27e7847c69f4d2b67ba56b77190209
change-id: 20251029-mt8189-dt-bindings-auxadc-89ad9e0a7834

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


