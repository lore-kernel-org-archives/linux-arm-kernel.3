Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820C7CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 17:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QIhX7rqrzQrwV8XhZ5o+irwRJ9ozuxAi9FRXh6iwrnU=; b=bNfxhx6NPn5TVel+oKONul3ibc
	LqfpMw4WXApnTGjeJw/a9j/X82yqS5OHvKODVbsiSU+HP2D6U7GaqmXxl3/mvxWEc26qNmbj/2g13
	QcUnYclJpdpx/yqa4/EO4tIpbeO3M45FobHWTfW9O5uEp4yIxVVMqdTdN918vCdDVVHmzUImVAIWi
	ktmqjoPiP9u4ZtzuGIKJeqdZot1CrqA9X+UOnqxoMJBz896OfEx9wV+UGOFKwgtiQJ3T8030mAPLF
	U0bI5v+kZAtJ78WNnE5d5oEyndM2CQTN8wJRbsmkMbQEsqgx1899blgj2duU5aDtEfL4D0qubClxq
	3Fk2Rx9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us38n-00000006ZCk-4At1;
	Fri, 29 Aug 2025 17:43:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ury3p-00000005caF-0mjp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 12:18:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D83860054;
	Fri, 29 Aug 2025 12:18:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33DE7C4CEF1;
	Fri, 29 Aug 2025 12:18:27 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/4] Renesas driver updates for v6.18
Date: Fri, 29 Aug 2025 14:18:14 +0200
Message-ID: <cover.1756468046.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756468041.git.geert+renesas@glider.be>
References: <cover.1756468041.git.geert+renesas@glider.be>
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

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.18-tag1

for you to fetch changes up to 2da2740fb9c8e26b6b5e20d74f2ed1d49824236d:

  soc: renesas: rz-sysc: Add syscon/regmap support (2025-08-20 08:35:55 +0200)

----------------------------------------------------------------
Renesas driver updates for v6.18

  - Add syscon/regmap support to the RZ System Controller driver.

----------------------------------------------------------------
John Madieu (1):
      soc: renesas: rz-sysc: Add syscon/regmap support

 drivers/soc/renesas/Kconfig          |  1 +
 drivers/soc/renesas/r9a08g045-sysc.c |  1 +
 drivers/soc/renesas/r9a09g047-sys.c  |  1 +
 drivers/soc/renesas/r9a09g057-sys.c  |  1 +
 drivers/soc/renesas/rz-sysc.c        | 30 +++++++++++++++++++++++++++++-
 drivers/soc/renesas/rz-sysc.h        |  2 ++
 6 files changed, 35 insertions(+), 1 deletion(-)

