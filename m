Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C3E103E305
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 15:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RhQbr3RZrekdSceZwHhpVS9NZfOuZeEVVOMiQ+CpsyM=; b=fTKEyQA8M7sBDUAcskxF4VTOxS
	uAmYjqVScGCSm7lnXi1oiSgPN4rR1hjcLYHn2QnRMihEfhXgPtZ9EjBk7OGO+SoCqg1jeS0y5Jtpg
	KntORXyNT2zpsqY0uRszJF07SvUmDQAEUSeAL1i8KwuIdHUc/r5A0bYcf4qAWk7sOzaenjwPcMi8n
	3VOc5BSu/ZGQMIHVencEnXlRyHb4eelKe+vNDVU6gc1yQ7bNJ8ENO6Dz76UvQWJwt4PzdXDzCPZP7
	SAwORtqOp6WekPYWkTLIWOpVeoI7nMKwW1INQpo+kiwZaGcw6pSxiJ1F37+hEMgNjX6CZcfL9q8ro
	X7lG0ajw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14p5-00000000aOZ-0Q58;
	Fri, 13 Mar 2026 15:53:11 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14p2-00000000aOA-0fvM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 15:53:09 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BE2FD1A2DF1;
	Fri, 13 Mar 2026 15:53:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 895A460027;
	Fri, 13 Mar 2026 15:53:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A90210369BC8;
	Fri, 13 Mar 2026 16:53:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773417185; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=RhQbr3RZrekdSceZwHhpVS9NZfOuZeEVVOMiQ+CpsyM=;
	b=P+tQK618eO5lJVH3N0dL48nTSc7MBge8GNqkERIJBdMoCtJGV9wc7UBW4TKR7y3jMUirkd
	35IsXqCg1HMg7aOXHWarq4rnpNSVrN5/f9LNp3c3bXYXrYYhb6t3iE2ygAEDNmZh0hZR5c
	BhFpkmKwLeoKIZt19eudIWtL8xtYlDDk68s+h0SFkKI0cPDIfxoTBjwSUW8pp1VsvN8G3w
	2v+EdxyCas8LaGjhtaJwlZ4iUoopxv98SvmSRs+Reosl+YzP29LNa975Px9aNK09M6CA0p
	ICOYZEkoldnRsGYQWs4BbEBGmyeJNkCAjQPmf/9Nl/JBGATvLEX0fs0jikFTFQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>,  <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: fixes for v7.0 (#1)
Date: Fri, 13 Mar 2026 16:53:03 +0100
Message-ID: <87sea3680w.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_085308_332858_D7CDA300 
X-CRM114-Status: UNSURE (   6.59  )
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

- Add bindings to validate the device tree that has already been merged.

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

