Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52D5F4368A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 09:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=R2jMQFmwoiQa0JSVWaha1MGxpeWtnEwnKFLdJY9xOhg=; b=ZWY3zRKTdrSCjP
	YilWvZ6soYXCCNvWTWshrUXe9JarXP02N+QF3JK2MonYJ8DgxJHeOro5LxXCPTPkyUpe1i765aLC+
	fP7akA8BfbXYgtx1WhxoKQ/YcTCbyA/T2YX3WspqdRcVXW2Z5vtuUliMNuatD1WOwEKLg+zOk8hF/
	gQLXcLxgqTB6OyYzTK3U6njNCN08wfUoAngU92F6Vqc57gWPr2yl1GCPDKIp12aUjQDppdA6HgRWc
	RYm8QdfY7jxcWNj6aIXZ3JpaVkYEQjaQ7goXOryVXM6Yv4ki0deqwCGBQV5dAP4keUZ4BuccOnF2X
	txVNAXXFcaoe7jgr8HNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfRv-00000003kfd-1VC0;
	Fri, 17 Apr 2026 09:25:21 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfRp-00000003ka0-0GTm;
	Fri, 17 Apr 2026 09:25:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417908;
	bh=IKJpLGqHW4jFrheW5fq3Ki7P44fJdkdTAa2m8hZWrGU=;
	h=From:Subject:Date:To:Cc:From;
	b=gOwMW371t5CJfkkZ+H9UIn5NHoLBQb54XbmKf/g7E/uRVj2F2+PgM0+Q170OSqbWO
	 JlJN5j50VCSl+DgFD+mg0+dOsD9ZunrG/oWOQZEHEvERMBxQoZxwNFaEZ9hYXWZRl+
	 j9wUIwIv7Ir1S541Tf1RVrf4H98TfdBRbrMsQkF2yAxiQhOOVKo2PNcHEUWkjr1LDt
	 u83gOhXiQ6AWtEqv90bgEQ6V9Pd+WQvdSDewK6V8XKvfZ+dekqHT3r3hh7o9AmOHAo
	 FzXFHFgyxwvbJsPtyNDemPJW2/3ZwcZURtHGvife4TQgE9gw5Iwh/ooZAUGh2vMkS4
	 BgiLlxGmF5OCA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D15FB17E127F;
	Fri, 17 Apr 2026 11:25:07 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH 00/40] arm64: dts: rockchip: Wire up frl-enable-gpios for
 RK3576/RK3588 boards
Date: Fri, 17 Apr 2026 12:24:34 +0300
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ6CQAxA4auQrm0ygGLwKobF/HSwSgbSAiEh3
 N1Rlt/ivR2UhEnhUewgtLLymDLKSwH+ZVNPyCEbKlM15lreMcyK8sEoA1KybiDsJx4VPbVtbYK
 LN28h15NQ5O1/fnandXFv8vNvB8fxBQtL3yt7AAAA
X-Change-ID: 20260417-dts-rk-frl-enable-gpios-ce9930dbf5ca
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_022513_246494_37F86515 
X-CRM114-Status: GOOD (  11.13  )
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

Several boards based on the RK3576 and RK3588(S) SoCs use a
GPIO-controlled voltage bias circuit on the HDMI data lines that must be
switched according to the active link mode: asserted for HDMI 2.1 FRL
and deasserted for HDMI 1.4/2.0 TMDS.

This series adds the frl-enable-gpios property to the HDMI nodes of all
boards for which the GPIO configuration could be identified from vendor
BSP kernel sources and/or schematics where available.  In a small number
of cases it was necessary to extract and disassemble the DTB from the
vendor firmware image.

One board remains unhandled (rk3588-edgeble-neu6a-io), pending
clarification from the vendor.

For each affected board the patches:
- set frl-enable-gpios with the appropriate GPIO reference and
  GPIO_ACTIVE_LOW polarity (inverted relative to the BSP enable-gpios /
  GPIO_ACTIVE_HIGH convention, which effectively acts as
  tmds-enable-gpios)
- extend pinctrl-0 of the HDMI node to include the new pin group
- add the corresponding pinctrl definition under &pinctrl

