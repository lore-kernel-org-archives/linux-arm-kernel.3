Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB630C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 02:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=23O+PgTn0R8tA7LLvfBRjILRLFx4UcGEZposQMbSwlg=; b=A9fq0tpTfreapIDSxtze79yMBr
	P1UfjbfQCh+ctGlM+NXKUUPwNgHNPzTWrq1QxfTLMoU6FMHvn4GLeOCZO1prXn0mE9xzunmGPz66N
	a6hsOtuElQ/57buys7g92v6iLJc9bl5KuxDdc5/0eu62Y0aovZGdgP5YJ4sTnmY3LRLIWRg4JeKSN
	mjNmsMm5a+YPjv1lWjozQixLeKuUqXEmpc8mpYDTHcoqXx6y0HJmxzTW1BgmOfdYjsB3WOqsimVM8
	YRhjLfcHVVM75luli0HmmM9nL//Bq2UVW/MAHMOPDjHPdxg2jyeirp+4ovmxXh8Tzrc3BOjdCwXMo
	DLaVqy1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubVJM-00000003n82-2m84;
	Tue, 15 Jul 2025 02:22:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubVFi-00000003mn6-1eSf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 02:18:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 505C25C4D3A;
	Tue, 15 Jul 2025 02:18:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F774C4CEED;
	Tue, 15 Jul 2025 02:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752545920;
	bh=wW0Sx7l5F4H8ALre3m4qaFZhDLGL8fV9aB0sV9Djh68=;
	h=From:To:Cc:Subject:Date:From;
	b=TH1ta0buslWs5zymquc/NsIrejBo647lFIZE03sWcHsaZ4i4eOAuMZmQluchk2FeP
	 +xnkM2omUD2bmJh9xFQdvH9jR3cQozV77ERMZDdgKrpykVl5kiNElbAupZjLPnqgk/
	 NJJqkNR1pFbpr8cTl4S7feLp0zq0lW7eYg3I8Bssx4TeuIKDq5wgGZyZnMCsQgH+T1
	 M37XZZqCc6F/o3WY32euoJ0uv1tK7+WLmwProAERmxYr7q5gDntbcbsKclIdcevxLo
	 5z+sgGQyHb1RAmzjlGU3B5YD2bLTQK/F5lwNCiB4v4IC2P5tynhm1wKa1wqHW/F/Vg
	 4PrQj618EnvJg==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kevin Widjaja <kevin.widjaja21@gmail.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Max Shevchenko <wctrl@proton.me>
Subject: [GIT PULL] Qualcomm Arm32 DeviceTree updates for v6.17
Date: Mon, 14 Jul 2025 21:18:37 -0500
Message-ID: <20250715021838.14751-1-andersson@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_191842_471126_163A1363 
X-CRM114-Status: GOOD (  10.38  )
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


The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.17

for you to fetch changes up to fb84f0ec527c50c54ab662d45c441f6789ec3550:

  ARM: dts: qcom: msm8974-sony-xperia-rhine: Add alias for mmc0 & mmc1 (2025-06-11 21:40:14 -0500)

----------------------------------------------------------------
Qualcomm Arm32 DeviceTree updates for v6.17

Add aliases for MMC controllers on MSM8974, enable USB charging on the
Sony Xperia Rhine platform and add new DeviceTree for the Sony Xperia Z
Ultra device.

Tidy up interrupts specifiers on MSM8960, by using macro constants.

----------------------------------------------------------------
Kevin Widjaja (4):
      ARM: dts: qcom: msm8974-sony-xperia-rhine: Enable USB charging
      ARM: dts: qcom: msm8974-sony-xperia-rhine: Move camera buttons to amami & honami
      dt-bindings: arm: qcom: Add Sony Xperia Z Ultra (togari)
      ARM: dts: qcom: Add initial support for Sony Xperia Z Ultra (togari)

Krzysztof Kozlowski (1):
      ARM: dts: qcom: Align wifi node name with bindings

Luca Weiss (3):
      ARM: dts: qcom: msm8974-oneplus-bacon: Add alias for mmc0
      ARM: dts: qcom: msm8974-hammerhead: Add alias for mmc0
      ARM: dts: qcom: msm8974-sony-xperia-rhine: Add alias for mmc0 & mmc1

Max Shevchenko (1):
      ARM: dts: qcom: msm8960: use macros for interrupts

 Documentation/devicetree/bindings/arm/qcom.yaml      |  1 +
 arch/arm/boot/dts/qcom/Makefile                      |  1 +
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi             | 10 +++++-----
 .../dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts  |  3 ++-
 .../qcom/qcom-msm8974-sony-xperia-rhine-amami.dts    | 16 ++++++++++++++++
 .../qcom/qcom-msm8974-sony-xperia-rhine-honami.dts   | 16 ++++++++++++++++
 .../qcom/qcom-msm8974-sony-xperia-rhine-togari.dts   | 16 ++++++++++++++++
 .../dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi     | 20 +++++---------------
 .../boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts  |  1 +
 9 files changed, 63 insertions(+), 21 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine-togari.dts

