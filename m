Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95AC1CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 17:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yRMFVN1HT6+zFmJEuXLl/iU0H6OSpKVPa/q1510L2Gg=; b=WXYuM3w0XrN6ykYzgyETLHm5QQ
	ICsGMp/d2AUxyi5VaOcVmdjbZmWAokdLSh5OoHyhME1Krx7l/q6Tq9671Y+LPyKzMo7Oye3GZegpe
	uoRXHsmfFRb4mL9cqvaT/q/ToBAl/95dP8NRaNx57EQjx293ndsKRtSwnkVUdg5AkJwLt1dDkOcXr
	MmWmXlQ7bYukiIpt7rD7pXC8eqtQyY+Jdpzi35OLiBji0z4wvvZ5wlXE97FLBMr5EsUMSyka+l5oy
	owJs9hNa3FjGBhT2Wf3DgtCc1oHhJb3wYXFjJu/31yv80MOumxso7c/2Tx8aKv2QgV9nrjeRdnEfT
	0dINSSWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCKuY-00000009u1i-0GvY;
	Thu, 01 Oct 2026 17:49:38 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCKuV-00000009u0Z-3Ow1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 17:49:37 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 2FE9A1FDEB;
	Thu,  1 Oct 2026 19:49:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790876971;
	bh=yRMFVN1HT6+zFmJEuXLl/iU0H6OSpKVPa/q1510L2Gg=; h=From:To:Subject;
	b=1K4JJy8iJ1DAPpa9k4NWY3Nys+u9mkuzQXupISnjMuxu+mZu6ozmlR//fIKOAihWC
	 r2nImulR4aC4jS/GoVxvZEp+25xnF3AX7e3y7W8Sl6Eax3mS3QeOPcIE2xPHfbs86N
	 5GRDYJTnwHxjirMH6hUZvLKb8Re9Trt1bMUO6/e/xKnFB0/MeUFiG2oIl+wVFJUfXH
	 T5Qw94fn9uKlGdwhepijyridjzaaOEPRCsA/cl6vQ03+D0WpmA3LHSQz9NlrKi7/Rr
	 f/jT0CqqsyEDU/5dEr5P+gOj239v+Vqs7cWhQYaEYOeOwfiM3i6jp32G/5xP80mtYD
	 Jjg8pntUBiqIg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/7] ARM: dts: imx6ull-colibri-emmc: Add DPI display and VGA overlays
Date: Thu,  1 Oct 2026 19:49:09 +0200
Message-ID: <20261001174924.3831455-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_104936_005655_0409180F 
X-CRM114-Status: GOOD (  12.73  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add device tree overlays for the Toradex display accessories on the
Colibri iMX6ULL eMMC parallel RGB LCD interface, mirroring what was
recently merged for the Colibri iMX7 eMMC:

 - Capacitive Touch Display 7" Parallel, touch on the 10-way Capacitive
   Touch Interface connector (Iris v2, Aster)
 - Capacitive Touch Display 7" Parallel, touch through the Capacitive
   Touch Adapter (Eval v3)
 - Resistive Touch Display 7" Parallel (Eval v3)
 - VGA output through a non-programmable video DAC (Aster, Eval v3,
   Iris, Iris v2)

The panel, backlight and LCDIF part of each overlay is identical between
the two modules, both using the same LCDIF binding and labels. Instead
of duplicating it, each patch moves that part out of the corresponding
Colibri iMX7 eMMC overlay into a dtsi shared by the two modules and
includes it from both. Only the Atmel MaxTouch wiring, the conflicting
PWM channels and the BL_ON pinctrl and GPIO driving the VGA DAC power-save
input stay in the SoC specific overlays. The shared files follow the
imx6ul-imx6ull-*.dtsi naming already used in the same directory.

The first three patches are fixes needed before the rework. Patch 1
(from Emanuele) drives the VGA DAC power-save input through the BL_ON
signal, without it the Eval and Aster carrier boards show a black image.
Patch 2 adds the Colibri iMX7 eMMC touch adapter and resistive touch
.dtbo to dtb-y, as they were built only as a dependency of the combined
DTBs and never shipped by dtbs_install. Patch 3 aligns the Colibri
iMX6ULL backlight brightness levels with the Colibri iMX7 ones, the LED
driver of the 7" displays turns off below roughly 15% duty cycle and only
the three highest of the current levels produced a visible image.

Emanuele Ghidoli (1):
  ARM: dts: imx7d-colibri-emmc: Enable the VGA DAC

Francesco Dolcini (6):
  ARM: dts: imx7d-colibri-emmc: Add missing touch display overlays to
    dtb-y
  ARM: dts: imx6ull-colibri: Align backlight brightness levels with
    Colibri iMX7
  ARM: dts: imx6ull-colibri-emmc: Add Toradex Capacitive Touch Display
    7" Parallel
  ARM: dts: imx6ull-colibri-emmc: Add Toradex Capacitive Touch Display
    7" Parallel with Touch Adapter
  ARM: dts: imx6ull-colibri-emmc: Add Toradex Resistive Touch Display 7"
    Parallel
  ARM: dts: imx6ull-colibri-emmc: Add VGA overlay

 arch/arm/boot/dts/nxp/imx/Makefile            | 47 ++++++++++++++
 ...ap-touch-7inch-parallel-touch-adapter.dtso | 46 ++++++++++++++
 ...i-emmc-panel-cap-touch-7inch-parallel.dtso | 31 ++++++++++
 ...i-emmc-panel-res-touch-7inch-parallel.dtso | 16 +++++
 .../dts/nxp/imx/imx6ull-colibri-emmc-vga.dtso | 24 ++++++++
 .../arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi |  4 +-
 ...olibri-panel-cap-touch-7inch-parallel.dtsi | 29 +++++++++
 ...olibri-panel-res-touch-7inch-parallel.dtsi | 30 +++++++++
 .../dts/nxp/imx/imx6ull-imx7-colibri-vga.dtsi | 61 +++++++++++++++++++
 ...ap-touch-7inch-parallel-touch-adapter.dtso | 16 +----
 ...i-emmc-panel-cap-touch-7inch-parallel.dtso | 16 +----
 ...i-emmc-panel-res-touch-7inch-parallel.dtso | 18 +-----
 .../dts/nxp/imx/imx7d-colibri-emmc-vga.dtso   | 49 +++------------
 13 files changed, 298 insertions(+), 89 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-panel-cap-touch-7inch-parallel-touch-adapter.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-panel-cap-touch-7inch-parallel.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-panel-res-touch-7inch-parallel.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-vga.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-imx7-colibri-panel-cap-touch-7inch-parallel.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-imx7-colibri-panel-res-touch-7inch-parallel.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-imx7-colibri-vga.dtsi

-- 
2.47.3


