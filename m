Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE41C55162
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 16:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P99q5g4wyD2KldzYnXtXrIbQfUIhqAH5fUtD1PWms6k=; b=byTD6qgJYb6pKQsrSI80CpOqmo
	SA0PPf2V2xLYaDXpU+L57U8wj1i6JsANhcysXHqg5CVfPJQStRcWMOiZiOGTJcPM+vJSCVfDG8qF2
	9VgVU6i8U57a/GFU2PB/PzBEF3lxvRjnZAUU4w4wXnGXMI+OqWZlKUiW/BbIQOQQd6B8hmaCEb0fX
	w8jJHfH8CzxAg+5VjTkNocvvRP0OYUVqhAzy5svXmqJUsDUxsfKng8A9oT1l0iROLKKBFUdL38WFK
	4IMzUQk0GG0GqrGUxGJWUdT/Q22hOmX76nkkvi5XCCc3lZAQsXb1St8KqetsgNsxknozSH1PdCqXX
	ndsJeSYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTxA-0000000B2YP-20pz;
	Thu, 30 Jul 2026 16:49:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTx9-0000000B2YJ-17mN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 16:49:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D9B3841837;
	Thu, 30 Jul 2026 16:49:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3488D1F000E9;
	Thu, 30 Jul 2026 16:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785430190;
	bh=P99q5g4wyD2KldzYnXtXrIbQfUIhqAH5fUtD1PWms6k=;
	h=From:To:Cc:Subject:Date;
	b=hdTS+wrwQcvIhkyt38zuP3uyCBSYF71Av8w26LZegudizTaG4RdQV/lafKquMofgy
	 4PYjM4mSRKQxbOuibv+vHK54rKtfpVYgh3H9mOotB8aSJZzGxMOPvIYqDYCZMj8880
	 UHYtRTZ2HqeiNrXIxUftHn4XRKpTCdwgL98eT+VIpWYxYt3G5/BBC/BXmwEmBbnS+h
	 zA3GwJj8Yf/599XvIHwUHO2O/Sk58Srj3LCVK5kJpy6iWcGn4dOfWS8A6SBjw/J9QR
	 LWnvMT3vCcAjmwa2Nc8aIy6w4jDjtay22w09/0kaRgaeH4OVt4VQiN8ZqPGZBxgb2z
	 cImVh5oCiJDiA==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
	Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
	Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm Arm64 defconfig updates for v7.3
Date: Thu, 30 Jul 2026 11:49:47 -0500
Message-ID: <20260730164947.177468-1-andersson@kernel.org>
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


The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-7.3

for you to fetch changes up to 9c1bb154d40b36434e919865cbb2b23da58a963b:

  arm64: defconfig: Enable Qualcomm BAM-DMUX WWAN driver (2026-07-07 22:04:24 -0500)

----------------------------------------------------------------
Qualcomm Arm64 defconfig updates for v7.3

Enable the Qualcomm reference device embedded-controller driver for
Hamoa and Glymur, the DMIC sound driver for Monaco and Lemans platforms,
and the BAM-DMUX WWAN driver for Shikra and other platforms using A2 BAM
hardware.

----------------------------------------------------------------
Anvesh Jain P (1):
      arm64: defconfig: Enable Qualcomm reference device EC driver

Ravi Hothi (1):
      arm64: defconfig: Enable Sound DMIC driver

Vishnu Santhosh (1):
      arm64: defconfig: Enable Qualcomm BAM-DMUX WWAN driver

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

