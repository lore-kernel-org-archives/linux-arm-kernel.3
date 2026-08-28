Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49106C61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 15:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1r8mgzapUG70AxS67SmdFCEspk9BAKsN7JCX6Vq1IZs=; b=sfGFIMH4h1Owokh69OStL08af+
	xlcqBbtjS6by1dD8AfNjAL6P7800J0b++VtLUKoQmD4phHisdb/IpDcRZz6JjfG0FOz3C+Gryul3o
	jDVo+d7N2xXdY6k1spCuLZkdqRq4dtCnHfrEZLzR1futMNjCtIKypJhaujZmiRWslmwTPRQtsQz+w
	s0orIsKpJ8owujTfM/zeSIO3FzbXm0Qw29+Vb98xBfbG5qcU6eiPUJ2CV3lVOv1d75j28vbVz+DKL
	Gr2BiLyKDsXmJ/iOsQmoNgu4DnDQbHT7i1X90e3jORV7uNMV+tvB4ejiNdSdwcKUpI9Fih8xfj1ab
	OPWHoAcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzyx0-000000069Ir-0JWI;
	Fri, 28 Aug 2026 15:57:06 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzywx-000000069Hq-3Z54
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 15:57:05 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C907411C6A9;
	Fri, 28 Aug 2026 17:56:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787932617; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=1r8mgzapUG70AxS67SmdFCEspk9BAKsN7JCX6Vq1IZs=;
	b=QXHRWS8Ftl/OHc5pQBQZm6WwfyMJS3E+Hd2x5GkNxFYs4VC5WchnsdTD+2AzW/NpVGAHmo
	0fxZkLPt1PaUsp9NMimQf7ACjX9g+cyO/eBRra640jPoaoeEF5rSGqwUW0JK201Z0Tgynn
	kwOOTsslkXUmfUZQSo9zR79z2J2lbdy+7BL06pvLPIkIvg94qclaZ54Z9lgJBlUh3c6Vn/
	/6am0k5KC047K135FHn/I2xGm3vP3rE2Ughnl1hBuCihChi2rl4JHoLc/t0BEtlmrzCPXE
	0bl+vCtDYb58f0JtPA9vy/9tPqelhvVbc1JNNM1W4eOnCLc5TpD7YW9vXlcP6w==
From: Marek Vasut <marex@nabladev.com>
To: linux-usb@vger.kernel.org
Cc: fabrice.gasnier@foss.st.com,
	Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v4 0/4] arm64: dts: st: Add STM32MP2 USB support
Date: Fri, 28 Aug 2026 17:55:44 +0200
Message-ID: <20260828155647.353877-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_085704_028128_B9FA1DDA 
X-CRM114-Status: UNSURE (   8.09  )
X-CRM114-Notice: Please train this message.
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

Add USB support for STM32MP23xx/STM32MP25xx SoCs. This includes USB 2.0
FEMTO-PHY driver, DWC3 glue code and DT adjustments. Parts of this are
taken from ST downstream kernel fork, reduced, or rewritten, since not
all of the content there was useful and bits which might be missing and
are useful can be added later.

Unlike the downstream implementation, the DWC3 glue code is using plain
dwc3-generic-plat, the EHCI and OHCI controllers are instantiated as
plain generic controllers without any wrapper glue driver, and the USB2
PHY driver is simplified.

Both USB 2.0 Host controller and DWC3 super-speed controller are tested.

Depends:
- dt-bindings: usb: generic-ohci: Document ST STM32MP1 SoC compatibles
  https://lore.kernel.org/all/20260828150202.173109-1-marex@nabladev.com/
- dt-bindings: usb: generic-ehci: Document ST STM32MP1 SoC compatibles
  https://lore.kernel.org/all/20260828152130.176171-1-marex@nabladev.com/
- dt-bindings: phy: Document ST STM32MP25 USB2-FEMTO PHY
  https://lore.kernel.org/all/20260828150739.174460-1-marex@nabladev.com/
- dt-bindings: usb: dwc3: Document ST STM32MP2 DWC3 xHCI USB controller
  https://lore.kernel.org/all/20260828150937.174735-1-marex@nabladev.com/
- dt-bindings: arm: stm32: Document st,stm32mp23/25-syscfg subnodes and cells
  https://lore.kernel.org/all/20260828151216.175020-1-marex@nabladev.com/

Marek Vasut (3):
  dt-bindings: usb: generic-ohci: Document ST STM32MP2 SoC compatibles
  dt-bindings: usb: generic-ehci: Document ST STM32MP2 SoC compatibles
  arm64: dts: st: Add USB nodes on stm32mp231

Pankaj Dev (1):
  arm64: dts: st: Add USB nodes on stm32mp251

 .../devicetree/bindings/usb/generic-ehci.yaml | 21 ++++++
 .../devicetree/bindings/usb/generic-ohci.yaml | 21 ++++++
 arch/arm64/boot/dts/st/stm32mp231.dtsi        | 64 +++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi        | 63 ++++++++++++++++++
 4 files changed, 169 insertions(+)

Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-usb@vger.kernel.org

-- 
2.53.0


