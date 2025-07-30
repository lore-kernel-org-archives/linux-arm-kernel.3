Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01795C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 21:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dOuU2CzAbDwgt7O1ZCpa+m2x3EzBHS/V4An9ZnS+K1M=; b=1TwqsquB5LZLodRo8B/r5ay8cP
	2Ut/eThTh3CgWhW00tbIBjRzw/AS6tmtLuuHgkTG9/iyy1COoHEneo6ovyzzNjtbblG5dWjXTMT9e
	ZMfyyysueG8XkltmQAWYeJYwNlWGzvgHCw8pcYv+iOzMZWnf1zTBLfwhsxQOSuPOX5u8G1rFX0oib
	p2avy2JuEejEQBfStKe8UInlcCOnL0ZuUFsgfesg44ywWCmxTtL3rLz5gEOxfbHXPqFK9Yh9dcmWm
	eVYxlngCZedhl93VPnlTo+F52qJyta6zyRE+LrIovGlyPFMJspvfajgOsLTnkDNwbfobalF/prrVe
	1RwPzYXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhDx6-00000002RoD-07Bj;
	Wed, 30 Jul 2025 21:03:08 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.205])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhDs7-00000002R6Y-42Ch
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 20:58:01 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 3C6E2C0005D3;
	Wed, 30 Jul 2025 13:57:58 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 3C6E2C0005D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1753909078;
	bh=echyi2c3urhSqgs7glAWZFtXGzhcRzbjLt58B4Kxebo=;
	h=From:To:Cc:Subject:Date:From;
	b=qLnM8crOGdPhLMTCi2MBVo/qSMtZcRXN8XoQtTZY2fCu9ymbL4taV4o7KdOkpZFzv
	 M21NyTjgeok6tiX7Fg1X6suyQ5f1xQ70ZjWWLySpXShncya+OAZudQkM3DlLEAQ15b
	 mPXS3APs+mzWtKrGhd7LGqDb/toWMIPzTpiIKQuk=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id DC1B418000530;
	Wed, 30 Jul 2025 13:57:57 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/1] Broadcom drivers changes for 6.17 part 2
Date: Wed, 30 Jul 2025 13:57:54 -0700
Message-ID: <20250730205754.3465896-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_135800_156538_6CD602B6 
X-CRM114-Status: UNSURE (   9.27  )
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

The following changes since commit e3ce7b897388339b407d57969acaa26063e38209:

  pinctrl: rp1: Implement RaspberryPi RP1 pinmux/pinconf support (2025-06-25 12:08:56 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.17/drivers-part2

for you to fetch changes up to add858eff8c57e31d367399e4a4308a7b1d3485f:

  clk: rp1: Implement remaining clock tree (2025-07-30 13:56:29 -0700)

----------------------------------------------------------------
This pull request contains Broadcom SoC drivers changes for 6.17, these
were applied a bit late, but would not otherwise be able to make it into
the clock tree:

- Andrea implements the remaining RP1 clocks within the RP1 clock
  driver: ADC, Audio IN/OUT, DMA, I2S, MIPI DPI/DSI, PWM, SDIO, UART and
  video encoder

----------------------------------------------------------------
Andrea della Porta (2):
      dt-bindings: clock: rp1: Add missing MIPI DSI defines
      clk: rp1: Implement remaining clock tree

 drivers/clk/clk-rp1.c                              | 1192 ++++++++++++++++++--
 include/dt-bindings/clock/raspberrypi,rp1-clocks.h |    4 +
 2 files changed, 1080 insertions(+), 116 deletions(-)

