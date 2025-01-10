Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7B8E7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 10:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aj3p5YEkL2Je1AnEdaQQ2QACpF4/wWQgDcT/1GT+BA4=; b=az2UMQIz4NuXwHOpgb/8c0b13c
	lUVmZh55Tx7OdLlS4iXeyObajyhmPPoYTdS94JIjRavbr/hOqlPkIL9aXlEHCwa4f4aD2tc3qvUX/
	8F2xKud/kt0OFL5Cj1CW4WchMeWN9PTW+tCtwC7uz4LwVEat0tjmetH/64fpmpFCrztupD7ImcbQH
	F2SFMVC3NUeMDf4ra5s+ngNgxa+jIJF1mceVP1C0y1J/RS+POvZh098Glr0vQ+a8/i88khU4eO6t2
	Lot3AQsrevxQK+OPjyGLMHv9P3rwprz8ouXOB6mH7AHK7ZkbIr3UnB2ZibZL6pNBVf0vP/DXL/Rsk
	vth5BftQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWC49-0000000EujD-43eV;
	Fri, 10 Jan 2025 10:16:34 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWBww-0000000EslS-3Hzh;
	Fri, 10 Jan 2025 10:09:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=Aj3p5
	YEkL2Je1AnEdaQQ2QACpF4/wWQgDcT/1GT+BA4=; b=MWfxTxd+UxOpTXbTNV/Qu
	wn0YOMtaSKa7Ct/EAwVbkQDfbBdOkDvyLVSfzSgbUVrKaaG3QQbEkRjjWLASvMOV
	D52PvYDQnFuEwG0CJcjlXDmNQ9Ul7w0h4Y1sOWemvWnDedXJMKllV9kS/rhc5wjP
	ko6JxeumpE9u5aExczNpmk=
Received: from ProDesk.. (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgBHPRKh8YBn2sBEEQ--.4640S4;
	Fri, 10 Jan 2025 18:08:39 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	derek.foreman@collabora.com,
	detlev.casanova@collabora.com,
	daniel@fooishbar.org,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v10 02/11] drm/rockchip: vop2: Rename TRANSFORM_OFFSET to TRANSFORM_OFFS
Date: Fri, 10 Jan 2025 18:08:17 +0800
Message-ID: <20250110100832.27551-3-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250110100832.27551-1-andyshrk@163.com>
References: <20250110100832.27551-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgBHPRKh8YBn2sBEEQ--.4640S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxCrWxKw4rJw15Jr18uw17Wrg_yoWrCr18pr
	W3JayDWF4UKFs2gFWkAr15AF48Xan2y3yfGa9xJrnIqFyaga4DWwnFka4UJr4Uta4I9FZ2
	q3saqrW7urW3tr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jr_-PUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqQLQXmeA6nmYfgAAs3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_020907_213598_F9886E3B 
X-CRM114-Status: GOOD (  11.39  )
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

This help avoid "exceeds 100 columns" warning from checkpatch

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

(no changes since v1)

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 8 ++++----
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 03248ac4ba4a..5ee8a7b86d0b 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1517,7 +1517,7 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 		transform_offset = vop2_afbc_transform_offset(pstate, half_block_en);
 		vop2_win_write(win, VOP2_WIN_AFBC_HDR_PTR, yrgb_mst);
 		vop2_win_write(win, VOP2_WIN_AFBC_PIC_SIZE, act_info);
-		vop2_win_write(win, VOP2_WIN_AFBC_TRANSFORM_OFFSET, transform_offset);
+		vop2_win_write(win, VOP2_WIN_AFBC_TRANSFORM_OFFS, transform_offset);
 		vop2_win_write(win, VOP2_WIN_AFBC_PIC_OFFSET, ((src->x1 >> 16) | src->y1));
 		vop2_win_write(win, VOP2_WIN_AFBC_DSP_OFFSET, (dest->x1 | (dest->y1 << 16)));
 		vop2_win_write(win, VOP2_WIN_AFBC_PIC_VIR_WIDTH, stride);
