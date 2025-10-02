Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8990CCCA471
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 03:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cKw1uJeuzhTccwXSsS5SyPqw67ddifsNvAwsgyPZwyM=; b=NA+XTMQESnG751E0U8+zqR6pwm
	mYnsUrNiKU0UyYI9W43qvwALLmIazuzLiLFTrMBy2u6sYSsBeVGtX4G226RgPX08aZiX+Li3V0szW
	vj7D5BL2/rw4tw30zdKXcl7zdQ0+OWXvT1cstcXBc0LkoegTsMP7n+mbDkoS29FDtu1P8eCowcUYE
	DIcRBoZHfAxZueVKic3auuYWRhYZKcd28NTw9vXyywkbJb9Og/9eTsRsv53BNVjDjWj3PWcx9HfdN
	c0iy9xNc+PJuMYMTEQQu91bIP918ruLWvVyKP0HW8pCF7yFAwW6NzE6fmAuc6sAAOYtM8HLA4mrxT
	rceeqbJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4AHn-00000009YOi-4BgS;
	Thu, 02 Oct 2025 03:47:20 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4AHl-00000009YNg-1qjb;
	Thu, 02 Oct 2025 03:47:18 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 3146817D8;
	Thu,  2 Oct 2025 05:45:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759376745;
	bh=CqJTrZYTK3Z0ORhw23J/pfO/CDry02I1G+tj+KnzEhY=;
	h=From:To:Cc:Subject:Date:From;
	b=h+KLTpD26CpYFaq7lCJm7HyNWgLavxGZpu5BXNFW5yNQtTZHVkdTE6ZaqsylAOo+r
	 j8qoIPSiHxcPIiV7yB22e6fFMz2HZmgIDOwtu61rDBNj1eddvr/LTLEvhIEm1zwhrt
	 oHGZGXbBB3jTfg1Bs0Lovjo6kOThluY/yCb4bjSo=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: Algea Cao <algea.cao@rock-chips.com>,
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
Subject: [PATCH 0/3] arm64: dts: rockchip: Add device tree for the Orange Pi CM5 Base board
Date: Thu,  2 Oct 2025 06:47:05 +0300
Message-ID: <20251002034708.19248-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_204717_624386_9B7AC345 
X-CRM114-Status: GOOD (  12.47  )
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

The series starts by adding a new compatible for the board to
arm/rockchip.yaml. The next patch documents a missing property in the
rk3588-dw-hdmi-qp bindings that the device tree needs. Finally, the last
patch adds the device tree.

Patch 2/3 may be slightly controversial as the new DT property could be
better named. It has been supported in the driver for a year now, so
there could be users in the wild. I have therefore decided to keep the
current name. I am open to alternative solutions.

Laurent Pinchart (3):
  dt-bindings: arm: rockchip: Add Orange Pi CM5 Base
  dt-bindings: display: rk3588-dw-hdmi-qp: Document enable-gpios
    property
  arm64: dts: rockchip: Add rk3588s-orangepi-cm5-base device tree

 .../devicetree/bindings/arm/rockchip.yaml     |   6 +
 .../rockchip/rockchip,rk3588-dw-hdmi-qp.yaml  |   4 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../rockchip/rk3588s-orangepi-cm5-base.dts    | 342 +++++++++++++
 .../dts/rockchip/rk3588s-orangepi-cm5.dtsi    | 450 ++++++++++++++++++
 5 files changed, 803 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-cm5-base.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-cm5.dtsi


base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
-- 
Regards,

Laurent Pinchart


