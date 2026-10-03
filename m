Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A5DCA5FE3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 09:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iDyRWil47bGyThquFijRBaS0VEfSp1CCoYZFzfGdrxY=; b=S9UtlSbtX/ZBsqWbwOyKS545kQ
	1v3pNPEj0PDVSOk5gAQJdv9L+JENDKCIPKnlhIe2iK+3Oyq7etz7xvJkl1nmvnwYTgc4k8C25bgEV
	2vkPLCo85yTY0x/kcH/elGMBya+AggIrGD+U16XTfWtJlkdhwk+7qkkhsYjDACic5oCe22XqQwAvH
	/NXyJZAJ3PwkUv9LwpU0xNFdEMoxlFfzm6u3e9GpwCc2sd9SIJfXDypsS1IRvGzZE/2XU7Yn0aSDy
	uwg0rCmhJYghb7hcLmCOTT6YyCYnnPkq4jcXWv/8bQneDRJFwFizEsZFwWz6QHgtgZ9YFwwPqPDNs
	X/6avIyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwWw-0000000DJoi-20Zg;
	Sat, 03 Oct 2026 09:59:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwWv-0000000DJmm-0eVV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 09:59:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9730760D93;
	Sat,  3 Oct 2026 09:59:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B972F1F008A0;
	Sat,  3 Oct 2026 09:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791021584;
	bh=iDyRWil47bGyThquFijRBaS0VEfSp1CCoYZFzfGdrxY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bIpx29mNT5f+TrYf8/DE1Sd+Qio9F5rZJSKsZrnSTF+/xEoxNeMac4phRmAgdRado
	 jmijyyInDBYSVWvEpIptx2lhxPDLey2QZy8P7t1omsThSGGC9MdpBWzlrfcs7h+gTI
	 WjblhfA9AJmXnTAav68OgfS4UodhZKb/Sispj/2mqfpbjCQCpZpxfnIBCuMlDP5qw3
	 3vCjcB7dtoj3Fkvxe1DYnhFTLatuzdfqplZ2r2Wl0KVWVhxax4N9EzUbxI2GaLQXpG
	 JG0GUkPhAqbyKu1q8THdS/k9/P2rh6566Em5c/i8iTiJQhYilVgjnViC3vv8j3Y8wH
	 7LHo+lKX9QJ2A==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 7/7] arm64: tegra: Default configuration changes for v7.4-rc1
Date: Sat,  3 Oct 2026 11:59:22 +0200
Message-ID: <20261003095924.1370238-7-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003095924.1370238-1-thierry.reding@kernel.org>
References: <20261003095924.1370238-1-thierry.reding@kernel.org>
Content-Type: text/plain; charset="utf-8"
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

From: Thierry Reding <thierry.reding@gmail.com>

Hi ARM SoC maintainers,

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.4-arm64-defconfig

for you to fetch changes up to d33a04d2712104a84357c6f485605a0a5528c5e3:

  arm64: defconfig: Enable I3C and SPD5118 hwmon (2026-10-03 00:49:35 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Default configuration changes for v7.4-rc1

This is a single change that enables the I3C subsystem and the
DesignWare I3C master controller, along with the SPD5118 temperature
sensor, all of which are used on NVIDIA Vera devices.

----------------------------------------------------------------
Akhil R (1):
      arm64: defconfig: Enable I3C and SPD5118 hwmon

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

