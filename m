Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BEFE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 12:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9hRj6QBWSNnBZTr4yilZjsKzMwsl9NH1dLjm2Bi6AOQ=; b=zUu1jupPpvrsGqpPujRXfGQaXL
	UdtvB/uz3ECeb3w6Lw9lzvR1RIG1I//odtlKG/je03BEpis1eiTrhx2yQwlTFH+Al5RktuttQrkRi
	O+ypxjNa+9USvOEl816Zr1Eu0+B7Zt0nXQ6hATxPBR1Zl3ysX7ByQfw2et+CKtlzyp3U1GaxgrEv9
	J67fpGofB/VtsMsjYuHP9LK5uCr9bkpIpPjGDhxnH+Y2iyS8PPoWnbnmyv4t7zM97pc1NijNW2sD8
	v9uSnA/KSTfNVRJGYrwSygOJMHGL5bWE8YiBKOqPml8SCZTh3eDCUeZe9QBxXc4Sr8b70OCw2cbxv
	nbFW91Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKd5s-00000007lHz-01qB;
	Mon, 09 Dec 2024 12:42:32 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKcuE-00000007gqZ-3kZg;
	Mon, 09 Dec 2024 12:30:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=9hRj6
	QBWSNnBZTr4yilZjsKzMwsl9NH1dLjm2Bi6AOQ=; b=EJwVkSdve370QTxcagkZI
	6RunCMT+v7Fzj8OsJBF0Af0iOFnOW1lQmb3KAPE3sUe2GL+GXSJA6aOQrctsTeh4
	xT8JecQz9qCAc7rPk1cOebtJ8+mInP7jpR4SVYgbJtM0xvhDf18FEcxvjAx92wH4
	b6egIiDNdMmDq1NoCpMnPE=
Received: from ProDesk.. (unknown [58.22.7.114])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgD3Woe44lZnubZICA--.5849S10;
	Mon, 09 Dec 2024 20:29:56 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com,
	krzk+dt@kernel.org,
	s.hauer@pengutronix.de,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	derek.foreman@collabora.com,
	detlev.casanova@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v5 05/18] drm/rockchip: vop2: Set AXI id for rk3588
Date: Mon,  9 Dec 2024 20:29:18 +0800
Message-ID: <20241209122943.2781431-9-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241209122943.2781431-1-andyshrk@163.com>
References: <20241209122943.2781431-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgD3Woe44lZnubZICA--.5849S10
X-Coremail-Antispam: 1Uf129KBjvJXoWxtw4DCF4xGF4fCrWrJFyDtrb_yoW3ArWfpa
	yfJwsxW3yqkr42qr97XF1YvF1rJasrt3yxXan3W3sFgFyFgw1xtF1jya4DAFyag34IkrWj
	qws8Jry7W39xtF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j8o7NUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0g6wXmdW3S-w5QAAsk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_043031_307131_EA3C5597 
X-CRM114-Status: GOOD (  14.05  )
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

There are two AXI bus in vop2, windows attached on the same bus must
have a unique channel YUV and RGB channel ID.

The default IDs will conflict with each other on the rk3588, so they
need to be reassigned.

Fixes: 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Tested-by: Derek Foreman <derek.foreman@collabora.com>

---

Changes in v5:
- Added in V5

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 14 +++++++++++
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  9 +++++++
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 26 +++++++++++++++++++-
 3 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index dc4edd65bc9e..8b9ca046eeeb 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1426,6 +1426,12 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 		&fb->format->format,
 		afbc_en ? "AFBC" : "", &yrgb_mst);
 
+	if (vop2->data->soc_id > 3568) {
+		vop2_win_write(win, VOP2_WIN_AXI_BUS_ID, win->data->axi_bus_id);
+		vop2_win_write(win, VOP2_WIN_AXI_YRGB_R_ID, win->data->axi_yrgb_r_id);
+		vop2_win_write(win, VOP2_WIN_AXI_UV_R_ID, win->data->axi_uv_r_id);
+	}
+
 	if (vop2_cluster_window(win))
 		vop2_win_write(win, VOP2_WIN_AFBC_HALF_BLOCK_EN, half_block_en);
 
@@ -3354,6 +3360,10 @@ static struct reg_field vop2_cluster_regs[VOP2_WIN_MAX_REG] = {
 	[VOP2_WIN_Y2R_EN] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL0, 8, 8),
 	[VOP2_WIN_R2Y_EN] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL0, 9, 9),
 	[VOP2_WIN_CSC_MODE] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL0, 10, 11),
