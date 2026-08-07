Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EFA0C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 15:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p2nGN5ZXRiqoTtzpZL872g3TGzGSNiIhzVCcBASG2ew=; b=BEeRtZ3c04ac4EXC0qUcEfYKWw
	6Up6y+X+uLwOUGEm6hBIYEUfeVfBNLhhmXjXU4qT8TudZUhEqNKcyFqFeZoeKYjngbi5hkVre3J6D
	cQrCx4TWKuoTTD8ZwOTHsbaKIvEcdWrNTJxZc6JptgW+p0vlI+VB79XaAZCprJntYDTRnnU5BImMf
	zDlWrdBav2AqKPMwf6plTeq+99z9TpZ+8FnAKOcnY6lnbqScuXjqAaMDNzX6ilRLTovJd7URFrojZ
	CGR+4gTSorDK8HX8ZUtat6EdpiyJuOz/LjU43ISC/qFTfl9pNIyHkv0khItsPueBDeldnOfN2QkVp
	uFHyfvIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMqH-00000008NTu-2Jdv;
	Fri, 07 Aug 2026 15:50:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMqF-00000008NTW-2LYO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 15:50:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 85BB1600B0;
	Fri,  7 Aug 2026 15:50:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E5241F000E9;
	Fri,  7 Aug 2026 15:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786117838;
	bh=p2nGN5ZXRiqoTtzpZL872g3TGzGSNiIhzVCcBASG2ew=;
	h=From:To:Cc:Subject:Date;
	b=V/KitA0fjocwxz1GdntzyJGUQRV/7s5428bv4zaiwbu5mlfGYe/aJHQ1XW93O/zBG
	 cQ5hGOuSFSZvc6Iq/lncalhUBnIsUfwq1k4+AhDXQFAOvE2Q+AkmoFkAQfiia3KkKk
	 LX94URQ+ixLinklf5ty1Pcgka/Rj84tEeHVpEPCXotxPXdLro6QMnKJE34CEwZT7hZ
	 sTNUKbNxXK875P4BaijdP4dJovtHlC/CeaH87INIAtcT2fD5kCTFwFh5C2Ptvlmw47
	 PgmxegjWdIZgFeRxmSfsR0Oh6u7/UXTVj38MIRK2jFDl3qmLmZj+oaAx07+xA3NFYK
	 x2auKZc9BPj/g==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Alexandre Messier <alex@me.ssier.org>,
	Antony Kurniawan Soemardi <linux@smankusors.com>,
	David Wales <daviewales@disroot.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Erikas Bitovtas <xerikasxx@gmail.com>,
	Rudraksha Gupta <guptarud@gmail.com>
Subject: [GIT PULL] Qualcomm Arm32 DeviceTree updates for v7.3
Date: Fri,  7 Aug 2026 10:50:35 -0500
Message-ID: <20260807155035.603563-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
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

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-7.3

for you to fetch changes up to 1c436bca83bef0f7ca8d106a878a89af17048270:

  ARM: dts: qcom: msm8926-sony-xperia-yukon-eagle: add initial device tree (2026-07-11 13:11:35 -0500)

----------------------------------------------------------------
Qualcomm Arm32 DeviceTree updates for v7.3

Add initial device tree support for the MSM8926-based Sony Xperia M2 and
the MSM8226-based Motorola Moto G2 (2014).

Add touchscreen, Bluetooth pin configuration, NFC, and multicolor status LED
support to the MSM8974-based HTC One M8 device tree.

Add the coreriver,tc360-touchkey compatible touchkey node to the MSM8960
Samsung ExpressATT device tree and label PM8921 XOADC channels.

Consolidate shared IPA properties in the SDX55 device tree.

----------------------------------------------------------------
Alexandre Messier (4):
      ARM: dts: qcom: msm8974pro-htc-m8: add status LEDs
      ARM: dts: qcom: msm8974pro-htc-m8: add NFC support
      ARM: dts: qcom: msm8974pro-htc-m8: add Bluetooth pins
      ARM: dts: qcom: msm8974pro-htc-m8: add touchscreen

Antony Kurniawan Soemardi (1):
      ARM: dts: qcom: pm8921: add labels for ADC channels

David Wales (1):
      ARM: dts: qcom: msm8226: Support Motorola Moto G2 (2014)

Dmitry Baryshkov (1):
      ARM: dts: qcom: sdx55: consolidate IPA properties

Erikas Bitovtas (1):
      ARM: dts: qcom: msm8926-sony-xperia-yukon-eagle: add initial device tree

Rudraksha Gupta (1):
      ARM: dts: qcom: msm8960: expressatt: Add coreriver,tc360-touchkey

 arch/arm/boot/dts/qcom/Makefile                    |   2 +
 arch/arm/boot/dts/qcom/msm8226-motorola-titan.dts  | 350 ++++++++++++++++++
 .../dts/qcom/msm8926-sony-xperia-yukon-eagle.dts   | 407 +++++++++++++++++++++
 arch/arm/boot/dts/qcom/pm8921.dtsi                 |  12 +
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   |  54 +++
 arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts  |  94 ++++-
 arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts          |   2 -
 .../boot/dts/qcom/qcom-sdx55-telit-fn980-tlb.dts   |   2 -
 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi             |   3 +
 9 files changed, 918 insertions(+), 8 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom/msm8226-motorola-titan.dts
 create mode 100644 arch/arm/boot/dts/qcom/msm8926-sony-xperia-yukon-eagle.dts

