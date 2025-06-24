Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EABC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 10:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tHYYJgQYozNXyXFCaTlEGnXeex1hMGGeDtKN0Br6QaA=; b=sxyWiACujmynuh9/uqOfx3uSW+
	xNfJCMAmM4KcGBXJO73yZOsFKSkLm4kUqrmyPkX1Ic/lSrw+B+h6Tq32/3z/130d0X91/W8g7C3B3
	Fn0pOUaKkbvhnWZG7XVRanxcihS895ycqYQ2FemTRonkvoxBSSDelzsFy5Ho1u61pTovYRJ/Ip539
	fEeo/ixJg49CKAOQHufHbOLxCAxYf8+B59UUJr0ApdWD5iiHAoOUntb3Fox9kPaWq3EihJOGaAIeh
	C8kXo2AqqPreBIUI7MCC6Cow/RSyvHlxvbtVICtE5O4IPj2Svu+shnYDA1co6oDXHzuSEdeuVB/wG
	7MBRh3dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU17M-00000005L3U-20jg;
	Tue, 24 Jun 2025 10:43:08 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU0mb-00000005I0f-2Nda
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 10:21:43 +0000
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B31791DAB;
	Tue, 24 Jun 2025 12:21:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750760480;
	bh=iyhJbIDgI4Oae74LEOpCqBLfntqEuWvPSqMqL1nUytY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uhY+eBaaSkgmOZBrHwmzxIdcKXa9fiW8fc83ZJIapbQzVhd0YxZbkgttbJB0IhqXd
	 qS2+o2Vn/xI0oA7may4MUHHCs76tOqSTlUWeFRxLldvnCdpKTE27Q8x94X/K9jb/PY
	 mV4v556g6PX6uabzSmBAJE03uYP6zIKceAQXYrMc=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 24 Jun 2025 11:21:22 +0100
Subject: [PATCH v10 09/17] MAINTAINERS: Add entry for mali-c55 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-c55-v10-9-54f3d4196990@ideasonboard.com>
References: <20250624-c55-v10-0-54f3d4196990@ideasonboard.com>
In-Reply-To: <20250624-c55-v10-0-54f3d4196990@ideasonboard.com>
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
 bh=iyhJbIDgI4Oae74LEOpCqBLfntqEuWvPSqMqL1nUytY=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoWnwoY+5HI6gOtbDj5LRvleNv0DFEHQdcipPdg
 1ODLWHT/LuJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaFp8KAAKCRDISVd6bEV1
 MjExD/wPUehcFtLs1sFnN8x01u0uxfhPTH+ryuV9Sps2xy3BrSpabyqYEurXfCBl5kqRU2Jjqqj
 rcbNaObr9H3HlGaL8Br2O0ObUCEJpJamo4qB/8XP9P9AGLtcE+BVKLN5P0VV4V24yXMGSQ9/D0+
 dKPDqje59L3a5poOid5DAhTgokaEmMUScNBSQyMF+hBlCaRylzQwO7U2KvfSVDcMVHnYRGd6pTR
 XMN9vmIcxMS+bYjJno4LdORQD0P0zx082lm6DKvWuHc4G9Kown1U5ZF9Pzv7Ie9cGz6pDUb49kJ
 WBZ16ZeZAL2Kl/BZ2cgJfD3t3SOLzDcVtSwDaJfhdQKVxse6snjDpefox89/JjOu/jFOf3oGwpG
 /sfHbXYBtlDqFgrSH6aTXe32Zp5iuPDPuMvH8d45OUAcwnhFYzlzgYUYef5fj4gd9XJ8JiMm/vp
 cZDa29iov3uYjBgSmDQqOGXGAAXZ35fDiSPNTub+Yl/rtOn9huRPKLiJ0jOP2Rc+1q3UYBkexxM
 XVaBbE6LTx88mnoOD2chG8ufZ6T+MS84KrZM7fkwdKge01bZP9TLyeiY+Eu1xtFXijGP5zNBmIP
 DeUkzz0s05iopEwzTXCdvdTPGwW2atz4bU5VNU958nLQ+L23yJpIhx2yCIud2jw/9gefVcMT3kc
 tVVahQPdwXCRxsA==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_032141_756440_8ACA80DE 
X-CRM114-Status: UNSURE (   8.51  )
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
index a92290fffa163f9fe8fe3f04bf66426f9a894409..43204b809333bf8f3d05a65fb3c24b063c91c2a4 100644
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


