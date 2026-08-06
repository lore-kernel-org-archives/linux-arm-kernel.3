Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8E3C561E6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 08:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D+0heS499WMn8/ZDqYM9hynjje4Gw8ZJl6CgmV7QoF0=; b=v9wru9CiPXRyWerN1OBlsnymKa
	FdJyIbKx2ZRXs3CQkrejV3zt8+30OXiIlaJzoHZV+3fqnclAw4Z1nJN4U5bqMm0WcCQcUwnqtS0iv
	mpSdTnBSXoH5K4ntZHrEw70DP16W9mTkKUdCCkCpIfF+5E78gEMVz0fQAJO1ypCVaaIdkKg9rZ2xP
	zD/ZB4PqOohPYGMDHF6KBygvlrI6BqSlIKRTdkS1zlQbr0aNYkCMlekQ4Qvpgx24fj+ttZo6v2+HE
	4ksKBw0YYxbjzHSDQI6UmKXozAIEWl78GIzSDRr1UDsXchX4MnKuWMrk49Z+ueIJqXxLyY3GNb3Mm
	Mm4oj8og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtJz-00000005Cs5-0Teq;
	Thu, 06 Aug 2026 08:19:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtJy-00000005Crl-1Bja
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 08:19:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E3E960A64;
	Thu,  6 Aug 2026 08:19:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D28941F00A3F;
	Thu,  6 Aug 2026 08:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786004361;
	bh=D+0heS499WMn8/ZDqYM9hynjje4Gw8ZJl6CgmV7QoF0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CukeG4Jh6Z+V6Oy1eflG+QopdQZjFiSuYrgKfTThB+wMYSsAMZXXg5V7yGbIjI57e
	 opMfEKIUh7Mt1eQbVQOWSjHKQm3JfsPPPv89BcqELF/QPjGqNtUOQ4xAX2H7Ipj0Cp
	 7ATv1oj6k0QRP2f+28BrlvqwM2RAzS/fu2iYfRWcJIpR3XwLoevAoJ1wi1lUbMd392
	 Cdzt/pSJbGlfDjP4JEcMij58xB7OMfPMgdODVV3lNYcf8F24padsB9XG4aQG0iNjBk
	 lg6ozPyo1tsZDcKN3EusTgOeRyCHN/GoNRFjrFwagwzeVgx+Sh3jfbVdxRG+qc/9o7
	 bgohRLxrAV5Wg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL 3/3] ARM: samsung: mach for v7.3
Date: Thu,  6 Aug 2026 10:19:03 +0200
Message-ID: <20260806081903.165005-6-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260806081903.165005-4-krzk@kernel.org>
References: <20260806081903.165005-4-krzk@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1196; i=krzk@kernel.org; h=from:subject; bh=Xyhmj+aDFTtIRlFLPpMbuYd/nr59AXNjT07GC2bojFY=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqdEN56v25JrMudRGF2XtGiuv5Lr8TEXdThEYxn 44nLXXXfCGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanRDeQAKCRDBN2bmhouD 18epD/4w6HXLRLqbAjooYqlbReI4D+KYr9ghpD050JWUX+MOsPTIq9Uxf+uNOi2XWcYwaWSB9m5 1QgKbHj8y0ZbsqT3NSlxr2nbGgvieEtsQQ7OiqhGKuT+JiPi1/8bL/I8TXbb/PKiRa3Wl8h7548 6vFE4YbopDwhGKChogkZX1hDU1w5yE/ibbgYf8YX6uIxdiG3+lbHw+Ljy2fjO1KOzqUzG6edg03 CTTL/8KtNxvUMApQrR496TticUqpyQGeN6t1oYvboE5XUVNAAPSWWsRcnu91C3UjjJE/oG3nuFM OcRZeCMPyaR6nyd/NSlYFKvTyQiph/tuscahH9dbGGgxbalh73gzhH/gL29E0axyWEfdqRqXcaK ff8kYqGSlA0uJk4zrlBtQdONbXb1f18cf2EIvd7LiLFsGKAtKHLQeX8WVTlXCQIu4kNNu7cwDdJ 8EZJTrjoo1pYBASLH+kouwO+Zybn1/F2WoSXvD+2SDyCb3DDlKouc4fOtugFksNogg9sWHwgAwj XTGZEWLgM9IlPk+zw5XEW29x2mLmj/ayJiqcTjdrsg1j7vn+9zyLtVyEKiVqqCfk9xbQ4Av2utA pzt69EVaILgS5YgDm/go4FctQ8dLZ6WhZ7UrR3Z7rMna5JX27QN/jESJZ/OozoAnu+pAuD7sdCX xVMNJxLQq76rBTQ==
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

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-7.3

for you to fetch changes up to f839968769b64bb81878a626d34097959ab79295:

  MAINTAINERS: Drop redundant lists from various Samsung entries (2026-08-01 17:07:51 +0200)

----------------------------------------------------------------
Samsung mach/soc changes for v7.3

Two minor cleanups:
1. Replace __ASSEMBLY__ with __ASSEMBLER__ in headers to have
   consistency with what compilers define.

2. Drop redundant mailing lists from Samsung MAINTAINERS entries (less
   code).

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      MAINTAINERS: Drop redundant lists from various Samsung entries

Thomas Huth (1):
      ARM: s3c: Replace __ASSEMBLY__ with __ASSEMBLER__ in header files

 MAINTAINERS                  | 21 ---------------------
 arch/arm/mach-s3c/map-base.h |  2 +-
 include/linux/serial_s3c.h   |  4 ++--
 3 files changed, 3 insertions(+), 24 deletions(-)

