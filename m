Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A385D47CAE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 01:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8v/THlnoXVHvcH673OA27G5X5V3+koupdlMYV2m+jOw=; b=gQ3YVw0NDK0Nbtv84/+JbzBa6y
	AIcY1bQhmv9og1Dl0YaEILHU74d9nLyRxIkbG0NGkIVw5uXIYP6FYOxvX5LoDTcEUH+2kVp+h8Zj8
	l78pmR0UCV78ffpJYQccbwYFbbEBsaP1SwmRW31xgcJQZ+r2tJQ7S3Kq7XBs350Kawxt8nYTFtjzR
	Fc8DqysYv7r0FFvGynRCQHBN+R8ThmVl86p4WYQQkgDv89SeVv8YLPczcAsum6RBjXas4+5QFGWN8
	OnrdbCucAAz6/BMTXRTw48EaZr2px1l56TuRZ8QAOK2zVuEp7RxxbnOAsCsYtTiTJ0c02p6hjQY5M
	sJE5vBLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYPJ-0000000DPFr-3KXO;
	Fri, 16 Jan 2026 01:13:45 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYPH-0000000DPFT-00CL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 01:13:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1768526018;
	bh=8v/THlnoXVHvcH673OA27G5X5V3+koupdlMYV2m+jOw=;
	h=Subject:From:To:Cc:Date;
	b=llyvELKSiIznZFW2NMeR6N9UUpuMCbNG5eZ6NMYA4qKlLjDmjmignOGD8GbWRNYv4
	 sFXxCPIzeM/fWBcLbmmYM1v3fpQSqi3JvkS1FIW1D63OhQXIzSgtjMUlR+v3/6ZC0O
	 RRACwGPLcHw0sVQIxHcWvdPpyo6UZ/+gUZ/mPR1MBIYOghg0Mx+m83v6/uIukXIAMG
	 cYmA3Cl/6Ek4v7wLoorSmvF/+RoeP49KrRSUKQ1J1Z92QxTYWNr65kCik1JYjLavm8
	 IwvKa72cO1dqks7sMNL9vU8D16BxrNnzmlT+wIUKau8jWH2MNv3sPMfISTVrPLdwaP
	 SDEFLCB0xHvKQ==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1D5BC7A005;
	Fri, 16 Jan 2026 09:13:38 +0800 (AWST)
Message-ID: <392d9247f7c15d11b115c86cba762568f37cd10f.camel@codeconstruct.com.au>
Subject: [GIT PULL] nuvoton: First batch of arm fixes for v6.19
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Fri, 16 Jan 2026 11:43:37 +1030
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_171343_232513_BCDE1BE8 
X-CRM114-Status: UNSURE (   4.26  )
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

Hello SoC maintainers,

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8=
:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/nuvoto=
n-arm-6.19-fixes-0

for you to fetch changes up to 70b8c45d8621c4d77b5659270e9a26ce7b1123cf:

  arm: npcm: drop unused Kconfig ERRATA symbol (2026-01-08 17:11:35 +1030)

----------------------------------------------------------------
Nuvoton NPCM Arm fixes for v6.19

Just the one change from Randy dropping an unused Kconfig symbol.

----------------------------------------------------------------
Randy Dunlap (1):
      arm: npcm: drop unused Kconfig ERRATA symbol

 arch/arm/mach-npcm/Kconfig | 1 -

