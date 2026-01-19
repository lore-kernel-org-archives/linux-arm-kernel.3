Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED02D29C40
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 16:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yHY2bxUJ2QWOL4hAwyaIq9xFjoUIszAseDUd66K8YyQ=; b=UCdx6flMwNL95XRp+XD9ZX18i+
	lnuaj0d73cD+czYg2Yp64A9dog8NGY2BFvqpi0TZb8eHIPA07XJ+IbL8LYC6oG1JI/9AlfnwQnSyz
	xPSDbquuxksLtgW9dQkiI4qYPKs79Lq5Ln6oGYsdlkrZU0cP0kIxpqd+JabsUyyW5IV7215VI6l1H
	PfKEW2WL73pWGTkfubfPyXQ0cJWx9olQQiCLHcgdgQ2qs9YfJsKDAIbGdzx0Q11lGkqKhRJ0jA4YB
	aaBuVPfhS2md+2334OOKoLEDJCrrvWxQBBS24gxf+xIIzFe5O9w30pRwgSbVNG1hx3oSfZLGKg3Bf
	KreMiewQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrmA-00000002QNf-3aqA;
	Mon, 19 Jan 2026 16:06:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrm8-00000002QMz-003p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 16:06:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 18EB760055;
	Mon, 19 Jan 2026 16:06:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2231BC116C6;
	Mon, 19 Jan 2026 16:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768838802;
	bh=xo28tgWBvvqBcKarBmzdhk1+UC7ykuAy3SMnlm0dwjo=;
	h=From:To:Cc:Subject:Date:From;
	b=r7U4AveucwM8EVCwDML70klVCqCPN3a89Qv2WUsOz+/dwsFzOkDoracEZx64nOQWv
	 J3K1rbgQXZArk6Obj5A+duVI9qDvBpKK32D7wxGJ3EY+3l/D1VAsE5abKOSN+wG1nN
	 p23ZS+tXrpHzDmaCr4QVB6sCQBTzuvoBif3ponqBXn68X5jCVH5bLJ/XaLp87KDmW/
	 JN5rpXwsQRlEtdC3Z4Z2sOoCtQzd0dGZc9vzy1XzZeOGtLh+RDsZOiWL0z9uKOFc96
	 +J8ggkvpE2hQNg3XT8lrgl89U60yf5swlJH3ULXtxg2RYrslhp9iurImKY8JwWeDnz
	 gUmpTsXttLTag==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Luca Weiss <luca@lucaweiss.eu>
Subject: [GIT PULL] Qualcomm Arm32 DeviceTree updates for v6.20
Date: Mon, 19 Jan 2026 10:06:41 -0600
Message-ID: <20260119160641.840311-1-andersson@kernel.org>
X-Mailer: git-send-email 2.52.0
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


The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.20

for you to fetch changes up to df7c440c904f754d8c94863a910d99e7ed8bbda9:

  ARM: dts: qcom: msm8974: Start using rpmpd for power domains (2026-01-19 09:40:32 -0600)

----------------------------------------------------------------
Qualcomm Arm32 DeviceTree updates for v6.20

Migrate the MSM8974 remoteproc power supplies to RPM provided
power-domains, to match what is done on most other platforms.

Give the LG Nexus 5 its more human friendly model name.

----------------------------------------------------------------
Luca Weiss (3):
      ARM: dts: qcom: msm8974-hammerhead: Update model property
      ARM: dts: qcom: msm8974: Sort header includes alphabetically
      ARM: dts: qcom: msm8974: Start using rpmpd for power domains

 .../arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts | 13 ------
 .../qcom/qcom-msm8974-lge-nexus5-hammerhead.dts    | 14 +-----
 .../boot/dts/qcom/qcom-msm8974-samsung-hlte.dts    | 12 ------
 .../dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi   | 12 ------
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           | 50 ++++++++++++++++++++--
 .../dts/qcom/qcom-msm8974pro-fairphone-fp2.dts     |  8 ----
 arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts  | 11 -----
 .../dts/qcom/qcom-msm8974pro-oneplus-bacon.dts     |  9 ----
 .../qcom/qcom-msm8974pro-samsung-klte-common.dtsi  | 11 ++---
 ...qcom-msm8974pro-sony-xperia-shinano-common.dtsi | 12 ------
 10 files changed, 52 insertions(+), 100 deletions(-)

