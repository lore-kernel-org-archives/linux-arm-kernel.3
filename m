Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939F3D77881
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 17:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nNAKJNF7gOGJ5liBgu05LUuy+DL5ctxb2S96YSva36A=; b=hbCQg1thv9kPpiJa1Ng3iZVddZ
	aZEdd0/GYGyLWHAiGr12tZ2OMuMSxC2nQO3geuwRShkLOV7cShbOVCRdFFUPFsll84xtkFybP/Mzd
	4FgP4XILJkEwtvcQtQggliXcCJZtGMe8bxynMxglEfF8FM3LNRW0ObbBxqchRIJlVeJb7tNpvmmtS
	+H0L2BvOFAq9GVqnKnFZ+LffqSqguoIWM8ltDpALgjr0pyv3111XkJ73SOOHja7XRuWviqhUqUzuZ
	5Vwoq2KYCH6sqaCAtplOj3E05P9cmwuGzzvWwy87XaD/n4+PD0jrQn87zEhjAKs87VwMJ6VhP5Hcq
	NJlfDzxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKoF-00000009HCA-0a4i;
	Fri, 23 Jan 2026 17:18:59 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKoB-00000009HB2-2DUj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 17:18:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 769351A2A2D;
	Fri, 23 Jan 2026 17:18:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3E1F26070A;
	Fri, 23 Jan 2026 17:18:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 561DF119A87DF;
	Fri, 23 Jan 2026 18:18:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769188729; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=nNAKJNF7gOGJ5liBgu05LUuy+DL5ctxb2S96YSva36A=;
	b=OEeCt2t8mdIuM49U94I/z5dTR3FI5pSSHiE5SAZg5q7FMGtx2Hg01pyHzVAgWjWXPglJYV
	W6XACQ0Mbio4XSm0jx3w8V6ajvwVHm6Yje8XZx5wS6DCz8fx+OEh/2ny+pcCCEfsS8Fsbz
	DZrTVPHjAvdlsoNzcjz6e92IkxKaCxVA6gHUdtBplzwclb8fufE2bx5V6oALrlVCuwjT9K
	/DE3I8DxmxyJToCZfkTrpuBXI+S4rC4sLl7xiHmap89NEYxgPJbpAStw77hMnvSx9l2bHb
	5mExsUbVHAPyLkLxiq6NfuORVvhWMGGvWuSjl0GQSYpcaqShbAh2FTFNQJ8W2g==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>,  <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: arm for v6.20 (#1)
Date: Fri, 23 Jan 2026 18:18:46 +0100
Message-ID: <87343wl021.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_091856_554905_FA48062E 
X-CRM114-Status: UNSURE (   6.69  )
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

Here is the first pull request for arm for mvebu for v6.20.

Gregory

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-arm-6.20-1

for you to fetch changes up to a1a359e12a4226f3ade63ee1c08cf21ce896a07a:

  soc: dove: pmu: Simplify with scoped for each OF child loop (2026-01-05 1=
5:03:43 +0100)

----------------------------------------------------------------
mvebu arm for 6.20 (part 1)

Simplify Dove PMU OF child node iteration with scoped loops

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      soc: dove: pmu: Simplify with scoped for each OF child loop

 drivers/soc/dove/pmu.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)
--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

