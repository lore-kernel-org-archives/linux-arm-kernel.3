Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621A2C54F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 03:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eDfRrZTgJlpfiEUAysiN58zud/Ic2eIBAuMILV71YM8=; b=Qt9LKE0+mmftla+NCw+EoZUQGg
	TJSr0bqTc9KnfRwXiMNfkYhg/JNTt8/xHj5/aLd63KHR/ecQpXRSF7Qgd8bdLZk8C0g32U2y34bWT
	HlpouKB54F/NEPIAkuRzxFnaAgVlq2qW9gpqE87lNySlSlk5kNm7iW6e0Z/qcQJMboDULFuEHpLGW
	IyeMLEcW+5W478PMuQe9lnHUj0IlWZ+l3OXaFqAQULe7Irl7BO0V+hLLIHQazDsr6rbaZAXbn6Yb5
	P4OPEBxgZpXXsKocKyVC0Eq0QsSezcTksBgiDWBLFbFcQC1MkiyuSiAeL0cN9Rz1DqOQCByJgkFGw
	grLuTPvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wout0-00000006kio-0X3d;
	Wed, 29 Jul 2026 03:23:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wousy-00000006kii-42zD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 03:23:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3690340146
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 03:23:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B14F51F000E9;
	Wed, 29 Jul 2026 03:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785295390;
	bh=eDfRrZTgJlpfiEUAysiN58zud/Ic2eIBAuMILV71YM8=;
	h=From:To:Cc:Subject:Date;
	b=LqrMhi3veXDAQ4EfyF3/HS6VxaEHpGSe0j/+dQ5aZrFATdMYq5jDyyxyrv7Vw+LAz
	 h9k+hyolOVmLLBuOBQqKz3LT0+fsGeTYLpsB8vPqxpjiBVPJd0jl8eGcisBHynOPvA
	 jv0wP3Cr48v3kwUckChuku/WqWmIxQ7nmnLUVoYCad8r9TN7qmTJ81x8u52cPoBAid
	 3KTgDy/EvcRVNB74BJAPUgDQ9JqBnISNX4+kRQSvy2XsXdTZJHBnPrxq3eAoyS6WkW
	 W7PyutvOFAWBhBXcGA9nAlZAPMKukiUCz7jITcYdXS4pmRIvtpvcWPXPOAFZpX8vij
	 fabtzaPvC55WQ==
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Cc: dinguyen@kernel.org,
	devicetree@vger.kernel.org
Subject: [GIT PULL] arm64: dts: socfpga: updates for v7.3
Date: Tue, 28 Jul 2026 22:23:08 -0500
Message-ID: <20260729032308.1359743-1-dinguyen@kernel.org>
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

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v7.3

for you to fetch changes up to ff98c9832fd430ba7b3158b8521002c8eb8aa16c:

  arm64: dts: socfpga: use consistent QSPI boot partition label (2026-07-27 22:09:15 -0500)

----------------------------------------------------------------
SoCFPGA DTS updates for v7.3
- dt-bindings updates:
	- Document compatible for Agilex72
	- Document additional interrupts for Agilex5

- Add the additional interrupts for the gmac on Agilex5
- Use decimal number for interrupts, not hexadecimal
- Enable the SMMU on Agilex5
- Add dma-coherent on XGMAC nodes
- Add initial support for the Agilex72 SoCDK
- Correct indentation on Arria10
- Update QSPI boot partition label

----------------------------------------------------------------
Dinh Nguyen (2):
      dt-bindings: net: altr,socfpga-stmmac: add more interrupts for Agilex5
      arm64: dts: socfpga: agilex5: update channel interrupts for gmac1 and gmac2

Geert Uytterhoeven (1):
      arm64: dts: intel: keembay: Always use decimal interrupts

Krzysztof Kozlowski (1):
      ARM: dts: intel: arria10: Correct indentation

Nazim Amirul (5):
      arm64: dts: socfpga: agilex5: Add per-channel interrupts to gmac0
      arm64: dts: socfpga: agilex5: Enable the SMMU
      arm64: dts: socfpga: agilex5: Add dma-coherent to XGMAC nodes
      dt-bindings: arm: altera: Add Agilex72 SoCFPGA compatible strings
      arm64: dts: socfpga: agilex72: Add initial device tree

Tze Yee Ng (1):
      arm64: dts: socfpga: use consistent QSPI boot partition label

 Documentation/devicetree/bindings/arm/altera.yaml  |   6 +
 .../bindings/net/altr,socfpga-stmmac.yaml          |  46 +++++-
 .../boot/dts/intel/socfpga/socfpga_arria10.dtsi    |   2 +-
 arch/arm64/boot/dts/intel/Makefile                 |   1 +
 arch/arm64/boot/dts/intel/keembay-soc.dtsi         |   2 +-
 .../arm64/boot/dts/intel/socfpga_agilex3_socdk.dts |   2 +-
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi     | 112 ++++++++++++++-
 .../arm64/boot/dts/intel/socfpga_agilex5_socdk.dts |   2 +-
 .../boot/dts/intel/socfpga_agilex5_socdk_013b.dts  |   2 +-
 .../dts/intel/socfpga_agilex5_socdk_modular.dts    |   2 +-
 arch/arm64/boot/dts/intel/socfpga_agilex72.dtsi    | 156 +++++++++++++++++++++
 .../boot/dts/intel/socfpga_agilex72_socdk.dts      |  27 ++++
 12 files changed, 346 insertions(+), 14 deletions(-)
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex72.dtsi
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex72_socdk.dts

