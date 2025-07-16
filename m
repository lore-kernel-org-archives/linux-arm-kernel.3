Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A656C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 10:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PocQ/nDHIATBOFJGSZ66fxv31g7Z72Z6uzRz+exnXWo=; b=hcLxU/TxkRzU949uFDsJaZRsnb
	Q3ge5+TxWvU2zaP8VXY75BypysebIIRk3jT9o9EJc4m1B/8QloefmLNXq5wCvmZ1xgVtQYXXirA8y
	LVVItAxqdCGlGWCxfTE/8MhsgYN6sR1WO8wDoaVU5spX9STdU9Kltwy8tYm7FOqDtKsyJZY8Sy+fc
	gYsS4IigVlg0K/oY37sXynyiBpb/iyKeZJoana0oxNklxXOr8Dv/Bw98iu9KqcfiI8fRwHVZhEy7c
	ua83/uaqVeV2bhe4GdTx3HS0YKP3NkJs5plXxWBwAlxY+9ACI9S6mBjGJrIKD0OpWDsyqo98E8tOv
	TiRyxMlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubz8C-00000007Ncg-1gCc;
	Wed, 16 Jul 2025 10:12:56 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubz0w-00000007M7T-3q1p;
	Wed, 16 Jul 2025 10:05:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Po
	cQ/nDHIATBOFJGSZ66fxv31g7Z72Z6uzRz+exnXWo=; b=EgIw32oLWCRlRqMHrx
	14RcuGB1TxGnOaYcrqy+fBiYGDARkRulBCDQWwziRA+Az1vbEl40+w0Z7/lyX5OJ
	EGoxG3/2FWaGsW2xfg0K849g6vfG8CtqtckHo0+NzG3lJR+EmQ/JNxBKw8BId2L6
	tgILwys7LQXOJf3l0YlIrC6YM=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wAH0s46eXdoG0BuFQ--.1985S2;
	Wed, 16 Jul 2025 18:04:49 +0800 (CST)
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
Subject: [PATCH v5 00/10] Add support for RK3588 DisplayPort Controller
Date: Wed, 16 Jul 2025 18:04:27 +0800
Message-ID: <20250716100440.816351-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAH0s46eXdoG0BuFQ--.1985S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZrWUZrWxJr4xWrWrWrykKrg_yoWrCr4fpa
	1UAry5JrWUWFW2qrs2kFn7Crs3Z3ZFy3yrKwn3J342vF12kFyUAwnIkFsxXr9rXF17AFW2
	krnxXr1xCFW7ZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jYbyZUUUUU=
X-Originating-IP: [103.29.142.67]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0h6MXmh3dDKLQAAAsM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_030527_290275_B1CA07F3 
X-CRM114-Status: GOOD (  14.68  )
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


There are two DW DPTX based DisplayPort Controller on rk3588 which
are compliant with the DisplayPort Specification Version 1.4 with
the following features:

* DisplayPort 1.4a
* Main Link: 1/2/4 lanes
* Main Link Support 1.62Gbps, 2.7Gbps, 5.4Gbps and 8.1Gbps
* AUX channel 1Mbps
* Single Stream Transport(SST)
* Multistream Transport (MST)
* Type-C support (alternate mode)
* HDCP 2.2, HDCP 1.3
* Supports up to 8/10 bits per color component
* Supports RBG, YCbCr4:4:4, YCbCr4:2:2, YCbCr4:2:0
* Pixel clock up to 594MHz
* I2S, SPDIF audio interface

The current version of this patch series only supports basic display outputs.
I conducted tests with DP0 in 1080p and 4K@60 YCbCr4:2:0 modes; the ALT/Type-C
mode was tested on Rock 5B, DP1 was tested on Rock 5 ITX by Stephen and Piotr.
HDCP and audio features remain unimplemented.
For RK3588, it's only support SST, while in the upcoming RK3576, it can support
MST output.


Changes in v5:
- Use drm_dp_read_sink_count_cap instead of the private implementation.
- Add MAINTAINERS entry.
- Link to v4: https://lore.kernel.org/linux-rockchip/20250619063900.700491-1-andyshrk@163.com/

Changes in v4:
- Drop unnecessary header files
- Switch to devm_drm_bridge_alloc
- Drop unused function
- Add platform_set_drvdata
- Link to v3: https://lore.kernel.org/linux-rockchip/20250403033748.245007-1-andyshrk@163.com/

Changes in v3:
- Rebase on drm-misc-next
- Switch to common helpers to power up/down dp link
- Only pass parameters to phy that should be set
- First introduced in this version.
- First introduced in this version.
- Add RA620 into bridge chain.
- Link to v2: https://lore.kernel.org/linux-rockchip/20250312104214.525242-1-andyshrk@163.com/

Changes in v2:
- Link to V1: https://lore.kernel.org/linux-rockchip/20250223113036.74252-1-andyshrk@163.com/
- Fix a character encoding issue
- Fix compile error when build as module
- Add phy init
- Only use one dw_dp_link_train_set
- inline dw_dp_phy_update_vs_emph
- Use dp_sdp
- Check return value of drm_modeset_lock
- Merge code in atomic_pre_enable/mode_fixup to atomic_check
- Return NULL if can't find a supported output format
- Fix max_link_rate from plat_data
- no include uapi path
- switch to drmm_encoder_init
- Sort in alphabetical order

Andy Yan (10):
  dt-bindings: display: rockchip: Add schema for RK3588 DPTX Controller
  drm/bridge: synopsys: Add DW DPTX Controller support library
  drm/rockchip: Add RK3588 DPTX output support
  MAINTAINERS: Add entry for DW DPTX Controller bridge
  dt-bindings: display: simple-bridge: Add ra620 compatible
  drm/birdge: simple-bridge: Add support for radxa ra620
  arm64: dts: rockchip: Add DP0 for rk3588
  arm64: dts: rockchip: Add DP1 for rk3588
  arm64: dts: rockchip: Enable DisplayPort for rk3588s Cool Pi 4B
  arm64: dts: rockchip: Enable DP2HDMI for ROCK 5 ITX

 .../display/bridge/simple-bridge.yaml         |    1 +
 .../display/rockchip/rockchip,dw-dp.yaml      |  150 ++
 MAINTAINERS                                   |    8 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |   30 +
 .../arm64/boot/dts/rockchip/rk3588-extra.dtsi |   30 +
 .../boot/dts/rockchip/rk3588-rock-5-itx.dts   |   59 +
 .../boot/dts/rockchip/rk3588s-coolpi-4b.dts   |   37 +
 drivers/gpu/drm/bridge/simple-bridge.c        |    5 +
 drivers/gpu/drm/bridge/synopsys/Kconfig       |    7 +
 drivers/gpu/drm/bridge/synopsys/Makefile      |    1 +
 drivers/gpu/drm/bridge/synopsys/dw-dp.c       | 2044 +++++++++++++++++
 drivers/gpu/drm/rockchip/Kconfig              |    9 +
 drivers/gpu/drm/rockchip/Makefile             |    1 +
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c     |  150 ++
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |    1 +
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h   |    1 +
 include/drm/bridge/dw_dp.h                    |   20 +
 17 files changed, 2554 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
 create mode 100644 drivers/gpu/drm/bridge/synopsys/dw-dp.c
 create mode 100644 drivers/gpu/drm/rockchip/dw_dp-rockchip.c
 create mode 100644 include/drm/bridge/dw_dp.h

-- 
2.43.0

base-commit: 6085a45a069d2aeab6bb3e5f3fdd32e259703106
branch: rk3588-dp-upstream-v5


