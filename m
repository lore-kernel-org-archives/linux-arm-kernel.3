Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E89CAC58F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 15:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qRNeTZ+u8UvNkq31cCoxDlR1+TEzwsLgubNQ4d+PvEc=; b=KERSsQfEK6IR+lSCAYEyN979jc
	Qw3/a3rDP100jHwBI/C0H6E0IS5CX9sbl5cSFHlO/3jVBH1KAmTlu2XZPyIZSFZWz9Wfc9W1ak1se
	tCjX/ztNUhDzgKxw7j6s7445UF6n7BSf/YaJ1bVa+jSVrvCBs4m/4CQX3Fb7fxCdM/ArvwzQgrEBA
	r/4OU7XlnNhJLlpFERnqkaBqYSKfHANOrlTSmWmEVholXV0RYKYV6KTj5lo0QAbAJMONGPDynaMkr
	0we3unCm567FSXqcoIAT5n36dnA3Jys1eyzNMhchzXpQvd81jq4MGGW/QtRNcGAGXw+chwpj3JWU2
	egw0RXsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5Tw-0000000AAon-1ldi;
	Fri, 12 Sep 2025 15:14:36 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5Tt-0000000AAkG-0A3J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 15:14:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B9E14C6B3A1;
	Fri, 12 Sep 2025 15:14:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B8B3E60638;
	Fri, 12 Sep 2025 15:14:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4F263102F29C9;
	Fri, 12 Sep 2025 17:14:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757690070; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=qRNeTZ+u8UvNkq31cCoxDlR1+TEzwsLgubNQ4d+PvEc=;
	b=qFZ8MoBP5r0YRGWSHGljyD1LxncG97xt4lr3mF7t5BDSWW8YEEjPUgnceVlAh+AXRw2gnV
	Z+wV2k/zPCkpd51DTOUJ6HYn43Z8IE8Lt/Q+PLeT7VBLFNkue7Ka615lxTTKLGdDm387XC
	KrbYNx2rJ7E3bz9O8bdRwEBtE0WRyAM8k3Gjy5r43yVjCHxLzGZquCPv1VVM62x06dZisv
	WUl62M4FFC4AyvJDbsZoDFXS4lO2HlWYGHfJ7FSIOrpf1KfNg+CE7jU1sT8bhVajGffzrp
	CnbrIFB1JKA5fyZ6yASjMIss6r5oC6UpTjo3zqi0PsOwpwahpBhJClh2dPF8pw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>,  <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v6.18 (#1)
Date: Fri, 12 Sep 2025 17:14:23 +0200
Message-ID: <87frcrn1o0.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_081433_286909_FC7443BA 
X-CRM114-Status: UNSURE (   8.79  )
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

Here is the first pull request for dt64 for mvebu for v6.18.

Gregory

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt64-6.18-1

for you to fetch changes up to 1cc3d6c8640e4a75dab4077121b8cafd15eab8b0:

  arm64: dts: marvell: cn9130-sr-som: add missing properties to emmc (2025-=
09-12 14:59:19 +0200)

----------------------------------------------------------------
mvebu dt64 for 6.18 (part 1)

Improve device tree correctness:
- Whitespace cleanup
- Add missing address-cells

Add new board definition for RIPE Atlas Probe v5, based on Turris MOX
(Armada 3720 SoC)

----------------------------------------------------------------
Josua Mayer (1):
      arm64: dts: marvell: cn9130-sr-som: add missing properties to emmc

Krzysztof Kozlowski (3):
      arm64: dts: marvell: Minor whitespace cleanup
      arm64: dts: marvell: armada-37xx: Add default PCI interrup controller=
 address cells
      arm64: dts: marvell: armada-cp11x: Add default ICU address cells

Tom=C3=A1=C5=A1 Macholda (2):
      dt-bindings: marvell: armada-37xx: add ripe,atlas-v5 compatible
      arm64: dts: marvell: add dts for RIPE Atlas Probe v5

 .../bindings/arm/marvell/armada-37xx.yaml          |   1 +
 arch/arm64/boot/dts/marvell/Makefile               |   1 +
 arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi      |   2 +-
 .../boot/dts/marvell/armada-3720-atlas-v5.dts      | 110 +++++++++++++++++=
++++
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi       |   1 +
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi      |   1 +
 arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi     |   2 +
 arch/arm64/boot/dts/marvell/cn9132-clearfog.dts    |   4 +-
 arch/arm64/boot/dts/marvell/cn9132-sr-cex7.dtsi    |   2 +-
 9 files changed, 120 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dts

