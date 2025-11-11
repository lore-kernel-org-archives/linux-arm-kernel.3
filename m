Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29480CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 09:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RPSic5nAf1kOXO1Zu5Bz6LOSqgI6SMFNgdId8dhSBeI=; b=apQ4TCX8I1AkBp7cfTjMb05deR
	tHij8XArgUQbpNFsLi8VZW7GnB7ZsNXGfCYc6F11j8mfyeSR26hVWBNEKWF/Ee/J22slnkzvxCGqM
	xGs/nL+aeipM3VKsRKyVqpsa0OVchgg/enp8izzJ8Oc0iPKgyOpsMUCns/Pa/uhCYyFdAgyv3emSI
	FuyQ/JwtT6X88x3+rh8LRk7K1tJtiALSXahNJxmHz/RSYYtlQeckE+d8f8rjxlUjQsCI4RhmM+S/R
	0IyyYFZ8oU9Qrzxxjj9R+nrl1r1c5/9bhghQkcIbhPCzhuMhE5aM9exrjWAINxkJBDsLsetw+N+qj
	uL/Q2mng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIl6R-00000006t1P-0cyV;
	Tue, 11 Nov 2025 09:55:55 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIl6O-00000006szs-3W59;
	Tue, 11 Nov 2025 09:55:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762854949;
	bh=ylPjEOKl3WZwpNgjv70BagSMYXICu9kbcOmPFeUUKno=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YqGM0dIME6f9KP+Ybwbi4PgChhlLwAQf/xmn8HeNH8kaF2ndY31lpETByM2FTHoAR
	 AhFxOtfMETg7/k+EBey763HKHULqTurrf5xyIZIKOdKzJ3Ju0AoQRaYEbe4/dCvhuJ
	 bxQMxJliBswdS3wka5vTUklkVK4hR5kENXkIptaji2SOqvIM+QTh6mgMYrBGKt3/+D
	 UxzOHP1OLnkPrpTZ3u7I0XjuGbrcJ82qOUM9HJasF0OBtALR/vrPVCFXIiCHySX49r
	 Lx145vIU2deO/NFT7s1Q0dG8o5jKC0bU4I41na+MszXGyPGwIF4dATwGkr4uGCis3d
	 y1xdlVKnjG7Ww==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6CA8117E1318;
	Tue, 11 Nov 2025 10:55:49 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,2/5] MediaTek ARM32 DTS updates for v6.19
Date: Tue, 11 Nov 2025 10:55:37 +0100
Message-ID: <20251111095542.13958-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251111095542.13958-1-angelogioacchino.delregno@collabora.com>
References: <20251111095542.13958-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_015553_047912_B09DD291 
X-CRM114-Status: UNSURE (   9.73  )
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

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts32-for-v6.19

for you to fetch changes up to 5416aeee4ef761b79d2e1c35f6d9a35bf3104709:

  ARM: dts: mediatek: drop wrong syscon hifsys compatible for MT2701/7623 (2025-10-14 13:47:13 +0200)

----------------------------------------------------------------
MediaTek ARM32 Device Tree updates

This performs a cleanup of the MT6582 devicetrees and adds support
for secondary cores bringup on this SoC.

This also introduces basic support for a new machine, the MT6582
Alcatel "yarisxl" Pop C7 (OT-7041D) smartphone, with support for
booting into a initramfs with UART console output.

----------------------------------------------------------------
Christian Marangi (1):
      ARM: dts: mediatek: drop wrong syscon hifsys compatible for MT2701/7623

Cristian Cozzolino (8):
      ARM: dts: mediatek: mt6582: move MMIO devices under soc node
      ARM: dts: mediatek: mt6582: sort nodes and properties
      ARM: dts: mediatek: mt6582: remove compatible property from root node
      ARM: dts: mediatek: mt6582: add mt6582 compatible to timer
      ARM: dts: mediatek: mt6582: add clock-names property to uart nodes
      ARM: dts: mediatek: mt6582: add enable-method property to cpus
      dt-bindings: arm: mediatek: Add MT6582 yarisxl
      ARM: dts: mediatek: add basic support for Alcatel yarisxl board

 Documentation/devicetree/bindings/arm/mediatek.yaml   |   1 +
 arch/arm/boot/dts/mediatek/Makefile                   |   1 +
 arch/arm/boot/dts/mediatek/mt2701.dtsi                |   2 +-
 arch/arm/boot/dts/mediatek/mt6582-alcatel-yarisxl.dts |  61 ++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/mediatek/mt6582.dtsi                | 142 +++++++++++++++++++++++++++++++++++++++------------------------------------
 arch/arm/boot/dts/mediatek/mt7623.dtsi                |   3 +-
 6 files changed, 138 insertions(+), 72 deletions(-)
 create mode 100644 arch/arm/boot/dts/mediatek/mt6582-alcatel-yarisxl.dts


