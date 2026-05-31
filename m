Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25337CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 06:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/RIAWcsdggrAj1q9UPmgQwLauoGYdsxwfmuNbjPmGSs=; b=A8uWOgASxkrV0wYT6u9gfzFkqF
	IAhM7YsfssSW4thULfnR6N02I0AqOG4MBkWPY4DfBym6jFMdWlmjn9tA3TJK7LGVACWTl1lwavmkp
	1Z4Jsr+zf3t26nHZZyZXDigdS5is56JA8loadS2DXMH54c1mBa0TETJSw/h1aO2dJGu1KREc7x0Xs
	CY2Tyf2bRfEb91ceIfgTs9rXaKt73Elbc1TA7g6wHUZtp2uls9rhrmJnitMy8UxMu5BcHsTMsoLZ0
	Vz/oFurzaXWW4YHkEKv3Yytx6PkEwOJnFsawS8wHChMCJ58UNtPJgV2+Fo2vG6IjImMoIbYVjCUr3
	3PKotT1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTZLd-00000009H5U-2F3z;
	Sun, 31 May 2026 06:08:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTZLc-00000009H5N-1rSE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 06:08:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 631E26001A;
	Sun, 31 May 2026 06:08:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86D5E1F00893;
	Sun, 31 May 2026 06:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780207711;
	bh=/RIAWcsdggrAj1q9UPmgQwLauoGYdsxwfmuNbjPmGSs=;
	h=From:To:Cc:Subject:Date;
	b=cNlgE9mHHW1NTP7r76+8D4Yp3igyIZ0Z8C3JjPzS9nrAAuHkJPNrJVyYVmN2HWnDM
	 F5CvXExKXGzLdq2qA3bo01L9XJrg7AFVvjHxR/IWbathKi3NhWFesfbExNxW2TFfNV
	 zu7+Xxb6d6J7JUP3KZ0kOY5taDcRaCHvevWyJ6G2QjOfwlhKlQ1iNh8USxUYfDl4za
	 8n0coX67+7NQ0Gqreifochtrg1L1ekFZk0UccpV3X2V9+H5ypXMDh1vztqBuTLh+sd
	 YFTDnB/PLzBYnUL+W8xEN+HB/juP6PS97WysgH4bsfal7utKISwaz/Gyv7+aCEppmf
	 XrjEDsaJv0ECg==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/6] dt-bindings: Changes for v7.2-rc1
Date: Sun, 31 May 2026 08:08:18 +0200
Message-ID: <20260531060825.1855391-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
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

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.2-dt-bindings

for you to fetch changes up to 1f1471284e9b5c2317b4dd8710270aa33c2fd2fe:

  dt-bindings: tegra: pmc: Add Tegra238 compatible (2026-05-28 23:11:15 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v7.2-rc1

This adds a compatible string for an upcoming new chip as well as
changes some maintainership information.

----------------------------------------------------------------
Prathamesh Shete (1):
      dt-bindings: tegra: pmc: Add Tegra238 compatible

Thierry Reding (1):
      dt-bindings: reserved-memory: Change maintainer for BPMP SHMEM

 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml   | 2 ++
 .../bindings/reserved-memory/nvidia,tegra264-bpmp-shmem.yaml           | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

