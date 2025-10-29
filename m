Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974A3CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 13:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=alE7Jcp33ORyG4JtPm4lgloC5EQQonXVQAA+XgGnnNc=; b=lCYUzwfc2knIln/N/i/bSHtP0y
	AWqXQ8GEgk+uIdufUkBvaOEjontj1CtictQdezIa9KXd+XsbcAsKaBhQ8SoWmgCJ/r3Z5KZEAqoMU
	SVtRFupC/buNbAtrgH+J59Sp8pt0SmTebF0+QEkfJEWGf7++YOVLFv1BzCVbsMiOO3N+EAEfdlFYt
	sRxnvXdmUEfBIioZMN8Z54fp0gz0aiQgcMUSB3IQvJJljUm6JWjX5nymPgJn11FgpmEnSNAei+7S/
	WvOgXX6DPGtJfnOvWT1t0rPaiVqZkPAXiBmdaWOacjO0IsLQYbp6/GBRK4XbBepSP/n7ic9wDSaOA
	wYJBAP4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE6Gx-00000001NEM-05RT;
	Wed, 29 Oct 2025 13:31:31 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE6Gu-00000001NCh-2VYA;
	Wed, 29 Oct 2025 13:31:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761744684;
	bh=SYraV+filwisiwS9WZRMVmfNWmZFChTE2AThFnhY42s=;
	h=From:Date:Subject:To:Cc:From;
	b=O/2LALGzfg7bxSRYGrCSZcCKSfhDdWiHlzQcoMNRFwqXz2fTTP8Z+4fI9mErQAqat
	 wSHWQ4Rp8/9xwh6X9jODcZjSRa1S8H/W5f1rHkT13i4IjKx390DkuhEYHLyBCuDsxH
	 w8bb8tdFob3TxcgLK7UIYZbyHMSxjmijTBNZDc7Y2R1WpGfnL2klhu/GLUm1nLBPx6
	 cntcbzD8wCH9oqsF3WfuUCy7jzJ4/76FarnSJFe1owfgHiiZPrQ7BMqByKHsK096/7
	 O/9BO72dGF4GTpx8vkOonl9L0Nx1Gb2CWdb8yCiym7GGUjtsvzDMpPUFZkBKDDvF29
	 GNJG8MetriMwQ==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4ADEB17E1396;
	Wed, 29 Oct 2025 14:31:24 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 29 Oct 2025 14:31:16 +0100
Subject: [PATCH] dt-bindings: spmi: spmi-mtk-pmif: Add compatible for
 MT8189 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-mt8189-dt-bindings-spmi-v1-1-fbea12a4ed5e@collabora.com>
X-B4-Tracking: v=1; b=H4sIACMXAmkC/zWNQQrDIBBFryKz7oAKgslVShZGp+ksNKljSyDk7
 pWGLt+H/94BQpVJYFQHVPqw8Fo6mJuC+AxlIeTUGay2zmg7YG7e+AFTw5lL4rIIypYZY3TO+qS
 TiQH6e6v04P1nvk8XV3q9e6BdI8xBCOOaM7dRFdob/iMwnecX0TQr8JoAAAA=
X-Change-ID: 20251029-mt8189-dt-bindings-spmi-cc5528d0d1ca
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761744684; l=1085;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=SYraV+filwisiwS9WZRMVmfNWmZFChTE2AThFnhY42s=;
 b=8WnqoSnrc9pTeBpRP9VFPa2YNPpVTj3ItU6mF7Ddtv+37XFri9zChwAGjmvq8J9vg4J7MVY8D
 rF8S6+WTYw1CH47b43P5Pq6t57bGbRXP/elzLDnv3V7FX4RCQEETblD
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_063128_785711_7F2B16D0 
X-CRM114-Status: UNSURE (   9.44  )
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

Add compatible string for the SPMI block on MT8189 SoC, which is
compatible with the one used on MT8195.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml b/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
index 7f0be0ac644aa31d6c2a6be5981347473579ff70..dc61d88008a9c4dba217a8246d82bb4db88f33fd 100644
--- a/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
+++ b/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
@@ -26,6 +26,7 @@ properties:
           - enum:
               - mediatek,mt8186-spmi
               - mediatek,mt8188-spmi
+              - mediatek,mt8189-spmi
           - const: mediatek,mt8195-spmi
 
   reg:

---
base-commit: c9a389ffad27e7847c69f4d2b67ba56b77190209
change-id: 20251029-mt8189-dt-bindings-spmi-cc5528d0d1ca

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


