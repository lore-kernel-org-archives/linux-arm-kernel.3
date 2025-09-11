Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE51CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 15:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6y/CVydmn0+oS7tAnTVaj89DG0YUeINUm6l5wRjGIBc=; b=MdoZvuKx3LDfVnZPtLSjVUcGJr
	aEvPGS1llC8lyNUXKMJLjLmW3ikqf+3aULmCNXsOwgOmpga5t4/QQj6qL9dfzW7kh8FRqpfJ+m2ZY
	pdPYPFPU8jECOU1fcprkSidrmTdvKjSv9mCuQKuKmRAkwFblRhJ+YbFe9Gx2hIR9xePBzs5gRfaAX
	2DdvhEOu9MlZG5Lzh9tV5njEVTddHtJAp0TukxT1+wEH7NkZCTPkmIdl02fwkHNGpvVnfMjR9cHoI
	6neAAtl7egcjK1wFlh0IkEvONojBQhBRm7RdFuZbsIFcIy+cA7TSXmvXSq0K30s1K3h5XRQDHuyah
	N1Tgt7lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjg0-000000042Hs-2GGx;
	Thu, 11 Sep 2025 15:57:36 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjfu-0000000429S-3VlI;
	Thu, 11 Sep 2025 15:57:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757606249;
	bh=x4NPsLT+iShc95Vj4vf/AjGTI6j+vxEXbcm4d/xO6xg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q2kWAdzqO0ev8lJLFnk3TmpgMlmaLc1XZXrYIR+qAifUp9XAp/9AEic4omUyS9LYa
	 hwc5HX/0EiM6aWO3itRWwS7NtlHiwU+5lsk5yIRSzrqhsbylnpe11LqgLSyIxOnLW8
	 hgaTU0eWyhStXJwahZ95/x4MeCMl74YfhLPQK4ThGEpFtr8QQSvuklqbAmRwnna5ne
	 LyaG8ILoAAJ3opX9ygKYGhofVcUlpGbPNPyt/vyXe3y14q1KzRDMexL/939ks+iPIy
	 5iIBem/CzNPa/H/Kcv2dU4HQKIclMdbKj8mPyEsLdscRsfmeH2PLa3f0F9q0RYjHLx
	 fjMbvj+p8GUww==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:36e5:357f:56a7:54dd])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9809517E127C;
	Thu, 11 Sep 2025 17:57:28 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: joro@8bytes.org,
	robin.murphy@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	nicolas.dufresne@collabora.com,
	jgg@ziepe.ca,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	linux-media@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v9 4/7] MAINTAINERS: Add entry for Verisilicon IOMMU driver
Date: Thu, 11 Sep 2025 17:57:14 +0200
Message-ID: <20250911155720.180465-5-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250911155720.180465-1-benjamin.gaignard@collabora.com>
References: <20250911155720.180465-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_085731_020028_73A20103 
X-CRM114-Status: UNSURE (   8.74  )
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
index 6dcfbd11efef..023d0e8b370b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26407,6 +26407,14 @@ F:	drivers/media/i2c/vd55g1.c
 F:	drivers/media/i2c/vd56g3.c
 F:	drivers/media/i2c/vgxy61.c
 
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


