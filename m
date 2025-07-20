Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E0AC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 03:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f4OclK638mOdqXAuDvuWtM7Kn7ptgMYJPXjQxQtHF5c=; b=3KuLMHweXM89tKGCMlksQ9L9Hu
	OG6SzK36jR9YkvxH69bAisUpplcNdn6EyhZqQf+t8ba9Lr/oOUf8/H18Juztq9y20q1WOQRRlT0TE
	FLQDFbXbCTxiNE4p6zv6Wk76ZfzpVL7yejQP/LVDwnV/GHMUp7SJXbd1OsW+8wISRK+Ufu6DN7bTB
	oh3ED9CRR+8+lfTLss3FI+pFJIECB9MC7X+5jNvyUUmr2hntCNavv9eMW/MpnyQa5oOgHmnB+LyOr
	dUYg2AqBxWAgmqyBe49vAvj51g2QpvHXLRi19SGfzSUI/6wFyC4ODHX/yzHh5OYyWjlcLI9dZ6BlF
	UetezCSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udKTq-0000000EqXx-0Ee9;
	Sun, 20 Jul 2025 03:12:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udKR9-0000000EqPg-0IRb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Jul 2025 03:10:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BF1F3A5051C;
	Sun, 20 Jul 2025 03:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B31E0C4CEF4;
	Sun, 20 Jul 2025 03:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752981001;
	bh=OZffXe6azFV9FeftGR9X58+sCMXsqv0J8LxCnzDlNhI=;
	h=From:To:Cc:Subject:Date:From;
	b=PI/M4KWwkMYal/3sU4kxPhbeKgO4moVSM8ZLuwFeR+8sr87bxxA4Sefprpa/KdCli
	 D3/jv6aMGoHK+ZXJx2WsgPb/0aglrQSiRl+4FTXjRoS0c2RDXUPYRr4YN7zkSvkykS
	 xZTSO84taA3RP2Y/mUXVmB+lhG17jwNS40S/dpEmP4z+U6lhnIsKRqIR+unAK/877p
	 tybF1dRUs/pWduBTwdsxa2Q9ngrsOwoj3RDY/oEX3BfNm5r3OYIHlwv+VyuGPC57Se
	 eHXJFrkz3Z4z8nMHKm4TPaKMj8Of3heLFBTcp1Bl30nWUx16vc+vfD5qidLPX6hGVq
	 vaLpE2659XF3w==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Antony Kurniawan Soemardi <linux@smankusors.com>,
	Shinjo Park <peremen@gmail.com>
Subject: [GIT PULL] More Qualcomm Arm32 DeviceTree updates for v6.17
Date: Sat, 19 Jul 2025 22:09:58 -0500
Message-ID: <20250720030959.285762-1-andersson@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_201003_178780_11513629 
X-CRM114-Status: UNSURE (   8.20  )
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


The following changes since commit fb84f0ec527c50c54ab662d45c441f6789ec3550:

  ARM: dts: qcom: msm8974-sony-xperia-rhine: Add alias for mmc0 & mmc1 (2025-06-11 21:40:14 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.17-2

for you to fetch changes up to f36e10fa6e1ed424058b2121c174e105e7c53f1d:

  ARM: dts: qcom: pm8921: add vibrator device node (2025-07-16 15:19:53 -0500)

----------------------------------------------------------------
More Qualcomm Arm32 DeviceTree updates for v6.17

Enable GSBI8 and define the SDCC3 pinctrl state on MSM8960, then add
support for the Sony Xperia SP phone based on this platform.

----------------------------------------------------------------
Antony Kurniawan Soemardi (5):
      ARM: dts: qcom: msm8960: add sdcc3 pinctrl states
      ARM: dts: qcom: msm8960: add gsbi8 and its serial configuration
      ARM: dts: qcom: msm8960: disable gsbi1 and gsbi5 nodes in msm8960 dtsi
      dt-bindings: arm: qcom: add Sony Xperia SP
      ARM: dts: qcom: add device tree for Sony Xperia SP

Shinjo Park (1):
      ARM: dts: qcom: pm8921: add vibrator device node

 Documentation/devicetree/bindings/arm/qcom.yaml    |   7 +
 arch/arm/boot/dts/qcom/Makefile                    |   1 +
 arch/arm/boot/dts/qcom/pm8921.dtsi                 |   6 +
 arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi      |  40 +++
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   |   5 +
 .../boot/dts/qcom/qcom-msm8960-sony-huashan.dts    | 361 +++++++++++++++++++++
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           |  32 ++
 7 files changed, 452 insertions(+)
 create mode 100644 arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts

