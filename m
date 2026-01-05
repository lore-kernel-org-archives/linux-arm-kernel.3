Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29443C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 15:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uE3nHiUT/9KOAX8UDuPnB+w0xSTCYpPeZoBDtBbAulM=; b=QGKyMxCiCkTL+/6cv7aipb9Gi8
	4wZ8yiN0eSDx0ULAMZREBECQEg6ilxN9MhgBuWbcmDNab5w1bJ87WNjP1yBcSd6sVt0YW0R9sq+sq
	F0ee4pWhqk0Zt+xU0aYnPP3FQUWiz/buZR5sXGFXAS3NRVU+ROCjz11rxNnk2xnSpAFMWIosToUX5
	75wYVUHmiDtonWchgVpfuYUTs1m3Y6H3J6yw0BP9hI6u8YcO3vSqBimYkGJfSq0ZW4ZPqxeeJYAhf
	9qdIi8o1/D0TB8BWqfiqejPjEINluFSOjJ2yS1Lu7FFaT6jFKhWiPKxCXz0qbjZwbzxPY8xvku+Yx
	N3JhwYIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmxw-0000000BgU9-1uRV;
	Mon, 05 Jan 2026 15:57:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmxu-0000000BgSD-018F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 15:57:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 13B7A6013B;
	Mon,  5 Jan 2026 15:57:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 429EDC116D0;
	Mon,  5 Jan 2026 15:57:51 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/3] Renesas driver updates for v6.20
Date: Mon,  5 Jan 2026 16:57:39 +0100
Message-ID: <cover.1767628167.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767628163.git.geert+renesas@glider.be>
References: <cover.1767628163.git.geert+renesas@glider.be>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.20-tag1

for you to fetch changes up to 1bea7e94bf09ee6d46051076866a9369f64d302a:

  soc: renesas: Enable ICU support on RZ/N2H (2025-12-23 09:25:33 +0100)

----------------------------------------------------------------
Renesas driver updates for v6.20

  - Enable Interrupt Controller (ICU) support on the RZ/N2H SoC.

----------------------------------------------------------------
Cosmin Tanislav (1):
      soc: renesas: Enable ICU support on RZ/N2H

 drivers/soc/renesas/Kconfig | 1 +
 1 file changed, 1 insertion(+)

