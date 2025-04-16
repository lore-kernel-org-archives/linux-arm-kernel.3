Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDFC4C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 12:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FzK/c2iLz78uJHZq+QIny/ZP5CNTme1jXzTpKYqIJWM=; b=JleyuLO4jkDDN04yeqFCAOQ9SI
	4SjRFOmnf9PsO+VZOR8oNSvaZXr6m26EaPbVsHSu1IyLGGG7aAzZNqYkpNgU7OLBffwsvo+HvPaB+
	AGX3+ido4dz4KMAxe+Cma99WeWbGGzsE6v/IOWB9Uzu8wgmMopLQmEsZ/3q0n4g/t6BA3SNDqVMvL
	SlLiFz5WE0S49hU6kNvciMOqORSAlNmgx3go4PMPCqzLFymsHu7nbUoWoLuI3YwNT3OpB8dS72nAf
	em07eCM6OmKYRngGGkWwELZylFEolvnd9+O0V49RD/U4k6bmH4rrQI1L0OqKSgZ+oDYpz/f+7GTNj
	pSl5XygA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u51i8-00000009TsF-0kHP;
	Wed, 16 Apr 2025 12:17:48 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u51Tl-00000009QWr-12n6;
	Wed, 16 Apr 2025 12:02:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744804975;
	bh=HtFDLhPzcyHbKcIfsvzrKJi3kvbFoXZ8Cs8iUVo1V/0=;
	h=From:To:Cc:Subject:Date:From;
	b=dL0enLZPStpWCW93CKMPvLqU1feJEdiAJON4Te0Hy0QgPXYCtxpceS6oyXgRxHftT
	 P+l1Pmhlhn+e/8cUuDqU2yxK06+aWO9s7OlpNG3XxTFaes1egqPxf0D2bmQRs5+KCB
	 LxN1XRaY7FW3ZlO5GSPrafZWqLLGl52IrTzYendWXXPl0ESmzGwiSFDh2Kn+TkaMSk
	 8pvnG2AZ+juTZlTEwVT7+qB1El8jr98j2NpFANDRgPO8d2UzAi42YEsu7oB7h2muW5
	 Q0qYAA0eightWbuid5Hb6a7/3qiEgCaaRY3+k2Bsf485nKVwbh7d+YTRr2QWmR5JhA
	 2guQJmAQlQJbg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DF16317E3624;
	Wed, 16 Apr 2025 14:02:54 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: ukleinek@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jitao.shi@mediatek.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH] dt-bindings: pwm: mediatek,pwm-disp: Add compatible for MT6893
Date: Wed, 16 Apr 2025 14:02:53 +0200
Message-ID: <20250416120253.147977-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_050257_478196_0A277DE7 
X-CRM114-Status: UNSURE (   7.84  )
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

Add a compatible string for the Display Controller PWM IP found in
the MediaTek Dimensity 1200 (MT6893) SoC, which is compatible with
the one found in MT8183.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
index 195e4371196b..68ef30414325 100644
--- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
+++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
@@ -27,6 +27,7 @@ properties:
           - const: mediatek,mt8173-disp-pwm
       - items:
           - enum:
+              - mediatek,mt6893-disp-pwm
               - mediatek,mt8186-disp-pwm
               - mediatek,mt8188-disp-pwm
               - mediatek,mt8192-disp-pwm
-- 
2.49.0


