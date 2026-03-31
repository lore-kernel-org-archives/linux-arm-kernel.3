Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9241A10F9302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 20:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wRy81soDInpLd32/YTrWOHIQs7g5Bx1F2KIpUQaDd1c=; b=mSABNodMSqqzq3HJp5jqI+UEhu
	qzvEEW8A8hhSwBxwkUXyP96xRFpQDdC6su18Aj01ymEm+IPDWakan811zbOZQ8/1HLhQm99ta+L0I
	kpxJxWBBlfN94h4CcdESrsSW68E+uI84kX9wU7LYXhPQPOoUBI/BcECinrVnhEDo+yedMfcA74GDP
	5uy+ZXqgpZc2ySZqrSmjTffQ/tn/VT+vVStOtPloboVMljQaboIzTl3EkZYyWB92Chs/nMSL/e0SJ
	KoUJYypccUgdvEHcc0Fetgnu1ZV6kqqDf5FckLK2eXlGSpbHyQyg/Wp1pqrbQ4YDqi8elPfdTt/TW
	pXNaoM9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7g5V-0000000DY5g-2bpY;
	Tue, 31 Mar 2026 20:53:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7g5T-0000000DY5M-1GIR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 20:53:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E757C41E45;
	Tue, 31 Mar 2026 20:53:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2832DC19423;
	Tue, 31 Mar 2026 20:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774990401;
	bh=x9UvOv0YJRzcsdGEQnhZlvNVNt/6OghCH7bhRc/MRdo=;
	h=From:To:Cc:Subject:Date:From;
	b=umpA/U03EBFsKfKcuLIJWoFPDip/PxEOF+yeMwP8RFFCIcBqOS0ulC7ih/hkK5iT6
	 FA4crWMc8ea/hg6ScRj9jVTrIHrSgj82axc7ykYDx2yBT9vjaJOevt67aUa/MCsIHL
	 CEi8mq3i3mjRJ9fbwnqJek9y5sGCngH9d42CYPYvCvkoMXbSW+96tXk3SvFm+kDRov
	 mDtu1O+ICQCgUeSrYYSV2v/73Ic7L10m2Rr04tEWkn62zhD0bi0gxPQ3HKfHKDYNil
	 98ysIUydh5CrOyUILlnElQQ+LHO22tTqr2r6CADqT1wcGW2Dh0qW1o40GigBV/O/kW
	 kunHuTx8BZijw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
Subject: [GIT PULL] More Qualcomm Arm64 DeviceTree fixes for v7.0
Date: Tue, 31 Mar 2026 15:53:18 -0500
Message-ID: <20260331205318.952913-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_135323_378431_B2D90FF4 
X-CRM114-Status: UNSURE (   6.80  )
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


The following changes since commit 2c409e03fc04b5cded81b7add9ce509706c922e3:

  arm64: dts: qcom: agatti: Fix IOMMU DT properties (2026-03-23 22:31:40 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-7.0-2

for you to fetch changes up to 11b72b1ca9891c77bc876ef9fc39d6825847ffee:

  arm64: dts: qcom: hamoa: Fix incomplete Root Port property migration (2026-03-30 08:08:48 -0500)

----------------------------------------------------------------
More Qualcomm Arm64 DeviceTree fixes for v7.0

The shuffling of reset and wake GPIO properties across various Hamoa
devices left things in an incomplete state, fix this.

Add the missing "ranges" property to the QCM2290 MDSS DeviceTree binding
example, to fix the validation warning that was introduced by the
previous fix.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      dt-bindings: display/msm: qcm2290-mdss: Fix missing ranges in example

Ziyue Zhang (1):
      arm64: dts: qcom: hamoa: Fix incomplete Root Port property migration

 .../bindings/display/msm/qcom,qcm2290-mdss.yaml    |  1 +
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi  | 16 +++++++++------
 arch/arm64/boot/dts/qcom/x1-crd.dtsi               | 24 ++++++++++++++--------
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi        | 14 +++++++------
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi   | 14 +++++++------
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi  |  8 +++++---
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |  6 +++---
 .../dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts    | 15 +++++++-------
 .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts | 14 +++++++------
 9 files changed, 66 insertions(+), 46 deletions(-)

