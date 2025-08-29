Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC6F5CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 17:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z1E0RaZ6/bmJtH/+QPC6Ipbxaa7Tyh27GgmE1fRPVBM=; b=4WurbxhaPA7T+k3wY4I96djzli
	4tJkbPM8pcqJGUkc6EypxmkBO218PTNDOU1EMAFLj7IHOq8TUe+zFXa1twW3hXhDe7fdUNjhzpZaR
	nnq1onMLrUV+iQTNNEA/fF0Z0K7aZOuFMWMSg+4c1yVA70bm6QrcxxfplyTKZhKBguLYJ5oYteki3
	44YhcUlptj6DQPdH0cVL2NmhOTCJK8I7yYc0wtxq7L7N0oCNhOsb0As6Y2FIFK5P1NwIwUlxP3DzL
	qSBWUioMlXiLuCRuFYlfJtS84XfzhpslKDB1AfAA7JHjev7PcWYyE48GNZ8BUZLmLzFoyzyXPJ0c6
	HqsU243A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us33P-00000006Yc7-3Pub;
	Fri, 29 Aug 2025 17:38:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ury3l-00000005cYp-2f3O
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 12:18:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F7EC4549C;
	Fri, 29 Aug 2025 12:18:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 552E0C4CEF1;
	Fri, 29 Aug 2025 12:18:23 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/4] Renesas ARM defconfig updates for v6.18
Date: Fri, 29 Aug 2025 14:18:12 +0200
Message-ID: <cover.1756468043.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756468041.git.geert+renesas@glider.be>
References: <cover.1756468041.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_051825_692476_8ED60AF4 
X-CRM114-Status: UNSURE (   8.43  )
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

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v6.18-tag1

for you to fetch changes up to abd7c0293816a5fa5766710d2e7b576384fdec4d:

  arm64: defconfig: Enable the RZ/V2H(P) RSPI driver (2025-08-11 16:23:10 +0200)

----------------------------------------------------------------
Renesas ARM defconfig updates for v6.18

  - Enable support for the Renesas RZ/T2H serial driver and the
    RZ/V2H(P) RSPI driver in the ARM64 defconfig.

----------------------------------------------------------------
Fabrizio Castro (1):
      arm64: defconfig: Enable the RZ/V2H(P) RSPI driver

Thierry Bultel (1):
      arm64: defconfig: Enable Renesas RZ/T2H serial SCI

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