+	[VOP2_WIN_AXI_YRGB_R_ID] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL2, 0, 3),
+	[VOP2_WIN_AXI_UV_R_ID] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL2, 5, 8),
+	/* RK3588 only, reserved bit on rk3568*/
+	[VOP2_WIN_AXI_BUS_ID] = REG_FIELD(RK3568_CLUSTER_CTRL, 13, 13),
 
 	/* Scale */
 	[VOP2_WIN_SCALE_YRGB_X] = REG_FIELD(RK3568_CLUSTER_WIN_SCL_FACTOR_YRGB, 0, 15),
@@ -3446,6 +3456,10 @@ static struct reg_field vop2_esmart_regs[VOP2_WIN_MAX_REG] = {
 	[VOP2_WIN_YMIRROR] = REG_FIELD(RK3568_SMART_CTRL1, 31, 31),
 	[VOP2_WIN_COLOR_KEY] = REG_FIELD(RK3568_SMART_COLOR_KEY_CTRL, 0, 29),
 	[VOP2_WIN_COLOR_KEY_EN] = REG_FIELD(RK3568_SMART_COLOR_KEY_CTRL, 31, 31),
+	[VOP2_WIN_AXI_YRGB_R_ID] = REG_FIELD(RK3568_SMART_CTRL1, 4, 8),
+	[VOP2_WIN_AXI_UV_R_ID] = REG_FIELD(RK3568_SMART_CTRL1, 12, 16),
+	/* RK3588 only, reserved register on rk3568 */
+	[VOP2_WIN_AXI_BUS_ID] = REG_FIELD(RK3588_SMART_AXI_CTRL, 1, 1),
 
 	/* Scale */
 	[VOP2_WIN_SCALE_YRGB_X] = REG_FIELD(RK3568_SMART_REGION0_SCL_FACTOR_YRGB, 0, 15),
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
index 8786c2ba48df..0a3b22e8d14e 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
@@ -78,6 +78,9 @@ enum vop2_win_regs {
 	VOP2_WIN_COLOR_KEY,
 	VOP2_WIN_COLOR_KEY_EN,
 	VOP2_WIN_DITHER_UP,
+	VOP2_WIN_AXI_BUS_ID,
+	VOP2_WIN_AXI_YRGB_R_ID,
+	VOP2_WIN_AXI_UV_R_ID,
 
 	/* scale regs */
 	VOP2_WIN_SCALE_YRGB_X,
@@ -149,6 +152,10 @@ struct vop2_win_data {
 	unsigned int layer_sel_id;
 	uint64_t feature;
 
+	uint8_t axi_bus_id;
+	uint8_t axi_yrgb_r_id;
+	uint8_t axi_uv_r_id;
+
 	unsigned int max_upscale_factor;
 	unsigned int max_downscale_factor;
 	const u8 dly[VOP2_DLY_MODE_MAX];
@@ -319,6 +326,7 @@ enum dst_factor_mode {
 
 #define RK3568_CLUSTER_WIN_CTRL0		0x00
 #define RK3568_CLUSTER_WIN_CTRL1		0x04
+#define RK3568_CLUSTER_WIN_CTRL2		0x08
 #define RK3568_CLUSTER_WIN_YRGB_MST		0x10
 #define RK3568_CLUSTER_WIN_CBR_MST		0x14
 #define RK3568_CLUSTER_WIN_VIR			0x18
@@ -341,6 +349,7 @@ enum dst_factor_mode {
 /* (E)smart register definition, offset relative to window base */
 #define RK3568_SMART_CTRL0			0x00
 #define RK3568_SMART_CTRL1			0x04
+#define RK3588_SMART_AXI_CTRL			0x08
 #define RK3568_SMART_REGION0_CTRL		0x10
 #define RK3568_SMART_REGION0_YRGB_MST		0x14
 #define RK3568_SMART_REGION0_CBR_MST		0x18
diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index f7d3350594fa..37c65138012d 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -395,7 +395,7 @@ static const struct vop2_video_port_data rk3588_vop_video_ports[] = {
  * AXI1 is a read only bus.
  *
  * Every window on a AXI bus must assigned two unique
- * read id(yrgb_id/uv_id, valid id are 0x1~0xe).
+ * read id(yrgb_r_id/uv_r_id, valid id are 0x1~0xe).
  *
  * AXI0:
  * Cluster0/1, Esmart0/1, WriteBack
@@ -415,6 +415,9 @@ static const struct vop2_win_data rk3588_vop_win_data[] = {
 		.layer_sel_id = 0,
 		.supported_rotations = DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_270 |
 				       DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y,
+		.axi_bus_id = 0,
+		.axi_yrgb_r_id = 2,
+		.axi_uv_r_id = 3,
 		.max_upscale_factor = 4,
 		.max_downscale_factor = 4,
 		.dly = { 4, 26, 29 },
@@ -431,6 +434,9 @@ static const struct vop2_win_data rk3588_vop_win_data[] = {
 		.supported_rotations = DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_270 |
 				       DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y,
 		.type = DRM_PLANE_TYPE_PRIMARY,
+		.axi_bus_id = 0,
+		.axi_yrgb_r_id = 6,
+		.axi_uv_r_id = 7,
 		.max_upscale_factor = 4,
 		.max_downscale_factor = 4,
 		.dly = { 4, 26, 29 },
@@ -446,6 +452,9 @@ static const struct vop2_win_data rk3588_vop_win_data[] = {
 		.supported_rotations = DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_270 |
 				       DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y,
 		.type = DRM_PLANE_TYPE_PRIMARY,
+		.axi_bus_id = 1,
+		.axi_yrgb_r_id = 2,
+		.axi_uv_r_id = 3,
 		.max_upscale_factor = 4,
 		.max_downscale_factor = 4,
 		.dly = { 4, 26, 29 },
@@ -461,6 +470,9 @@ static const struct vop2_win_data rk3588_vop_win_data[] = {
 		.supported_rotations = DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_270 |
 				       DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y,
 		.type = DRM_PLANE_TYPE_PRIMARY,
+		.axi_bus_id = 1,
+		.axi_yrgb_r_id = 6,
+		.axi_uv_r_id = 7,
 		.max_upscale_factor = 4,
 		.max_downscale_factor = 4,
 		.dly = { 4, 26, 29 },
@@ -475,6 +487,9 @@ static const struct vop2_win_data rk3588_vop_win_data[] = {
 		.layer_sel_id = 2,
 		.supported_rotations = DRM_MODE_REFLECT_Y,
 		.type = DRM_PLANE_TYPE_OVERLAY,
+		.axi_bus_id = 0,
+		.axi_yrgb_r_id = 0x0a,
+		.axi_uv_r_id = 0x0b,
 		.max_upscale_factor = 8,
 		.max_downscale_factor = 8,
 		.dly = { 23, 45, 48 },
@@ -488,6 +503,9 @@ static const struct vop2_win_data rk3588_vop_win_data[] = {
 		.layer_sel_id = 3,
 		.supported_rotations = DRM_MODE_REFLECT_Y,
 		.type = DRM_PLANE_TYPE_OVERLAY,
+		.axi_bus_id = 0,
+		.axi_yrgb_r_id = 0x0c,
+		.axi_uv_r_id = 0x01,
 		.max_upscale_factor = 8,
 		.max_downscale_factor = 8,
 		.dly = { 23, 45, 48 },
@@ -501,6 +519,9 @@ static const struct vop2_win_data rk3588_vop_win_data[] = {
 		.layer_sel_id = 6,
 		.supported_rotations = DRM_MODE_REFLECT_Y,
 		.type = DRM_PLANE_TYPE_OVERLAY,
+		.axi_bus_id = 1,
+		.axi_yrgb_r_id = 0x0a,
+		.axi_uv_r_id = 0x0b,
 		.max_upscale_factor = 8,
 		.max_downscale_factor = 8,
 		.dly = { 23, 45, 48 },
@@ -514,6 +535,9 @@ static const struct vop2_win_data rk3588_vop_win_data[] = {
 		.layer_sel_id = 7,
 		.supported_rotations = DRM_MODE_REFLECT_Y,
 		.type = DRM_PLANE_TYPE_OVERLAY,
+		.axi_bus_id = 1,
+		.axi_yrgb_r_id = 0x0c,
+		.axi_uv_r_id = 0x0d,
 		.max_upscale_factor = 8,
 		.max_downscale_factor = 8,
 		.dly = { 23, 45, 48 },
-- 
2.34.1


