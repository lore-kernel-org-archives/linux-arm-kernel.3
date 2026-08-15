Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21451C5DF67
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 08:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4eGC9x1zlRVQNHV1HFiP9eA02RV5+baUhRnHBOM8Efs=; b=PNblGavVHIroANAnj1DhVAiSP6
	sOvsBPrPqD8d3bzGwDOyWvtfV0QaN1f+U4h3II4tK08FYNNzRKt0m2m6I7Mg/w3jh1TZx7DsszBEt
	j/+gWWbX3yG2aZPInuqIzjd+EQ/Jj8legoQsiXe5NQ6WxkZpi1u0TXUHT8Kk3D8I7Lr02OXH/95M3
	IiLUgtvgvKBt7TY3CsGaGleUrSTzWRQdesZWMiGYbyC8LmrO4RhA5IJF30mzcLbY60gNebrRyGjWF
	9ctOpKCBXyfz+nPDbyGq2bBUSc/2J4Pi6adAhekRSAuLTs1CawpgJ/Q96/SS0Iyo5KGbxura9baZZ
	/O2YcOZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv9e9-00000003fJx-2cz4;
	Sat, 15 Aug 2026 08:21:41 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv9e6-00000003fGi-1xMn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 08:21:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D042D1A1660;
	Sat, 15 Aug 2026 08:21:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 95BA2604AA;
	Sat, 15 Aug 2026 08:21:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B5D9311C4F436;
	Sat, 15 Aug 2026 10:21:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786782088; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=4eGC9x1zlRVQNHV1HFiP9eA02RV5+baUhRnHBOM8Efs=;
	b=oZlCzu7BzsjAsdKlteo4OnvHrFzEEI6//eoiNjezo9wYSzqjAD0oGKf/VmKZmoqNBLb3/8
	wwlY1FiVBs4m+Hbr0Z/ipBiF1NtRXTHTbFzB5YjZB0q07tKiZuOjkWRLPKts+6iGMAJsTq
	bZXsxbBDA5XbXtR2clepAR9vqtag0dttID3kvhdsWf/6MbXQT0k6f77uzl+LEBU02Uvqkf
	OWxgwwxLjk6EdkYwEKUDw252ItGD+MyzHCyxXdtb7eC1vvl5iF4GFZ3dBB6BNDxYIZWCS+
	kfv++ChiQ1cQ266/bGcTzIqK7leX/ZnfqpmlgBwxHyFgbnmd0t3MOy9yR8xHFg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>,  <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v7.3 (#1)
Date: Sat, 15 Aug 2026 10:21:24 +0200
Message-ID: <87lda7oku3.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_012138_665353_8D926829 
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

Here is the first pull request for dt64 for mvebu for v7.3.

Sorry for the delay. I only managed to push my branches for linux-next
last Sunday, so I waited a few days for them to be merged before
creating this PR.

Gregory

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt64-7.3-1

for you to fetch changes up to 0c2a8eed95160e41b367a1fa605a2c1b24a9639a:

  arm64: dts: turris-mox: fix usb3 phys (2026-08-09 12:42:37 +0200)

----------------------------------------------------------------
mvebu dt64 for 7.3 (part 1)

Fix usb3 phys declaration on Turris MOX an Armada 3700 based Soc

----------------------------------------------------------------
Tom=C3=A1=C5=A1 Macholda (1):
      arm64: dts: turris-mox: fix usb3 phys

 arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

