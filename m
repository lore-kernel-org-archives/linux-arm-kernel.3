Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A17BCD6E52
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 12:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zORGeWuTCNHFb6hRylyD7s9kKaOx02hxKZ8rvXfea0I=; b=Cr3KdTD6+70nXF96rew1FlBqOW
	O3FnfUAJ/yllzEDTBo8Nbwt7FQN4jtjl9HHOhdr7u9K/+Y5bb6xJBQ9iw3fAXw6xS4GFXPBIX/otm
	m1GXvtp8//9JWTRAe0ENy8/i4/CrQzMz6j3NljHLZG60oxs6dtdjFtV4m4AcEIjlB4II/fwqh4bXY
	lQnZf4EOrGJKqAl1A42X6THdwaHA7/ZKo58OBfYjomdVVuihr1qtMyywOnhGsLVIlw2Ust+UCBVt5
	I2HSqEB/Gh+TA9lKb4uLdzOZNr2Oix2VO4jSBg+pJyuLaKM1lCNggfNIS7duIWXnUVG+re9xkLVI5
	AUdbZ0mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTewx-00000009Z1h-2vY9;
	Sun, 31 May 2026 12:07:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTewv-00000009Z1P-0CCD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 12:07:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2B2A460138;
	Sun, 31 May 2026 12:07:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F1CD1F0089A;
	Sun, 31 May 2026 12:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780229243;
	bh=zORGeWuTCNHFb6hRylyD7s9kKaOx02hxKZ8rvXfea0I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=js4n3+7+v3K5Tv77SQsDR7WI0DUARPFkX1P/3XV1SOpo79lKXoU8vfWJ0W9hBrjDs
	 JNPGS8fpxpahWtWZ20g6C1M/g5yLqn9AhDSlHJ5aj+p7GOApEm5YcWApxicQ3KJ8b2
	 YSd1qvhzh+guUELpcARykR/XJW//qvUmcbu6pwp1bnKRjhKCsvRgSIGVPjfar8IOMA
	 OkMAmERCgdNzEpuxnbI35nRDCnQc2ZobKzXCbu+IJVoqza8rDHsraRder+3qqdoh7m
	 +48oFGlFf+N7z3k1oT/pPRursveUHdD/OnM4DIMPAkJ0DUWaV5SjAeH+4gOHDs5U2N
	 uFCuy3XXYqVFw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL 2/2] ARM: samsung: mach for v7.2
Date: Sun, 31 May 2026 14:07:09 +0200
Message-ID: <20260531120708.21017-4-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260531120708.21017-3-krzk@kernel.org>
References: <20260531120708.21017-3-krzk@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=832; i=krzk@kernel.org; h=from:subject; bh=pAo6hBdIG5A1dOfFT71zH2XqG2hBMV9l5Je5Gi8xvQI=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqHCRtiR3xlZ356nsuc1DBE4XfIARyYSGCdJvsm L2Hm1zX9CaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCahwkbQAKCRDBN2bmhouD 19IVEACAfFOV73GgiP7yXctThdSml1CzW9Zaj0e8lmr2ojgWWRP59PTCjnECC1tlzo0ccog+71K iKAoc3Nu1R7gLtjC1q5gwVS5gWS3Eyh7JODGJVnIy/iStFzPwLA0r7rBxXN81NGpnYLsT18exxb ANJty5QhCeXzYw/kh6/11BFKXLiKT9OsZ4Uey9XyQKbV+75Nq18OzOdbOl2pTBkMd7PTkMNvRoU 0ce2pr1U9lzkGtJl7HoBJfBmTfeUOtCC6F6NviXPXhh4615al59ygiUwGHw7sNCOmKJKqVOf7si l9S1FTuVOtLiGYtYFtoWgeplkfHaVCkk3amrJWu1JmKlCrCNl3+PJYOgY9LklE3OFD4o5soCy2P m/qjBFNnoW/jP0snJusas1EHGUMU9Hjn5EQ8w1e+Bh11noyr9k/6FjiNsJyU/xX1ngMPum5Qm2n 77eL2RYrpeB/tKmd5cEVtUz5ZOjS2Z+0w5Z3YJkDJUyYdTr1c5N/4DTemR1FcgLTS0bXucbALz/ Frs5viIBxG+s/GB8E+4PWdmMEINLkLdmEOFdxNHW1MuZksi+o6bWLesMHIgN3LbiXJ0dvV4Wyd0 NWSQFlrjfJR3/G2ICI9xX9j7kKptpKwpAyFdDDMuxW5dCHVvL8mYRx8i+s0lf9modO71K6Dh6xK 5qgnMMtGLUdK20Q==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-7.2

for you to fetch changes up to b64cbd3f5d96b143fa9f21d84d381b1bb286339c:

  ARM: s3c: use gpio lookup table for LEDs (2026-05-04 19:09:09 +0200)

----------------------------------------------------------------
Samsung mach/soc changes for v7.2

Remove raw GPIO number usage from S3C6410-based crag6410 board.

----------------------------------------------------------------
Arnd Bergmann (1):
      ARM: s3c: use gpio lookup table for LEDs

 arch/arm/mach-s3c/mach-crag6410.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

