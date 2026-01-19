Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA9CD29C43
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 17:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PlTicvZTPcl321u0fURHRjZSH0DCCW5nHUV/2vqk8Fo=; b=S37vyQBXPK/qQ3i7SJgRvRM59w
	78x4rOdIS1t7nxLInumS56MVCwPuH3EPdK2pJhpLX5jjAJaxIK1r99BFZrUtOoweRxibqQ2tVR4h3
	ZPSl5Wx6s066Lg2u52UGjp8SLkjasR9SlAKpKfoOpmyab4oP3MgALR05wmTxSoAqD2O0wowBPYFA3
	Fwn48mSEuNb5GQRNmJRogd8ycOkZOztPCReUlLoD4CcwZ0yi/x9MLNcTPRzmy43GtIaWO0L69o75K
	KrhJlBTfeCAePopwc7w64Q2rt+GRbr5vS9BLpZdKXD5S9u+cn2UxiyNMK3eNvbhRjDwDSyuOVp5vG
	aIEAdvCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsey-00000002aJ7-07Ln;
	Mon, 19 Jan 2026 17:03:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsew-00000002aIp-24b0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 17:03:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9536B60054;
	Mon, 19 Jan 2026 17:03:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A397C116C6;
	Mon, 19 Jan 2026 17:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768842201;
	bh=EcK0McsaD5PqEhzXSuPqy2gy/gwkBquxIH6Ix+hFNnU=;
	h=From:To:Cc:Subject:Date:From;
	b=sXWiBJd8i1JSvuM0+NEYSc7T5ujL4OKYw9FJl/MJLWZNQClkEgACHPXbZb14ALffS
	 8YaFqZ7jpEesEXvMrTWbYp0CngKczu70RZXKovBkO+nNz7V/5ok1Bmsf0qtLH08+4u
	 DVKZD2CokHcbaLN+6uEZmullzY3THYuEQRzsgniFYsiD0IJ/CwvLUyWy+11epPJZDt
	 G/IzrMIF/XdCHCZCdZRIyaU0jWStTBa7n1R+hcVyuUVyAOZQIp7Wi/iLoSe+/olZ6Y
	 cDZv2n4FrjBVGwCQnjXbMMJp7de61n4niRnZIJXiJNadaChJbfmGm9uOJq1s6hNYEO
	 wJ/sleEizT30w==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Subject: [GIT PULL] Qualcomm Arm64 defconfig update for v6.20
Date: Mon, 19 Jan 2026 11:03:19 -0600
Message-ID: <20260119170319.847911-1-andersson@kernel.org>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-arm64-defconfig-for-6.20

for you to fetch changes up to 9f262627a90c3af102e066ad922e966d9f6fa24b:

  arm64: defconfig: Enable EC drivers for Qualcomm-based laptops (2026-01-03 12:35:00 -0600)

----------------------------------------------------------------
Qualcomm Arm64 defconfig update for v6.20

Enable drivers needed to boot the Kaanapali and Milos platforms.

Enable EC-drivers found on various Qualcomm-based laptops.

----------------------------------------------------------------
Jingyi Wang (1):
      arm64: defconfig: enable clocks, interconnect and pinctrl for Qualcomm Kaanapali

Krzysztof Kozlowski (1):
      arm64: defconfig: Enable EC drivers for Qualcomm-based laptops

Luca Weiss (1):
      arm64: defconfig: Enable options for Qualcomm Milos SoC

 arch/arm64/configs/defconfig | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

