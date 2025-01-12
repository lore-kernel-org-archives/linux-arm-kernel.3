Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5C9E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 19:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZtBqhdvDtSMZSifwdEtbxuLavEcjAiJgqkWtN+G3/74=; b=f1W2c8SEH9fJINQ8IS33PwTGoY
	YNUAGAVjJQBf0ViBkA9x64zEARtH+ghUtWWBopGvo1LVXeBbi+yS41W1wfU3hGYqb8YOjHaxEq3wq
	ZhNsqJABaf9rSldTpZLDZkBxoqoU5B1F0gAAGKCSUilDA6Ad77IgLB6GHqQvBnFzOjMftaH4j14tH
	yPbPAI4GZeurMng21Rr+IWrBpqXjyPiUfXyvpLYj5XxNx14Po4LeG9/zqAwGRxtpodnhya8mZ8xCQ
	uaqWKqH0hd6QstGfUKVi2b5jVSJqj1h+hFamxH4M7bvkYo4tGtBZm5uPOvAgqrI2EbybQOaZQLGDL
	ByHg14Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tX3lJ-00000003L7i-2wqH;
	Sun, 12 Jan 2025 19:36:41 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tX3k3-00000003L2p-0xrG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 19:35:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 842A4FF803;
	Sun, 12 Jan 2025 19:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736710517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=ZtBqhdvDtSMZSifwdEtbxuLavEcjAiJgqkWtN+G3/74=;
	b=YaPPvibscYQZa+LJLSt5HaYahNFKdc9GFsiNmqWvpniX7X31YicBAri0U+ReH2HOOBSbW8
	odWpyJzU0yKdPHxnS6c15XzH9qXCUePHMfC7QyJdPbnwonfFWbKSvyKgqV9+ky3PvFN1ox
	13P9kT6Z2Aj2tw6eG35P2qKIErdbW/G4F1ZkWXT3JDVSXQBe5kkgbjNWQQcbHPK8cB/0RD
	rlY0mQGhYgsFP01NYsPS3RK8kFO6hvw4mBEHJt4+cXJUpzpYNV25i0fqdMcccafq/Mkqpw
	uF1c6UP2ioGgSBIfbAY4HpkpoCBoL4ZSdusPUReBB/2Z876HbvUET59ZU92UtA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v6.14 (#1)
Date: Sun, 12 Jan 2025 20:35:16 +0100
Message-ID: <87frlnygej.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-Sasl: gregory.clement@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_113523_577117_52A888F1 
X-CRM114-Status: UNSURE (   7.99  )
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

Here is the first pull request for dt64 for mvebu for v6.14.

Gregory

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-dt64-6.14-1

for you to fetch changes up to a34c9fac85b2fe9d2a4191b3d5cc3a459823124e:

  arm64: dts: marvell: drop additional phy-names for sata (2025-01-08 09:24:38 +0100)

----------------------------------------------------------------
mvebu dt64 for 6.14 (part 1)

Fix errors reported by dtbs_check for sata related nodes
Fix cp1 comphy link on Marvell CN913x platforms

----------------------------------------------------------------
Frank Wunderlich (2):
      arm64: dts: marvell: only enable complete sata nodes
      arm64: dts: marvell: drop additional phy-names for sata

Josua Mayer (1):
      arm64: dts: marvell: cn9131-cf-solidwan: fix cp1 comphy links

 arch/arm64/boot/dts/marvell/armada-7040-db.dts             | 1 +
 arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts       | 2 ++
 arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts | 1 +
 arch/arm64/boot/dts/marvell/armada-8040-db.dts             | 5 +++--
 arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi         | 3 +--
 arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts    | 2 ++
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi              | 2 ++
 arch/arm64/boot/dts/marvell/cn9130-crb-B.dts               | 1 +
 arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts         | 4 ++--
 arch/arm64/boot/dts/marvell/cn9131-db.dtsi                 | 1 +
 arch/arm64/boot/dts/marvell/cn9132-db.dtsi                 | 1 +
 11 files changed, 17 insertions(+), 6 deletions(-)

