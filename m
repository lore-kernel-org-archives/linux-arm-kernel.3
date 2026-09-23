Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0CFC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 02:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KczbAkQhqY6njypvcnyBp35WCf0MGoTb+eczMmXqr4Y=; b=HQjWXAWlUuo4nqS18WYwmaAJtG
	1QXZExiENZDL4wuT65P+qdxYBqeaLAdHJXx9EvHf9W2gcmX65DMzrwx/I3OzLlygomuc9y++oBvTV
	GbqC8MDsbLiug9Juf5NiR91+WwCIB2JkrDfNB007Nbciz6u3a6joDt1FJKmuI9vNI2id3k3z8ngTx
	b3oy0Kb/mRuPluR2HzrQGFpImP3qRXD710mswk2yr0cD9s2nD0tkf42K6R9Q6msjMC2SGsk4JTiou
	SxTkFGmCn3TopTaHyRxk67W7X6D+FGmbmrLTfv04QvNvnRLfe0d5o1OL6g6hQ5pzI0JpC6HwRQtEn
	6TpDkBWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9D3H-00000006zBR-3IcS;
	Wed, 23 Sep 2026 02:49:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9D3G-00000006zBB-1QMs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 02:49:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 16D1943618;
	Wed, 23 Sep 2026 02:49:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 672C91F000FF;
	Wed, 23 Sep 2026 02:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790131782;
	bh=KczbAkQhqY6njypvcnyBp35WCf0MGoTb+eczMmXqr4Y=;
	h=From:To:Cc:Subject:Date;
	b=Mm1eld4A/eeO+qKpe6H1EjhtnktMYJWvTurb2DQWwcLd/+qZPEpof//9nEgIecYRT
	 ql4Eddx84z+Dvm6QEeJlmfaNXZImNR4bPWX280boQBekO7Yz39I+tMDds7M6qSiJh/
	 ZJ02xwFR5IymKCh6Mkg8WhgzkhT8w+HmoMJ3kChFhEMr3lXOrsQQRr7vNMAprgHzRp
	 o3RbFKWFomcL4NIYKV6VbKjCnpPNtrBscqK2ruK6tEiMKjtaR+MHi4KMyghrt4/gnH
	 nKn5dHHCyBSFYj4Bk2Ex7GhKLb9DliCGIFPaLC1XoKvFovQFv08jd+3CQ7D+ZcVQbH
	 BMpBkeUN3BwCw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm Arm64 defconfig updates for v7.4
Date: Tue, 22 Sep 2026 21:49:39 -0500
Message-ID: <20260923024939.406813-1-andersson@kernel.org>
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


The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-7.4

for you to fetch changes up to 897cf6d54f366885e190e75b3a221e7b3ae35065:

  arm64: defconfig: Enable PMIC5 Gen3 ADC thermal monitor (2026-09-12 14:18:26 -0500)

----------------------------------------------------------------
Qualcomm Arm64 defconfig updates for v7.4

Enable the SGM3804 regulator, Renesas R63419 panel, and SY7758
backlight drivers needed for the display on the SM8650-based Ayaneo
Pocket S2.

Enable the QMP PCIe Multi-PHY driver as a module for the shared PCIe3
PHY on Glymur.

Enable the PMIC5 Gen3 ADC and ADC thermal monitor drivers as modules
for system thermistor measurements on Hamoa-based devices.

----------------------------------------------------------------
Bjorn Andersson (1):
      arm64: defconfig: Enable PMIC5 Gen3 ADC thermal monitor

Neil Armstrong (1):
      arm64: defconfig: enable the necessary drivers for the Ayaneo Pocket S2

Qiang Yu (1):
      arm64: defconfig: Enable QMP PCIe Multi-PHY driver

 arch/arm64/configs/defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

