Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA87E9DE68
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 08:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V4G9clivTCOBNDyXno+rGyGLMHPPjMdcWkYABxM2zhM=; b=bel5rmzw6HwFZerZSUKEAGs8JW
	p2jyv29RcY/TWvaKP4yMFK9A4VyJj8MUI0eUPoYQkIKSqvieARYMW4p6osufOCcEVoLR/BYP+p+vq
	RgbcoS2/hOd4mTP4IqCccy5gipf36tWqeAxehYjKOKax8ltcNX9EJmXrqkJ2VaFGRg9HVSWvjHKou
	klD5PVy4ArDwTZhpprxz2qIILMkI4VXmiNqp0Hn2urzTwFr1+3jS3wXTXFVABKi1VYey2tcSbboLA
	oSnE8cTwE0ahLAWGFEqAVcCGpFbt1E8KSyUEoeKK0xBc9KjYfQU7sAJMoJe79tKkmqIx8nS9Wr+FW
	zqQ79JfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAlCE-00000009zYO-1pyp;
	Thu, 09 Apr 2026 08:57:06 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAlCB-00000009zXZ-2YnC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 08:57:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 63BDF4E428C6;
	Thu,  9 Apr 2026 08:57:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 325845FDEB;
	Thu,  9 Apr 2026 08:57:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 39CAD10450269;
	Thu,  9 Apr 2026 10:56:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775725019; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=V4G9clivTCOBNDyXno+rGyGLMHPPjMdcWkYABxM2zhM=;
	b=SxCsDT9A8FvofNq/CSqO7DGk07IOuXsLQhkPL2bM9i4TAmPdKj9KiebmbZ61LV7MCoaMYF
	LH43g/x14Y1HInP5gNtSjiDQ5nkC7sOoF8Ec0AGyG66P06iGO0iL+HX9fSrOz3s6p7RJfZ
	rwrFsvK2VLeZaOmDmdERBseLo63+S/ulzLxPKeQh0utI6GPj+hWl0Jo/WurvNwKGHGFXiv
	OtoB9fIbjHlslRIqooKARtAqUcceZAQl+FxgH8NsSwDQ6qrh7oi1QZspmBPlpML6PEumrD
	xOT0T6NFfQptzXOBEv0HCu3RzzjxA+rHAB0L9eEJLpJpjYyvAMNDu1tNwOGNIQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>,  <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt for v7.1 (#1)
Date: Thu, 09 Apr 2026 10:56:57 +0200
Message-ID: <87qzoo3412.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_015703_782630_9344E3EF 
X-CRM114-Status: UNSURE (   5.89  )
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

Here is the first pull request for dt for mvebu for v7.1.

Gregory

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt-7.1-1

for you to fetch changes up to 29d8a380643521422a9907f3e982e142fe22d19e:

  MAINTAINERS: drop file entry in Marvell Kirkwood and Armada SOC support (=
2026-03-02 16:24:43 +0100)

----------------------------------------------------------------
mvebu dt for 7.1 (part 1)

Drop unnecessary MAINTAINERS entry for non-existent Marvell db-falcon files

----------------------------------------------------------------
Lukas Bulwahn (1):
      MAINTAINERS: drop file entry in Marvell Kirkwood and Armada SOC suppo=
rt

 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