@@ -1528,7 +1528,7 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 	} else {
 		if (vop2_cluster_window(win)) {
 			vop2_win_write(win, VOP2_WIN_AFBC_ENABLE, 0);
-			vop2_win_write(win, VOP2_WIN_AFBC_TRANSFORM_OFFSET, 0);
+			vop2_win_write(win, VOP2_WIN_AFBC_TRANSFORM_OFFS, 0);
 		}
 
 		vop2_win_write(win, VOP2_WIN_YRGB_VIR, DIV_ROUND_UP(fb->pitches[0], 4));
@@ -3420,7 +3420,7 @@ static const struct reg_field vop2_cluster_regs[VOP2_WIN_MAX_REG] = {
 	[VOP2_WIN_AFBC_TILE_NUM] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_VIR_WIDTH, 16, 31),
 	[VOP2_WIN_AFBC_PIC_OFFSET] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_PIC_OFFSET, 0, 31),
 	[VOP2_WIN_AFBC_DSP_OFFSET] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_DSP_OFFSET, 0, 31),
-	[VOP2_WIN_AFBC_TRANSFORM_OFFSET] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_TRANSFORM_OFFSET, 0, 31),
+	[VOP2_WIN_AFBC_TRANSFORM_OFFS] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_TRANSFORM_OFFS, 0, 31),
 	[VOP2_WIN_AFBC_ROTATE_90] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_ROTATE_MODE, 0, 0),
 	[VOP2_WIN_AFBC_ROTATE_270] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_ROTATE_MODE, 1, 1),
 	[VOP2_WIN_XMIRROR] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_ROTATE_MODE, 2, 2),
@@ -3519,7 +3519,7 @@ static const struct reg_field vop2_esmart_regs[VOP2_WIN_MAX_REG] = {
 	[VOP2_WIN_AFBC_PIC_OFFSET] = { .reg = 0xffffffff },
 	[VOP2_WIN_AFBC_PIC_SIZE] = { .reg = 0xffffffff },
 	[VOP2_WIN_AFBC_DSP_OFFSET] = { .reg = 0xffffffff },
-	[VOP2_WIN_AFBC_TRANSFORM_OFFSET] = { .reg = 0xffffffff },
+	[VOP2_WIN_AFBC_TRANSFORM_OFFS] = { .reg = 0xffffffff },
 	[VOP2_WIN_AFBC_HDR_PTR] = { .reg = 0xffffffff },
 	[VOP2_WIN_AFBC_HALF_BLOCK_EN] = { .reg = 0xffffffff },
 	[VOP2_WIN_AFBC_ROTATE_270] = { .reg = 0xffffffff },
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
index 29cc7fb8f6d8..8510140b0869 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
@@ -118,7 +118,7 @@ enum vop2_win_regs {
 	VOP2_WIN_AFBC_PIC_OFFSET,
 	VOP2_WIN_AFBC_PIC_SIZE,
 	VOP2_WIN_AFBC_DSP_OFFSET,
-	VOP2_WIN_AFBC_TRANSFORM_OFFSET,
+	VOP2_WIN_AFBC_TRANSFORM_OFFS,
 	VOP2_WIN_AFBC_HDR_PTR,
 	VOP2_WIN_AFBC_HALF_BLOCK_EN,
 	VOP2_WIN_AFBC_ROTATE_270,
@@ -335,7 +335,7 @@ enum dst_factor_mode {
 #define RK3568_CLUSTER_WIN_DSP_INFO		0x24
 #define RK3568_CLUSTER_WIN_DSP_ST		0x28
 #define RK3568_CLUSTER_WIN_SCL_FACTOR_YRGB	0x30
-#define RK3568_CLUSTER_WIN_AFBCD_TRANSFORM_OFFSET	0x3C
+#define RK3568_CLUSTER_WIN_AFBCD_TRANSFORM_OFFS	0x3C
 #define RK3568_CLUSTER_WIN_AFBCD_OUTPUT_CTRL	0x50
 #define RK3568_CLUSTER_WIN_AFBCD_ROTATE_MODE	0x54
 #define RK3568_CLUSTER_WIN_AFBCD_HDR_PTR	0x58
-- 
2.34.1


