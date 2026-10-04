Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37496CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 20:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GAgL45iiZDO9SPuPJegj4hc8HxNDWOPMhsXWYMRsHPc=; b=unH2FhMp9HbtGAgNUVFpyjmORE
	e1uDvc5JzT3EfCYhYWBhsAIQxe9v+030yX7CDFcY8NpsWexxApYmQZ4MKl/FTSPVaBKR62FmR7kaF
	0bZsXf8TGXXjVX9IeJbwkZQSF0xIQAOx+4mz0LYoDVfnFM5USYbj/CgsZNee6xKbE4jPW/FEZ+Cdd
	M6kqPRbcyA01Juq/883bTnN52wfEGWt62KH9nL6NcFO9JpC66lqFa0vqQ1qKD0QdVmzGbDRL5ZO99
	yHZyOErcTx6PnosgxbDTFXc2brjM5vYb+xrUTNAV7N146bCwlniGOViKV2QY/sUcqnZgeDec7PUrG
	hXllnr2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDSoG-0000000FGaw-2dNi;
	Sun, 04 Oct 2026 20:27:48 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDSoD-0000000FGaI-0gbu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 20:27:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0C3E11A1138;
	Sun,  4 Oct 2026 20:27:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D4781604FE;
	Sun,  4 Oct 2026 20:27:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 976B71032820F;
	Sun,  4 Oct 2026 22:27:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791145660; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=GAgL45iiZDO9SPuPJegj4hc8HxNDWOPMhsXWYMRsHPc=;
	b=DbZw1QNfz9B2KbqJcW26t6vB875sA9h2CbHUR6c2xAkgOA14jdZaFo88FnlMmRkYKNNRsF
	u39t86bdTtzWaEonDjE6ALT+bxRaYFI/2sbnKPX03xZLEICU/AmNUw4HH+l/aaMtphqHKL
	YkcAavenQObAfprb2OjC8Q5mVf5G3OsAKY4M+lygVzN/tINS6EuuPgTP17uA2oXODGc0Wa
	whHfqke04eBmneAVo0kSDkZXJeuuvjwaP/AcG6aiyGuz+zyWDebWSDSFeRDYu9ydRddSfO
	Vl34nvw/bhl/u0d5kJViIMa2cGwuaWXD/REuWGNLsVulm1s4IqlmOkqeHGIK3w==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>,  <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v7.4 (#1)
Date: Sun, 04 Oct 2026 22:27:38 +0200
Message-ID: <87qzi56wjp.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_132745_600284_9D5F5F2F 
X-CRM114-Status: UNSURE (   6.36  )
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

Hi,

Here is the first pull request for dt64 for mvebu for v7.4.

Note: the syscon "compatible is too short" dtcheck warning is a false
positive (pre-existing nodes from the shared armada-ap80x/cp11x dtsi),
so this should be ok to be merged.

Gregory

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt64-7.4-1

for you to fetch changes up to 0f72e965efec4cda7c3b1ac76edfab53f27ed9a7:

  arm64: dts: marvell: Add Sophos XGS 107w NPU board (2026-09-30 21:52:13 +=
0200)

----------------------------------------------------------------
mvebu dt64 for 7.4 (part 1)

Add Sophos XGS 107w NPU board (CN9130 based)

----------------------------------------------------------------
Nicolo Giuliani (3):
      dt-bindings: vendor-prefixes: Add Sophos
      dt-bindings: arm: marvell: Add Sophos XGS 107w NPU
      arm64: dts: marvell: Add Sophos XGS 107w NPU board

 .../bindings/arm/marvell/armada-7k-8k.yaml         |   7 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/marvell/Makefile               |   1 +
 .../boot/dts/marvell/cn9130-sophos-xgs107w.dts     | 188 +++++++++++++++++=
++++
 4 files changed, 198 insertions(+)
 create mode 100644 arch/arm64/boot/dts/marvell/cn9130-sophos-xgs107w.dts
--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

