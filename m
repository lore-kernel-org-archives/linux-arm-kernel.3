Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8337CCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 09:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zFrzFI9CO2RgAFzCk5OPl/Rn0r175A9AO9G0lV6hQ0k=; b=2VSouykaujx01MKoL4LVDPe9oK
	Wg/WavXjVpWpoBMzrrWOAQo/Xn1Rcejhy30vdo13pwqBFtOTfzb6fxQ4Snb3/2MWo7xku3ZkVGL7Q
	V8oO8XEMYgGPJKZmoticWg8+imSNWCo435PHisgSIGwNt+eBHh2sM3fZxo/rdXefjOLG0iOA69A11
	D1+sNlI8lLzwLF1cGqVei0Gesqu6HbbkXJtNs+ITlP8qAWU7BhOycQdOmHQJq9PeFjb+BdHOopYnG
	/KYN/ai2gOBw1En9EyTwf40OJYk48Z0JDU32t0JTohH+0G4mSw0jK1G+aw3Wf6EbTBFXIzNnos0sS
	iuKk226g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIl6R-00000006t22-34tB;
	Tue, 11 Nov 2025 09:55:55 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIl6O-00000006szq-1XOb;
	Tue, 11 Nov 2025 09:55:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762854949;
	bh=taqJ88tgrMmaM/VXubOrq+GZSJDLUZiefDWipANLyKE=;
	h=From:To:Cc:Subject:Date:From;
	b=DCv/dtCZRxcj7lR8ewssFjoHh89wj/51YqeF0kLDFqy670u7JocDna67GU7DR5bW6
	 tjnYrAyVlQ68mnakzipsmM5ekJ3LAqdnHyBO21VVPfqOt7RHDbgecdwC69YaU/CHzL
	 vzwBZUk1uybmClxTxv3C1WLaPmoyvA9eqjKIiCCZs5hLPBxsnDbsl0HH+T1193Kmk5
	 ZCA4dGkx1S15IpB6xCkr0ezhH6z0Rq7pJzwxuzW3G7RtN8sMI7qBh1Ld3fFc6ys/6j
	 jc0H4Gnr1cD8GuXF11W84qUa8NJQr21FxJ9vRdwJZkXjKWgtbjpbExbO5k24R62NZQ
	 LthG1SlvY3bhA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EDD1517E130A;
	Tue, 11 Nov 2025 10:55:48 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,1/5] MediaTek ARM32 mach updates for v6.19
Date: Tue, 11 Nov 2025 10:55:36 +0100
Message-ID: <20251111095542.13958-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_015552_592008_BCC6FFC4 
X-CRM114-Status: UNSURE (   7.59  )
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

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-arm32-for-v6.19

for you to fetch changes up to 7f637d718752f1b821f90170bf841c4d924b382b:

  ARM: mediatek: add MT6582 smp bring up code (2025-10-13 11:46:58 +0200)

----------------------------------------------------------------
MediaTek mach ARM32 updates

This adds support for the MT6582 SoC and its SMP bringup code.
This SoC is found in old smartphones and tablets from various
manufacturers.

----------------------------------------------------------------
Cristian Cozzolino (2):
      ARM: mediatek: add board_dt_compat entry for the MT6582 SoC
      ARM: mediatek: add MT6582 smp bring up code

 arch/arm/mach-mediatek/Kconfig    | 4 ++++
 arch/arm/mach-mediatek/mediatek.c | 1 +
 arch/arm/mach-mediatek/platsmp.c  | 1 +
 3 files changed, 6 insertions(+)


