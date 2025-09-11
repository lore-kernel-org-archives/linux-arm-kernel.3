Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9DABCAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 22:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E3NIOOkvm7piGrzSuOg33H8Rv0Uuv0C43vpGxmflUMc=; b=uL8ycrUijjEEFdSY5rUe/C6/3R
	sHpq/2n2/G3n8sx4ylXlN1smgykXS77vxmDGiNiOeuOfzog8Y9rVdIHUUEi1P6MlZDm5STU23tUel
	Bre1t/6M/xssfBR61WZX1XURLnadqEKc/TXgnVRwfOTOJOGEWdexmNjnTVunx0LBiaflczXljc8BN
	MV4BvjYhEeaFHQM1luO+jYCtWdVtc8jtMOjYAYgVGfw+D0/FMAgoKk0h9Jj7uAHoua7wZ0DxwIM1b
	ED/xg6gnMhvYjgqNT0X8BnAA6uTWOR1/oWeQ7BjYqmlAs4fOvooD77IFw6MK3qcK14OMNvFUKF4nr
	SmWm1jTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwpUC-00000005daz-2pKG;
	Thu, 11 Sep 2025 22:09:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwpU8-00000005dZz-1g9d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 22:09:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8CF1044070;
	Thu, 11 Sep 2025 22:09:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC75EC4CEF0;
	Thu, 11 Sep 2025 22:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757628582;
	bh=hK/6ySfwQ46/Rl9FEdZ2FVCEJGm+bWyf0/UFMaVoSKM=;
	h=From:To:Cc:Subject:Date:From;
	b=GrEVPAX+LE3r3grr6VPwoZjvP5XHq+gVEgHdZu+C2snhHoQlR7gzS3s4T0M9M1ewU
	 npHjd7DUl+vA0feqMN//bwoctsa+hO2WVpQvIaxNpEIkD09yaQRcPlpQgAiPaT8/ar
	 +5LJ3fvP8UJ2YV2dD9yeCPC/TzatdYjY3rcGBeq6fApuoC4WGNLE/zdZ1qbC0Xr9Vz
	 EH3rs5ZDZTQ7awRbVdnGSmokEGH6MulrHT2YE69mYEzlfZZGP6ahoR5CnGu1Qd3vUB
	 HiQNnotyc3ilAVUbynKKZ8g8cW5rjL94cX2rRKG6VvA1Zej5kV7yMJqPCCjIbHrB72
	 SAAEvF3mVGwPw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Antony Kurniawan Soemardi <linux@smankusors.com>,
	Adam Honse <calcprogrammer1@gmail.com>,
	Raymond Hackley <raymondhackley@protonmail.com>,
	Shinjo Park <peremen@gmail.com>
Subject: [GIT PULL] Qualcomm Arm32 DeviceTree updates for v6.18
Date: Thu, 11 Sep 2025 17:09:39 -0500
Message-ID: <20250911220940.3023575-1-andersson@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_150944_480205_03078A66 
X-CRM114-Status: GOOD (  10.95  )
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


The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.18

for you to fetch changes up to ba1045c76be299896528ac48021501fc9de78512:

  ARM: dts: qcom: Use GIC_SPI for interrupt-map for readability (2025-09-01 11:18:03 -0500)

----------------------------------------------------------------
Qualcomm Arm32 DeviceTree updates for v6.18

Bring a few updates to the MSM8960 platform and add support for the Sony
Xperia SP.

Touch keys support is added to the Samsung Galaxy Grand 2.

A number of DeviceTree cleanups.

----------------------------------------------------------------
Adam Honse (1):
      ARM: dts: qcom: msm8974-samsung-hlte: Add touchkey support

Antony Kurniawan Soemardi (5):
      ARM: dts: qcom: msm8960: add sdcc3 pinctrl states
      ARM: dts: qcom: msm8960: add gsbi8 and its serial configuration
      ARM: dts: qcom: msm8960: disable gsbi1 and gsbi5 nodes in msm8960 dtsi
      dt-bindings: arm: qcom: add Sony Xperia SP
      ARM: dts: qcom: add device tree for Sony Xperia SP

Krzysztof Kozlowski (6):
      ARM: dts: qcom: apq8064-mako: Minor whitespace cleanup
      ARM: dts: qcom: ipq4019: Add default GIC address cells
      ARM: dts: qcom: apq8064: Add default GIC address cells
      ARM: dts: qcom: ipq8064: Add default GIC address cells
      ARM: dts: qcom: sdx55: Add default GIC address cells
      ARM: dts: qcom: Use GIC_SPI for interrupt-map for readability

Raymond Hackley (1):
      ARM: dts: qcom: msm8226-samsung-ms013g: Add touch keys

Shinjo Park (1):
      ARM: dts: qcom: pm8921: add vibrator device node

 Documentation/devicetree/bindings/arm/qcom.yaml    |   6 +
 arch/arm/boot/dts/qcom/Makefile                    |   1 +
 arch/arm/boot/dts/qcom/pm8921.dtsi                 |   6 +
 .../boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts  |   6 +-
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi           |   9 +-
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi           |   9 +-
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi           |  25 +-
 .../boot/dts/qcom/qcom-msm8226-samsung-ms013g.dts  |   2 +
 arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi      |  40 +++
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   |   5 +
 .../boot/dts/qcom/qcom-msm8960-sony-huashan.dts    | 361 +++++++++++++++++++++
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           |  32 ++
 .../boot/dts/qcom/qcom-msm8974-samsung-hlte.dts    |  45 +++
 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi             |   9 +-
 14 files changed, 529 insertions(+), 27 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts

