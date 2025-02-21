Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737B3C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 17:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r1YyZKHiPIJWO1N/1sgwfM9CKHCZ600NqMSwpmqbWzs=; b=HDUeyex7NXO6vIzferFxnmVpi+
	HECymEIg/MJ9XbhQwSAj6481FR7xvw5Pknmd0XiHwy7rwS6me7zis2rNpidV1bmLtf4u5//1gGxdP
	0MfFzXxskFmAGdivLXaw5UCWAbFLqovqzL0sNHsra7Sca9HpOGC9XO6jqObITyfId/xWAsu2+UQZX
	tWYWyBXs37okE5+4dILCoJLQKpNQ31vjcbgZVNKkNJzmtlMHaZNJjxu+WF5XlVWckoqnq9rk7ZVJg
	l2/fYwnzUPqvlH7k57NirLEEwsDaKuElqe0oUeaQtqHMcL6vCDXV8Dt7MYgirB7MZAeiuCjRLZKX/
	2aYVdbsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlWQm-00000006IMQ-1aRj;
	Fri, 21 Feb 2025 17:03:16 +0000
Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlWLK-00000006HOu-1ymg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 16:57:41 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:ae9a:419e:d123:9695])
	by michel.telenet-ops.be with cmsmtp
	id GGxX2E00D0y8aK506GxXtj; Fri, 21 Feb 2025 17:57:33 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tlWKs-0000000BMsR-3Why;
	Fri, 21 Feb 2025 17:57:31 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tlWLD-0000000EOqo-12jX;
	Fri, 21 Feb 2025 17:57:31 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/5] Renesas ARM SoC updates for v6.15
Date: Fri, 21 Feb 2025 17:57:23 +0100
Message-ID: <cover.1740156740.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740156736.git.geert+renesas@glider.be>
References: <cover.1740156736.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_085738_663025_0F9611F4 
X-CRM114-Status: UNSURE (   5.75  )
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

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-soc-for-v6.15-tag1

for you to fetch changes up to 490a6291b17fbc65e31c54a0fd9301669ad283c0:

  ARM: shmobile: rcar-gen2: Remove CMA reservation code (2025-02-03 11:04:28 +0100)

----------------------------------------------------------------
Renesas ARM SoC updates for v6.15

  - Remove the legacy CMA reservation code on R-Car Gen2, which causes
    issues with highmem.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      ARM: shmobile: rcar-gen2: Remove CMA reservation code

 arch/arm/mach-shmobile/setup-rcar-gen2.c | 76 --------------------------------
 1 file changed, 76 deletions(-)

