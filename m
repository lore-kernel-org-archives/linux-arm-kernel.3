Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 516F210A62CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 13:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V+IQh2bMlNIHcEvQUAb1og0fb5F+EUrCaMN/nPuxpxE=; b=D6ioqHS8RVNpj9qKGXzP6/4LbN
	Z1FrFNQGrI0iPSBTC45fQTY8jF9DwRKFpTXXCsrnkYHgD17qLF1z71MWlVeXhmfXjMlic7lyvqq6z
	6I9iOBeZD1pX8i2EqTqEqJShFfoc/f3cBzbbH1UrQxPuJU4mqMzR3zOULZVwjiCpXGO3kbyMBzZsD
	b8Px92lK8ZQGm06K97Qtu86PbtrOGLVdIreIFprXOxjW2nVY1omEoeUY7KpZ1tBwYxfm2QF+mPwJo
	iVP6wv5zvyB73e/zrydFyUhOxTZssxKR6yTBMU9x4JwDwH15+3nS9fIiy44xHpvephhhckakjFEgD
	9M4nlLJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ko1-00000005YTF-2dSG;
	Thu, 26 Mar 2026 13:31:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ko0-00000005YSu-28wA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 13:31:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6720F60053;
	Thu, 26 Mar 2026 13:31:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30EDEC116C6;
	Thu, 26 Mar 2026 13:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774531883;
	bh=si+jevF1tez+sJmAqLfZ+PpqgojMBaE2vdJxM1Sql6s=;
	h=From:To:Cc:Subject:Date:From;
	b=atlSNU+xyyR3FPljR6Eqa/bAswPaibNUdndeJMiCKNuPeY2HU2Yz/k24VwHxHfoCp
	 TbRve90y0wRkoy6xqKC3Rkegq5ce/XO1XPNvM/rZdxyDAQdIc84ve+KVmpw10Ri2h0
	 evPvQs4GaPAW4G6G+jv3CEbV1fgQ47ZjlwEniKD8mdtaEnNfOMyHpqEO3AdFKA+Tud
	 dI7Dybo0l2YGwDVYjBlJ9rRYZwlJyG7Ur3yPA63r9VYb9ItzmZj3Wc+zr7yZQN2E9m
	 5DllpWAH4EzvKvnUi2MKcwwQplviH82fPBdVgLGrHOeQIg+CsSj6JPEe7HpKRRi7bX
	 lGtT5skPuKJ6g==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm driver fixes for v7.0
Date: Thu, 26 Mar 2026 08:31:19 -0500
Message-ID: <20260326133119.66268-1-andersson@kernel.org>
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


The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-7.0

for you to fetch changes up to a343fb1e03cfc9f6dc83a5efb2a8d33e9cdaf6b9:

  soc: qcom: pmic_glink_altmode: Fix TBT->SAFE->!TBT transition (2026-03-18 21:51:11 -0500)

----------------------------------------------------------------
Qualcomm driver fixes for v7.0

Fix the length of the PD restart reason string in pd-mapper to avoid
QMI decoding errors, resulting in the notification being dropped.

Fix the newly introduce handling of TBT/USB4 notifications in pmic_glink
altmode driver, as it broke the handling of non-TBT/USB4 DisplayPort
unplug events.

----------------------------------------------------------------
Konrad Dybcio (2):
      soc: qcom: pmic_glink_altmode: Fix SVID=DP && unconnected edge case
      soc: qcom: pmic_glink_altmode: Fix TBT->SAFE->!TBT transition

Mukesh Ojha (1):
      soc: qcom: pd-mapper: Fix element length in servreg_loc_pfr_req_ei

 drivers/soc/qcom/pdr_internal.h       |  2 +-
 drivers/soc/qcom/pmic_glink_altmode.c | 39 +++++++++++++++++++++++++----------
 drivers/soc/qcom/qcom_pdr_msg.c       |  2 +-
 include/linux/soc/qcom/pdr.h          |  1 +
 4 files changed, 31 insertions(+), 13 deletions(-)

