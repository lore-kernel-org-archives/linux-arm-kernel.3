Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D4ECCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 21:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GwijoFDAFi9ccx8HhnpL/QQnyuPRpaB7K4GJppn+trQ=; b=BMkl2VS20x1CjT/pwNSnNNWwK3
	ThaWR6e0TafICHJGj3Xg/mAcNXxQq3yrrvR/BFiwLAnalwBgjFl1HP2pRf/15Wx7itBuScyKHihjG
	WtrdjfIxU5KGaz4mPgqVggafnhHEhvK7OO15HNCHaOzJrgZHUaJX9srKCG1VmPv/DugWsXmmwRFvb
	jUCpoa0a5hGdgW6t6jWzljt/3AfWGuNmOh9iKJCSDV0J3J4/V5ox0MY7tAd0yMYY/tKfkYgGLXzNt
	ZiYle+HbrmrAoWvDu/BI42ZDUY8ZTDuQTdnI/wSSgCcp5qckiz/qtpWpEHHg86E7GQ+luXhEoldCD
	EIxbY0tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVD3-0000000EoNt-0YPQ;
	Mon, 27 Oct 2025 21:57:01 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVCz-0000000EoMU-3Oo4;
	Mon, 27 Oct 2025 21:56:59 +0000
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B711B1858;
	Mon, 27 Oct 2025 22:55:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761602104;
	bh=+K+gUmZB3sJXbuD9oZaHn/RXL88yKQAGTqo6IXebcCA=;
	h=From:To:Cc:Subject:Date:From;
	b=taEpqCIyc9yIB+cDO+IBAfhE5FTWMx5vcrePdu8BF+kAqPO6E45jWfnjm1hhOG3hf
	 XVDYuEEuD/LNZED5UJqD9Ee7vyoojj9cWI2edLciogB8TQftWJPra7HsqdKM/Xd7rf
	 7sxwRFfcfijATSgdmU3k8yryJflNp2G52iqLwAVc=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: Conor Dooley <conor+dt@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 0/2] arm64: dts: rockchip: Add device tree for the Orange Pi CM5 Base board
Date: Mon, 27 Oct 2025 23:56:34 +0200
Message-ID: <20251027215637.20715-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_145658_307665_93D3B483 
X-CRM114-Status: GOOD (  14.89  )
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

The series is quite straightfoward. Patch 1/2 adds a new compatible for
the board to arm/rockchip.yaml, and patch 2/2 adds the device tree for
the board.

Compared to v2, I have replaced the tmds-enable-gpios support with a
pull-up on the signal in the device tree to unconditionally select TMDS
mode. FRL mode will be brought back once it gets supported by the HDMI
driver. This should allow merging this series without any dependency on
driver changes.

Laurent Pinchart (2):
  dt-bindings: arm: rockchip: Add Orange Pi CM5 Base
  arm64: dts: rockchip: Add rk3588s-orangepi-cm5-base device tree

 .../devicetree/bindings/arm/rockchip.yaml     |   6 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../rockchip/rk3588s-orangepi-cm5-base.dts    | 355 +++++++++++++
 .../dts/rockchip/rk3588s-orangepi-cm5.dtsi    | 473 ++++++++++++++++++
 4 files changed, 835 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-cm5-base.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-cm5.dtsi


base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
-- 
Regards,

Laurent Pinchart


