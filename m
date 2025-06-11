Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFEFC71133
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 15:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NfRlwNTz8xY9LY8Zb5gGzpmlTyCtsyz65QcAQ74rIU0=; b=xEvvOTe4aX2RGQ3bm5ZSauJ/3W
	WO9O4O9N27cx3ERgmnjobktOSzAl6m/utwSwj3lh7DkN+WpEysOWDXjkut60Fp5Z+tvr0RniSk3iW
	GEgty6U+vqZaCmX6nAj4LQSn3iUFeHSCCejScbfvWogj9NLsrrHoqXneX7gGpoLHx9ApD5tMXn5mX
	epBFVimKh2jdEbPGEgNPxwpGB/ydKDPBZfFPv+Lq2vK38PxB6Ig3duwYO4aOB5XhgRqXbPBFC6NCs
	8zFmA7hUeQMK/0QR5+ZEOZLt3lpPag91GzT777rdbvEOe6mKDZHXpVu12LQUHzsVbSSRK/PjcH/Lz
	6Jf+lFKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNmu-0000000AURp-0ExM;
	Wed, 11 Jun 2025 15:54:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJJM-00000009i6Y-2t08;
	Wed, 11 Jun 2025 11:08:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=NfRlwNTz8xY9LY8Zb5gGzpmlTyCtsyz65QcAQ74rIU0=; b=C2irjUDS/yd3UIUlq8J8QiLySn
	JDYPuZsREkQTt4tlYsMuQDC3H4+kjkIumlE7PhcMVb35/gFR3c6S2JKan3SegEnEF3NHOi+T3IZ+f
	tmbhtGXkdSp5JtE86OcheQ/Z5SRpoix34GngwBPNpdyio5BxsPNbUvvKGfVCI5WbcZ5w+hS6+z3ts
	urA/+docj23Re290WnWZJckV/gQ0Bt3VUrtVKW06O5diphK2VO8NCXJsV/ZBFuSp2gJCuHBMK0tmk
	sZNqPrmEgtzKYDFzVb6Zp2Ikm0o+9rp/7oQfD4FLGrf/qQbm8shz3jO/jHVDfN+ajyU2toKj5+3Lu
	TScmyyMQ==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJJK-00000002K81-2yBY;
	Wed, 11 Jun 2025 11:08:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749640079;
	bh=AZdbARWOeCnWEmDLRenfjc1WfkYQIODwwqhvNjwz+1E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XdjLxKY0sG7cDYnt0erdLwjdWYFThlRyNe8Kw9epJBHnh2JDpFMKGQsRZvEPOohbV
	 F1/wOcCO4xTNDc7QXvaPtexs6N06xcBb1mM09nzKw7i/N2LuBkjf9sdvFPZJZKK2ls
	 O1jHlKDESpQhctlMnkcpz/lwAQXEAokeLtb5mLgDJX/qgnxfr4TYwe2l2xAlHVk18C
	 763RrlGtjPU8NsRr7F/jZJI6bS8ofnmpM4ckuneBdxBMy2CnaMC3zQrb917RSFirGM
	 +11bO/Wp/IFo2n71qED+vHYZiR4qzmvJmmLNWyYxxrinVUdT051Epw8VHtD7FKg8TX
	 afy45P7Z/Qowg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4E27017E0F66;
	Wed, 11 Jun 2025 13:07:58 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	leilk.liu@mediatek.com,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 2/2] spi: spi-mt65xx: Add support for MT6991 Dimensity 9400 SPI IPM
Date: Wed, 11 Jun 2025 13:07:47 +0200
Message-ID: <20250611110747.458090-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611110747.458090-1-angelogioacchino.delregno@collabora.com>
References: <20250611110747.458090-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_120802_954446_48096B54 
X-CRM114-Status: GOOD (  10.77  )
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

Add support for the SPI IPM controller found in the MediaTek
Dimensity 9400 (MT6991) SoC. As a note, this is the same SPI
IPM Controller IP found on the MT8196 Kompanio counterpart.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/spi/spi-mt65xx.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 4b0a1c0db041..a6032d44771b 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -220,6 +220,14 @@ static const struct mtk_spi_compatible mt6893_compat = {
 	.no_need_unprepare = true,
 };
 
+static const struct mtk_spi_compatible mt6991_compat = {
+	.need_pad_sel = true,
+	.must_tx = true,
+	.enhance_timing = true,
+	.dma_ext = true,
+	.ipm_design = true,
+};
+
 /*
  * A piece of default chip info unless the platform
  * supplies it.
@@ -245,6 +253,9 @@ static const struct of_device_id mtk_spi_of_match[] = {
 	{ .compatible = "mediatek,mt6765-spi",
 		.data = (void *)&mt6765_compat,
 	},
+	{ .compatible = "mediatek,mt6991-spi",
+		.data = (void *)&mt6991_compat,
+	},
 	{ .compatible = "mediatek,mt7622-spi",
 		.data = (void *)&mt7622_compat,
 	},
-- 
2.49.0


