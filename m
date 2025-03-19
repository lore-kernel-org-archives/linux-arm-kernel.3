Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE98BC35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 14:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pfzQMPiIUKoxaR/WBNZUj1RbXxTxjKLnE7BXiY/7gDU=; b=Dn3ufjqdPbWlmAUJeRulfdbol9
	lzy3mJhtmA22z/biO+pGLoZJHeutanqFNiXAjzZxdoGlN586vNiRDizJX9YpCBDw1jPuSUO35Udje
	pHcy9FPETdN4up0QZW2GFiBLUFnjh0Ctf9VroEDbxcOXdn00nxcf7R2mw8a7t3cFB33Zd81/7WCCC
	MON1G35tUMjIgJ2FfSzGf0i32s9TgbhCotVWuHBaLhoVmF1qSIjXl8epk1K5VYdocmQkURtefrr6x
	1DctF4GKi8UGiZJ5d6dQgA/aPH9UESPR+aX00MVtjgmjhcd4iA5RNOqqRRuRtRr83Cr/ExATNe2t4
	kZThKpSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuuSQ-00000009DW4-0J5L;
	Wed, 19 Mar 2025 14:31:46 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuuPO-00000009D2F-3zJF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 14:28:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B2039A49141;
	Wed, 19 Mar 2025 14:23:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40959C4CEE4;
	Wed, 19 Mar 2025 14:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742394517;
	bh=ZNjmKzkOVckbQ6QKTgj5AFXZPrq7OW3mSTiRZa5UIpw=;
	h=From:To:Cc:Subject:Date:From;
	b=qvf/gY87xRj3fVupCpHfcNwePMPxspYJSgmHW89UhhAAgpbhnHpDJ9EBmTwAidGm3
	 61qI1/NHKJenUL8OKHsJpzUw4JGqyPdQGxAkt8PIJ4JvlLm9R+dIfZxBzapqUWKmA6
	 /BKrspraqLxqr2CXnQ2sNUIL/jmvKrij3TX3IirkJUTBvCGNUvdzCyYkXP7SvvGE5n
	 K0aXsi0mdiy3cQ2fr2ICHjT5/oyRAA45/LuAryz5/Fdn3o2CBqUxD89UIRqYacawrh
	 YQidbJdE/BcU/qfU9wr/yFWSnXr/gDGE45SXopVAOofdS4RwF9K0TCD4G5au05oArX
	 wxbe/39VccVaA==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Luca Weiss <luca@lucaweiss.eu>,
	=?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
	Rudraksha Gupta <guptarud@gmail.com>,
	Ivan Belokobylskiy <belokobylskij@gmail.com>
Subject: [GIT PULL] More Qualcomm Arm32 Devicetree updates for v6.15
Date: Wed, 19 Mar 2025 09:28:34 -0500
Message-ID: <20250319142836.2279859-1-andersson@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_072839_112777_A067AD24 
X-CRM114-Status: UNSURE (   9.34  )
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


The following changes since commit adbbdcf4b2d6556721b580385ba387baca5c26ee:

  ARM: dts: qcom: ipq4018: Switch to undeprecated qcom,calibration-variant (2025-03-03 22:36:52 -0600)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.15-2

for you to fetch changes up to f5b7564fedcfd32df68d56781b9d7698343f8fbf:

  ARM: dts: qcom: Initial dts for LG Nexus 4 (2025-03-16 21:51:58 -0500)

----------------------------------------------------------------
More Qualcomm Arm32 Devicetree updates for v6.15

Introduce DeviceTree for the LG Nexus 4. Describe the modem remoteproc
and related components on MSM8226 and enable the modem on Samsung Galaxy
Tab 4 10.1 and HTC One Mini 2.

----------------------------------------------------------------
Ivan Belokobylskiy (1):
      ARM: dts: qcom: Initial dts for LG Nexus 4

Luca Weiss (4):
      ARM: dts: qcom: msm8226: Add modem remoteproc node
      ARM: dts: qcom: msm8226: Add BAM DMUX Ethernet/IP device
      ARM: dts: qcom: Introduce dtsi for LTE-capable MSM8926
      ARM: dts: qcom: msm8926-htc-memul: Enable modem

Matti Lehtimäki (3):
      ARM: dts: qcom: msm8226: Add node for TCSR halt regs
      ARM: dts: qcom: msm8226: Add smsm node
      ARM: dts: qcom: msm8226-samsung-matisse-common: Enable modem

Rudraksha Gupta (2):
      ARM: dts: qcom: msm8960: Add BAM
      ARM: dts: qcom: msm8960: Add thermal sensor (tsens)

 arch/arm/boot/dts/qcom/Makefile                    |   1 +
 arch/arm/boot/dts/qcom/msm8926.dtsi                |  11 +
 .../dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts |   1 +
 .../dts/qcom/qcom-apq8026-samsung-milletwifi.dts   |   2 +
 .../boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts  | 341 +++++++++++++++++++++
 .../dts/qcom/qcom-msm8226-microsoft-common.dtsi    |   6 +-
 .../dts/qcom/qcom-msm8226-microsoft-dempsey.dts    |   1 +
 .../dts/qcom/qcom-msm8226-microsoft-makepeace.dts  |   1 +
 .../dts/qcom/qcom-msm8226-microsoft-moneypenny.dts |   1 +
 .../qcom/qcom-msm8226-samsung-matisse-common.dtsi  |  19 +-
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi           | 155 ++++++++++
 arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts  |  14 +-
 .../qcom/qcom-msm8926-microsoft-superman-lte.dts   |   1 +
 .../boot/dts/qcom/qcom-msm8926-microsoft-tesla.dts |   1 +
 .../dts/qcom/qcom-msm8926-motorola-peregrine.dts   |   2 +-
 .../dts/qcom/qcom-msm8926-samsung-matisselte.dts   |   5 +
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           |  99 +++++-
 17 files changed, 652 insertions(+), 9 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom/msm8926.dtsi
 create mode 100644 arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts

