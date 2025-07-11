Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE36DC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 09:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gVAMKzhcaXlu8FsqtMyYdkQe8c4jjQ1pemL98owXOhA=; b=ZPuLyaJOpV5cYzoG3eeUpDwO38
	Kq+MiWuTtf0RjJO0+iJJMRpqoOv+XIAB880ZMP9DeV3pIwp5Bos7OtkaoY0TMnroTGFOdl1mQhbON
	f96rHhsyhwvQGN5tnIGyYqafNsPAlm5dknGRmxDssjq0nN4J1H7CfFlFP0p48PvXCNd8l8PJqPRrB
	J1saWcBwiiMFeoPoEHaTNTdD6f8nZ3YieaRLdLbH5yklTLJZ99u5CsZGB/g/vhZ4g+DbrUe0ERWLH
	2NxfIOHGbJcxgB4sky2GD6V0gbJVuOgONxttefoSpZMCn5adJg5Sh/I65YQyLC1XTCUbwqCOe3spk
	7HjKsqNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaAAr-0000000EKZ8-3Q8u;
	Fri, 11 Jul 2025 09:36:09 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua9Fd-0000000EAli-3UCw;
	Fri, 11 Jul 2025 08:37:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752223019;
	bh=y0aPRwANdifwMCZnj1MfkC/ifenoxmwVdFLzlQuwxU8=;
	h=From:To:Cc:Subject:Date:From;
	b=II1l4k+gHS1NleBNhkPr2q8EcW/7zv/oI/OSLcIrDt1AEZKVqOn7idHE7W6tcS/XO
	 hCDPK9vbn/WNilDEUif61OSnuUYr56GTqEo5Hjs7Lz7DdZNN84D+arSB13UZm89XHw
	 wRw+ZwXzuo+WlEfRP53cTbgoNoHvZUDr8zGXCypYUeEFSzzrgaADUQR3g78YOxO3fK
	 jmbRXSqW1SOPTFWufCASSbxSjVg8pspTStWpG7+mYiRyOJ7U4tpqBmB/jPFI/ciUk+
	 RG00SaL3otd7b5uImQWaRc8qMxtY5FM8Fh69ZkfWzAIccauPcxDmXylLrY+iL6lNKG
	 MHXrPHZ2GPrKQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A42EB17E0EBD;
	Fri, 11 Jul 2025 10:36:58 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,1/4] MediaTek arm32 updates for v6.17
Date: Fri, 11 Jul 2025 10:36:45 +0200
Message-ID: <20250711083656.33538-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_013702_044174_CD23F45D 
X-CRM114-Status: UNSURE (   7.42  )
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

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-arm32-for-v6.17

for you to fetch changes up to 20e672e65844469fc36a52326dfea80f1068705a:

  ARM: mediatek: add MT6572 smp bring up code (2025-07-11 10:04:08 +0200)

----------------------------------------------------------------
MediaTek mach ARM32 updates

This adds support for the MediaTek MT6572 SoC, found in various
old smartphones and tablets from various manufacturers.

In particular, this adds a board_dt_compat entry for this SoC
and its SMP bring up sequence to enable secondary cores.

----------------------------------------------------------------
Max Shevchenko (2):
      ARM: mediatek: add board_dt_compat entry for the MT6572 SoC
      ARM: mediatek: add MT6572 smp bring up code

 arch/arm/mach-mediatek/Kconfig    | 4 ++++
 arch/arm/mach-mediatek/mediatek.c | 1 +
 arch/arm/mach-mediatek/platsmp.c  | 7 +++++++
 3 files changed, 12 insertions(+)


