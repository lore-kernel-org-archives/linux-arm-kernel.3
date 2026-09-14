Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C51C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 14:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tYq7J+liZPfE6vz/gYfQT62bcUz+PZLbDbl9s0i8mss=; b=rw2VanWyh4IjdVXMdv61K+EsHf
	47Am10Cf3GPb4pZSmtZpQNH5AB6LvxfL+H4tSc7kKBenLfg6JzC2/ZqL8z+mI8qahabI3KIYCAsSI
	x0+sN1nzGBjGlyZIsKx7jE9g4pjUsP6dKidp/qTkGqITH1bLaN47wkJFEsHI8FQzCePGYxcibalqQ
	mRXgmIVgakP3eQkayX+wjmdzPjr5pMuHeB3cU5WvMAuBekayJcOTe42z1H+Vb9OZ+xwsvuQdn4NUa
	vPbUg2VhsL6bwdBb74JugTFqYm0S1HtSrSrFViiiIsEEoQx7S5mHqXfw138gjyOsVlmaVOJMWKx8F
	+d76tugg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67Ya-00000003y2A-3q48;
	Mon, 14 Sep 2026 14:21:16 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67YY-00000003y1Z-2O7N;
	Mon, 14 Sep 2026 14:21:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789395672;
	bh=RUjuEURudxuA62FC/3YKgFX+Jca+QNqEHhjwHbSSvWI=;
	h=From:To:Cc:Subject:Date:From;
	b=OKzWNuKv9eEo3SSOjHFmQr9Bdku02etUWBv5Bzlg0UYBJQsSanvY2FACiBdq1/ErQ
	 xs4tgeVjObiq3UV/hni6D8ZRtdQ4WEb1BcPUeNesTRH7VTAwxWP2LmjonUl1SLwZpe
	 thZ98FgfrFYOAAecbBjCorcITBFhoCICwQz8C1qyqmVqqxQLrzA7tdJncgkeQjDOmB
	 j0VtmUuYK6L/3ro+pDVVgJXb74HxoDa+IBaf0Xm64VtRAIYxkeNDOiWILh8bZpychz
	 Eqh3CS8OzMrDXjWOwK6W11KwVO9UJeBEX8v4zuGbC+pP1kx6qJ9W32fvLjHqR8aub+
	 oWNa1LlSk9lzA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 43F4817E0075;
	Mon, 14 Sep 2026 16:21:12 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: bmasney@redhat.com
Cc: sboyd@kernel.org,
	jbrunet+clk@baylibre.com,
	linux-clk@vger.kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] MAINTAINERS: Add Angelo as MediaTek Clock Drivers submaintainer
Date: Mon, 14 Sep 2026 16:20:39 +0200
Message-ID: <20260914142039.31654-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_072114_752757_C2D933BD 
X-CRM114-Status: UNSURE (   7.88  )
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

As asked multiple times by both Stephen Boyd and Brian Masney,
add an entry for MediaTek Clock Drivers with myself as the
submaintainer.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7dd93f200d51..881ada7b2af9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16722,6 +16722,17 @@ M:	Sean Wang <sean.wang@mediatek.com>
 S:	Maintained
 F:	drivers/media/rc/mtk-cir.c
 
+MEDIATEK CLOCK DRIVERS
+M:	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+L:	linux-clk@vger.kernel.org
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git
+F:	Documentation/devicetree/bindings/clock/mediatek,*
+F:	drivers/clk/mediatek/
+F:	include/dt-bindings/clock/mediatek,*.h
+F:	include/dt-bindings/clock/mt*-clk.h
+
 MEDIATEK DMA DRIVER
 M:	Sean Wang <sean.wang@mediatek.com>
 L:	dmaengine@vger.kernel.org
-- 
2.55.0


