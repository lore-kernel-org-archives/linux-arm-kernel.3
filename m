Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B1E810F9302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 21:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lR0TZTL4vgxqeh17aCtAUk73qw2Qnai0er/TlANgzP4=; b=dJ/735YJHPK2I0SuN+o5m9b6DV
	JA+zIIKCbM5D76hh8fuB6ZVtstzICSCP8oxemXKfvh/ws4L9zZ2mMplRhCxcEGZRCvmiTLvZtl4VQ
	A8r1usn3PPUKGw4PJmFKGmdpNXKhnPW3VdmvyMCWzkWB/oKYb3xBpZUXbXTgknPHqfB+GYQSTBfWh
	bUMQUvC99UaGsF6KTk8gb+AGxITXFeh2Sgit5z02jMBGOmwXd+BDmUgHQeEmBZxOoYJEtxwkzK1uU
	7VrgdKolu72WMmQzoVLSiEllL8ACYcYifov7i8BYylBxzCsQuf9gb1BjyPmg/GXjrkKVCmT/q3+RQ
	6j1kWPiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7h3Y-0000000DbfU-29WR;
	Tue, 31 Mar 2026 21:55:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7h3V-0000000DbfA-3Ay0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 21:55:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EF2BC40BC3;
	Tue, 31 Mar 2026 21:55:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AE9FC19423;
	Tue, 31 Mar 2026 21:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774994124;
	bh=NhuFMXlvIvwXGeFlkQZ4EjJD7dqZdKtt1rvST/wuTUY=;
	h=From:To:Cc:Subject:Date:From;
	b=efKmWD2cojixGjWSKPS4XFjSeeurzqKxFKT2Kai1csXNtIGcwLixJlLqXmHbvrwFx
	 eEmNzdQmdzaYXxQ1cbOCDm/JrH+v5d2LcDFnJTP6j4R1xbJxx2o19LxCc/hlDJB6Mw
	 9/NxcX+4nV+V1he4Tr47kfC33r6CkPQEoo/IqIQiCo6JNjUbTrmci3fYjBi4aCf5Aq
	 tG65bkzjF9QoENSqfAlX6Ln+edmUcRGsFVmoUs5XyQR64cLB8BzoMEynpe37+NqOrb
	 e8bcyJG5mgqmUtunYLjgWl1cGr6TIf6D4qEr7UsfFwzUT82QkuwfMVEfaVEIQWEHzg
	 HGaVcy0vJhaPw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
	Harshal Dev <harshal.dev@oss.qualcomm.com>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm Arm64 defconfig updates for v7.1
Date: Tue, 31 Mar 2026 16:55:21 -0500
Message-ID: <20260331215521.968341-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_145525_851119_26D4A229 
X-CRM114-Status: UNSURE (   7.64  )
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


The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-7.1

for you to fetch changes up to fdeb077b8ae53a6ef772c5b3c4d1f3a408dac2a0:

  arm64: defconfig: enable pci-pwrctrl-generic as module (2026-03-23 21:40:52 -0500)

----------------------------------------------------------------
Qualcomm Arm64 defconfig updates for v7.1

Enable base drivers for booting boards based on Kaanapali, Glymur,
Eliza, SM8750, and IPQ5210 SoCs.

Enable the Milos LPASS LPI driver. Enable the Qualcomm WCD937x headphone
codec driver, used on QCM6490 boards.

Enable the QCOMTEE driver, to support the interface found in various
Qualcomm SoCs.

Enable ethernet and analog codecs used on the Arduino Ventuno Q.

Enable the Lontium LT8713sx driver, used for the Monaco EVK board.

Enable the PCI pwrctrl generic driver used in a few different
Qualcomm-based boards with USB controllers on PCI buses.

----------------------------------------------------------------
Abel Vesa (1):
      arm64: defconfig: Enable Qualcomm Eliza basic resource providers

Ajay Kumar Nandam (1):
      arm64: defconfig: Enable Qualcomm WCD937x headphone codec as module

Harshal Dev (1):
      arm64: defconfig: Enable QCOMTEE module for QTEE-enabled Qualcomm SoCs

Kathiravan Thirumoorthy (1):
      arm64: defconfig: enable IPQ5210 RDP504 base configs

Krzysztof Kozlowski (1):
      arm64: defconfig: Enable Qualcomm Eliza SoC display clock controller

Luca Weiss (2):
      arm64: defconfig: Enable S5KJN1 camera sensor
      arm64: defconfig: Enable Milos LPASS LPI pinctrl driver

Neil Armstrong (1):
      arm64: defconfig: enable pci-pwrctrl-generic as module

Pankaj Patil (1):
      arm64: defconfig: Enable configs for Qualcomm Glymur SoC

Srinivas Kandagatla (1):
      arm64: defconfig: Enable configs for Arduino VENTUNO Q

Taniya Das (2):
      arm64: defconfig: Enable SM8750 clock controllers
      arm64: defconfig: Enable Kaanapali clock controllers

Vishnu Saini (1):
      arm64: defconfig: Enable Lontium LT8713sx driver

 arch/arm64/configs/defconfig | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

