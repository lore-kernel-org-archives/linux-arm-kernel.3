Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D41F2C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 17:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IUi7A3QSNLZO1JggiV3IpVAY/+9qkEe3/1ybLvLwbkg=; b=etti1hwd3ndaXAFWJmfxpktBFy
	qzR2NtNwUdSXPWDff7VQP6Qc8qT+Ey/vDB++98g/eHhX0tzxftIBKrjhL+RsWk44NOjEbDsEY0YL7
	J/tujE7W4qg0jBzo5f3LSghbdQOCXc3xs5rpEHO/hP4UbIbRfLtEG9XQkbZ52K8eEI8wIXsbxyv+7
	l7TJPLBygmOgYEwjXHj9Y3dJgaZc+H0EQ7s+IOIOj2i7zDxaiv8dYW3aTzwES15uO0mqpsXCbk2zs
	pUjEg5a5Bu4eZRUVpDBkXZ1vFbJMuVP/axChZuHeXhnGYqYjchCa3uoDBlNHaZtXZSKaK1itEgjpP
	SS2RZLng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlWPL-00000006I6K-2zjI;
	Fri, 21 Feb 2025 17:01:47 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlWLK-00000006HOs-1ubk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 16:57:41 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:ae9a:419e:d123:9695])
	by laurent.telenet-ops.be with cmsmtp
	id GGxX2E00F0y8aK501GxXFZ; Fri, 21 Feb 2025 17:57:33 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tlWKs-0000000BMsS-3cAS;
	Fri, 21 Feb 2025 17:57:31 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tlWLD-0000000EOqt-1Ain;
	Fri, 21 Feb 2025 17:57:31 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/5] Renesas driver updates for v6.15
Date: Fri, 21 Feb 2025 17:57:24 +0100
Message-ID: <cover.1740156741.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740156736.git.geert+renesas@glider.be>
References: <cover.1740156736.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_085738_643585_3ACD9956 
X-CRM114-Status: UNSURE (   9.26  )
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

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.15-tag1

for you to fetch changes up to 25a5246b0e564d238e917b5a3684171718c950fd:

  soc: renesas: r9a09g057-sys: Add a callback to print SoC-specific extra features (2025-02-20 17:38:33 +0100)

----------------------------------------------------------------
Renesas driver updates for v6.15

  - Add a driver for the System Controller on RZ/G3S, RZ/G3E, and
    RZ/V2H.

----------------------------------------------------------------
Claudiu Beznea (2):
      soc: renesas: Add SYSC driver for Renesas RZ family
      soc: renesas: rz-sysc: Move RZ/G3S SoC detection to the SYSC driver

John Madieu (3):
      soc: renesas: rz-sysc: Add support for RZ/G3E family
      soc: renesas: rz-sysc: Move RZ/V2H SoC detection to the SYS driver
      soc: renesas: r9a09g057-sys: Add a callback to print SoC-specific extra features

 drivers/soc/renesas/Kconfig          |  18 +++++
 drivers/soc/renesas/Makefile         |   4 +
 drivers/soc/renesas/r9a08g045-sysc.c |  23 ++++++
 drivers/soc/renesas/r9a09g047-sys.c  |  67 +++++++++++++++++
 drivers/soc/renesas/r9a09g057-sys.c  |  67 +++++++++++++++++
 drivers/soc/renesas/renesas-soc.c    |  33 +--------
 drivers/soc/renesas/rz-sysc.c        | 137 +++++++++++++++++++++++++++++++++++
 drivers/soc/renesas/rz-sysc.h        |  46 ++++++++++++
 8 files changed, 363 insertions(+), 32 deletions(-)
 create mode 100644 drivers/soc/renesas/r9a08g045-sysc.c
 create mode 100644 drivers/soc/renesas/r9a09g047-sys.c
 create mode 100644 drivers/soc/renesas/r9a09g057-sys.c
 create mode 100644 drivers/soc/renesas/rz-sysc.c
 create mode 100644 drivers/soc/renesas/rz-sysc.h

