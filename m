Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D0CCA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 19:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bsaFSZfndAczrKiugFmOGwtt440SXaY/1HwOOWFeNCg=; b=vKC12ItgrrRG4BA/cAgeLK4TM5
	sZeeeqy3i2iKuDcDCbKHtk1lTNwlbWje7/81Lcdj9BpGHQlHA6B4fz1uKz5aqzxKbUphfoxZ3CljL
	Lz9DD1Tdjt9fYhhrcZHVgXA3ABVgsPdZdIX/30zzyimOvg1bHqIERtFOJcPwd+JbR3nxlSQEiMW00
	yC4OPcAFVj1OYP6IBd0I2JwnrTCYTvoW/RMLLp980T41dlWwPliKOkjM9dpSrdtH0E3gaMGEZo3pV
	pe5jLBzinMCW8r1QA0sQBAsa7TI9SnCDdoHIkEQGf8m5TWXyqI3qoCmm3FAUceggFBguGGEvt1zp7
	TDbFvqvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLa8-0000000BNQR-0PjQ;
	Mon, 12 Oct 2026 19:21:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLa6-0000000BNQ8-3znu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 19:21:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5367D405C2;
	Mon, 12 Oct 2026 19:21:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A89121F008A1;
	Mon, 12 Oct 2026 19:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791832866;
	bh=bsaFSZfndAczrKiugFmOGwtt440SXaY/1HwOOWFeNCg=;
	h=From:To:Cc:Subject:Date;
	b=Yx3pr79SOnZBTyh4x5/XmITPz1+aTdKgovI/dHQX4ZW6FagzVMvistC/u8xAXKJpc
	 7P0Mo2/yZxuxboOkgRbB4I/B5RnnhTBk7Klcb6KOgViaagpEowTI5lJuEeRZj7Y9fZ
	 c/4PK3dhQPRFn/QJHkh0U8zN2wn6gouVyl7KylaAS+baZp6eTfpuAyfvTABfIzGVmr
	 qS/kHhZOR8F/gRtC/ccBr50TuaFwPB8C6FwRcT2QdSGUZZhcaOLK3lMGLiIdVwU56I
	 WLbzKTwseYAfuRz6ynkpd7WptCg40fQ366ochZ/xwDNx4SiSZlZIFozjlUdYPoXB/T
	 idJct2b0Ue/+w==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Antony Kurniawan Soemardi <linux@smankusors.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm Arm32 DeviceTree updates for v7.4
Date: Mon, 12 Oct 2026 14:21:02 -0500
Message-ID: <20261012192102.12999-1-andersson@kernel.org>
X-Mailer: git-send-email 2.55.0
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

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-7.4

for you to fetch changes up to ccf7f47dbe15d2c2bf57e7c443e9e485d2290c2d:

  ARM: dts: qcom: sdx55: Fix PCIe WAKE# GPIO polarity (2026-09-27 21:25:32 -0500)

----------------------------------------------------------------
Qualcomm Arm32 DeviceTree updates for v7.4

Add MSM8960 wireless connectivity support by describing the RPM clock
controller, SCM, SMEM, SFPB hardware mutex, SMSM, and Riva/WCNSS nodes,
including firmware memory and Bluetooth/Wi-Fi pinctrl state. Enable Wi-Fi
and Bluetooth on the Sony Xperia SP (Huashan) board.

Fix MSM8960 USB clock descriptions by wiring the controller to the RPM
Daytona fabric clock and correcting the HS1 transceiver clock usage.

Fix MSM8974 display by adding the MDSS reset line needed for reliable DSI
bring-up, and fix the SDX55 T55 PCIe WAKE# GPIO polarity to active-low.

----------------------------------------------------------------
Antony Kurniawan Soemardi (6):
      ARM: dts: qcom: msm8960: add RPM clock controller and fix USB clocks
      ARM: dts: qcom: msm8960: add SCM
      ARM: dts: qcom: msm8960: add SMEM & hwlock
      ARM: dts: qcom: msm8960: add SMSM & SPS
      ARM: dts: qcom: msm8960: add Riva
      ARM: dts: qcom: msm8960: huashan: enable Wi-Fi and Bluetooth

Dmitry Baryshkov (1):
      ARM: dts: qcom: msm8974: add MDSS reset

Krishna Chaitanya Chundru (1):
      ARM: dts: qcom: sdx55: Fix PCIe WAKE# GPIO polarity

 .../boot/dts/qcom/qcom-msm8960-sony-huashan.dts    |  15 ++
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           | 169 ++++++++++++++++++++-
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           |   3 +
 arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts          |   2 +-
 4 files changed, 186 insertions(+), 3 deletions(-)

