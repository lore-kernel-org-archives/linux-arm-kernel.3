Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AEC7D59D99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 08:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uOI1zTMxKsViP/V0p/hbh/oUTKccTrBplwD4G17FtKY=; b=3RcNvW/7la85NcBtuqoAR/fZQ/
	s57Ppv59iE9RsHgPLN6rRmFul/yRJeSQOuuhOhgtNghDgNQphzO5lDmWKiExv+ImyraHxGztC4M50
	bPrhtRrCOSArp/DHQhmBYVy/Q3Jhil+zjGZ7C6qk7nsxA9WFHT4x+RxNzF9wvm0V87rpTXdNIjNDN
	tItnePcPc23M2aUmkTFo/3+Vb3B1NJ/2DP32L8EnHHlunyc3SF7mqHlkS5b9ZoqRZjEo5tPZbHeiP
	3ix/Q+5ybqeqnzu2tF8kp+fQ2FM4VuQB9QuJtv2/Tb0sADRnZxE9tCARCHKyjsqbk47zv5waPfJKY
	sDcoxK/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV4LE-00000003J3N-1DsN;
	Mon, 15 Dec 2025 08:54:04 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV4L9-00000003IzA-42v3;
	Mon, 15 Dec 2025 08:54:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765788838;
	bh=a4oJ5h8F6+5H21ppQ4zCYLSP4cr9qDHKi8vQVGfWg0M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RaxHWbRSswmNgKV7KS4Ai8npfmR0euDswGOgyCcMWV1WsXQegU7ggZuDmQ5G7Hkw1
	 GY1Wc/zXhsvrp9XnnLahAss6RV7pb+ZBFLtReGyK5JzTyb7Z7KpCDaf46eQkviT0d0
	 FfwBKfUB4RmZw2sIqaXmQcgqJ/gWvrESrqVRq0y3Wf1pj++lNUVzXNb6qBCvv3dRxB
	 3yrZZgJSninYhy6apDMT1/Zsp4kjHMC7yhRpoiYxTdCO4fF2b3REzmWR9GYpvsV0Zh
	 SmhH7Va7Pz7QDD3Ctfl6lE1MiucHsKy8dMdalLpdfCeGtYOO3WjH562DnZ8dBPWEdZ
	 wAMDuB/tVl8mA==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:c17e:135b:5095:83a8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7E66F17E1423;
	Mon, 15 Dec 2025 09:53:57 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-media@vger.kernel.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v10 4/7] MAINTAINERS: Add entry for Verisilicon IOMMU driver
Date: Mon, 15 Dec 2025 09:53:41 +0100
Message-ID: <20251215085349.10155-5-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251215085349.10155-1-benjamin.gaignard@collabora.com>
References: <20251215085349.10155-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_005400_156051_D11AA721 
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

Add maintainer for Verisilicon iommu driver.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c9e416ba74c6..ca67e5333134 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27296,6 +27296,14 @@ F:	drivers/media/v4l2-core/v4l2-isp.c
 F:	include/media/v4l2-isp.h
 F:	include/uapi/linux/media/v4l2-isp.h
 
+VERISILICON IOMMU DRIVER
+M:	Benjamin Gaignard <benjamin.gaignard@collabora.com>
+L:	iommu@lists.linux.dev
+S:	Maintained
+F:	Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml
+F:	drivers/iommu/vsi-iommu.c
+F:	include/linux/vsi-iommu.h
+
 VF610 NAND DRIVER
 M:	Stefan Agner <stefan@agner.ch>
 L:	linux-mtd@lists.infradead.org
-- 
2.43.0


