Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5235FC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 16:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4mFhJOtgyZnCoa7op0iZYcEX0VgZ0VItdjPVTy70E70=; b=TxxGq1Ik8BxroKu6Z7Si8sErsn
	8KhH+p3Ilf59vfoIBbILT+qT7V41CIrTcYRgJZ3Q/dlayNQhe3pJuAe2U7zVZtyH4F+Mm4ioV3zH3
	QtjBM6iVqim7RLRZHcxUU5vb3KRAP016dx1S0MS66XUsNExGp8McITB837P8Ayk4zJ8J4nXhkCAug
	gotbanRTGx5y1NxMQws3x69oAL5h3nUpcWtXh+GCPrb+Ndc1i7M0BxFa2i0NfzXkK2v90AJcwCUwv
	vGtEtcjHSlnedn197O1n+L2u3FDzUP8bLNKimNV4Z5CHw5z/em9uz45fZMlwfA9sQ/xmwXH+9trZz
	lYg0CGJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDQzz-00000004Mdq-0pAj;
	Fri, 09 May 2025 16:54:59 +0000
Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOco-00000003w75-3Avr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 14:22:57 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:805c:3876:152c:485c])
	by michel.telenet-ops.be with cmsmtp
	id n2No2E00F3X0DE5062NomD; Fri, 09 May 2025 16:22:50 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uDOca-000000012Ni-3KEr;
	Fri, 09 May 2025 16:22:48 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uDOci-00000003ADG-1i5Q;
	Fri, 09 May 2025 16:22:48 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/3] Renesas ARM defconfig updates for v6.16 (take two)
Date: Fri,  9 May 2025 16:22:28 +0200
Message-ID: <cover.1746798750.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746798748.git.geert+renesas@glider.be>
References: <cover.1746798748.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_072254_947202_69543647 
X-CRM114-Status: UNSURE (   8.01  )
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

The following changes since commit 33d5bf70fff43fbc612450164bd0bab6b9ada261:

  arm: multi_v7_defconfig: Drop individual Renesas SoC entries (2025-04-09 14:56:03 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v6.16-tag2

for you to fetch changes up to 976c4626c5f57d9a0eea0f4618ce58e68102bee3:

  ARM: shmobile: defconfig: Enable more support for RZN1D-DB/EB (2025-05-06 14:51:56 +0200)

----------------------------------------------------------------
Renesas ARM defconfig updates for v6.16 (take two)

  - Enable modular support for the Renesas RZ/G2L GPT and MSIOF sound in
    the ARM64 defconfig,
  - Enable more support for RZN1D-DB/EB in shmobile_defconfig.

----------------------------------------------------------------
Biju Das (1):
      arm64: defconfig: Enable Renesas RZ/G2L GPT config

Geert Uytterhoeven (1):
      ARM: shmobile: defconfig: Enable more support for RZN1D-DB/EB

Kuninori Morimoto (1):
      arm64: defconfig: Add Renesas MSIOF sound support

 arch/arm/configs/shmobile_defconfig | 7 ++++++-
 arch/arm64/configs/defconfig        | 2 ++
 2 files changed, 8 insertions(+), 1 deletion(-)

