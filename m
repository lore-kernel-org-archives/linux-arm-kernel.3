Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05841E9D834
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 13:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tK3O76BzFxR3NTCCUf/kOsnoLPAQBJDNUZl95DxKc8Y=; b=2x3XCFHT8XgVnBKzjGvUGiOXD8
	dD85eht0P40d4PAjqRWs2LASLJdFh+66nkLDkNsV8v/l//5lKEKX55ILubTiwR9kUjEIQ7D2UoSmG
	2d3KCPPjsGQeiP1xTm3UEBxqVmiDASju3WGe0w834VqNZtEj4g2rbp/nciivy8eM8rwt2X1aMmAik
	YanxE4sJ8YJHrlANWGs9Ppb+mUaJokFEHIDshNxcq+WZ/yjF24w1fQaea/f3FQhpZ4gXCU3u+vzUM
	boDcfik9KdQsE4kX8uWetZA8Q6G4cEFTXBDwcUb+m0Vb9wOxUvzCShrKdruyFdSf1abpgPLdsDXy8
	SuWxmxqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9jtf-0000000593C-3ej3;
	Mon, 06 Apr 2026 13:21:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9jte-0000000592o-1FR0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 13:21:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BC531600AC;
	Mon,  6 Apr 2026 13:21:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5CB9C4CEF7;
	Mon,  6 Apr 2026 13:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775481701;
	bh=gMzvZgJhPQDGhuIKuU+VTQeMpr2RvuGJOM4ZILaIqFM=;
	h=From:To:Cc:Subject:Date:From;
	b=fsgW6wgGxQgAydwtbIDhTk+P+JSilrn1Tax8ZmMrcV+Lk2Pca7Vwn6KzcjoppNSBo
	 +z15AhJqxG4SvBN8legbu7ORAtxK+8tvlPnTKzS77w9pNmMsosqr2TkxXKQdSN5seZ
	 BHn3SYsmIKXRrUJ+GBSlqB1dDjSJqUs29KHvbJOvbEmNzlHofD5zukbFBz80Tqj7Xu
	 cyUwAM+nFcSIcj63J8NRUy9ifU8PUfwHpbH+SOQXuJ0n5NFcvH0bKzoqgIV1WeUaGP
	 APnZ56ai67I5jUlkIAY54LXp5kfIZK3KX+0CUR1BBFtfOJf3Fm5UV2YIBoxnW10H+H
	 bDmrBaJslID/Q==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [GIT PULL] One more Qualcomm driver update for v7.1
Date: Mon,  6 Apr 2026 08:21:38 -0500
Message-ID: <20260406132138.2265013-1-andersson@kernel.org>
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


The following changes since commit d6e766e391ef0b2be62682e007223fc72ba7764f:

  Merge branch '20260125-iris-ubwc-v4-1-1ff30644ac81@oss.qualcomm.com' into drivers-for-7.1 (2026-03-30 12:46:14 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-7.1-2

for you to fetch changes up to a31ad9339eff4ce401dec816b01a94b4e3c47898:

  firmware: qcom: scm: Allow QSEECOM on Lenovo IdeaCentre Mini X (2026-04-02 16:09:01 -0500)

----------------------------------------------------------------
One more Qualcomm driver update for v7.1

Flag Lenovo IdeaCentre Mini X to have functional QSEECOM/uefisecapp.

----------------------------------------------------------------
Bjorn Andersson (1):
      firmware: qcom: scm: Allow QSEECOM on Lenovo IdeaCentre Mini X

 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

