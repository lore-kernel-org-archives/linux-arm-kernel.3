Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A978BC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 16:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c2EmILJOFBv8Zbh6LHCH0yn7dTRek4J7KPqxCXfmhEw=; b=17SGFEh+OUX04Mx96CzWK1X9As
	V9KCbb/lXx7IoTSTZplRnnbbpqA/IJJ+Y+B7/wqjVyxuRacYsFtXI0DmCaVx8uhgECRxB1QgeCKsR
	AFnzBYkcKvfiYpWhzBkbcstDB6yOJ+Eq3YE71Lp2FuPwQUDfNkqL7P5LEfMxpXrMUJb7VbdR43Ew5
	SJVANgYB+dZlUTdJ3DnIBTiuyi3MAH2FDjYnHNc+/DlKO5oOHvpVMQwxOx4NOrPTVYxN16WU/umyG
	6VHgA2GB+fbU4rN0krskwYq/BFdSoUnMDl5iQqOWZQ74p3qjCK0/Zv1myJby67bDPVcngIHA/MXYG
	LB9Gf11Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubLb2-00000002mKc-09ec;
	Mon, 14 Jul 2025 16:00:04 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKlZ-00000002Yvo-1FB1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 15:06:54 +0000
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 10A265537;
	Mon, 14 Jul 2025 17:06:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752505580;
	bh=xCc55GEZUTk5JyTc2/0YXIODCmmVHtv/VzS9CFZ2QkA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TCCP/Lzc/4C0s8nq/LNSMFkutAI13EE8KGF0yh/qhS8f4T/22JAOyFFRjopgyzUJT
	 Zm6+HHPPchAQHz8jgsTa5websH/5S2byzbnt69Q0WA86m7sC2N8Cg7atCA+w8BLk5d
	 7nG5UYQoCawC7gRgkOJdXHmhc6BQKIh1gWZQZAjM=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Mon, 14 Jul 2025 16:06:37 +0100
Subject: [PATCH v11 11/19] MAINTAINERS: Add entry for mali-c55 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-c55-v11-11-bc20e460e42a@ideasonboard.com>
References: <20250714-c55-v11-0-bc20e460e42a@ideasonboard.com>
In-Reply-To: <20250714-c55-v11-0-bc20e460e42a@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, 
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1688;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=xCc55GEZUTk5JyTc2/0YXIODCmmVHtv/VzS9CFZ2QkA=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBodR0BujGm1q8thC9p4diUSRKlk6P6sSuIIJKQO
 dc0v3iKwdOJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaHUdAQAKCRDISVd6bEV1
 MsrMD/4liO7b9bk27PFIp+xM4N/m3yJsIcjX3kEvDDd9PIIYYeNJ84Whl0G/rlalikBCWVolmGy
 sWWMHV08oumLfUZx/eSLAZdJMB6PGD+LlHHex3QkiCDypdIEj8bwkIrS77vUj+CAvmFS29tp1uN
 e1jUVqfZvpu2QVPPZFmufOwcreUQYESs7my8NKiV3G5k1W9IYnE3V2upufhfTRYnP+ZGgMAydYL
 gOYoAoed29AGhJM7G16TvAsc4cNe9SQqCN+S/99gN4ywEPMV7QFcmbKJ5h86Wq/SFypbTidzVXR
 M7bmT/FxA88rh6VT+xOT3ja+rkiOed42RUNdswwXpvb3he/Q1Q7e6r4FsSqiRTZU1AToCVsaiPG
 B750cL6fHKMg861A9qlkbOQjZPtD88XgptXtEOuTRCi2jfrexXQzUvBBd8vJeuUE3uFw303LEUl
 BWq9MNLRLicFNqdeQAuxK6ONzZr9Fw+Ab/Aq1Z93vjr2t05xLcJuSXEP4j6+7mit148pV0oa1Ts
 IWYbvsdEgIqSsQpKngTsLV3gLY4uGZZ64y0mKO6dcPC/hLWJJTi968lYdkAyb3LLHEzhSD/wng/
 E1FFHjd0gmuzpGUQ0FdE5yrcowMPKaTlkCMcMDbJQERZCO0UXIke8ZNKgicz6jDTTGQc/eC0ZBK
 uYPf/syd2oBqZzw==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_080653_512149_D6C04224 
X-CRM114-Status: UNSURE (   8.71  )
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
index f03c10092a891a06052484b691409f0c459de87d..7d0b268ed7588fbffb767cd962df6b0e31a9b842 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2028,6 +2028,18 @@ F:	drivers/gpu/drm/ci/xfails/panfrost*
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
2.34.1


