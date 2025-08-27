Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 684C6CA0FF7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 11:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X7sNMdN8Y2eavsaIZyYU8/ldURS06rJH2hNTsjfxAKY=; b=cBywcRVqbchCY107DwZnjiWDJS
	jMQQvbpJgkq87O+gYC/QPgEA2QERgTBLclZk9z8CSNCNq4kmBPszTVTG96qQwZKiPj8r39gPE/C6v
	Xf/8slTZrdzPIp1XVi28fg/MxPZy8iYHCBMCvzLFT4XXXiOxY4jZwMZahA9ekj0zjY1z1axAxCoAE
	5WpRUY4funW1eFOSuxa9/1+pQtybNB7lwPTYdMIPTSMZHesC1UcSFlMC2Hq2NE5RygjGLq9WNMWda
	4AGniUvvej5WkuKkF17HJg+p7es3YQMVl6s1BwH2xNhwrPEHD0YBpLVlBuBEDYMavvbd96XRkVx1h
	tLb2mz1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urDzf-0000000F9mS-0eFg;
	Wed, 27 Aug 2025 11:07:07 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urC8h-0000000EmuC-0CJB;
	Wed, 27 Aug 2025 09:08:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756285697;
	bh=6V4Clbq308KQFAQTjTHjGV/TIZjO5G7JCGaqRh4tsCA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UC0QDwmQciOS85zNqIgcVmjxIIc40puwKRrJbQ2gRlfKqsZtzap6QIerr0dIP8hRt
	 1cj/Ng45J5piv4JXIYPAyrKYd7z39vR6DV6RSxs0Haxha+cx2JiMq0zx+7eaLFVrGX
	 4KCmhjMk6nsXyZpkfH3PKRnIOBisWtVebBlZgs5VJq5gVEgukItgL0jBE7XW5E2SUS
	 SYDpwbNYb9QOzsjmHaB5DpCom6a0BX+7JecK/9ox0dhezCTVuZ0D9xzvMzk1tJXGCh
	 pZL3FdbTe/XbzgfNtv3rCxeu5WFs8GWageba2l7lEkkKtIM9wDWHXxLwc/qqhzgmQB
	 q3+Ss+DfBwYdg==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:4be:99b9:5069:3bef])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4167717E0EB8;
	Wed, 27 Aug 2025 11:08:17 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: joro@8bytes.org,
	will@kernel.org,
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
Subject: [PATCH v8 4/7] MAINTAINERS: Add entry for Verisilicon IOMMU driver
Date: Wed, 27 Aug 2025 11:08:00 +0200
Message-ID: <20250827090809.34555-5-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827090809.34555-1-benjamin.gaignard@collabora.com>
References: <20250827090809.34555-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_020819_235381_88FF167F 
X-CRM114-Status: UNSURE (   8.78  )
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
changes in version 8:
- Add myself in MAINTAINERS file.

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fed6cd812d79..d32830f56add 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26408,6 +26408,14 @@ F:	drivers/media/i2c/vd55g1.c
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


