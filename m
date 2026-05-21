Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9581CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 08:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cppn0sJL5/Pz1acCZKRGfCVjTCB3p7PnEHCsUgmApEE=; b=Jz0+nXVGJ6AnPhOFKjZi8QIfzi
	49x6CVu4PlfCyxXySspGKDoUNCq6GKi6eYaWf+MZ+4rtbqzJVZgp/HLAZzlK2y7m/kBBCx+ViC/vB
	YciSZ1Xo3WNyAyA+6HLkj+MfaCeCIz5UtSfKHI33MmMSIV5cJQS56xhSukzFn/XudYtphyWHfesni
	NRfPD0Snw8xRsBk8Qtl53n0/f9QZSOYa+h+MxOf9ihXx/FgQORblV/s84GtqMc2pH/TCOTYGvc6Vp
	nlls8LfKl8qynec4zhmMali6RkbHeeUAWU8Q9GHMgL/CAP9g17fQA0MOxsLjNvJTIaTfRdK5n3mtC
	2JVNWQEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPyTI-000000073zg-0qZG;
	Thu, 21 May 2026 08:09:36 +0000
Received: from mail-m93119.xmail.ntesmail.com ([103.126.93.119])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPySu-000000073Y3-1gW0;
	Thu, 21 May 2026 08:09:13 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3f48aae5a;
	Thu, 21 May 2026 16:08:57 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	nicolas.frattaroli@collabora.com,
	cristian.ciocaltea@collabora.com,
	sebastian.reichel@collabora.com,
	dmitry.baryshkov@oss.qualcomm.com,
	luca.ceresoli@bootlin.com,
	dianders@chromium.org,
	m.szyprowski@samsung.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Damon Ding <damon.ding@rock-chips.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 02/10] dt-bindings: display: rockchip: analogix-dp: Add per-clock descriptions
Date: Thu, 21 May 2026 16:08:27 +0800
Message-Id: <20260521080835.1362416-3-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260521080835.1362416-1-damon.ding@rock-chips.com>
References: <20260521080835.1362416-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e4994a16603a3kunm810e96ea5eb8c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZQ0lOVhhCSx1LS0sfHx9KGlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=DTXBtZoV6RxwaDsRCFb/n2JNUPrHJcA1ewQWRkE56FG82e48RDQx6cS5VfY9u1wbSHU+3Gewq1Lv51GyF0lqu/mAqi3/WAUwrHVc6GpRsVbh9FUghyRxX5n9wKt1B1Hq8e7Is4gIvtA+kxF62KSWyWvkogpv1ZyMGn/mMNrX+Sw=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=Cppn0sJL5/Pz1acCZKRGfCVjTCB3p7PnEHCsUgmApEE=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_010912_689998_E273DFE4 
X-CRM114-Status: UNSURE (   8.57  )
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

Supplement dedicated description for each clock in the clocks
property, clarifying the function of each clock input for the
Analogix DP controller binding.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v4:
- Modify the commit msg.

Changes in v5:
- Add Acked-by tag.
---
 .../bindings/display/rockchip/rockchip,analogix-dp.yaml      | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
index 8001c1facf98..d679da70947d 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
@@ -19,7 +19,10 @@ properties:
 
   clocks:
     minItems: 2
-    maxItems: 3
+    items:
+      - description: Reference clock
+      - description: APB bus clock
+      - description: GRF or AHB bus clock
 
   clock-names:
     minItems: 2
-- 
2.34.1


