Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47603CA5FE5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 19:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m0VvAogCPfC8hL2UvXxXnVJMr1C6NdDN0eRshYZll/E=; b=YN2KLgA4uTtdIKjtibGOvnr8WG
	iPp7F1X02XZBiVeTdiPNepM/tO494d5k4RdCdlL044Ry2VupPDMs9CqY0aeR/RQrltL8GMDO/CS94
	Hvld7udrpN3DGjwqIfj+XrgKtkAwWoAjJ86Dp/LJxYEfLYbuJevll3HjSglwfxYReH7rD/FMz3u6v
	wcUCEGcGoylEdB106tKwGatprWaXi9VAlg7f7vxtGOReYdQcdbgaY896cylVEFw8jd9TW+cKDbyNZ
	TE2bijEFfc8AMuQi3JK0PHxds97sHw9ySxkA7IgswmMcOf4lnmyD0J0oBCdrVDlI40J7Ivr01Dqbk
	9NVoqbVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCjHX-0000000CR2a-1Nv5;
	Fri, 02 Oct 2026 19:50:59 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCjHU-0000000CR1D-0erw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 19:50:58 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id C255FC0000D0;
	Fri,  2 Oct 2026 12:50:48 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com C255FC0000D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1790970648;
	bh=WiNBuEQv6dMvTXhO9orx74TnReKesSrj/Ai1PYKpad4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HEqIMhHd8hcJlFaIrYL6xLoVkeb0M3qDObAnx8przMPDOHpeVMmJ6mgMIOPyGAtig
	 GgaaF8WHin83kyHVL96lGK4UV0HiiIkp/iKCRktde3ebhOl3nsCqab34KMYvuLMNQ0
	 s8FtrbmqbIUg1Wbr3wGTydwkVC13mKYgI12pXQ1M=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 97BE5A88;
	Fri,  2 Oct 2026 12:50:48 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Daniel Drake <dan@reactivated.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Peter Robinson <pbrobinson@gmail.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/2] Broadcom devicetree-arm64 changes for 7.4
Date: Fri,  2 Oct 2026 12:50:46 -0700
Message-ID: <20261002195046.364682-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002195046.364682-1-florian.fainelli@broadcom.com>
References: <20261002195046.364682-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_125056_245253_1B504D97 
X-CRM114-Status: GOOD (  10.17  )
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

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-7.4/devicetree-arm64

for you to fetch changes up to 4db272ba40c09eafda1ec0a4d59c0423561c8f7a:

  arm64: dts: broadcom: bcm2712: Add GPU IOMMU and IOMMU cache nodes (2026-09-28 11:24:14 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs Device Tree changes
for 7.4, please pull the following:

- Peter adjust the display DT nodes status properties since it may not
  be used by default and therefore that must be done at the board level.
  He also adds the ARM PMU, thermal monitor (TMON), USB OTG nodes.

- Gregor adds the 2712D0 stepping compatible string because there is a
  need to differientate the D0 stepping to avoid crashes on boot when an
  incorrect DTB is selected. He also adds the SPI controller to the RP1
  southbridge chip

- Stanimir adds the RP1 PWM node

- Daniel adds the GPU IOMMU and IOMMU cache nodes to the 2712 DTS

----------------------------------------------------------------
Daniel Drake (1):
      arm64: dts: broadcom: bcm2712: Add GPU IOMMU and IOMMU cache nodes

Gregor Herburger (4):
      dt-bindings: arm: bcm2835: Add 2712-d0 Stepping
      arm64: dts: broadcom: bcm2712-d-rpi-5-b: add compatible
      arm64: dts: broadcom: rp1: add spi controller
      arm64: dts: broadcom: bcm2712-rpi-5-b: add spi0 interface

Peter Robinson (4):
      arm64: dts: broadcom: bcm2712: adjust display status
      arm64: dts: broadcom: bcm2712: add arm PMU
      arm64: dts: broadcom: bcm2712: Add thermal monitor
      arm64: dts: broadcom: bcm2712: Add USB OTG port

Stanimir Varbanov (1):
      arm64: dts: broadcom: rpi-5: Add RP1 PWM node

 .../devicetree/bindings/arm/bcm/bcm2835.yaml       |   6 +
 arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts |   5 +
 .../boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |  41 +++++++
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts   |  34 ++++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi          |  91 +++++++++++++++
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi       | 128 +++++++++++++++++++++
 6 files changed, 305 insertions(+)

