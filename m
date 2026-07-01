Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD94EC44506
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 12:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQwXsr33PDWDylUJrRWygqi3FIPjOPpBIXbLRPE3rDI=; b=w95DfDdNQ+FInr2jQPtbpmJvpP
	7IUBfTUU2n6O8hkb1X1yjbqZF7Eag7AYPwrv/P1K9TCMCetJWN/h/obZrYiM0cHxS9LuTQazgC/JE
	veockMjGtPNemZDhxJeGMUOZB6HrpD2VWH2io2BE56HPgm32+RAVkBqazv6EXK8SdLIl2dz1jRK4E
	3ivigK0xKuiQ+9VG4htm5Oi/9DSXnhsH7bCdtlpUg+C/d5gPlZ+15BAYJJYALodt2m28CgAytK7KQ
	7C24dKx6pnVjGulZt53/hydCh3qJU7ev/kEXQ0yJXJPXQt5O4AuP7f7vMsoJ/HrCi2IImqeedQL6b
	GJOwCr6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetv0-00000001q0m-1wKV;
	Wed, 01 Jul 2026 12:19:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetux-00000001ptF-36Ib;
	Wed, 01 Jul 2026 12:19:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=pQwXsr33PDWDylUJrRWygqi3FIPjOPpBIXbLRPE3rDI=; b=lnNOXHUD/5wIpHJ9tfCNIHbBfj
	LP6Y240IenOcgXZcqwn6wlo1wIYkMBcFHQzP2tuisQlRugFWJO7H4fWZhoCQi3danJwiNrZndfUvG
	nSw7dR2abe8iYjSz9byaM6iDGFp/6tTj6jtv0BJLeRC2Xd8DgQxgAPxuH4sJ6i8GLmTcw7fSShFvD
	BqLoO+6jtXfYY74yH2fSsBQNY+ZtJ677bHYNRqCBGH5E4qGKiCst2KJn3THilNkREoX/9ksiQDs4M
	SXMKrEB5stmX5isOsMeClHPktZlBkPSpodLG4bUE7IcJg1t61duQOZxZa2rBBt8Rw7BXb5u1LNsPM
	kHdXWxcA==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wetut-00000002iwv-3Jg8;
	Wed, 01 Jul 2026 12:19:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908386;
	bh=N9qgTD2hCOq6phgEAOhZ0sHaU3HIB5GFM6z3BqTcBcQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ke5dK4aUjJAAyxOCMHrVw+wFCSjKctNVXNUUd3oWnDuL8t2IHkB2g30mKK+SoCWtN
	 CCw/nWwMppgS55qcOd8TO0ooye19JVtUaN4G+60zM2eoi3SRQIWCuBqXXsEUnhlr3m
	 Da6VsdtHiuaHQNEJJf/QY7fJ2NKm/nsmWlKGdwqsDBefrF1NLKe/gCtpfkN/tG2f6F
	 66dRwm0ltM6f4zm9zyGT6yavcHjYi+F41TLzrPqSsuY2MonSLpiDh6lhgaM/OvIP9e
	 1AirmzWy24MVgvRMpJq/LFBHeQuHulUkNGm303r1Ytj77+WIC7JzViCCzE9IdhG/ua
	 5k+vFXg9OKV0g==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B15D817E0CA2;
	Wed,  1 Jul 2026 14:19:45 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunfeng.yun@mediatek.com
Cc: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	justin.yeh@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH 1/2] dt-bindings: phy: mediatek,dsi-phy: Add support for MT8196
Date: Wed,  1 Jul 2026 14:19:42 +0200
Message-ID: <20260701121943.19430-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701121943.19430-1-angelogioacchino.delregno@collabora.com>
References: <20260701121943.19430-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_131947_937856_AFA4D80D 
X-CRM114-Status: UNSURE (   9.07  )
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

Add support for the MediaTek Kompanio Ultra (MT8196) SoC: this
chip features a DSI PHY that is similar to the one found in the
MT8183 SoC, but is a new (incremental) revision with a different
register layout.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
index c6d0bbdbe0e2..9df1dbe1253b 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
@@ -39,6 +39,7 @@ properties:
       - const: mediatek,mt2701-mipi-tx
       - const: mediatek,mt8173-mipi-tx
       - const: mediatek,mt8183-mipi-tx
+      - const: mediatek,mt8196-mipi-tx
 
   reg:
     maxItems: 1
-- 
2.54.0


