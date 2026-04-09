Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2D6E9DE68
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 08:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0gNMksGCJbd7EqixIA8vvHKcH+FZvBP9KXWFhtHZFsg=; b=xeqmeXkqeJHHTeRfPZDET74FRi
	geAnnfjfcFm8nScuZxdEV0uFa3bTq3/GeaMfbSyiNLI+RT/wRDpQgjYAthq6MCxqvtmLiQG8nLY0f
	v6BdTpJElzEYzc46ISeumbFywI0Nz4CrZL9WurG/uraLdRjO9W6pHS8OOGrrKhDbMrK3NYfweYmXZ
	mULeRawOwKW4BpqUaM4C2e6zOoNAZ9vM75CvfWEmlB6inqREs/r6AZQ0opmm7pXzFs21g3Eg7Yy2F
	yf9wGOcbXX5OQqztdE8mrM9MnB0Zk3cPexjSC7/qH3lNEXsS6Si7P7cyanZv9ros9Dju9s2VNtp4I
	lEwuwZmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAkkQ-00000009wc4-2Edp;
	Thu, 09 Apr 2026 08:28:22 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAkkK-00000009waH-2VJs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 08:28:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 538F11A322F;
	Thu,  9 Apr 2026 08:28:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 22A8B5FDEB;
	Thu,  9 Apr 2026 08:28:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B27BE1045024F;
	Thu,  9 Apr 2026 10:28:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775723292; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=0gNMksGCJbd7EqixIA8vvHKcH+FZvBP9KXWFhtHZFsg=;
	b=L6SlGv4qS1oSXd1UYVpGCwW6362M2yLv5Tvzpe5++GDQpXy5wMRRE0pHQGs0yC7LzYrPNK
	K1Bwpvx/Lorz3V/omsyVnNcnq/nVm7b6pFZ3od3JIIWaWM6acZFmXE6wh9OJfqNGcec2ND
	0zk3vWhk1i/JHCRgQ//1dMZoB71YJSXkvYOVyZYpDH25G2saznlfApYuHbvT6Dzrc+2mbg
	aJmJ2ww2GEHVQVetnLqQzGNGky4Gto2y7mKrwEzVotMjYlq34Ux/nm7sbVHS+3NfxXywNt
	GGZaRVf4NDPkunlQy9KU59Vp6x/lEQVZ20+l8PVh38aKR+1PQJDIWbQL7HfGWQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>,  <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: fixes for v7.0 (#1)
Date: Thu, 09 Apr 2026 10:28:09 +0200
Message-ID: <87tstk35d2.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_012818_342187_03A122C1 
X-CRM114-Status: UNSURE (   6.16  )
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

Here is the first pull request for fixes for mvebu for v7.0.

Gregory

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-fixes-7.0-1

for you to fetch changes up to edb7efa767da8bb82d724b85178be251ec4e060e:

  dt-bindings: arm64: add Marvell 7k COMe boards (2026-03-13 16:41:11 +0100)

----------------------------------------------------------------
mvebu fixes for 7.0 (part 1)

A new device tree has been merged without a binding, which triggered
warnings during dtb_checks. The commit in this pull request fixes this
issue, enabling easier detection of new problems in device trees by
reducing the number of false warnings.

----------------------------------------------------------------
Elad Nachman (1):
      dt-bindings: arm64: add Marvell 7k COMe boards

 .../devicetree/bindings/arm/marvell/armada-7k-8k.yaml         | 11 +++++++=
++++
 1 file changed, 11 insertions(+)

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