It's worth noting the Rockchip platform glue driver for the DesignWare
HDMI QP TX controller already drives the frl-enable GPIO, but since FRL
is not yet supported, TMDS mode is unconditionally selected.  This
ensures a consistent setup independent of hardware reset defaults and
bootloader state.

Furthermore, this allows removing a few DT quirks hardcoding the active
link mode and paves the way for a follow-up series enabling HDMI 2.1 FRL
support.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Cristian Ciocaltea (40):
      arm64: dts: rockchip: Add frl-enable-gpios to rk3576-100ask-dshanpi-a1
      arm64: dts: rockchip: Add frl-enable-gpios to rk3576-armsom-sige5
      arm64: dts: rockchip: Add frl-enable-gpios to rk3576-evb1-v10
      arm64: dts: rockchip: Add frl-enable-gpios to rk3576-evb2-v10
      arm64: dts: rockchip: Add frl-enable-gpios to rk3576-luckfox-core3576
      arm64: dts: rockchip: Add frl-enable-gpios to rk3576-nanopi-m5
      arm64: dts: rockchip: Add frl-enable-gpios to rk3576-nanopi-r76s
      arm64: dts: rockchip: Add frl-enable-gpios to rk3576-roc-pc
      arm64: dts: rockchip: Add frl-enable-gpios to rk3576-rock-4d
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588-armsom-sige7
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588-armsom-w3
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588-coolpi-cm5-evb
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588-coolpi-cm5-genbook
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588-evb1-v10
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588-evb2-v10
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588-firefly-itx-3588j
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588-friendlyelec-cm3588-nas
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588-h96-max-v58
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588-jaguar
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588-mnt-reform2
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588-nanopc-t6
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588-orangepi-5-max
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588-orangepi-5-plus
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588-orangepi-5-ultra
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588-roc-rt
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588-rock-5-itx
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588-rock-5b-5bp-5t
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588-tiger
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588s-coolpi-4b
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588s-gameforce-ace
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588s-indiedroid-nova
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588s-khadas-edge2
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588s-nanopi-r6
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588s-odroid-m2
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588s-orangepi-5
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588s-orangepi-cm5-base
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588s-radxa-cm5-io
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588s-roc-pc
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588s-rock-5a
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588s-rock-5c

 .../boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts      |  8 ++++++++
 arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts    |  8 ++++++++
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts        |  8 ++++++++
 arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts        |  8 ++++++++
 .../boot/dts/rockchip/rk3576-luckfox-core3576.dtsi      |  9 ++++-----
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts       |  8 ++++++++
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts     |  9 ++++-----
 arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts          |  8 ++++++++
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts         |  8 ++++++++
 arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts    |  9 +++++++++
 arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dts       | 16 ++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts  | 17 ++++++++++++++++-
 .../boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts     | 10 +++++++++-
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts        | 16 ++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts        |  9 +++++++++
 .../boot/dts/rockchip/rk3588-firefly-itx-3588j.dts      |  9 +++++++++
 .../dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts     | 16 ++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts     |  9 +++++++++
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts          | 10 +++++++++-
 arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dts     |  9 +++++++++
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi      | 16 ++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts  | 15 ++++++++++++++-
 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts | 16 ++++++++++++++++
 .../arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts |  9 ++++++++-
 arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dts          | 16 ++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts      |  9 ++++++++-
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi | 16 +++++++++++++++-
 arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts    |  3 ++-
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi          |  9 ++++++++-
 arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts      |  9 +++++++++
 arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts  |  8 +++-----
 .../arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts | 10 +++++++++-
 arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts   | 13 +++++++++----
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi     |  9 +++++++++
 arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts      |  9 +++++++++
 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi    |  9 +++++++++
 .../boot/dts/rockchip/rk3588s-orangepi-cm5-base.dts     |  3 ++-
 arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts   |  9 +++++++++
 arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts         | 15 ++++++++++++---
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts        | 10 +++++++++-
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts        | 10 +++++++++-
 41 files changed, 392 insertions(+), 35 deletions(-)
---
base-commit: 452c3b1ea875276105ac90ba474f72b4cd9b77a2
change-id: 20260417-dts-rk-frl-enable-gpios-ce9930dbf5ca


