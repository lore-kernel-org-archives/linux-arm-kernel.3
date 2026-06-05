Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D54BCD6E7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 15:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jkcwehCu+0OeNZKIbUXSujcXjfc/ESvUqTFvx/NqvIc=; b=GgoiS9I8FIAs9s9c76Cr5wA8wl
	eIa0k29i1MzR25DjLB1egkjnddTexV/lOZmuStAcRuly7IVe2JA5n+UXPm8K/Vi5KYF7yfu993jKt
	Fb6RC1qSbNLsqIhA2y8GRvibbrwR5rCSR/gGJdn6O0fBHTg1PljLSmfxD/NTj9lvURI7vjbr9SFCC
	neRd5nJFHac/yjGm0HqQKKZKtU6R4R/WlUmBM8mioq9NoLtax7D75JEbYj0rJduVe1c0H8Td0aVya
	LKs9kFBeMAmkqTFB34DGSm9yLJemtc5IKvVwARyCaCcyq6OVFq6UBaVKcOotE3+NqnfKy7XuKVUOd
	OB8zxuJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVWSv-00000000ogT-2Wff;
	Fri, 05 Jun 2026 15:28:09 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVWSr-00000000ofe-1A28
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 15:28:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 172024E40835
	for <linux-arm-kernel@lists.infradead.org>; Fri,  5 Jun 2026 15:28:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C34765FED1;
	Fri,  5 Jun 2026 15:28:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3A2C9106A24F0;
	Fri,  5 Jun 2026 17:27:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780673281; h=from:subject:date:message-id:to:cc:mime-version:content-type;
	bh=jkcwehCu+0OeNZKIbUXSujcXjfc/ESvUqTFvx/NqvIc=;
	b=Zy4URk/TEcoKsonq8DbxWxdKGfHoZAZ0hMphy1u/HoI2P2ozmAyTXAIx+twIrPov+V+Vo6
	l4R5h1qguezCUIzagn2MriW7A7sLx6K9i7zLQvv9LRIt8iPvFw6EyNLjxzXkjjRIVnGNgX
	uCAW3UA4YSJjUps5y64nHe90Byizw9fch02AmW1zGuD+qG5Vuqf+pHJgJkaN/uhhstiuAg
	i9XjlBDZVXPstHyaNDhfXBtPH1hKXhIBxjnXAE9q6J/xv0bweFvmzrXIp6YGaC0mEvtsIG
	yuCA19oOyJOtkngx0/30o/zt/FNs3oyAMjjA2E4l5kYQ1IEa0Hyi7vWa8yzI2g==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>,  <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: arm for v7.2 (#1)
Date: Fri, 05 Jun 2026 17:27:59 +0200
Message-ID: <87zf19atxc.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_082805_445232_15A5E4F7 
X-CRM114-Status: UNSURE (   7.15  )
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

Here is the first pull request for arm for mvebu for v7.2.

Gregory

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-arm-7.2-1

for you to fetch changes up to bf4ad3be0679460585ab17dbcf298d085cf23429:

  ARM: orion5x: update board check in mss2_pci_init() to use the DT (2026-06-01 10:26:30 +0200)

----------------------------------------------------------------
mvebu arm for 7.2 (part 1)

Orion5x: Replace machine_is_mss2() with of_machine_is_compatible() in mss2_pci_init()

mvebu_v5_defconfig: Remove stale MACH_LINKSTATION_LSCHL reference

Armada 370: Simplify of_node_put calls and drop redundant NULL checks

----------------------------------------------------------------
Ethan Nelson-Moore (2):
      arm: mvebu_v5_defconfig: remove stale MACH_LINKSTATION_LSCHL reference
      ARM: orion5x: update board check in mss2_pci_init() to use the DT

Martin Kaiser (2):
      ARM: mvebu: drop unnecessary NULL check
      ARM: mvebu: simplify of_node_put calls

 arch/arm/configs/mvebu_v5_defconfig | 1 -
 arch/arm/mach-mvebu/coherency.c     | 9 ++-------
 arch/arm/mach-orion5x/board-mss2.c  | 4 ++--
 3 files changed, 4 insertions(+), 10 deletions(-)

