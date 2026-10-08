Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D745BCA600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 16:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P5QqN91oq5UQdWOAGLusHuKZASEgHmUyhsRnptvmHmQ=; b=hIU5ml+2Bwe0+FkalEvtAlP5Oa
	2OLPz5XZICKcMbxy3UIPsdjthHLmybxKfDFqcwPhIDvrKmpJR8eFpSy5Qfk/8rdyOewi/3qZTJjN9
	MKdC5a+dODnHMrxovG68M7/Esh1Nspie7bFHCsMS4I23stn6gOUArzvpwv4tzBEyOiwJ1DHVLluvT
	IddI+tecEmp9eNtTGqenTT5ySIU7jX5bUedZYDm14kzP1cLoKd/olTTojqYprPjQdFuenP1hAh1Pb
	CAGZxkNKJZGUHbmGFZsUyfmKc0JlYPAW8iW908XGY+PJMaSW5JmV/v4YQcvfaypcalahVkytEFxM8
	odM3lCVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xErHO-00000004j68-0Fuc;
	Thu, 08 Oct 2026 16:47:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xErHN-00000004j5j-0ksb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 16:47:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9203E43502
	for <linux-arm-kernel@lists.infradead.org>; Thu,  8 Oct 2026 16:47:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2841F1F000FF;
	Thu,  8 Oct 2026 16:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791478056;
	bh=P5QqN91oq5UQdWOAGLusHuKZASEgHmUyhsRnptvmHmQ=;
	h=From:To:Cc:Subject:Date;
	b=ACPbM7F6MN1iZ8oNQ6xEzcyA5gR0Z2PehoZz+TkD1YJmcOc7mf+7dStRzhXapDwie
	 KlpLbCqjGp1Cjht/TULoaKmI0MqflCUbyCAE3UVtomJmlYAe/rF/r5Xr27Q03Qacyb
	 DwW3GUT726l9P7JysogKeO+00K208oNMn5QoZ1mwsB/ECks26AFcWk+Yexib+OaXaX
	 +x8XHDZCSEEFoRlB0pDRdwUckKG+wOW+DSMHSlHiIjh4mhNHtyXF6/SIMaXvAyognu
	 mh7dFEjZGBhvjXVUSYQKIlpjFX94apkQEYbVJdYkep5yhwP/gjONVJSbrFCzV2dl90
	 Yb2MAqw240bHQ==
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Cc: dinguyen@kernel.org,
	devicetree@vger.kernel.org
Subject: [GIT PULL 1/2] SoCFPGA DTS updates for v7.4
Date: Thu,  8 Oct 2026 11:47:35 -0500
Message-ID: <20261008164735.566333-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v7.4

for you to fetch changes up to 1c4d22949a77d82505188bf36a4bcae0cbdf699e:

  arm64: dts: altera: Move all SoCFPGA files to dts/altera (2026-10-08 11:25:18 -0500)

----------------------------------------------------------------
SoCFPGA DTS updates for v7.4
dt-bindings:
- Add the SOCDK eMMC and TSN config2 boards based on Agilex5
- Update the interrupts spec for the Stratix10 Service Layer
dts:
- Agilex5
   - Add FPGA manager, region, and USB3.1 node in the base DTSI
   - Add SD/eMMC on the SoCDK OOBE card
   - Add the SoCDK eMMC daughter board
   - Add support for the debug daughter card
   - Add support for the  SoCDK TSN Config2 board
- Add SDM interrupts for Agilex and Stratix10
- Move all Altera SoCFPGA dts files to dts/altera

----------------------------------------------------------------
Adrian Ng Ho Yin (3):
      arm64: dts: intel: agilex5: add USB3.1 controller node
      arm64: dts: intel: agilex5: remove usb0 in Agilex5 SoCDK
      arm64: dts: agilex5: add support for debug daughter card

Dinh Nguyen (3):
      arm64: dts: socfpga: agilex5: add FPGA manager and region nodes
      arm64: dts: socfpga: agilex5: Add SoCDK TSN Config2 board
      arm64: dts: altera: Move all SoCFPGA files to dts/altera

Mahesh Rao (3):
      dt-bindings: firmware: Add interrupt specification for Intel Stratix 10 Service Layer
      dts: stratix10: Add support for SDM mailbox interrupt for Intel Stratix10 SoCFPGA
      dts: agilex: Add support for SDM mailbox interrupt for Intel Agilex SoCFPGA

Nazim Amirul (1):
      dt-bindings: arm: altera: Add Agilex5 SoCDK TSN Config2 board

Tanmay Kathpalia (4):
      arm64: dts: agilex5: add SD/eMMC host controller
      arm64: dts: agilex5: enable SD card on SOCDK OOBE card
      dt-bindings: arm: altera: add Agilex5 SOCDK eMMC board variant
      arm64: dts: agilex5: add SOCDK eMMC daughter board

 Documentation/devicetree/bindings/arm/altera.yaml  |   2 +
 .../bindings/firmware/intel,stratix10-svc.yaml     |  10 ++
 arch/arm64/boot/dts/altera/Makefile                |  14 +-
 .../boot/dts/{intel => altera}/socfpga_agilex.dtsi |   2 +
 .../{intel => altera}/socfpga_agilex3_socdk.dts    |   0
 .../dts/{intel => altera}/socfpga_agilex5.dtsi     |  61 +++++++++
 .../boot/dts/altera/socfpga_agilex5_socdk.dts      | 146 +++++++++++++++++++++
 .../socfpga_agilex5_socdk_013b.dts                 |   0
 .../dts/altera/socfpga_agilex5_socdk_debug.dts     | 121 +++++++++++++++++
 .../boot/dts/altera/socfpga_agilex5_socdk_emmc.dts | 123 +++++++++++++++++
 .../socfpga_agilex5_socdk_modular.dts              |   0
 .../socfpga_agilex5_socdk_nand.dts                 |   0
 .../socfpga_agilex5_socdk_tsn_cfg2.dts}            |  40 ++++--
 .../dts/{intel => altera}/socfpga_agilex72.dtsi    |   0
 .../{intel => altera}/socfpga_agilex72_socdk.dts   |   0
 .../{intel => altera}/socfpga_agilex7m_socdk.dts   |   0
 .../dts/{intel => altera}/socfpga_agilex_n6000.dts |   0
 .../dts/{intel => altera}/socfpga_agilex_socdk.dts |   0
 .../socfpga_agilex_socdk_emmc.dts                  |   0
 .../socfpga_agilex_socdk_nand.dts                  |   0
 .../dts/{intel => altera}/socfpga_n5x_socdk.dts    |   0
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi  |   4 +
 arch/arm64/boot/dts/intel/Makefile                 |  12 --
 23 files changed, 510 insertions(+), 25 deletions(-)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex.dtsi (99%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex3_socdk.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex5.dtsi (93%)
 create mode 100644 arch/arm64/boot/dts/altera/socfpga_agilex5_socdk.dts
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex5_socdk_013b.dts (100%)
 create mode 100644 arch/arm64/boot/dts/altera/socfpga_agilex5_socdk_debug.dts
 create mode 100644 arch/arm64/boot/dts/altera/socfpga_agilex5_socdk_emmc.dts
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex5_socdk_modular.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex5_socdk_nand.dts (100%)
 rename arch/arm64/boot/dts/{intel/socfpga_agilex5_socdk.dts => altera/socfpga_agilex5_socdk_tsn_cfg2.dts} (73%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex72.dtsi (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex72_socdk.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex7m_socdk.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex_n6000.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex_socdk.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex_socdk_emmc.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex_socdk_nand.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_n5x_socdk.dts (100%)

