Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A828ECA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 14:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tPy4GqAOn9NjYCgd7E8mSk+A/Y65Vwnn+Qoudmsz9DA=; b=FH2jM0bdA0ZzYoWja9BdWC2dZ4
	VKxLTASF1QCqQi7clsVW1kbgcQKlHHl3ttH3m+J7gsVglYPdZxxA692HIBOHrhAc3D8OMxMVVkAAz
	5HUCPObyG0RG0L0NbkKZlqESv5GYdXKozOceBVyXyvk2xXPgqsNYgzY5gYvJZCoko6nMyofUCKqu/
	qFgd6UoPn2GFVGFyN7gYhbuWUQBS7L9O0nOBBjq1MEeX0tLTZ+h0JrmM/o3a/0pU592EGADgP/2fW
	fj2wh6ks5nZ9gdKy1ndCV8XGU+VW/azP3zOr43wJqkLQ+e1HqsHDqunWNHS22vHyZH3a2EnjAVMDr
	Xbo9aU6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upScO-00000002mFu-3Dyx;
	Fri, 22 Aug 2025 14:19:48 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upLS8-00000001iKQ-2J4S;
	Fri, 22 Aug 2025 06:40:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=tP
	y4GqAOn9NjYCgd7E8mSk+A/Y65Vwnn+Qoudmsz9DA=; b=EIoPWMMvjCX2csB6LR
	DakDX+jLnKlOqmFiczf4GNsbb7WBHVSO0H7ETd0JRr2r6Uc1dJ2537iYMJSbbEIY
	N01aIcttvLsyAsPbmgVePsoBhlkh8jIsXYXDpsav9RQbjdaPusV8dKTXBXVFwAck
	cFdZOtB2ZDdsKiLUZF2JDjKrk=
Received: from ProDesk.. (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgAn9_zCEKhoYtibAA--.23257S6;
	Fri, 22 Aug 2025 14:40:20 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de
Cc: hjc@rock-chips.com,
	mripard@kernel.org,
	naoki@radxa.com,
	stephen@radxa.com,
	cristian.ciocaltea@collabora.com,
	neil.armstrong@linaro.org,
	Laurent.pinchart@ideasonboard.com,
	yubing.zhang@rock-chips.com,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v7 04/10] MAINTAINERS: Add entry for DW DPTX Controller bridge
Date: Fri, 22 Aug 2025 14:39:48 +0800
Message-ID: <20250822063959.692098-5-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250822063959.692098-1-andyshrk@163.com>
References: <20250822063959.692098-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgAn9_zCEKhoYtibAA--.23257S6
X-Coremail-Antispam: 1Uf129KBjvdXoWrZrW5JF4DZry8Gw43CFWktFb_yoWkCrc_C3
	WxZ3yxXr4rGF90krZ7Aan3Ga4Sya1IgFsxu3Wkt392yasYyrWUtFWvkryxGw15CF1fCFWD
	ua4fXFyakrnxujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8N_-PUUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gqxXmioDHlwywABs4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_234044_958890_DDFCC598 
X-CRM114-Status: UNSURE (   8.35  )
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

From: Andy Yan <andy.yan@rock-chips.com>

Add an entry for the DW DPTX Controller bridge driver.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

---

(no changes since v5)

Changes in v5:
- First included in this version.

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cfa28b3470ab6..0ae7d13c2b3c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7999,6 +7999,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/synaptics,r63353.yaml
 F:	drivers/gpu/drm/panel/panel-synaptics-r63353.c
 
+DRM DRIVER FOR SYNOPSYS DESIGNWARE DISPLAYPORT BRIDGE
+M:	Andy Yan <andy.yan@rock-chips.com>
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
+F:	drivers/gpu/drm/bridge/synopsys/dw-dp.c
+F:	include/drm/bridge/dw_dp.h
+
 DRM DRIVER FOR TI DLPC3433 MIPI DSI TO DMD BRIDGE
 M:	Jagan Teki <jagan@amarulasolutions.com>
 S:	Maintained
-- 
2.43.0


