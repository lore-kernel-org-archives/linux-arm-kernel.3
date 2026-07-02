Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562CBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 14:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/7XOl3w91hOUbQxmzIR2m5YIz3vbahuHJqb9BRaXCj0=; b=wDnuad9fw5/bt/kSRa+nr8JCPZ
	ZmRy9OeWYfl7MWNPILOS/IPo+PT3FPJVxrdulMw3Wp6RV4IUy8PI0JXDsvzDC/GDmLiGNZ7YwTGy2
	zXhZneay0NzN9fzgjtg42rvSz/0bTZll0ozsTTv/PUPtrwmGdw9VGLlQa+1VlZvgUoCXgM1bOeOBS
	P/kjVJFiyWQhrvbcsW3CLxz6UC+5thf47Ijs7CaeGRUepLFT+kVRPEskLbHJqi+r/13cSxSJVpoqP
	UMrwk9o3VunXD3j0e4OqlJwGjr23kQ2Tb/7pStnsPMyI3WmKpNbZUx1Mjni/0JX2atKQpIEJCXAc2
	l5/A+Zvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfI4e-00000004afV-3AdB;
	Thu, 02 Jul 2026 14:07:28 +0000
Received: from out203-205-221-209.mail.qq.com ([203.205.221.209])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfI4b-00000004aed-29ox;
	Thu, 02 Jul 2026 14:07:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1783001241; bh=/7XOl3w91hOUbQxmzIR2m5YIz3vbahuHJqb9BRaXCj0=;
	h=From:To:Cc:Subject:Date;
	b=wVvJgs6PeVibewGukVv6ROeFdxW964IpTzNl5KXqKOfnkCN6/TJPXIxjY9s07zLU1
	 tvsjPYCQtqWnSwlZq+IwMCidFZxX3p0ZDy+xPAx5NoTs/qcmFmcbP24SV13pnOmblT
	 R7YX+AGKcCYk0oYZbkAuQEyns3bQ6GqFB2prxyWU=
Received: from localhost.localdomain ([218.4.149.66])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 1D09A800; Thu, 02 Jul 2026 22:07:16 +0800
X-QQ-mid: xmsmtpt1783001236tk28nalud
Message-ID: <tencent_87CB2824608F3C06B4229EF99D3609D00C0A@qq.com>
X-QQ-XMAILINFO: N8W06kCOZCa5FMwEcpxJJHVidSk1vAQDcjFuBk+i1xLcvE7AwoAWrF++TN0smv
	 Gr3j9IxC0UQ391iXGpPWSkN4JYX0zKhJO7OQb6bQWhKxrqDrXHM0EPB+KiAKzx0IwzBvAEF/K9R2
	 2NurbZc1zi470K+bSeczhW3BZeTcOgNAOqoVE3ldSeTSdVQtIS+PuLOQrFMHewM+URGU2AGJcEMk
	 6+EujMyIJ5o9rGNzCr8nL64pe56ysvOTjXGzVTdDQydXwM1W2Sbfk9fAAThmjHOPaYYkpkBwSFBd
	 y8xQIOp0D6tzECChyMK/6lAy14Emj5fnkGuv1EAAjIZuX+BqnaDOZqs6zKvlmHwE0HTDshnu9Xdb
	 1swkq53h7WCdr+4heDN259cyT/vBnn0xlAh0knCBNcaa9H6EGqwTAEHNGG23e1M/PYx85b+S5Pzm
	 ttUUK5QLqMBLkB1XaxWvVXTidpuyHghtXzlO2bRBEf2VeJIvc0HfvKk/JyPxtK9+sOor+W6d+2U8
	 MOQiKXpg214JPFWbAye8ZDLmr33Lk9T8wl/vQm/20dvx1+0hTjLeFodh4yTO7BTDiUp568Q+SHS3
	 JldRy6StxtbG8FUrZ/I8s/nAeDRrKCnZOkYWA9kTgpQ/aMLNNLWZTyu5Wo26tYnXiZQNEeDVJoPf
	 UM6hkzYc10IF9VvCjJEpxoFR/6QmJBv6omPiXZWZ23ar77vVd3GCZBRPN1DY07CCnQL6qCKIwUgT
	 1bHf3Vg9H6XGtjYZr1IXnIxcjNtb/vQIw0jpM0O7nAkdRmnQNXhLXvNiny/j5Qb+w/ACbHIthTAw
	 GHOgRKZgwyTBm31xB2An0HeDWQO6ZhUqzBX1qOrrY+PVUEBTOvRjsIHyHg1sH7+kBN9QbNsnhdWp
	 K4F0u9N7c8R8BL1zlYGyY5qmq2VVwgP7QF7R5+SB6EtFy3YsJpMNs8xEhH2R6D/wFcafogzmAKrP
	 eQ4ZEm6ioTvpMjzTSTbuBn1RB52DIoiWxtrjrANPFav4yhV9/7jZKWEcTgIHhhIzmRKvZonrTBj2
	 L3jkVvRzq0zCd2QWjy
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: 1579567540@qq.com
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	linux-can <linux-can@vger.kernel.org>
Cc: Vincent Mailhol <mailhol@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	kernel <kernel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Eric Biggers <ebiggers@kernel.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Yixun Lan <dlan@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-rockchip <linux-rockchip@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Cunhao Lu <1579567540@qq.com>
Subject: [PATCH v2 0/4] can: rockchip: add RK3588 CAN support
Date: Thu,  2 Jul 2026 22:06:50 +0800
X-OQ-MSGID: <20260702140654.2961561-1-1579567540@qq.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_070725_877562_A2944E3F 
X-CRM114-Status: GOOD (  13.10  )
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

