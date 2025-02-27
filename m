Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4E4C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 12:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hXkde911Z64kF8smw3cD/AQJM1tLWmI9WubsKq7+gEI=; b=qRMjZTXGJlHlGy+kiod8Pvhx7/
	IyTelq1368D7Vcn7UXFYRvCqUPuQXCWMpwDuOqlMMDUPs6QnZJJ3+cdM6TBUpSlgbAK/zWMyCTKxt
	cF/5BtMb75OXIY88pC28G7wU9T1n8aTSGkAYi1PoL5HamD8f2dhtW7N1YSgFv6CQOPTgK7bSjudca
	fBrd/luMkdHEwKdtj8siBbihboOhL2YLYIaERIsYgaIIlVjpanSYdtYHb8lcC/glgGFzQzo90VRjH
	CW9KMKVjb5o6PKX88seMYbkJID1h9yQ+RFRAqB3lo25bWGkAWlRftjIX5TMOrdCe5cFhzCAelF7iq
	dfCCgI9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tncrr-00000007L4J-2axm;
	Thu, 27 Feb 2025 12:19:55 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tncMW-00000007EYe-3Kgp;
	Thu, 27 Feb 2025 11:47:34 +0000
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:a3f5:6799:2ce9:5b66])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5DFD27F5;
	Thu, 27 Feb 2025 12:46:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740656763;
	bh=P9xqUjKbHM5Je+UfdaKgLXkxGRlIAHd1iEy80IGgQXE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TCN0cIHzr1IRMzTI7bhy1uuEj1SRVAB00NAagrYvtrsx4PI91VFfxUNlIEg/EzI02
	 1Hl0d4eE73DYpypXFuli6Yj27dkq5nre2BNTyUIHQf9DIlWA0JJ6PKtP6jd6RpWBRF
	 CZKearkxFmOjwsNV9nLve8me29659QOwH6R21HdQ=
From: Stefan Klug <stefan.klug@ideasonboard.com>
To: linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Stefan Klug <stefan.klug@ideasonboard.com>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] media: rkisp1: Remove unnecessary defines
Date: Thu, 27 Feb 2025 12:45:01 +0100
Message-ID: <20250227114558.3097101-4-stefan.klug@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250227114558.3097101-1-stefan.klug@ideasonboard.com>
References: <20250227114558.3097101-1-stefan.klug@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_034732_967524_A4B978D8 
X-CRM114-Status: UNSURE (   8.27  )
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

The effect modes are not shifts but numbers which are already defined a
few lines above. Remove the misleading defines.

Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
index bf0260600a19..139177db9c6d 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
@@ -327,13 +327,6 @@
 #define RKISP1_CIF_IMG_EFF_CTRL_CFG_UPD			BIT(4)
 #define RKISP1_CIF_IMG_EFF_CTRL_YCBCR_FULL		BIT(5)
 
-#define RKISP1_CIF_IMG_EFF_CTRL_MODE_BLACKWHITE_SHIFT	0
-#define RKISP1_CIF_IMG_EFF_CTRL_MODE_NEGATIVE_SHIFT	1
-#define RKISP1_CIF_IMG_EFF_CTRL_MODE_SEPIA_SHIFT	2
-#define RKISP1_CIF_IMG_EFF_CTRL_MODE_COLOR_SEL_SHIFT	3
-#define RKISP1_CIF_IMG_EFF_CTRL_MODE_EMBOSS_SHIFT	4
-#define RKISP1_CIF_IMG_EFF_CTRL_MODE_SKETCH_SHIFT	5
-#define RKISP1_CIF_IMG_EFF_CTRL_MODE_SHARPEN_SHIFT	6
 #define RKISP1_CIF_IMG_EFF_CTRL_MODE_MASK		0xe
 
 /* IMG_EFF_COLOR_SEL */
-- 
2.43.0


