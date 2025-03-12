Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCCCC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 10:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GQ4IVqd5vthdWR02fI9OyUNtDn4aPkc2JVI2vLesiR0=; b=TGxVCYn353ZSSoAxLZtgTFTzg6
	Y+NyzfGe2YeVEu+RlfuoaJcWAfiqgRFTloTpSR/npCTUDdzS5SCHT7pOTjDnIyHAF2gw8CBS1V6BP
	abNGllNQeS1DKkt9fhcP6Fl0wg1e40+XjDySXJ0A3xjQZUVntNnCQKnNDl4VfalRrfNf6PLHeBa9G
	9aZHHIVWi4CbdMg2yIWsgSdiEhCqRweXFVCpUlti6/duPUAAjhXLpTjZKRKivZXbdyqlM2cM+iRF3
	uePGwvwCi+YZepstiDmM4o8OlkmDt86TDtFlNpQ/m5wAGMq7d8UzI8Xu7HB6xCm58sbB04otKQ2cE
	S1Bas5mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJZf-000000088rw-0bBS;
	Wed, 12 Mar 2025 10:44:31 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJXz-000000088P8-3RjK;
	Wed, 12 Mar 2025 10:42:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=GQ4IV
	qd5vthdWR02fI9OyUNtDn4aPkc2JVI2vLesiR0=; b=ANNYtaSf1E+HNkgWNmblD
	sN/JzKkrCvR/x+aj6ww/i3Es/DN7RQ33c/W02J+Feh1WVcAPveoFwZUAm9yrTL/3
	ai9/3afvJwHLTKTVckkyRQetOicmV61u3k3/CBsfMw6xaBaF4sXEhvuVf/dO/tGP
	ewJ/up5SIgy+cZyWz2jwto=
Received: from ProDesk.. (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgAHUvcHZdFnEN_+Kg--.14177S2;
	Wed, 12 Mar 2025 18:42:19 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com,
	mripard@kernel.org,
	cristian.ciocaltea@collabora.com,
	neil.armstrong@linaro.org,
	yubing.zhang@rock-chips.com,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	lumag@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v2 0/7] Add support for RK3588 DisplayPort Controller
Date: Wed, 12 Mar 2025 18:42:01 +0800
Message-ID: <20250312104214.525242-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PSgvCgAHUvcHZdFnEN_+Kg--.14177S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZrWUZrWfWry5CFW7Gr1rJFb_yoWrGryDpa
	1jyry5try8uFW2qFs2k3WDCrZ3Z3ZFyrWrGwn7Ja42vFy2kFyUArna9FsxXr9rJFnrAFy2
	krsxXryxGrW2qF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UWrWwUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gsOXmfRXiailwABsz
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_034248_274125_57ADB60C 
X-CRM114-Status: GOOD (  14.60  )
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

This version still has unresolved issues highlighted by Dmitry during
the last code review(I add TODO for them), specifically those depending
on PHY/drm bridge framework changes. My plan is to tackle them sequentially.
Let's make the driver itself to a usable and good shape first.

Currently, there are three dependencies PATCH pending review, take care
if there are someone want to here a try with this series[0][1][2]:

[0]https://lore.kernel.org/linux-rockchip/20250302115257.188774-1-andyshrk@163.com/
[1]https://lore.kernel.org/linux-rockchip/20250312064218.524143-1-andyshrk@163.com/T/#u
[2]https://lore.kernel.org/linux-rockchip/20250312080041.524546-1-andyshrk@163.com/T/#u


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

Andy Yan (7):
  dt-bindings: display: rockchip: Add schema for RK3588 DPTX Controller
  drm/bridge: synopsys: Add DW DPTX Controller support library
  drm/rockchip: Add RK3588 DPTX output support
  arm64: dts: rockchip: Add DP0 for rk3588
  arm64: dts: rockchip: Add DP1 for rk3588
  arm64: dts: rockchip: Enable DisplayPort for rk3588s Cool Pi 4B
  arm64: dts: rockchip: Enable DP2HDMI for ROCK 5 ITX

 .../display/rockchip/rockchip,dw-dp.yaml      |  150 ++
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |   30 +
 .../arm64/boot/dts/rockchip/rk3588-extra.dtsi |   30 +
 .../boot/dts/rockchip/rk3588-rock-5-itx.dts   |   37 +
 .../boot/dts/rockchip/rk3588s-coolpi-4b.dts   |   37 +
 drivers/gpu/drm/bridge/synopsys/Kconfig       |    7 +
 drivers/gpu/drm/bridge/synopsys/Makefile      |    1 +
 drivers/gpu/drm/bridge/synopsys/dw-dp.c       | 2106 +++++++++++++++++
 drivers/gpu/drm/rockchip/Kconfig              |    7 +
 drivers/gpu/drm/rockchip/Makefile             |    1 +
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c     |  154 ++
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |    1 +
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h   |    1 +
 include/drm/bridge/dw_dp.h                    |   19 +
 14 files changed, 2581 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
 create mode 100644 drivers/gpu/drm/bridge/synopsys/dw-dp.c
 create mode 100644 drivers/gpu/drm/rockchip/dw_dp-rockchip.c
 create mode 100644 include/drm/bridge/dw_dp.h

-- 
2.34.1