From: Cunhao Lu <1579567540@qq.com>

Add support for the RK3588 CAN controller.

RK3588 integrates three CAN-FD controllers that are closely related to
the existing Rockchip CAN-FD IP already supported in the kernel. The
RK3588 variant is not fully compatible with RK3568v2 because the RX
FIFO count register field has a different layout.

This series therefore:

- extends the existing Rockchip CAN-FD binding with the
  rockchip,rk3588-canfd compatible
- adds a dedicated RK3588 match entry and devtype in the driver
- describes the three CAN controller nodes in rk3588-base.dtsi
- enables CAN on the RK3588 Tiger Haikou board

RK3588 encodes RX_FIFO_CNT in bits 7:5 instead of 6:4. This
difference was found by comparing Rockchip's vendor kernel 6.1 CAN
support for RK3568 and RK3588, and was also confirmed by runtime
testing.

RK3588 uses the existing erratum 5 empty-FIFO workaround. Based on
Heiko's testing, v2 also enables the erratum 6 workaround for extended
frames being transmitted as standard frames.

RKCANFD_QUIRK_CANFD_BROKEN remains enabled for RK3588, so CAN-FD stays
disabled for now. Local testing did not reproduce the two known CAN-FD
trigger frames that cause Error Interrupts on RK3568 variants. Instead,
RK3588 shows a different CAN-FD failure mode: CAN-FD frames without BRS
work in this setup, but BRS with a data bitrate different from the
nominal bitrate immediately drives the controller bus-off.

Tested on an embedfire,rk3588-lubancat-5io board with can0/can1
directly connected. Runtime testing used a 200 MHz CAN clock, nominal
bitrate 500 kbit/s, data bitrate 500 kbit/s and 1 Mbit/s, and included stress and
error-path coverage for the existing Rockchip errata handling.

Changes in v2:
- use real author name
- fold the single-compatible entries into an enum, as suggested by Krzysztof
- enable the erratum 6 workaround for RK3588 based on Heiko's testing
- add Heiko's RK3588 Tiger Haikou CAN enablement patch
- keep RKCANFD_QUIRK_CANFD_BROKEN enabled for RK3588 so CAN-FD stays disabled
- document the RK3588 CAN-FD/BRS bus-off failure mode

Cunhao Lu (3):
  dt-bindings: can: rockchip: add rk3588 CAN-FD compatible
  can: rockchip: add RK3588 CAN support
  arm64: dts: rockchip: add CAN-FD nodes for RK3588

Heiko Stuebner (1):
  arm64: dts: rockchip: Enable CAN controller on RK3588-Tiger-Haikou

 .../net/can/rockchip,rk3568v2-canfd.yaml      |  4 +-
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 39 +++++++++++++++++++
 .../boot/dts/rockchip/rk3588-tiger-haikou.dts |  6 +++
 .../net/can/rockchip/rockchip_canfd-core.c    | 12 ++++++
 drivers/net/can/rockchip/rockchip_canfd-rx.c  |  5 ++-
 drivers/net/can/rockchip/rockchip_canfd.h     | 26 ++++++++++++-
 6 files changed, 89 insertions(+), 3 deletions(-)

-- 
2.34.1


