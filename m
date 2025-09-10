Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0369CCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 17:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tp1eJrh8zFMvTnnM92iKV1SSBY/ntkp5FZh/N00K5+o=; b=NC722zRWYgpgbnQctXyY465RE7
	Tu6tZv0b4ilxP3oVtfcnJ75I8u8v/OiJ5jMZD+uAW438GA/RdVv+TaytNnPfOUgKwHKxgUkscBHNY
	djJRsOkDNSqqgRPuc28s27tVMo0pPTS8YCwS49HkYuftyvCO19+NOEQuWlZfv9CbXkm1zmybpyqgF
	69dDXyNpefCmWhgqzref3jFoKgEDFLUYfMLm4mDPqyW6GfUZte9tSQtN+xK5fN5I7PepbejBMHCiO
	GL00OEhjezqhzlsIFjWVZ4s1n/VHeyhMTvvuoBwDtavS5lDedsXrXsV7AgHYwLN+IBYAOhHT0i+hW
	odDKxzqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwOTZ-0000000Fk52-0o4O;
	Wed, 10 Sep 2025 17:19:21 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwOTU-0000000Fk24-2Y6m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 17:19:18 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id E6B4FC00071B;
	Wed, 10 Sep 2025 10:19:13 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com E6B4FC00071B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1757524754;
	bh=0UFDjhUme3C5flksKIYcmrVII18fPlsZVUyXSxZ7Ah8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=and7dQbQGn3ZKwWHYxCGCruIOgeckgQNbnPXGH2yiP1Uu5PxCzYOnfcVpueGqRoco
	 GFb8V9JrukSftfXU35iMoqDZAVWbwoybmjsMCF1JrzGdNWYXowX+x0fpAmE3vQz8E7
	 dELp7N1039poBvRdyDI8JOmYcflOODQN/T8NQO0g=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id C9B3118000853;
	Wed, 10 Sep 2025 10:19:13 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Brian Masney <bmasney@redhat.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Akhilesh Patil <akhilesh@ee.iitb.ac.in>,
	Andrea della Porta <andrea.porta@suse.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 4/4] Broadcom drivers changes for 6.18
Date: Wed, 10 Sep 2025 10:19:10 -0700
Message-ID: <20250910171910.666401-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250910171910.666401-1-florian.fainelli@broadcom.com>
References: <20250910171910.666401-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_101916_664181_18B89408 
X-CRM114-Status: GOOD (  10.22  )
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

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.18/drivers

for you to fetch changes up to 41c9570e41783648ff9455ea903615406b2bb127:

  clk: rp1: convert from round_rate() to determine_rate() (2025-09-03 14:58:19 -0700)

----------------------------------------------------------------
This pull request contains Broadcom SoC drivers updates for 6.18:

- Andrea adds the missing MIPI DSI clock defines for the RP1 and then
  continues to implement the remaining clocks for the RP1 chip (ADC,
  I2S, Audio in/out, DMA, MIPI, PWM, SDIO, UART, encoder)

- Akhilesh fixes a spelling typo in the bcm47xx_sprom driver

- Brian converts the RP1 clock driver to use the new determine_rate()
  API

----------------------------------------------------------------
Akhilesh Patil (1):
      drivers: firmware: bcm47xx_sprom: fix spelling

Andrea della Porta (2):
      dt-bindings: clock: rp1: Add missing MIPI DSI defines
      clk: rp1: Implement remaining clock tree

Brian Masney (1):
      clk: rp1: convert from round_rate() to determine_rate()

 drivers/clk/clk-rp1.c                              | 1222 ++++++++++++++++++--
 drivers/firmware/broadcom/bcm47xx_sprom.c          |    2 +-
 include/dt-bindings/clock/raspberrypi,rp1-clocks.h |    4 +
 3 files changed, 1100 insertions(+), 128 deletions(-)

