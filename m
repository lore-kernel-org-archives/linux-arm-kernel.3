Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1DBBCCD185
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Oct 2025 23:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vVCn/YoOGX1nbALwREUJkJ6YC6c8Bqx90K6+/yCtxMo=; b=Wm3cIc9ALMDnJGKFzgLH8n8q5K
	tkp6rf6fbCJl/Yj6Mr+QDy6RqhTRu+MphtBjcdRxX63aKV2yIJoVTwmPKTOZefOkpWvX1CjDqAnqk
	ePUJrgzkzD8/0mc/4huZFLdxExd1/dqwxWO78RunrFegbeW7BQ2f/xgPPJgiXviybfriZ4RWWTxhx
	5i+PKJqsYYA7XJDV8tL/I2CkmSfMUURfDTqGHwmYUOCMXVO6uADaHWMmq4kO8yAyJ6pnP1RxjqkVQ
	vY8cxwJ4kW1xjMmd5qeTw1k25vKseMP56mm3qidlEOE7m8uidWvv8kCuDAW1dpg91Vr9beHmnRh1C
	IEA4ehyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5Ya6-0000000GkaQ-3Yy9;
	Sun, 05 Oct 2025 23:55:58 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5Ya3-0000000GkW1-3r9Z;
	Sun, 05 Oct 2025 23:55:57 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9FAAC11AE;
	Mon,  6 Oct 2025 01:54:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759708456;
	bh=H6DUy7gUUFzf7L9G58j7/brWtZ1vdQDbJMU7TIx2b+s=;
	h=From:To:Cc:Subject:Date:From;
	b=dNmIR7tdjJz+LYW1VSS0Y7dcW6TLI9FViOmnzeC7yViytgHDpSdGEyPvjxxFapuUk
	 /7SrVAUPeep41iQdUU0CO2lK/t60W+xSkisdTPazs+fjlf4VOx7zUpZkyO2Smt6BZg
	 4PKwXuHeKlgX/7HSFG41gdaqodKY/AakpMeTU2bw=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: Alexey Charkov <alchark@gmail.com>,
	Algea Cao <algea.cao@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Cenk Uluisik <cenk.uluisik@googlemail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Muhammed Efe Cetin <efectn@6tel.net>,
	Ondrej Jirman <megi@xff.cz>,
	Rob Herring <robh@kernel.org>,
	Sandy Huang <hjc@rock-chips.com>
Subject: [PATCH v2 0/5] arm64: dts: rockchip: Add device tree for the Orange Pi CM5 Base board
Date: Mon,  6 Oct 2025 02:55:36 +0300
Message-ID: <20251005235542.1017-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251005_165556_090974_27A767BB 
X-CRM114-Status: GOOD (  13.97  )
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

Hello,

This patch series adds a device tree for the Orange Pi CM5 Base board
from Xunlong. This is a combination of a compute module and a carrier
board, so the device tree is split in two files.

The work is based on a combination of upstream device trees for other
RK3588-based Orange Pi boards and the downstream device tree, all
checked against the available schematics for the carrier board. The
compute module schematics is unfortunately not available.

The series starts with three patches that add a new tmds-enable-gpios
property to the rk3588-dw-hdmi-qp DT binding (1/5) and update the driver
accordingly (2/5 and 3/5). Those patches have been authored by Cristian
Ciocaltea as part of a larger series, I have incorporated them here
as-is.

Patch 4/5 then add a new compatible for the board to arm/rockchip.yaml.
The last patch (5/5) adds the device tree for the board.

Patches 2/5 and 3/5 could be merged separately through the DRM tree,
but patch 1/5 needs to be merged with the device tree in 5/5 to avoid
introducing DT validation warnings. I'd appreciate advice from the DT
maintainers regarding how to handle this, as I have been told before
that DT bindings and DT sources can't be merged through the same tree.

Cristian Ciocaltea (3):
  dt-bindings: display: rk3588-dw-hdmi-qp: Add tmds-enable-gpios
    property
  drm/rockchip: dw_hdmi_qp: Improve error handling with dev_err_probe()
  drm/rockchip: dw_hdmi_qp: Fixup usage of enable_gpio member in main
    struct

Laurent Pinchart (2):
  dt-bindings: arm: rockchip: Add Orange Pi CM5 Base
  arm64: dts: rockchip: Add rk3588s-orangepi-cm5-base device tree

 .../devicetree/bindings/arm/rockchip.yaml     |   6 +
 .../rockchip/rockchip,rk3588-dw-hdmi-qp.yaml  |  10 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../rockchip/rk3588s-orangepi-cm5-base.dts    | 346 +++++++++++++
 .../dts/rockchip/rk3588s-orangepi-cm5.dtsi    | 473 ++++++++++++++++++
 .../gpu/drm/rockchip/dw_hdmi_qp-rockchip.c    |  70 ++-
 6 files changed, 864 insertions(+), 42 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-cm5-base.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-cm5.dtsi


base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
-- 
Regards,

Laurent Pinchart


