Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CFC0CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 10:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sP5nVNKjb1pQaRR+2r/TiTFLzAY81X0RTCHDByMaEFA=; b=p7ISG+aBYBsdXtPOe5UxJGnC9j
	yywSFvBFihkrFVtqcDFhOq1p1PPb6tymBFjUYk7b5rrXzH4f/FLAWi7f6YVWeVFgbYBQb7ojGgHhN
	pQQIKKAT7+XTLmA9bKRkmBhuCaJTZ5/Q11eTvfIzH34iUTPEaVgSMHm1fzMXiEbkSf/HDRRmcN8HM
	gzktn4hLSFPHFd8ZE/Vti2huevFf/iUtII/WDn85buc3nHsF9YR/26eQY866e5yJrXaAL6GfbvIXA
	bsHP4FtEDOqEdGvz/JcELinAoHp8OCJ6edqgtd0T0tMHrhexvggiHooW0jRmtM16YweQnmNKuTcpr
	BuvTU8qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4GOh-0000000AEff-1G7x;
	Thu, 02 Oct 2025 10:18:51 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4GOa-0000000AEXl-1kDN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 10:18:46 +0000
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A2A1AF06;
	Thu,  2 Oct 2025 12:17:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759400232;
	bh=Cqluj7U/KLSqNIFIlzY5s8rRln1Gzbirj64U1h1UC0w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pq/WxGjNH11TW03U7sdZYwZM5nilhlupdq7PQNwbGf/28HLEOLgh7/EUK7SaVlkEd
	 i+Lwh/hyemWrSKfxeY6c6z4nt8Xiv/msL1Kqwv5YtTmxb3CNDrSdR2rD7Ktj3VeSRK
	 FyVCUwCK7d02IGzxvZBHs4HhlmrvZfNvgwS/Q5UY=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Thu, 02 Oct 2025 11:18:26 +0100
Subject: [PATCH v12 07/15] MAINTAINERS: Add entry for mali-c55 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251002-c55-v12-7-3eda2dba9554@ideasonboard.com>
References: <20251002-c55-v12-0-3eda2dba9554@ideasonboard.com>
In-Reply-To: <20251002-c55-v12-0-3eda2dba9554@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, 
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1762;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=Cqluj7U/KLSqNIFIlzY5s8rRln1Gzbirj64U1h1UC0w=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBo3lF5T0T9TBninJ9XDpuDKtPGxQb71fmRB+kAw
 VlZHY3e4rWJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaN5ReQAKCRDISVd6bEV1
 MnG7D/4+WgdEszOfDsBWiw+ftI5SEIqpVwbgDYEYPzwj4BJdAV67v8uOvNI8cMi+wNguTF6tqKh
 AfVQRPuqaDQvFwqqFytvPkTFo/Ux2hhaMxbEkyGfV0HzrkrytWIuXbSEs0ik2+fWAD5DM/5wehN
 /QgTkqr7SnDX49jcq3s4F+k/sivp1GPs51RWPYTq/pCqBjv6YOR9d6Bt1HP13d9Aj+1cBDpQQp0
 eeA7OjV9BOhTJ+Fh1utEtf9GPuGwuiRSkUGXh7kTYM4oibTME5oTrznP0NWCEzg8VajnnSNBs1j
 xbP69joBRjdg20N+5OUY3EV/7zsY9TsQCcpBYkfH4+t1sjBncJcntG5o8zHof03doMmiaoPOkJR
 2fVeeQ7oWZ+MQz/ifOvVNXQzujhj923hzEmXhyN5FixwsMELZ+ezIniQh08TvE1qxaIXxUg0tuU
 BXSll/pnUqcsL1dTyCUQHNd87FvHrufniayeft6GLwYt41C4WGGNLhake93aRB8U8HFPG9rbGq4
 PLrAZqNV3IuARf0e7q3PuW8RTT0yw1O1syxZKC2EmIGmpJsnZNdmsV7aV+CNVdcgdKzofuO3EWu
 C2ExapIttZ7Xm/IRmYdASdMt4EJuIJuiOKBpsp+12ZG4ucoRiosuZuRgKD7CweTUjISIqUlFVvh
 R4fRuBNcGkZh0GQ==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_031844_668285_264919B4 
X-CRM114-Status: UNSURE (   8.63  )
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

Add a MAINTAINERS entry for the mali-c55 driver and its associated
documentation.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v12:

        - None

Changes in v11:

        - None

Changes in v10:

	- None

Changes in v9:

	- Added a File line for
	  Documentation/userspace-api/media/drivers/mali-c55.rst

Changes in v8:

	- None

Changes in v7:

	- None

Changes in v6:

	- None

Changes in v5:

	- None

Changes in v4:
	- None

Changes in v3:

	- none

Changes in v2:

	- none
---
 MAINTAINERS | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b0c5e6c2b21a5d5ebc63d2ae8b5c1b68fa912b33..86a6ec3a629417ace8c79bf89e1868cbeb422b85 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2075,6 +2075,18 @@ F:	drivers/gpu/drm/ci/xfails/panfrost*
 F:	drivers/gpu/drm/panfrost/
 F:	include/uapi/drm/panfrost_drm.h
 
+ARM MALI-C55 ISP DRIVER
+M:	Daniel Scally <dan.scally@ideasonboard.com>
+M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/admin-guide/media/mali-c55-graph.dot
+F:	Documentation/admin-guide/media/mali-c55.rst
+F:	Documentation/devicetree/bindings/media/arm,mali-c55.yaml
+F:	Documentation/userspace-api/media/drivers/mali-c55.rst
+F:	drivers/media/platform/arm/mali-c55/
+
 ARM MALI PANTHOR DRM DRIVER
 M:	Boris Brezillon <boris.brezillon@collabora.com>
 M:	Steven Price <steven.price@arm.com>

-- 
2.43.0


