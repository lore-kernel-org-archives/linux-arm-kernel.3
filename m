Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72924D3F07A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 15:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1VRoc2YFdE9DFkhhmguCqDLwGt5PKcH0Wcb7rnX8sH4=; b=lxNR9hhwKF6GXz/S3kyo/D3Ntp
	ZdToFVEiiz8U9p2J8mHiDe8abLEBYkH8DsS5EmvFAuIMqP54CmiDi+rmMxKKdQjrYXd1rcg7Jbtqm
	pjhN8MQlBvd5fMbZN4ChfAH+6r97Qn5lwkFOye+Ewkbt4N45uOMJ4UFDEPNEturK0McPbZOPtm0kn
	ee+D8IO3N9ijKsz0Dg7DvrTmCalesVO12+tfAtSISdbPTCmLDxkUcZSSC+lTHurrk45ZpT+V6jvnF
	YZTx73uWJu1N6J7r7/M60FSo46Ro76R9PSHSVgmLE89wH1fHhnoPLure+F2aoL1DvqS7+1Aqmbn7w
	kwCFn3tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl750-0000000GEk2-3NDC;
	Wed, 28 Jan 2026 15:03:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl74z-0000000GEjl-1Hg4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 15:03:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A5F0E600AD;
	Wed, 28 Jan 2026 15:03:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D50F6C4CEF1;
	Wed, 28 Jan 2026 15:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769612616;
	bh=SRI/Bhj5iQxuWLS2Y73G5XTyLHgrFBNxPOnmb5dA5zw=;
	h=From:To:Cc:Subject:Date:From;
	b=OLoWLJsBoBmxjaPnML7nSJiQA7OyXqjyx9+FFNnMGrWMtj0npzizD/S2bk7uWQilu
	 QKNftvWLH3Y6gdgWqydGgLNuZuQCQY2GlGgbfKKRUuCIzCsDdSHN0e8oXfIr78lagR
	 0FZY/Y+BSJdYk28ky7M+iP5T7PLDkEXcbZmNHrLapwqFFLRhUjmhI3UKIXVqPuxlYp
	 LNOVofO+XbrABJfpedRhk/2wgR0v+F+iOvlc6oW6jecMLCugPZTtEBXhK/mo+KFTtA
	 FNYc8i1dS1tr9w1mWJrlwrdirbj/MynnZlggUokTfs5B2zd3EAwTPBXBzHX/dqQZ84
	 XaO6R/2XYGvdw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Rudraksha Gupta <guptarud@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [GIT PULL] More Qualcomm Arm32 DeviceTree updated for v6.20
Date: Wed, 28 Jan 2026 09:03:34 -0600
Message-ID: <20260128150334.2089748-1-andersson@kernel.org>
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


The following changes since commit df7c440c904f754d8c94863a910d99e7ed8bbda9:

  ARM: dts: qcom: msm8974: Start using rpmpd for power domains (2026-01-19 09:40:32 -0600)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.20-2

for you to fetch changes up to 4506cdf52a806be0d9e1b1c0b6c9bc2909ca8b1c:

  ARM: dts: qcom: switch to RPMPD_* indices (2026-01-21 15:05:03 -0600)

----------------------------------------------------------------
More Qualcomm Arm32 DeviceTree updated for v6.20

MSM8226 is switched to generic RPMPD_ indices, to allow dropping the
duplicate platform-specific constants.

On MSM8960 two additional GSBIs and I2C controllers are introduced.
Accelerometer, Magnetometer, NFC and Light/Proximity sensors are then
enabled on the Samsung Galaxy Express.

----------------------------------------------------------------
Dmitry Baryshkov (1):
      ARM: dts: qcom: switch to RPMPD_* indices

Rudraksha Gupta (5):
      ARM: dts: qcom: msm8960: Add GSBI2 & GSBI7
      ARM: dts: qcom: msm8960: expressatt: Add Light/Proximity Sensor
      ARM: dts: qcom: msm8960: expressatt: Add NFC
      ARM: dts: qcom: msm8960: expressatt: Add Magnetometer
      ARM: dts: qcom: msm8960: expressatt: Add Accelerometer

 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi           |   4 +-
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 109 +++++++++++++++++++++
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           |  96 ++++++++++++++++++
 3 files changed, 207 insertions(+), 2 deletions(-)

