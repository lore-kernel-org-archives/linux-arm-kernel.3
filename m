Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A51CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 20:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Iu6lAlqaodgXtL2mhM3pv2AXvPYLj6PPOmWMM+ICyy0=; b=yyEIxh/LvBmJ9jzIfaVfWPgdf2
	Mpyz24oteREO7IZlzUDxpMM96qsra8QQaFteTti4lsR7PGlFFg09cbPIHf43vsPg9qvWjJy73qbuG
	SlZOUw7Q33tYMU8o6kIeQY5bLFOmJy8Qn5vjSBP2DnL7xIx6+2X2vNxXYT3KYnjyP05uJ3pxew/pz
	+sRA2Qtw5rZYXKOVGMHG8tuPGax6/+4V3gctTRKX5rwQ4wxHs3jTlFVINhfveMDLU5f2r+rJQJq5u
	2AssItHQeyw9U5MC4GbSIm8hD5UfJwBdXfGDXVIHL5bqHbjKlcl24Pmy5lZcQfwy1ge0CodsH9NtS
	AbKTBOHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDSkQ-0000000FGMm-0brI;
	Sun, 04 Oct 2026 20:23:50 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDSkL-0000000FGMG-11hq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 20:23:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AF8984E41156;
	Sun,  4 Oct 2026 20:23:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 67A6E604FE;
	Sun,  4 Oct 2026 20:23:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D19451032820F;
	Sun,  4 Oct 2026 22:23:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791145419; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Iu6lAlqaodgXtL2mhM3pv2AXvPYLj6PPOmWMM+ICyy0=;
	b=c16y1G7V3Ioe0+oCDYPDM2I9U+JWsVdQOiYqIA6G3gwfYoi5JqOLoQ8cuay0ksnsQdY2E9
	lK4VouDxVYAmicjPaIh60iWmhCFSp/p51SU/aJKSr8LAZVAfFbs1qOiRmbRABkyUo2wLeK
	hicmd84K0O5vBg3CCSw5rI/nWAsyQZCm0OQ2W3uMCUNHz2D0CXC8pIX+sT3OWh/rOZF7vE
	7yUzKWxjGiioNjOKptUxnbnvuj6gtON1j5guLJ/PNl7bpYsj9xEQXKAAPCUFvcEm6l/+fL
	cbdu0EkIVIknxqNygzphYns/+e13raCUNGNROrT/QWBrtdsR3GjvCWB2uXMIsw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>,  <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: arm for v7.4 (#1)
Date: Sun, 04 Oct 2026 22:23:36 +0200
Message-ID: <87tsn16wqf.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_132345_463399_51203F62 
X-CRM114-Status: UNSURE (   5.67  )
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

Here is the first pull request for arm for mvebu for v7.4.

Gregory

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-arm-7.4-1

for you to fetch changes up to 76e67df8bc1cb72157368c3669119e64cdb0a6a6:

  ARM: mvebu: fix Cortex-A9 errata selection for Armada 38x (2026-09-30 22:=
27:22 +0200)

----------------------------------------------------------------
mvebu arm for 7.4 (part 1)

Fix Cortex-A9 errata selection for Armada 38x that are r4p1 and not r2p0.

----------------------------------------------------------------
Qingfang Deng (1):
      ARM: mvebu: fix Cortex-A9 errata selection for Armada 38x

 arch/arm/mach-mvebu/Kconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

